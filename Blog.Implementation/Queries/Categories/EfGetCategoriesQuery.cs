using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Queries;
using Blog.Application.Queries.Categories;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Categories
{
    public class EfGetCategoriesQuery : IGetCategoriesQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetCategoriesQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 13;

        public string Name => "Get Categories";

        public PagedResponse<CategoryDto> Execute(CategorySearch search)
        {
            var query = context.Category.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Paged<CategoryDto, Category>(search, mapper);
        }
    }
}
