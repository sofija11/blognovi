using AutoMapper;
using Blog.Application.Commands.Comments;
using Blog.Application.DTO;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Comments;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Comments
{
   public class EfCreateCommentsCommand : ICreateCommentCommand
    
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreateCommentValidator validations;

        public EfCreateCommentsCommand(BlogContext context, IMapper mapper, CreateCommentValidator validations)
        {
            this.context = context;
            this.mapper = mapper;
            this.validations = validations;
        }

        public int Id => 16;

        public string Name => "CreateComment";

        public void Execute(CommentDto request)
        {
            validations.ValidateAndThrow(request);
            var commentt = mapper.Map<Comment>(request);
            context.Comments.Add(commentt);
            context.SaveChanges();
        }
    }
}
