using System;
using System.Collections.Generic;
using System.Text;
using Blog.Application.DTO;

namespace Blog.Application.Queries.Comments
{
    public interface IGetOneCommentQuery : IQuery<int, OneCommentDto>
    {
    }
}
