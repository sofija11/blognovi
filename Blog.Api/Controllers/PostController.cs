using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Blog.Application;
using Blog.Application.Commands.Posts;
using Blog.Application.DTO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Blog.Application.Searches;
using Blog.Application.Queries.Posts;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Blog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private readonly IUseCaseExecutor executor;
        private readonly IApplicationActor actor;
        public PostController(IUseCaseExecutor executor, IApplicationActor actor)
        {
            this.executor = executor;
            this.actor = actor;
        }
        // GET: api/<PostController>
        [HttpGet]
        public IActionResult Get([FromQuery] PostSearch search, [FromServices] IGetPostsQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<PostController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOnePostQuery query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<PostController>
        [HttpPost]
        public IActionResult Post([FromForm] PostDto dto, [FromServices] ICreatePostCommand command)
        {
            dto.UserId = actor.Id;
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<PostController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] PostDto dto, [FromServices] IUpdatePostCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<PostController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePostCommand command)
        {
            executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
