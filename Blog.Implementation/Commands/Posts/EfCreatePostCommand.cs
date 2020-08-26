using AutoMapper;
using Blog.Application.Commands.Posts;
using Blog.Application.DTO;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Posts;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Posts
{
    public class EfCreatePostCommand : ICreatePostCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreatePostValidator validator;

        public EfCreatePostCommand(BlogContext context, IMapper mapper, CreatePostValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 16;

        public string Name => "Create Post";

        public void Execute(PostDto request)
        {
            validator.ValidateAndThrow(request);
            var post = mapper.Map<Post>(request);
           
            context.Posts.Add(post);
            context.SaveChanges();
        }
    }
}
