﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Schedule.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TimeTableContainer : DbContext
    {
        public TimeTableContainer()
            : base("name=TimeTableContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Lesson> LessonSet { get; set; }
        public DbSet<Classroom> ClassroomSet { get; set; }
        public DbSet<Time> TimeSet { get; set; }
        public DbSet<Group> GroupSet { get; set; }
        public DbSet<Teacher> TeacherSet { get; set; }
        public DbSet<Day> DaySet { get; set; }
        public DbSet<Student> StudentSet { get; set; }
        public DbSet<Subject> SubjectSet { get; set; }
    }
}