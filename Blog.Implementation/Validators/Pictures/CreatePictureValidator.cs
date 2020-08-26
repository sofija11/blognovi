using Blog.Application.DTO;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Validators.Pictures
{
    public class CreatePictureValidator : AbstractValidator<PictureDto>
    {
        public CreatePictureValidator(BlogContext context)
        {
            RuleFor(x => x.PictureSrc).NotEmpty();
        }
    }
}
