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
        ScheduleModelContainer container = new ScheduleModelContainer();
        public ActionResult Index()
        {
            
            return View();
        }

        public ActionResult TeacherAdd(FormCollection form)
        {
            return View();
        }

        public ActionResult TeacherAddSubmit(FormCollection form)
        {

            // Разобраться со связями и подсчетом часов

            Teacher teacher = new Teacher
            {
               FirstName = form["FirsName"],
               LastName = form["LastName"],
               Hours = 2,
               
              


            };
            container.Teachers.Add(teacher);
            container.SaveChanges();
            return RedirectToAction("Index", "Admin");
        }

        public ActionResult SubjectAdd(FormCollection form)
        {
            return View();
        }

        public ActionResult SubjectAddSubmit(FormCollection form)
        {
            // Разобраться со связями
            //var teacher = container.Teachers.Where(m=> m.Subject==)
            string TeacherFirstName = form["TeachersFirstName"];
            var teacherId = container.Teachers.Where(m => m.FirstName == TeacherFirstName);
            
           Subject subject = new Subject
            {
                Name = form["SubjectName"],
                TeacherId = Int32.Parse(teacherId.First().Id.ToString()) ,
                
            };
            container.Subjects.Add(subject);
            container.SaveChanges();
            return RedirectToAction("Index", "Admin");
        }
        public ActionResult StudentAdd(FormCollection form)
        {
            return View();
        }

        public ActionResult StudentAddSubmit(FormCollection form)
        {
            var prepods = container.Teachers.Where(t => t.Hours > 666);

            var subjects = container.Subjects.Where(s => s.Teacher.FirstName == "Vorobei");
            string groupname = form["GroupName"];
            var groups = container.Groups.Where(g => g.Name == groupname);

            //var groupId = 0;
            //foreach (var item in groups.ToList())
            //{
            //    groupId = item.Id;
            //}

            var groupId = Int32.Parse(form["GroupId"]);
            string firstName = form["FirstName"].ToString();
            string lastName = form["LastName"].ToString();
            //GroupId пока что задаем руками, вернутся позже!!
            Student student = new Student
            {
                FirstName = firstName,
                LastName = lastName,
                GroupId = Int32.Parse(groups.First().Id.ToString())
               
            };
            container.Students.Add(student);
            container.SaveChanges();
            return RedirectToAction("Index", "Admin");
        }

        public ActionResult GroupAdd()
        {
           
            return View();
        }

        public ActionResult GroupAddSubmit(FormCollection form)
        {
            //Add DataBase Save
            //!! Добавить шаблонизатор для проверки правильности ввода
            string subjectname = form["subjectname"];
            var subject = container.Subjects.Where(g => g.Name == subjectname);
            Group group = new Group
            {
                Name = form["GroupName"],
                Subject = subject.ToList()
            };
            container.Groups.Add(group);
            container.SaveChanges();
            return RedirectToAction("Index", "Admin");
        }
    }
}
