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

        TimeTableContainer container = new TimeTableContainer();
       // ScheduleModelContainer container = new ScheduleModelContainer();

        //[Authorize]
        [AllowAnonymous]
        public ActionResult Index()
        {
 
          
           

            
            return View();
        }


        

        public ActionResult GroupScheduleAjax(string groupName)
        {

            Queue<Teacher> teachers = new Queue<Teacher>();
            Queue<Classroom> classrooms = new Queue<Classroom>();
            Queue<string> subjectnames = new Queue<string>();
            Queue<int> HowMuchInOneDay = new Queue<int>();
            int howMuch = 0;
            for (int i = 1; i < 4; i++) // Проходим по всей недели
            {
                var day = container.DaySet.Where(e => e.Id == i); // Берем первый день
                if (day != null)
                {
                    var lesson = container.LessonSet.Where(r => r.Day == day.FirstOrDefault()); // берем все предметы в этот день
                    // берем по одному предмету и достаем оттуда учителя, аудиторию и название , записываем в кучу  
                    // и присваеваем во вьюбег, потом во вьюхе достаем.
                    foreach (var item in lesson)
                    {
                        if (item.Group.FirstOrDefault().Name == groupName) // здесь будем проверять на группу.
                        {
                            var teacher = container.TeacherSet.Where(q => q.Id == item.Teacher.Id).FirstOrDefault();
                            var classroom = container.ClassroomSet.Where(w => w.Id == item.Classroom.Id).FirstOrDefault();
                            teachers.Enqueue(teacher);
                            classrooms.Enqueue(classroom);
                            subjectnames.Enqueue(item.SubjectName);
                            howMuch++;
                        }
                    }

                }
                HowMuchInOneDay.Enqueue(howMuch);
                howMuch = 0;

            }

            HowMuchInOneDay.Enqueue(3);
            HowMuchInOneDay.Enqueue(3);
            HowMuchInOneDay.Enqueue(3);
            ViewBag.HowMuchInOneDay = HowMuchInOneDay;
            ViewBag.Teachers = teachers;
            ViewBag.ClassRooms = classrooms;
            ViewBag.SubjectNames = subjectnames;

            
           

            return PartialView();
        
        }


        public ActionResult GroupSchedule(FormCollection form)
        {
            Queue<Group> queuegroup = new Queue<Group>();
            // var mygroup = containter.GroupSet.Where(q => q.Id > 0);
             var mygroup = container.GroupSet.Where(w => w.Id > 0);
             foreach (var item in mygroup)
             {
                 queuegroup.Enqueue(item);
             }
            
            ViewBag.Group = queuegroup;
           
            
            return View();
        }

        public ActionResult TeacherSchedule()
        {

            Queue<Teacher> queueteacher = new Queue<Teacher>();
            // var mygroup = containter.GroupSet.Where(q => q.Id > 0);
            var myteacher = container.TeacherSet.Where(w => w.Id > 0);
            foreach (var item in myteacher)
            {
                queueteacher.Enqueue(item);
            }

            ViewBag.Teacher = queueteacher;
            return View();
        }

        public ActionResult TeacherScheduleAjax(string teacherName)
        {

            Queue<Teacher> teachers = new Queue<Teacher>();
            Queue<Classroom> classrooms = new Queue<Classroom>();
            Queue<string> subjectnames = new Queue<string>();
            Queue<int> HowMuchInOneDay = new Queue<int>();
            int howMuch = 0;
            for (int i = 1; i < 6; i++) // Проходим по всей недели
            {
                var day = container.DaySet.Where(e => e.Id == i); // Берем первый день
                if (day != null)
                {
                    var lesson = container.LessonSet.Where(r => r.Day == day.FirstOrDefault()); // берем все предметы в этот день
                    // берем по одному предмету и достаем оттуда учителя, аудиторию и название , записываем в кучу  
                    // и присваеваем во вьюбег, потом во вьюхе достаем.
                    foreach (var item in lesson)
                    {
                        if (item.Teacher.LastName == teacherName) // здесь будем проверять на учителя.
                        {
                            var teacher = container.TeacherSet.Where(q => q.Id == item.Teacher.Id).FirstOrDefault();
                            var classroom = container.ClassroomSet.Where(w => w.Id == item.Classroom.Id).FirstOrDefault();
                            teachers.Enqueue(teacher);
                            classrooms.Enqueue(classroom);
                            subjectnames.Enqueue(item.SubjectName);
                            howMuch++;
                        }
                    }

                }
                HowMuchInOneDay.Enqueue(howMuch);
                howMuch = 0;

            }

            HowMuchInOneDay.Enqueue(3);
            HowMuchInOneDay.Enqueue(3);
            HowMuchInOneDay.Enqueue(3);
            ViewBag.HowMuchInOneDay = HowMuchInOneDay;
            ViewBag.Teachers = teachers;
            ViewBag.ClassRooms = classrooms;
            ViewBag.SubjectNames = subjectnames;

            
           

            return PartialView();
        }

    }
}
