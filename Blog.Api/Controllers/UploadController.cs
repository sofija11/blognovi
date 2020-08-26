using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Blog.Application;
using Blog.Application.Commands.Pictures;
using Blog.Application.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Blog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly IUseCaseExecutor executor;
        private readonly IApplicationActor actor;

        public UploadController(IUseCaseExecutor executor, IApplicationActor actor)
        {
            this.executor = executor;
            this.actor = actor;
        }

        // POST api/<UploadController>
        [HttpPost]
        public IActionResult Post([FromForm] PictureDto dto, [FromServices] ICreatePictureCommand command)
        {
            executor.ExecuteCommand(command, dto);

            return StatusCode(StatusCodes.Status201Created);
        }



    }
}
