using Blog.Application;
using Blog.Application.Commands.Categories;
using Blog.Application.Commands.Comments;
using Blog.Application.Commands.Pictures;
using Blog.Application.Commands.Posts;
using Blog.Application.Commands.User;
using Blog.Application.Queries.Categories;
using Blog.Application.Queries.Comments;
using Blog.Application.Queries.Posts;
using Blog.Application.Queries.Users;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Implementation.Commands.Categorys;
using Blog.Implementation.Commands.Comments;
using Blog.Implementation.Commands.Pictures;
using Blog.Implementation.Commands.Posts;
using Blog.Implementation.Commands.Users;
using Blog.Implementation.Queries;
using Blog.Implementation.Queries.Categories;
using Blog.Implementation.Queries.Comments;
using Blog.Implementation.Queries.Post;
using Blog.Implementation.Queries.Users;
using Blog.Implementation.Validators.Category;
using Blog.Implementation.Validators.Comments;
using Blog.Implementation.Validators.Pictures;
using Blog.Implementation.Validators.Posts;
using Blog.Implementation.Validators.Users;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Api.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            //komande
            services.AddTransient<ICreateUserCommand, EfCreateUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>();
            services.AddTransient<ICreatePictureCommand, EfCreatePictureCommand>();
            services.AddTransient<ICreatePostCommand, EfCreatePostCommand>();
            services.AddTransient<ICreateCommentCommand, EfCreateCommentsCommand>();
            services.AddTransient<IDeleteCommentCommand, EfDeleteCommentCommand>();
            services.AddTransient<IDeletePostCommand, EfDeletePostCommand>();
            services.AddTransient<IUpdateCommentCommand, EfUpdateCommentCommand>();
            ///querii
            ///
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IGetOneUserQuery, EfGetOneUserQuery>();
            services.AddTransient<IGetUseCaseLogsQuery, EfGetUseCaseLogsQuery>();
            services.AddTransient<IGetCategoriesQuery, EfGetCategoriesQuery>();
            services.AddTransient<IGetOneCategoryQuery, EfGetOneCategoryQuery>();
            services.AddTransient<IGetCommentsQuery, EfGetCommentsQuery>();
            services.AddTransient<IGetPostsQuery, EfGetPostsQuery>();
            services.AddTransient<IGetOneCommentQuery, EfGetOneCommentQuery>();
            services.AddTransient<IGetOnePostQuery, EfGetOnePostQuery>();



            //validatori
            services.AddTransient<CreateUserValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<DeleteCategoryValidator>();
            services.AddTransient<CreatePictureValidator>();
            services.AddTransient<CreatePostValidator>();
            services.AddTransient<CreateCommentValidator>();
            services.AddTransient<DeleteCommentValidator>();
            services.AddTransient<DeletePostValidator>();
        }
        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();


                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                     return new AnnonymusActor();
                   
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });

        }
        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<JwtManager>(x =>
            {
                var context = x.GetService<BlogContext>();

                return new JwtManager(context);
            });


            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }
    }
}
