using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Comments;
using Blog.DataAccess;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Post
{
    public class EfGetOneCommentQuery : IGetOneCommentQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetOneCommentQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 20;

        public string Name => "Get One Comment";

        public OneCommentDto Execute(int search)
        {
            var comm = context.Comments.Find(search);

            if (comm == null)
            {
                throw new EntityNotFoundException(search, typeof(Comment));
            }

            var query = context.Comments.Where(u => u.Id == search).First();

            var commm = mapper.Map<OneCommentDto>(query);

            return commm;
        }
    }
}
