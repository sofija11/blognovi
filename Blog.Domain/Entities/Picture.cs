using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Blog.Domain.Entities
{
    public class Picture : Entity
    {
        [Required]
        public string PictureName { get; set; }
        
    }
}
