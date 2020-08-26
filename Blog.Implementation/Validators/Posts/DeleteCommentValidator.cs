using Blog.Implementation.Validators.Category;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Validators.Posts
{
    public class DeleteCommentValidator : AbstractValidator<int>

    {
        public DeleteCommentValidator()
        {
            RuleFor(x => x).NotEmpty();
        }
    }
}
