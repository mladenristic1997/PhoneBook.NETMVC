using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GrogotApp.Models
{
    public class PersonViewModel
    {
        public int PersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public bool Sex { get; set; }
        public string Email { get; set; }
        public int CountryId { get; set; }
        public int CityId { get; set; }
        public System.DateTime DOB { get; set; }
    }
}