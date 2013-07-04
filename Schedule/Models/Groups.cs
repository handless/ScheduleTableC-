using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class Groups:IDataBase
    {
        //Сперва использовал struct Group, но возникли проблемы с колекцией, перешел на использование классов
        //он приватный и его ниже видно не будет, так что обращать внимание на одинаковые имена не стоит и тем самым
        //сохраним логику проекта
        private class Group
        {
            public List<int> SubjectIdCollection = new List<int>();
            //public int  SubjectId;
            public string GroupName;

            public Group(string GroupName,  int SubjectId)
            {
                this.SubjectIdCollection.Add(SubjectId);
                this.GroupName = GroupName;
            }
        }
        private List<Group> myGroups = new List<Group>();
       
        
        
        public void SaveChanges()
        { 
         // Save Data in DataBase
           
        }

        //Method For Tests
        protected string ShowGroupName()
        {
            string NameMass = "";
            foreach (var item in myGroups)
            {
                NameMass += " "+item.GroupName;
            }
            return NameMass;
        }


        protected void Add(string GroupName,int SubjectId) 
        {
            myGroups.Add(new Group(GroupName, SubjectId)); 
        }
       
    }
}