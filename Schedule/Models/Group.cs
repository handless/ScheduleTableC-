using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class Group:Groups
    {

        public  void AddGroup(string GroupName,int SubjectId)
        {
            Add(GroupName, SubjectId);
            
        }

        public string ShowGroupName() 
        {
           string Names = base.ShowGroupName();
           return Names;
        }

        public bool DeleteGroup()
        {
            return false;
        }

        public bool SearchGroup()
        {
            return false;
        }

       
    }
}