using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Schedule.Models
{
    public class DataBase:IDataBase
    {
        public void SaveChanges()
        {
            // Save Data in DataBase

        }
        // Попытка вынести студентов групы пары и учителей наверх что бы была глобальная видимость. и смог достучатьсяиз любого класса
        //public List<Student> myStudents = new List<Student>();
    }
}