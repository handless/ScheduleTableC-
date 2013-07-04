using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class Students:IDataBase
    {

        private struct Student
        {
            public string FirstName,LastName;
            public int GroupId;

            public Student(string FirstName, string LastName,int GroupId )
            {
                this.FirstName = FirstName;
                this.LastName = LastName;
                this.GroupId = GroupId;
            }
        }
        private List<Student> myStudents = new List<Student>();

        protected string Name { get; set; }

        public void SaveChanges()
        {
            // Save Data in DataBase

        }

        //Method For Tests
        protected string ShowStudentsName()
        {
            string NameMass = "";
          
            foreach (var item in myStudents)
            {
                NameMass += " " + item.FirstName;
            }
            return NameMass;
        }


        protected void Add(string FirstName, string LastName,int GroupId)
        {
            myStudents.Add(new Student(FirstName, LastName,GroupId));
        }
       
    }
}