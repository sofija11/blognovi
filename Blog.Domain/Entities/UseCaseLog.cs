﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Domain.Entities
{
    public class UseCaseLog
    {
        public int Id { get; set; }

        public DateTime Date { get; set; }

        public string UseCaseName { get; set; }

        public string Data { get; set; }

        public string Actor { get; set; }
    }
}
