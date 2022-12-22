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
    public partial class TrangXoaNSX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            //hien thi ten nguoi dung o goc tren phai
            else
            {

            }
            string idNSX = Request.QueryString.Get("idNSX").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlNSX = "SELECT * FROM NHASANXUAT WHERE ID_NSX="+idNSX;

            DataTable dt = dataAccess.LayBangDuLieu(sqlNSX);

            lblNSX.Text = dt.Rows[0]["TENNSX"].ToString();

            dataAccess.DongKetNoiCSDL();

        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string idNSX = Request.QueryString.Get("idNSX").ToString();

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "DELETE FROM NHASANXUAT WHERE ID_NSX = " + idNSX;

            SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());

            cmd.ExecuteNonQuery();

            dataAccess.DongKetNoiCSDL();

            Response.Redirect("QLYDanhMuc.aspx");
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QLYDanhMuc.aspx");
        }
    }
}