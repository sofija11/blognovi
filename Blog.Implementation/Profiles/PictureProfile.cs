using AutoMapper;
using Blog.Application.DTO;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles
{
    public class PicturesProfile : Profile
    {
        public PicturesProfile()
        {
            CreateMap<Picture, PictureDto>();
            CreateMap<PictureDto, Picture>().ForMember(x => x.PictureName, opt => opt.Ignore());
        }
    }
}
