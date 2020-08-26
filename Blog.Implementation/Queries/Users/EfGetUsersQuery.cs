using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Queries;
using Blog.Application.Queries.Users;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Users
{
    public class EfGetUsersQuery : IGetUsersQuery
    {

        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetUsersQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 5;

        public string Name => "Search Users";

        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var query = context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.Name.ToLower()));
            }
            return query.Paged<UserDto, Domain.Entities.User>(search, mapper);

        }
    }
}
