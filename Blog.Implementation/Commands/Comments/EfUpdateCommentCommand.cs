using AutoMapper;
using Blog.Application.Commands.Comments;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Comments;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Comments
{
    public class EfUpdateCommentCommand : IUpdateCommentCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreateCommentValidator validator;

        public EfUpdateCommentCommand(BlogContext context, IMapper mapper, CreateCommentValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 22;

        public string Name => "Update Comment";

        public void Execute(CommentDto request)
        {
            validator.ValidateAndThrow(request);
            var comm = context.Comments.Find(request.Id);
            if (comm == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Comment));
            }

            var cyy = context.Comments.Where(x => x.Id == request.Id).First();

            mapper.Map(request, cyy);
            context.SaveChanges();
        }
    }
}
