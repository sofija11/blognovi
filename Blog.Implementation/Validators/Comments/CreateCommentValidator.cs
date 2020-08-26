using Blog.Application.DTO;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Blog.Implementation.Validators.Comments
{
    public class CreateCommentValidator : AbstractValidator<CommentDto>
    {
        public CreateCommentValidator(BlogContext context)
        {
            RuleFor(x => x.Text).NotEmpty();


            RuleFor(x => x.UserId).NotEmpty()
                .Must(x => context.Users.Any(s => s.Id == x)).WithMessage("UserId must be in table Users");
            RuleFor(x => x.PostId).NotEmpty()
                .Must(x => context.Posts.Any(s => s.Id == x)).WithMessage("Post must exists");
        }
    }
}
