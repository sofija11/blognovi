using Blog.Application.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Application
{
    public class IUseCaseExecutor
    {
        private readonly IApplicationActor actor;
        private readonly IUseCaseLogger logger;

        public IUseCaseExecutor(IApplicationActor actor, IUseCaseLogger logger)
        {
            this.actor = actor;
            this.logger = logger;
        }
        public void ExecuteCommand<TRequest>(ICommand<TRequest> command, TRequest request)
        {
            logger.Log(command, actor, request);
            if (!actor.AllowedUseCases.Contains(command.Id))
            {
                throw new UnauthoriziedUseCaseException(command, actor);
            }

            command.Execute(request);
        }
        public TResult ExecuteQuery<TSearch, TResult>(IQuery<TSearch, TResult> query, TSearch search)
        {
            logger.Log(query, actor, search);

            if (!actor.AllowedUseCases.Contains(query.Id))
            {
                throw new UnauthoriziedUseCaseException(query, actor);
            }

            return query.Execute(search);
        }
    }
}
