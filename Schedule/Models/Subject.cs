using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class Subject:Subjects
    {
        public void AddSubject(string SubjectName, int GroupId, int TeacherId)
        {
            Add(SubjectName, GroupId,  TeacherId);

        }

        public string ShowSubjectsName()
        {
            string Names = base.ShowSubjectsName();
            return Names;
        }

        public bool DeleteSubject()
        {
            return false;
        }

        public bool SearchSubject()
        {
            return false;
        }
    }
}