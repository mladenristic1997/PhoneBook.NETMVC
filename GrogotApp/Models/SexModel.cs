using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GrogotApp.Models
{
    public class SexModel
    {
        public SexModel(int id, string name)
        {
            SexId = id;
            Sex = name;
        }

        public int SexId { get; set; }
        public string Sex { get; set; }
    }
}