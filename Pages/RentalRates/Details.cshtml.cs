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
    public class DetailsModel : PageModel
    {
        private readonly Cars.Data.CarsContext _context;

        public DetailsModel(Cars.Data.CarsContext context)
        {
            _context = context;
        }

        public RentalRate RentalRate { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            RentalRate = await _context.RentalRate.FirstOrDefaultAsync(m => m.RentalRateId == id);

            if (RentalRate == null)
            {
                return NotFound();
            }
            return Page();
        }
    }
}
