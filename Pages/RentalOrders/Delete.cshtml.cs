using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Cars.Data;
using Cars.Models;

namespace Cars.Pages.RentalOrders
{
    public class DeleteModel : PageModel
    {
        private readonly Cars.Data.CarsContext _context;

        public DeleteModel(Cars.Data.CarsContext context)
        {
            _context = context;
        }

        [BindProperty]
        public RentalOrder RentalOrder { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            RentalOrder = await _context.RentalOrder
                .Include(r => r.Car)
                .Include(r => r.Customer).FirstOrDefaultAsync(m => m.RentalOrderId == id);

            if (RentalOrder == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            RentalOrder = await _context.RentalOrder.FindAsync(id);

            if (RentalOrder != null)
            {
                _context.RentalOrder.Remove(RentalOrder);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
