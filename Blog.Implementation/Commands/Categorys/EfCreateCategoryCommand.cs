using AutoMapper;
using Blog.Application.Commands.Categories;
using Blog.Application.DTO;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Category;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Categorys
{
    public class EfCreateCategoryCommand : ICreateCategoryCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreateCategoryValidator validator;

        public EfCreateCategoryCommand(BlogContext context, IMapper mapper, CreateCategoryValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 10;

        public string Name => "Create Category";

        public void Execute(CategoryDto request)
        {
            validator.ValidateAndThrow(request);
            var category = mapper.Map<Category>(request);
            context.Category.Add(category);
            context.SaveChanges();
        }
    }
}
