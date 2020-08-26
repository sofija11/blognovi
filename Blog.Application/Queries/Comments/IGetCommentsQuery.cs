using Blog.Application.DTO;
using Blog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Comments
{
    public interface IGetCommentsQuery : IQuery<CommentSearch,PagedResponse<CommentDto>>
    {
    }
}
