using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Categories;
using Blog.DataAccess;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Categories
{
    public class EfGetOneCategoryQuery : IGetOneCategoryQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetOneCategoryQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 14;

        public string Name => "Get One Category";

        public OneCategoryDto Execute(int search)
        {
            var category = context.Category.Find(search);

            if (category == null)
            {
                throw new EntityNotFoundException(search, typeof(Category));
            }

            var query = context.Category.Where(u => u.Id == search).First();

            var categoryy = mapper.Map<OneCategoryDto>(query);

            return categoryy;
        }
    }
}
