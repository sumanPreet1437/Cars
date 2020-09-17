using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    // a class reprenting table RentalRates 
    // stores rents
    public class RentalRate
    {
        // primary key for RentalRate table
        [Key]
        public int RentalRateId { get; set; }
        // rates fields
        public double DailyRate { get; set; }
        public double WeeklyRate { get; set; }
        public double MonthlyRate { get; set; }

    }
}
