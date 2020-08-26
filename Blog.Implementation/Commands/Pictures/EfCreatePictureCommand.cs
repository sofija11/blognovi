using AutoMapper;
using Blog.Application.Commands.Pictures;
using Blog.Application.DTO;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Pictures;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Blog.Implementation.Commands.Pictures
{
    public class EfCreatePictureCommand : ICreatePictureCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreatePictureValidator validator;

        public EfCreatePictureCommand(BlogContext context, IMapper mapper, CreatePictureValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 15;

        public string Name => "Upload picture";

        public void Execute(PictureDto request)
        {
            validator.ValidateAndThrow(request);

            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(request.PictureSrc.FileName);
            var newFileName = guid + extension;
            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                request.PictureSrc.CopyTo(fileStream);
            }

            var slika = mapper.Map<Picture>(request);
            slika.PictureName = newFileName;
            context.Pictures.Add(slika);
            context.SaveChanges();
        }
    }
}
