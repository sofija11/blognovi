using Blog.Application.DTO;
using Blog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Users
{
    public interface IGetUsersQuery : IQuery<UserSearch, PagedResponse<UserDto>>
    {

    }
}
