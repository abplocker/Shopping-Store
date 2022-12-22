using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class QuanLyKMNSX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            if (!IsPostBack)
            {
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();
                string sqlLoai = "select * from NHASANXUAT";
                SqlCommand cmdLoai = new SqlCommand(sqlLoai, dataAccess.getConnection());
                ddNSX.DataSource = cmdLoai.ExecuteReader();
                ddNSX.DataTextField = "TENNSX";
                ddNSX.DataValueField = "ID_NSX";
                ddNSX.DataBind();
                

                try
                {
                    SqlParameter[] p = { };
                    DataTable dt = dataAccess.ExecuteQuery("GETKM", p);
                    
                    if(dt != null && dt.Rows.Count > 0)
                    {
                        this.ddKM.DataSource = dt;
                        this.ddKM.DataTextField = "TENKM";
                        this.ddKM.DataValueField = "MAKM";
                        this.ddKM.DataBind();
                    }
                }
                catch
                {

                }
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            //Cap nhat ty le khuyen mai
            try
            {
                SqlParameter[] p =
                {
                    new SqlParameter("@ID_NSX",SqlDbType.Int),
                    new SqlParameter("@MAKM",SqlDbType.Int),
                    new SqlParameter("@PHANTRAMKHUYENMAI",SqlDbType.Int)
                };
                p[0].Value = ddNSX.SelectedValue;
                p[1].Value = ddKM.SelectedValue;
                p[2].Value = Int32.Parse(txtPhanTramKH.Text);
                int a = dataAccess.ExecuteNonQuery("UPDATEKM", p);
                if (a > 0)
                {
                    Label1.Style.Add("display", "block");
                    Label1.Text = "Áp dụng thành công";
                }
                else
                {
                    Label1.Style.Add("display", "block");
                    Label1.Text = "Áp dụng thất bại";
                    Label1.Style.Add("color", "red");
                }
            }
            catch
            {

            }

            //Them thong tin khuyen mai vao bang chi tiet khuyen mai
            try
            {
                SqlParameter[] p =
                {
                    new SqlParameter("@ID_NSX",SqlDbType.Int),
                    new SqlParameter("@MAKM",SqlDbType.Int),
                    new SqlParameter("@PHANTRAMKHUYENMAI",SqlDbType.Int)
                };
                p[0].Value = ddNSX.SelectedValue;
                p[1].Value = ddKM.SelectedValue;
                p[2].Value = Int32.Parse(txtPhanTramKH.Text);
                int a = dataAccess.ExecuteNonQuery("INSERT_CHITIETKM", p);
            }
            catch
            {

            }
            dataAccess.DongKetNoiCSDL();
        }
    }
}