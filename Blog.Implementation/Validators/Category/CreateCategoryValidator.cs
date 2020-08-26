using Blog.Application.DTO;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Category
{
    public class CreateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(BlogContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .NotNull()
                .MinimumLength(3)
                .Must(x => !context.Category.Any(c => c.Name == x))
                .WithMessage("Category already exist");
        }
    }
}
