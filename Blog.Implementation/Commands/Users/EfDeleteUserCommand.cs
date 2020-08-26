using Blog.Application.Commands.User;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Users
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        public readonly BlogContext context;

        public EfDeleteUserCommand(BlogContext context)
        {
            this.context = context;
        }

        public int Id => 7;

        public string Name => "Delete user";

        public void Execute(int request)
        {
            var user = context.Users.Find(request);

            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(Domain.Entities.User));
            }
            user.DeletedAt = DateTime.Now;
            user.IsDeleted = true;

            context.SaveChanges();
        }
    }
}
