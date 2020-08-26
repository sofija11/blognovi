using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Domain.Entities
{
   public class Post : Entity
    {
        public string Name { get; set; }

        public string Text { get; set; }

        public virtual User User { get; set; }
        public virtual Category Category { get; set; }

        public virtual Picture Picture { get; set; }

        public int CategoryId { get; set; }
        public int PictureId { get; set; }

        public int UserId { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }
    }
}

