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


        public ActionResult Index()
        {
            //Struct.Subject[] mysbj = new Struct.Subject[5];

            //// Initialize:
            ///*Для проверки сделал структурами так как не знаю как подключить базу данных.*/
            //mysbj[0].SubjectName = "Math";
            //mysbj[0].TeacherId = 1;
            //mysbj[0].SubjectId = 1;
            //mysbj[1].SubjectName = "OOP";
            //mysbj[1].TeacherId = 2;
            //mysbj[1].SubjectId = 2;
            //mysbj[2].SubjectName = "English";
            //mysbj[2].TeacherId = 3;
            //mysbj[2].SubjectId = 3;
            //mysbj[3].SubjectName = "Economic";
            //mysbj[3].TeacherId = 4;
            //mysbj[3].SubjectId = 4;
            //mysbj[4].SubjectName = "Physical Education";
            //mysbj[4].TeacherId = 5;
            //mysbj[4].SubjectId = 5;
            ///**/

            //Group myGroup = new Group();
            //Student myStudent = new Student();
            //myGroup.AddGroup("Hoy", 1);
            //myGroup.AddGroup("motg", 2);
            //myGroup.AddGroup("sda", 3);
            //myStudent.AddStudent("Sasha", "hand", 1);
            //myStudent.AddStudent("Alex","asd",2);
            //myStudent.AddStudent("Petya","sad",1);
            //ViewBag.Test2 = myStudent.ShowStudentsName();
            //ViewBag.Test = myGroup.ShowGroupName();

            var prepods = container.Teachers.Where(t => t.Hours > 666);

            var subjects = container.Subjects.Where(s => s.Teacher.FirstName == "Olga");

            Teacher tt = new Teacher
            {
                FirstName = "Olga",
                LastName = "Prila",
                Subject = container.Subjects.ToList(),
            };
            container.Teachers.Add(tt);
            container.SaveChanges();
            return View();
        }

    }
}
