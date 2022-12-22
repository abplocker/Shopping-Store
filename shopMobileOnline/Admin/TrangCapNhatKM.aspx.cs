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
    public partial class TrangCapNhatKM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            if (!IsPostBack)
            {
                string id = Request.QueryString.Get("id");
                DataAccess data = new DataAccess(); 
                data.MoKetNoiCSDL();
                string sqlTrangThaiKM = "SELECT TRANGTHAI FROM KHUYENMAI WHERE MAKM=" + id;
                DataTable tbTrangThai = data.LayBangDuLieu(sqlTrangThaiKM);
                string TrangThaiKM = tbTrangThai.Rows[0]["TRANGTHAI"].ToString();
                if (TrangThaiKM == "0")
                {
                    btnMo.Style.Add("display", "block");
                }
                else if (TrangThaiKM == "1")
                {
                    btnKhoa.Style.Add("display", "block");
                }
                string sql = "SELECT * FROM CHITIETKM A,KHUYENMAI B WHERE A.MAKM = B.MAKM AND A.MAKM=" + id;
                DataTable dt = data.LayBangDuLieu(sql);

                if (dt != null && dt.Rows.Count > 0)
                {
                    txtTen.Text = dt.Rows[0]["TENKM"].ToString();
                    txtPhanTramKM.Text= dt.Rows[0]["PHANTRAMKHUYENMAI"].ToString();
                }
                data.DongKetNoiCSDL();

            }
        }

        protected void btncapnhat_Click(object sender, EventArgs e)
        {
           
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            string id = Request.QueryString.Get("id");
            SqlCommand cmd = new SqlCommand("UPDATE_KM_1", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MAKM", id);
            cmd.Parameters.AddWithValue("@TENKM",txtTen.Text);
            cmd.Parameters.AddWithValue("@PHANTRAM", txtPhanTramKM.Text);
            int a = cmd.ExecuteNonQuery();

            if (a > 0)
            {
                Response.Redirect("ThongKeKM.aspx");

            }
            else
            {
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThongKeKM.aspx");
        }

        protected void btnKhoa_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            string id = Request.QueryString.Get("id");
            SqlCommand cmd = new SqlCommand("KHOA_KM", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MAKM", id);
            int a = cmd.ExecuteNonQuery();

            if (a > 0)
            {
                Response.Redirect("ThongKeKM.aspx");

            }
            else
            {
            }
        }

        protected void btnMo_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            string id = Request.QueryString.Get("id");
            SqlCommand cmd = new SqlCommand("MO_KM", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MAKM", id);
            cmd.Parameters.AddWithValue("@PHANTRAM", txtPhanTramKM.Text);
            int a = cmd.ExecuteNonQuery();

            if (a > 0)
            {
                Response.Redirect("ThongKeKM.aspx");

            }
            else
            {
            }
        }
    }
}