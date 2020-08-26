using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Blog.Api.Core;
using Blog.Application;
using Blog.Application.Email;
using Blog.DataAccess;
using Blog.Implementation.Commands.Categorys;
using Blog.Implementation.Commands.Comments;
using Blog.Implementation.Commands.Pictures;
using Blog.Implementation.Commands.Posts;
using Blog.Implementation.Commands.Users;
using Blog.Implementation.Email;
using Blog.Implementation.Logging;
using Blog.Implementation.Queries;
using Blog.Implementation.Queries.Categories;
using Blog.Implementation.Queries.Comments;
using Blog.Implementation.Queries.Post;
using Blog.Implementation.Queries.Users;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;

namespace Blog.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddTransient<BlogContext>();

            services.AddApplicationActor();
            services.AddJwt();
            services.AddUseCases();
            services.AddTransient<IEmailSender, SmtpEmailSender>();


            services.AddTransient<IUseCaseLogger, UseCaseLogger>();
            services.AddTransient<IUseCaseExecutor>();

            services.AddHttpContextAccessor();
            services.AddAutoMapper(typeof(EfCreateUserCommand).Assembly);
            services.AddAutoMapper(typeof(EfGetUsersQuery).Assembly);
            services.AddAutoMapper(typeof(EfGetOneUserQuery).Assembly);
            services.AddAutoMapper(typeof(EfUpdateUserCommand).Assembly);
            services.AddAutoMapper(typeof(EfCreatePostCommand).Assembly);

            services.AddAutoMapper(typeof(EfGetUseCaseLogsQuery).Assembly);
            services.AddAutoMapper(typeof(EfCreateCategoryCommand).Assembly);
            services.AddAutoMapper(typeof(EfUpdateCategoryCommand).Assembly);
            services.AddAutoMapper(typeof(EfGetCategoriesQuery).Assembly);
            services.AddAutoMapper(typeof(EfCreatePictureCommand).Assembly);
            services.AddAutoMapper(typeof(EfCreateCommentsCommand).Assembly);
            services.AddAutoMapper(typeof(EfGetCommentsQuery).Assembly);
            services.AddAutoMapper(typeof(EfGetPostsQuery).Assembly);

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Blog", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseMiddleware<GlobalExceptionHandler>();
           
            app.UseStaticFiles();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
