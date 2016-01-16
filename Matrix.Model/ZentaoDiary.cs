using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Matrix.Model
{
    public class ZentaoDiary
    {
        public string Department;
        public string WorkType;
        public string Project;
        public DateTime StartDate;
        public int WorkHours;
        public string Content;
    }

    public class ZentaoDiaryTask : ZentaoDiary
    {
        public ZentaoDiaryTask() { }

        public ZentaoDiaryTask(string userName, string password, string department, string workType, 
            string project, DateTime startDate, int workHours, string content, string frequency, DateTime updateTime)
        {
            UserName = userName;
            Password = password;
            Department = department;
            WorkType = workType;
            Project = project;
            StartDate = startDate;
            WorkHours = workHours;
            Content = content;
            Frequency = frequency;
            UpdateTime = updateTime;
        }

        public string UserName;
        public string Password;
        public string Frequency;
        public DateTime UpdateTime;
    }
}
