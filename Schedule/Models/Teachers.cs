using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class Teachers:IDataBase
    {
        private struct Teacher
        {
            public string FirstName, LastName;
            public int SubjectId;
            public int hours;

            public Teacher(string FirstName, string LastName, int SubjectId, int hours)
            {
                this.FirstName = FirstName;
                this.LastName = LastName;
                this.SubjectId = SubjectId;
                this.hours = 1;
            }

            
        }
        private List<Teacher> myTeachers = new List<Teacher>();

        protected string Name { get; set; }

        public void SaveChanges()
        {
            // Save Data in DataBase

        }
        //protected void setHours(Teacher teacher,Students students)
        //{
        //    foreach (var item in myStudents)
        //    {
        //        teacher.hours++;
        //    }
        //}
        //Method For Tests
        protected string ShowTeachersName()
        {
            string NameMass = "";
            foreach (var item in myTeachers)
            {
                NameMass += " " + item.FirstName;
            }
            return NameMass;
        }


        protected void Add(string FirstName, string LastName, int SubjectId, int hours)
        {
            myTeachers.Add(new Teacher(FirstName, LastName, SubjectId,hours));
        }
    }
}