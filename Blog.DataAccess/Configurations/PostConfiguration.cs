using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.DataAccess.Configurations
{
    public class PostConfiguration : IEntityTypeConfiguration<Post>
    {
        public void Configure(EntityTypeBuilder<Post> builder)
        {

            builder.Property(x => x.Text).IsRequired().HasMaxLength(255);
            builder.Property(x => x.Name).IsRequired().HasMaxLength(150);

            builder.HasMany(x => x.Comments)
                    .WithOne(c => c.Post)
                    .HasForeignKey(x => x.PostId)
                    .OnDelete(DeleteBehavior.Restrict);
        }

        
    }
}
