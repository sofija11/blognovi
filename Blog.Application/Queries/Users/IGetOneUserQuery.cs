using Blog.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Users
{
    public interface IGetOneUserQuery : IQuery<int, SingleUserDto>
    {
    }
}
