﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Domain.Entities
{
   public class User : Entity
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public virtual ICollection<UserUseCases> UserUseCases { get; set; }
        public virtual ICollection<Post> Posts { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
    }
}

