using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Domain.Entities
{
    public class Category : Entity
    {
        public string Name { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
