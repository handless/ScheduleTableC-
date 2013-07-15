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


        

        public ActionResult GroupScheduleAjax(string groupName)
        {
            //var monday = container.DaySet.Where(q => q.Name == "Monday");
            
            // var lesson = container.LessonSet.Where(r => r.Day == monday.FirstOrDefault());

            // ViewBag.test = lesson;


            // Берем предметы за 1 день
            //string GroupSelected = "КИ102";


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
            // Попробуем вывести инфу об одном уроке в понедельник. 

            
           // var lesson = container.LessonSet.Where(r => r.Day == monday.FirstOrDefault());
           
           // ViewBag.test = lesson;


            // Берем предметы за 1 день
            //string GroupSelected = "КИ102";
            
            
            //    Queue<Teacher> teachers = new Queue<Teacher>();
            //    Queue<Classroom> classrooms = new Queue<Classroom>();
            //    Queue<string> subjectnames = new Queue<string>();
            //    Queue<int> HowMuchInOneDay = new Queue<int>();
            //    int howMuch = 0;
            //    for (int i = 1; i < 3; i++) // Проходим по всей недели
            //    {
            //        var day = container.DaySet.Where(e => e.Id == i); // Берем первый день
            //        if (day != null)
            //        {
            //            // Добавить пункт из которого будет браться группа.. выпадающий список во вьюхе
            //            // выбираем группу, она передается сюда и делаем выбор урока по двум критериям, т.е. ставим еще 1 where
            //            // .Where(q => q.Group == container.GroupSet.Where(e => e.Name == "КИ103").FirstOrDefault()); - не работает

            //            var lesson = container.LessonSet.Where(r => r.Day == day.FirstOrDefault()); // берем все предметы в этот день


            //            // берем по одному предмету и достаем оттуда учителя, аудиторию и название , записываем в кучу  
            //            // и присваеваем во вьюбег, потом во вьюхе достаем.
            //            foreach (var item in lesson)
            //            {
            //                if (item.Group.FirstOrDefault().Name == GroupSelected) // здесь будем проверять на группу. т.е. комментарий выше.
            //                {
            //                    var teacher = container.TeacherSet.Where(q => q.Id == item.Teacher.Id).FirstOrDefault();
            //                    var classroom = container.ClassroomSet.Where(w => w.Id == item.Classroom.Id).FirstOrDefault();
            //                    teachers.Enqueue(teacher);
            //                    classrooms.Enqueue(classroom);
            //                    subjectnames.Enqueue(item.SubjectName);
            //                    howMuch++;
            //                }
            //            }

            //        }
            //        HowMuchInOneDay.Enqueue(howMuch);
            //        howMuch = 0;

            //    }

            //    HowMuchInOneDay.Enqueue(3);
            //    HowMuchInOneDay.Enqueue(3);
            //    HowMuchInOneDay.Enqueue(3);
            //    ViewBag.HowMuchInOnDay = HowMuchInOneDay;
            //    ViewBag.Teachers = teachers;
            //    ViewBag.ClassRooms = classrooms;
            //    ViewBag.SubjectNames = subjectnames;

            //    GroupSelected = form["GroupSelected"];
            //    ViewBag.GroupSelected = GroupSelected;
            //    //
            //    var days = container.DaySet.Where(e => e.Name == "Monday");
           
            ////var mySubject = containter.SubjectSet.Where(q => q.Teacher == containter.TeacherSet.Where(r => r.)
            return View();
        }

        public ActionResult TeacherSchedule()
        {
            
            ViewBag.Teachers = container.TeacherSet.Where(g => g.Id > 0);
            return View();
        }

    }
}
