using avanceCsharp.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace avanceCsharp.data
{
    public class ApplicationDbContext: DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options): base(options) { }

        public DbSet<Producto> Producto { get; set; }

        public DbSet<Personal> Personal { get; set; }

        public DbSet<Categoria> Categoria { get; set; }
    }
}
