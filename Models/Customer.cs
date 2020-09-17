using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    // a class representing table customer in schema
    public class Customer
    {
        // primary key for table customer
        [Key]
        public int Customerid { get; set; }
        // other members for fields of this table
        // license number
        public int DrvLicNumber { get; set; }
        // full name of customer
        public string FullName { get; set; }
        // customer address
        public string Address { get; set; }

    }
}
