using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Queries;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries
{
    public class EfGetUseCaseLogsQuery : IGetUseCaseLogsQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetUseCaseLogsQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 9;

        public string Name => "Search logs";

        public PagedResponse<UseCaseLogDto> Execute(UseCaseLogsSearch search)
        {
            var query = context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.Actor) || !string.IsNullOrWhiteSpace(search.Actor))
            {

                query = query.Where(x => x.Actor.ToLower().Contains(search.Actor.ToLower()));

            }
            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.DateStart) || !string.IsNullOrWhiteSpace(search.DateStart) ||
               !string.IsNullOrEmpty(search.DateEnd) || !string.IsNullOrWhiteSpace(search.DateEnd))
            {

                DateTime start = Convert.ToDateTime(search.DateStart);
                DateTime end = Convert.ToDateTime(search.DateEnd);

                query = query.Where(x => x.Date >= start && x.Date <= end);
            }

            return query.Paged<UseCaseLogDto, Domain.Entities.UseCaseLog>(search, mapper);
        }
    }
}
