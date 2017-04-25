using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    string conn = System.Configuration.ConfigurationManager.ConnectionStrings["my-con"].ToString();
    string book_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Auto_gen();
        //GridView1.Visible = true;
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Label1.Text = null;
        txt_id.Text = null;
        txt_name.Text = null;
        txt_auth.Text = null;
        txt_price.Text = null;
        txt_publ.Text = null;
    }

    
    public void Auto_gen()
    {
        //DataSet ds_ID = new DataSet();
        //SqlDataAdapter da_ID = new SqlDataAdapter("SELECT COUNT(b_id)+1 from tbl_book",conn);

        //da_ID.Fill(ds_ID);
        //{
        //   book_id = ds_ID.Tables[0].Rows[0][0].ToString();
        //   txt_id.Text = book_id;
        //}

        txt_id.Text = txt_name.Text.Substring(0,1)+"-"+txt_auth.Text.Substring(0,2)+"-"+txt_publ.Text.Substring(0,3)+"-"+txt_price.Text;
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
       Auto_gen();

       SqlConnection cn = new SqlConnection(conn);
       DataSet ds_check = new DataSet();
       SqlDataAdapter da_check = new SqlDataAdapter("SELECT b_id from tbl_book where b_id = '" + txt_id.Text + "'", conn);
       da_check.Fill(ds_check);
       if (ds_check.Tables[0].Rows.Count == 0)
       {
           //Auto_gen();
           //int b_id = Convert.ToInt32(txt_id.Text);
           Double price = Convert.ToDouble(txt_price.Text);
           cn.Open();
           string str_save = "INSERT into tbl_book VALUES('" + txt_id.Text + "','" + txt_name.Text + "','" + txt_auth.Text + "','" + txt_publ.Text + "'," + price + ")";

           SqlCommand cmd_save = new SqlCommand(str_save, cn);
           cmd_save.ExecuteNonQuery();

           Label1.Text = "Record Submitted Successfully!";
           // b_id = 0;
           cn.Close();
       }
       else
       {
           Label1.Text = "Server Error- Please Click RESET!.";
       }
       GridView1.Visible = true;
       GridView1.DataBind();
    }

}