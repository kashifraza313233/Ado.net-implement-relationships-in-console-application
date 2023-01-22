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
            Console.WriteLine("\t\t\t\t\t\t\t\t|Teacher College Profile|");
            Console.WriteLine("\t\t\t\t\t\t\t\t|-----------------------|");
            Console.WriteLine("\t\t\t\t\t\t\t\t|Enter 1 to Insert Teacher Data|");
            Console.WriteLine("\t\t\t\t\t\t\t\t|Enter 2 to Get Data\t\t|");
            Console.WriteLine("\t\t\t\t\t\t\t\t|Enter 3 to Delete Data|");
            //Console.WriteLine(" Enter 4 to Update Data:\t");
            Console.WriteLine("\t\t\t\t\t\t\t\t|Enter 0 to Exist|");
           
            CrudOperation operation = new CrudOperation();
            int n;
            Console.WriteLine("Enter Number:");
            n = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("\n");
            while (n != 0)
            {
                switch (n)
                {
                    case 1:
                        operation.InsertTeacherData();
                        break;
                    case 2:
                        operation.GetTeacherData();
                        break;
                }
                Console.WriteLine("\n");
                Console.WriteLine("Enter Number:");
                n = Convert.ToInt32(Console.ReadLine());
            }
         
        }
    }
    public class CrudOperation
    {
        string ConnectionString = @"Data Source=DESKTOP-EOP4ESH\SQLEXPRESS01;Initial Catalog=TeacherCollegeProfile;Integrated Security=True";
        public void GetTeacherData()
        {
           try
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
            catch(Exception e)
            {
                Console.WriteLine(e.Message);   
            }
        }
        public void InsertTeacherData()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConnectionString);
                conn.Open();
                Console.WriteLine("Please Enter Data:\n");
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
                string query = "insert into Teacher values('" + First_Name + "','" + Last_Name + "','" + Gender + "','" + ContactNo + "','" + EmailAddress + "','" + City + "','" + Address + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                Console.WriteLine("Data Successfully Inserted!");
                conn.Close();
                Console.ReadKey();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message); 
            }
            
        }
      

    }

}
