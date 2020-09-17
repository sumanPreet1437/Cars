using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    enum TankLevel
    {
        Empty,Half,Full
    }
    // a class representing RentalOrder table in database
    public class RentalOrder
    {
        [Key] // set primary key using data annotation
        public int RentalOrderId { get; set; }
        // date processed
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime DateProcessed { get; set; }

        // foreign keys
        [ForeignKey("Customer")]
        public int CustomerId { get; set; }
        public Customer Customer { get; set; }
        [ForeignKey("Car")]
        public int CarId { get; set; }
        public Car Car { get; set; }

        // other member fields 
        // tank level in car empty, half or full
        public string TankLevel { get; set; }
        // milage start before renting
        public int MilageStart { get; set; }
        // milage after rent
        public int MilageEnd { get; set; }
        // no of days to rent
        public int Days { get; set; }
        // start date of rent

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime RentStartDate { get; set; }
        // end date for rent

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime RentEndDate { get; set; }
        // rate applied for retning
        public double RateApplied { get; set; }
        // total rent for current order
        public double OrderTotal { get; set; }
        // status: pending or fullfilled
        public string OrderStatus { get; set; }

    }
}
