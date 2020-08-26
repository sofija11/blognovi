using AutoMapper;
using Blog.Application;
using Blog.DataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Logging
{
    public class UseCaseLogger : IUseCaseLogger
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public UseCaseLogger(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            context.UseCaseLogs.Add(new Domain.Entities.UseCaseLog
            {
                Actor = actor.Identity,
                Data = JsonConvert.SerializeObject(useCaseData),
                Date = DateTime.UtcNow,
                UseCaseName = useCase.Name

            });

            context.SaveChanges();
        }
    }
}
