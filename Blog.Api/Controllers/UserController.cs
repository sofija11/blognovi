using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Blog.Application;
using Blog.Application.Commands.User;
using Blog.Application.DTO;
using Blog.Application.Queries.Users;
using Blog.Application.Searches;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Blog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUseCaseExecutor executor;
        private readonly IApplicationActor actor;
        public UserController(IUseCaseExecutor executor, IApplicationActor actor)
        {
            this.executor = executor;
            this.actor = actor;
        }
        // GET: api/<UserController>
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearch search, [FromServices] IGetUsersQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<UserController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneUserQuery query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<UserController>
        [HttpPost]
        public IActionResult Post([FromBody] UserDto dto, [FromServices] ICreateUserCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<UserController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserDto dto, [FromServices] IUpdateUserCommand command)
        {
            id = dto.Id;
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<UserController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
