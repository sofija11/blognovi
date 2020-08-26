using Blog.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.Posts
{
   public interface IDeletePostCommand : ICommand<int>
    {
       
    }
}
