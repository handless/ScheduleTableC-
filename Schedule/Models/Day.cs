//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Schedule.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Day
    {
        public Day()
        {
            this.Subject = new HashSet<Subject>();
        }
    
        public int Id { get; set; }
        public string DayName { get; set; }
    
        public virtual ICollection<Subject> Subject { get; set; }
    }
}
