using Blog.Application.Commands.Categories;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Category;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Categorys
{
    public class EfDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly BlogContext context;
        private readonly DeleteCategoryValidator validator;

        public EfDeleteCategoryCommand(BlogContext context, DeleteCategoryValidator validator)
        {
            this.context = context;
            this.validator = validator;
        }

        public int Id => 11;

        public string Name => "Delete Category";

        public void Execute(int request)
        {
            validator.ValidateAndThrow(request);
            var category = context.Category.Find(request);

            if (category == null)
            {
                throw new EntityNotFoundException(request, typeof(Category));
            }
            category.IsDeleted = true;
            category.DeletedAt = DateTime.Now;

            context.SaveChanges();
        }
    }
}
