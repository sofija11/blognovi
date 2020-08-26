using Blog.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Posts
{
    public interface IGetOnePostQuery : IQuery<int, OnePostDto>
    {
    }
}
