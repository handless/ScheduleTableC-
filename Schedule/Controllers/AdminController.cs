using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Schedule.Models;

namespace Schedule.Controllers
{
    [Authorize(Roles="admin")]
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        TimeTableContainer container = new TimeTableContainer(); 
       // ScheduleModelContainer container = new ScheduleModelContainer();
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult ClassRoomAdd()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ClassRoomAdd(Classroom classroom)
        {
           // класс рум , время, день нужно создавать вместе с парой.. по другому не получится.
            container.ClassroomSet.Add(classroom);
            
            container.SaveChanges();

            return RedirectToAction("Index", "Admin");
        }
       
        //
        // GET: /Admin/GroupAdd
        public ActionResult GroupAdd()
        {
           
            return View();
        }

        [HttpPost]
        public ActionResult GroupAdd(Group group)
        {
         
            
            container.GroupSet.Add(group);
            container.SaveChanges();

            return RedirectToAction("Index", "Admin");
        }


        public ActionResult GroupAndSubjectAdd()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GroupAndSubjectAdd(FormCollection form)
        {
            //string groupname = form["GroupName"];
            //string subjectname = form["SubjectName"];
            //var subject = container.Subjects.FirstOrDefault(m=>m.Name == subjectname);
            ////Group group = new Group
            ////{
            ////    Name = groupname,
            ////    Subject = subject,
                
            ////};

            //var group = container.Groups.FirstOrDefault(g => g.Name == groupname);
            //// Если группы не существует, то выдать ошибку или как-то сказать юзеру(validation), но не return null; =)
            //if (group == null) return null;

            //group.Subject.Add(subject);
            
            ////container.Groups.Add(group);
            //container.SaveChanges();
            return RedirectToAction("Index", "Admin");
        }
    }
}
