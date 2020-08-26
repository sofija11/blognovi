using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Queries;
using Blog.Application.Queries.Comments;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Comments
{
   public class EfGetCommentsQuery : IGetCommentsQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetCommentsQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 19;

        public string Name => "Search Comments";

        public PagedResponse<CommentDto> Execute(CommentSearch search)
        {
            var query = context.Comments.Include(c => c.User).Include(u => u.Post).AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Text.ToLower().Contains(search.Name.ToLower()));
            }
            return query.Paged<CommentDto, Domain.Entities.Comment>(search, mapper);

        }
    }
}
