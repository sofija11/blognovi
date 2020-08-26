using AutoMapper;
using Blog.Application.Commands.Posts;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Posts;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Posts
{
    public class EfUpdatePostCommand : IUpdatePostCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreatePostValidator validator;

        public EfUpdatePostCommand(BlogContext context, IMapper mapper, CreatePostValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 23;

        public string Name => "Update Post";

        public void Execute(PostDto request)
        {
            validator.ValidateAndThrow(request);
            var post = context.Posts.Find(request.Id);
            if (post == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Post));
            }

            var p = context.Posts.Where(x => x.Id == request.Id).First();

            mapper.Map(request,p);
            context.SaveChanges();
        }
    }
}
