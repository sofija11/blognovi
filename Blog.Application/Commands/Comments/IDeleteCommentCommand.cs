using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.Comments
{
    public interface IDeleteCommentCommand : ICommand<int>
    {
    }
}
