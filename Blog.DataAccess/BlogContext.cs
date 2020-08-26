using Blog.DataAccess.Configurations;
using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.DataAccess
{
    public class BlogContext : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new UserUseCasesConfiguration());
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new PostConfiguration());
            modelBuilder.ApplyConfiguration(new CommentConfiguration());

            modelBuilder.Entity<User>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Category>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Post>().HasQueryFilter(p => !p.IsDeleted);
            modelBuilder.Entity<Comment>().HasQueryFilter(p => !p.IsDeleted);
           

        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {

                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.CreatedAt = DateTime.Now;
                            e.IsDeleted = false;
                            e.ModifiedAt = null;
                            e.DeletedAt = null;
                            break;
                        case EntityState.Modified:
                            e.ModifiedAt = DateTime.Now;
                            break;
                    }
                }
            }
            return base.SaveChanges();

        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-V3ET5KE\SQLEXPRESS;Initial Catalog=blogsad;Integrated Security=True;Pooling=False");
            base.OnConfiguring(optionsBuilder);
        }




        public DbSet<User> Users { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<UserUseCases> UserUseCases { get; set; }
        public DbSet<Category> Category { get; set; }

        public DbSet<Picture> Pictures { get; set; }

        public DbSet<Post> Posts { get; set; }
        public DbSet<Comment> Comments { get; set; }
    }
}
