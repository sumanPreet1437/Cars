using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Cars.Data;
using Cars.Models;

namespace Cars.Pages.RentalOrders
{
    public class EditModel : PageModel
    {
        private readonly Cars.Data.CarsContext _context;

        public EditModel(Cars.Data.CarsContext context)
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
           ViewData["CarId"] = new SelectList(_context.Car, "CarId", "CarId");
           ViewData["CustomerId"] = new SelectList(_context.Customer, "Customerid", "Customerid");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(RentalOrder).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RentalOrderExists(RentalOrder.RentalOrderId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool RentalOrderExists(int id)
        {
            return _context.RentalOrder.Any(e => e.RentalOrderId == id);
        }
    }
}
