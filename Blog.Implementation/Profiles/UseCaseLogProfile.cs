using AutoMapper;
using Blog.Application.DTO;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles
{
    public class UserUseCaseLogProfile : Profile
    {
        public UserUseCaseLogProfile()
        {
            CreateMap<UseCaseLog, UseCaseLogDto>();
            CreateMap<UseCaseLogDto, UseCaseLog>();
        }
    }
}
