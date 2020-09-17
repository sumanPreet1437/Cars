using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Cars.Data;
using Cars.Models;

namespace Cars.Pages.RentalRates
{
    public class IndexModel : PageModel
    {
        private readonly Cars.Data.CarsContext _context;

        public IndexModel(Cars.Data.CarsContext context)
        {
            _context = context;
        }

        public IList<RentalRate> RentalRate { get;set; }

        public async Task OnGetAsync()
        {
            RentalRate = await _context.RentalRate.ToListAsync();
        }
    }
}
