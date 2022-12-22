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
    public partial class TrangCapNhatNSX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            //hien thi ten nguoi dung o goc tren phai
            if (!IsPostBack)
            {
                string idNSX = Request.QueryString.Get("idNSX").ToString();
                DataAccess dataAccess = new DataAccess();
                string sqlNSX = "SELECT * FROM NHASANXUAT where ID_NSX=" +idNSX;

                dataAccess.MoKetNoiCSDL();

                DataTable dtNSX = dataAccess.LayBangDuLieu(sqlNSX);
                if (dtNSX != null && dtNSX.Rows.Count > 0)
                {
                    //Set du lieu cho cac field html
                    txtTenNSX.Text = dtNSX.Rows[0]["TENNSX"].ToString();
                    SqlCommand cmdNSX = new SqlCommand(sqlNSX, dataAccess.getConnection());
                }
                //dong connection
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            string idNSX = Request.QueryString.Get("idNSX").ToString();
            SqlCommand cmd = new SqlCommand("UPDATE_NSX", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ID_NSX",idNSX);
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