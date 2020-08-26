using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Domain.Entities
{
    public class Comment : Entity
    {
        public string Text { get; set; }

        public int UserId { get; set; }
        public int PostId { get; set; }
        public virtual User User { get; set; }

        public virtual Post Post { get; set; }
    }
}
