using AutoMapper;
using Blog.Application;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Users;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Users
{
    public class EfGetOneUserQuery : IGetOneUserQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetOneUserQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 4;

        public string Name => "Get one user";

        public SingleUserDto Execute(int search)
        {
            var user = context.Users.Find(search);

            if (user == null)
            {
                throw new EntityNotFoundException(search, typeof(User));
            }

            var query = context.Users.Include(u => u.UserUseCases).Where(u => u.Id == search).First();

            var userOne = mapper.Map<SingleUserDto>(query);

            return userOne;
        }

        
    }
}
