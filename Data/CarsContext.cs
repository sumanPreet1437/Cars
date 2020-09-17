using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Cars.Models;

namespace Cars.Data
{
    // Dbcontext class for Cars
    public class CarsContext : DbContext
    {
        public CarsContext (DbContextOptions<CarsContext> options)
            : base(options)
        {
        }
        // all Db Sets for tables data
        // on which queries are applied
        public DbSet<Cars.Models.Car> Car { get; set; }

        public DbSet<Cars.Models.Customer> Customer { get; set; }

        public DbSet<Cars.Models.RentalOrder> RentalOrder { get; set; }

        public DbSet<Cars.Models.RentalRate> RentalRate { get; set; }
    }
}
