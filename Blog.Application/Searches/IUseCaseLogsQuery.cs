using Blog.Application.DTO;
using Blog.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Searches
{
    public interface IGetUseCaseLogsQuery : IQuery<UseCaseLogsSearch, PagedResponse<UseCaseLogDto>>
    {
    }
}
