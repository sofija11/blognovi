using Blog.Application.DTO;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Posts
{
   public class CreatePostValidator : AbstractValidator<PostDto>
    {
        public CreatePostValidator(BlogContext context)
        {
            RuleFor(x => x.Name).NotEmpty().Must(x => !context.Posts.Any(name => name.Name == x))
              .WithMessage("Name already exists");
            RuleFor(x => x.Text).NotEmpty();

            RuleFor(x => x.PictureId).NotEmpty()
                .Must(x => context.Pictures.Any(s => s.Id == x)).WithMessage("Photo must be in table Pictures");

            RuleFor(x => x.CategoryId)
                .NotEmpty()
                .Must(catid => context.Category.Any(p => p.Id == catid))
                .WithMessage("Category has to be valid.");
            RuleFor(x => x.UserId)
               .NotEmpty()
               .Must(userid => context.Users.Any(u => u.Id == userid))
               .WithMessage("User must be from registrated users");
        }
    }
}
