using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DTO
{
    public class PictureDto
    {
        public int Id { get; set; }
        public IFormFile PictureSrc { get; set; }

    }
}
