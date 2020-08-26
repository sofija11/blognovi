using Blog.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string Name { get; set; }
    }
}
