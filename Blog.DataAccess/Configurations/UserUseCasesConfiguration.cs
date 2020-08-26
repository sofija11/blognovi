using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.DataAccess.Configurations
{
    public class UserUseCasesConfiguration : IEntityTypeConfiguration<UserUseCases>
    {
        public void Configure(EntityTypeBuilder<UserUseCases> builder)
        {
            builder.Property(x => x.UseCaseId).IsRequired();
            builder.Property(x => x.UserId).IsRequired();
        }
    }
}
