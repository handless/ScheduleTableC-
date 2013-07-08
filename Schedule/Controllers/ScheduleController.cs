using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Schedule.Models;


namespace Schedule.Controllers
{
    public class ScheduleController : Controller
    {
        //
        // GET: /Schedule/

        ScheduleModelContainer container = new ScheduleModelContainer();

        //[Authorize]
        [AllowAnonymous]
        public ActionResult Index()
        {
 
            //var prepods = container.Teachers.Where(t => t.Hours > 666);

            //var subjects = container.Subjects.Where(s => s.Teacher.FirstName == "Vorobei");

            //Teacher tt = new Teacher
            //{
            //    FirstName = "Yuriy",
            //    LastName = "Vorobei",
                
            //    Subject = container.Subjects.ToList(),
            //};
            //container.Teachers.Add(tt);
            //container.SaveChanges();

            var prepods = container.Teachers.Where(m => m.Id > 0);
            ViewBag.prepods = prepods;
            return View();
        }

    }
}
