using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Cars.Data;
using Cars.Models;

namespace Cars.Pages.RentalOrders
{
    public class CreateModel : PageModel
    {
        private readonly Cars.Data.CarsContext _context;

        public CreateModel(Cars.Data.CarsContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["CarId"] = new SelectList(_context.Car, "CarId", "CarId");
        ViewData["CustomerId"] = new SelectList(_context.Customer, "Customerid", "Customerid");
            return Page();
        }

        [BindProperty]
        public RentalOrder RentalOrder { get; set; }

        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.RentalOrder.Add(RentalOrder);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
