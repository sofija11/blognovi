using Blog.Application.Commands.Comments;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Posts;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Comments
{
    public class EfDeleteCommentCommand : IDeleteCommentCommand
    {
        private readonly BlogContext context;
        private readonly DeleteCommentValidator validator;

        public EfDeleteCommentCommand(BlogContext context, DeleteCommentValidator validator)
        {
            this.context = context;
            this.validator = validator;
        }

        public int Id => 17;

        public string Name => "Delete Commment";

        public void Execute(int request)
        {
            validator.ValidateAndThrow(request);
            var comment = context.Comments.Find(request);

            if (comment == null)
            {
                throw new EntityNotFoundException(request, typeof(Comment));
            }
            comment.IsDeleted = true;
            comment.DeletedAt = DateTime.Now;

            context.SaveChanges();
        }
    }
}
