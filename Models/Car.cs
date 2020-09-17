using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    // a class representing table Car
    public class Car
    {
        // primary key of car
        [Key]
        public int CarId { get; set; }
        // other member properties used as table fields
        // car tag number
        public string TagNumber { get; set; }
        // make of car
        public string Make { get; set; }
        // model of car
        public string Model { get; set; }
        // year of the car
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CarYear { get; set; }
        //is car available
        public bool IsAvailable { get; set; }
   
        // other assessories avaiable bool fields
        public bool AirConditioned { get; set; }
        public bool DVDPlayer { get; set; }
        public bool AirBags { get; set; }
    }
}
