using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Queries;
using Blog.Application.Queries.Posts;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Post
{
    public class EfGetPostsQuery : IGetPostsQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetPostsQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }
        public int Id =>20;

        public string Name => "Search Posts";

        public PagedResponse<PostDto> Execute(PostSearch search)
        {
            var query = context.Posts.Include(c => c.User).Include(u => u.Picture).Include(u => u.Category).AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            return query.Paged<PostDto, Domain.Entities.Post>(search, mapper);
        }
        
    }
}
