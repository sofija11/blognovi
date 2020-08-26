using Blog.Application.Commands.Posts;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Posts;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Posts
{
    public class EfDeletePostCommand : IDeletePostCommand
    {
        private readonly BlogContext context;
        private readonly DeletePostValidator validator;

        public EfDeletePostCommand(BlogContext context, DeletePostValidator validator)
        {
            this.context = context;
            this.validator = validator;
        }

        public int Id => 18;

        public string Name => "Delete Post";

        public void Execute(int request)
        {
            validator.ValidateAndThrow(request);
            var post = context.Posts.Find(request);

            if (post == null)
            {
                throw new EntityNotFoundException(request, typeof(Post));
            }
            post.IsDeleted = true;
            post.DeletedAt = DateTime.Now;

            context.SaveChanges();
        }
    }
}
