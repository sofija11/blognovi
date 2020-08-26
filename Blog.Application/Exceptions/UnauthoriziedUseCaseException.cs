using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Exceptions
{
    public class UnauthoriziedUseCaseException : Exception
    {
        public UnauthoriziedUseCaseException(IUseCase useCase, IApplicationActor actor)
            : base($"Actor with an id {actor.Id} - {actor.Identity} tried to execute {useCase.Name}")
        {

        }
    }
}
