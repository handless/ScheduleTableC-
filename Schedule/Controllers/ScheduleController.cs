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

        TimeTableContainer containter = new TimeTableContainer();
       // ScheduleModelContainer container = new ScheduleModelContainer();

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
           

            
            return View();
        }

        public ActionResult GroupSchedule()
        {
            Queue<Group> queuegroup = new Queue<Group>();
            var mygroup = containter.GroupSet.Where(q => q.Id > 0);
            foreach (var item in mygroup)
            {
                queuegroup.Enqueue(item);
            }

            ViewBag.Group = queuegroup;

            var mySubject = containter.SubjectSet.Where(q => q.Teacher == containter.TeacherSet.Where(r => r.)
            return View();
        }

        public ActionResult TeacherSchedule()
        {
            
            ViewBag.Teachers = containter.TeacherSet.Where(g => g.Id > 0);
            return View();
        }

    }
}
