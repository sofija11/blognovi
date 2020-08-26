using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DTO
{
    public class PostDto
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string Text { get; set; }

        public int CategoryId { get; set; }
        public int PictureId { get; set; }

        public int UserId { get; set; }


    }
}
