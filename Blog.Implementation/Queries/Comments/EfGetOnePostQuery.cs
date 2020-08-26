using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Posts;
using Blog.DataAccess;
using Blog.Domain.Entities;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Comments
{
    public class EfGetOnePostQuery : IGetOnePostQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetOnePostQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 21;

        public string Name => "Get one post";

        public OnePostDto Execute(int search)
        {
            var post = context.Posts.Find(search);

            if (post == null)
            {
                throw new EntityNotFoundException(search, typeof(Blog.Domain.Entities.Post));
            }

            var query = context.Posts.Where(u => u.Id == search).First();

            var commm = mapper.Map<OnePostDto>(query);

            return commm;
        }
    }
}
