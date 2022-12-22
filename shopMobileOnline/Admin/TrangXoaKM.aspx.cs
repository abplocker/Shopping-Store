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
    public partial class TrangXoaKM : System.Web.UI.Page
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
            string id = Request.QueryString.Get("id");
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlKM = "SELECT * FROM KHUYENMAI WHERE MAKM=" + id;
            DataTable dt = dataAccess.LayBangDuLieu(sqlKM);

            lblTen.Text = dt.Rows[0]["TENKM"].ToString();

            dataAccess.DongKetNoiCSDL();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {

           

            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            string id = Request.QueryString.Get("id");
            SqlCommand cmd = new SqlCommand("XOA_KM", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MAKM", id);
            dataAccess.DongKetNoiCSDL();

            Response.Redirect("ThongKeKM.aspx");
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThongKeKM.aspx");
        }
    }
}