using AutoMapper;
using Blog.Application.Commands.User;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Users;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Users
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly UpdateUserValidator validator;

        public EfUpdateUserCommand(BlogContext context, IMapper mapper, UpdateUserValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 8;

        public string Name => "Update User";

        public void Execute(UserDto request)
        {
            validator.ValidateAndThrow(request);

            //var findUser = context.Users.Find(request.Id);

            //if (findUser == null)
            //{
            //    throw new EntityNotFoundException(request.Id, typeof(User));
            //}

            var user = context.Users.Include(x => x.UserUseCases).Where(x => x.Id == request.Id).First();

            mapper.Map(request, user);


            foreach (var one in user.UserUseCases)
            {
                context.Remove(one);
            }

            foreach (var uCNew in request.useCasesForUser)
            {
                context.UserUseCases.Add(new UserUseCases
                {
                    UseCaseId = uCNew,
                    UserId = request.Id
                });
            }


            user.Password = EasyEncryption.SHA.ComputeSHA256Hash(request.Password);

            context.SaveChanges();
        }

       
    }
}
