using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class Student:Students
    {
        public void AddStudent(string FirstName,string LastName, int GroupId)
        {
            Add(FirstName,LastName, GroupId);

        }

        public string ShowStudentsName()
        {
            string Names = base.ShowStudentsName();
            return Names;
        }

        public bool DeleteStudent()
        {
            return false;
        }

        public bool SearchStudent()
        {
            return false;
        }
    }
}