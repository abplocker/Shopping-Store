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
    public partial class TrangThemMoiNSX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("INSERT_NSX", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@TENNSX", txtTenNSX.Text);
            int a = cmd.ExecuteNonQuery();

            if (a > 0)
            {
                Response.Redirect("QLYDanhMuc.aspx");

            }
            else
            {
                lblThongBao.Text = "Đã tồn tại Nhà Sản Xuất";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QLYDanhMuc.aspx");
        }
    }
}