using Blog.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.User
{
    public interface ICreateUserCommand : ICommand<UserDto>
    {

    }
}
