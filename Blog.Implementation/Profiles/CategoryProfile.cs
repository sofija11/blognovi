using AutoMapper;
using Blog.Application.DTO;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles
{
    public class CategoryProfile : Profile
    {
        public CategoryProfile()
        {
            CreateMap<Category, CategoryDto>();
            CreateMap<CategoryDto, Category>();

            CreateMap<OneCategoryDto, Category>();
            CreateMap<Category, OneCategoryDto>();
        }
    }
}
