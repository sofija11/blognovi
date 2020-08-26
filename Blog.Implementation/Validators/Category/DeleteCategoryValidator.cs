using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Validators.Category
{
    public class DeleteCategoryValidator : AbstractValidator<int>
    {
        public DeleteCategoryValidator()
        {
            RuleFor(x => x).NotEmpty();
        }
    }
}
