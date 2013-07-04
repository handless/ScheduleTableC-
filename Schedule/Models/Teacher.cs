using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class Teacher:Teachers
    {
        public void AddTeacher(string FirstName, string LastName, int SubjectId,int hours)
        {
            Add(FirstName, LastName, SubjectId,hours);

        }

        public string ShowTeachersName()
        {
            string Names = base.ShowTeachersName();
            return Names;
        }

        public bool DeleteTeacher()
        {
            return false;
        }

        public bool SearchTeacher()
        {
            return false;
        }
    }
}