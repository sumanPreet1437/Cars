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
    public class IndexModel : PageModel
    {
        private readonly Cars.Data.CarsContext _context;

        public IndexModel(Cars.Data.CarsContext context)
        {
            _context = context;
        }

        public IList<RentalOrder> RentalOrder { get;set; }

        public async Task OnGetAsync()
        {
            RentalOrder = await _context.RentalOrder
                .Include(r => r.Car)
                .Include(r => r.Customer).ToListAsync();
        }
    }
}
