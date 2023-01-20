using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ado.Net_Relationships
{
    internal class Program
    {
        static void Main(string[] args)
        {
            CrudOperation operation = new CrudOperation();
            operation.GetData();
        }
    }
    public class CrudOperation
    {
        string ConnectionString = @"Data Source=DESKTOP-EOP4ESH\SQLEXPRESS01;Initial Catalog=TeacherCollegeProfile;Integrated Security=True";
        public void GetData()
        {

            SqlConnection conn = new SqlConnection(ConnectionString);
            string query = "Select * from Teacher";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Console.WriteLine(reader[0].ToString() + " " + reader[1].ToString() + " " + reader[2].ToString() + " " + reader[3].ToString()
                    + " " + reader[4].ToString() + " " + reader[5].ToString() + " " + reader[6].ToString());
            }
        }
        public void InsertData()
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            Console.Write("First_Name:");
            string First_Name = Console.ReadLine();
            Console.Write("Last_Name:");
            string Last_Name = Console.ReadLine();
            Console.Write("Gender:");
            string Gender = Console.ReadLine();
            Console.Write("ContactNo:");
            string ContactNo = Console.ReadLine();
            Console.Write("EmailAddress:");
            string EmailAddress = Console.ReadLine();
            Console.Write("City:");
            string City = Console.ReadLine();
            Console.Write("Address:");
            string Address = Console.ReadLine();
            string query = "insert into Teacher(First_Name,Last_Name,Gender,ContactNo,EmailAddress,City,Address)values('" + First_Name + "','" + Last_Name + "','" + Gender + "','" + ContactNo + "','" + EmailAddress + "','" + City + "','" + Address + "',)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            Console.WriteLine("Data Inserted!");
            conn.Close();
            Console.ReadKey();
        }
    }
}
