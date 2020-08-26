using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries
{
    public class PagedSearch
    {
        public int PerPage { get; set; } = 3;
        public int Page { get; set; } = 1;
    }
}
