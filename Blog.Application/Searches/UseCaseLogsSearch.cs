using Blog.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Searches
{
    public class UseCaseLogsSearch : PagedSearch
    {
        public string Actor { get; set; }
        public string UseCaseName { get; set; }
        public string DateStart { get; set; }
        public string DateEnd { get; set; }
    }
}
