using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Blog.Application;
using Blog.Application.Searches;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Blog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UseCasesLogsController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly IUseCaseExecutor executor;

        public UseCasesLogsController(IApplicationActor actor, IUseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/UseCasesLogs
        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseLogsSearch search, [FromServices] IGetUseCaseLogsQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }
    }
}
