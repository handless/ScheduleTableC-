using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class Subjects
    {
        private struct Subject
        {
            public string SubjectName;
            public int GroupId,TeacherId;

            public Subject(string SubjectName, int GroupId, int TeacherId)
            {
                this.SubjectName = SubjectName;
                this.GroupId = GroupId;
                this.TeacherId = TeacherId;
            }
        }
        private List<Subject> mySubjects = new List<Subject>();


        public void SaveChanges()
        {
            // Save Data in DataBase

        }

        //Method For Tests
        protected string ShowSubjectsName()
        {
            string NameMass = "";

            foreach (var item in mySubjects)
            {
                NameMass += " " + item.SubjectName;
            }
            return NameMass;
        }


        protected void Add(string SubjectName,  int GroupId, int TeacherId)
        {
            mySubjects.Add(new Subject(SubjectName,  GroupId, TeacherId));
        }
    }
}