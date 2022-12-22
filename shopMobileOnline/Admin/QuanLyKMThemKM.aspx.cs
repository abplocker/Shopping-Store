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
    public partial class QuanLyKMTheoMua : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();
            if (Session["id"] == null)
            {
                Response.Redirect("adlogin.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            try
            {
                SqlParameter[] p =
                    {
                        new SqlParameter("@TENKM",SqlDbType.NVarChar,50),
                        new SqlParameter("@NGAYBD",SqlDbType.Date),
                        new SqlParameter("@NGAYKT",SqlDbType.Date),
                 };
                p[0].Value = txtTenKM.Text;
                p[1].Value = Convert.ToDateTime(txtNgayBD.Text);
                p[2].Value = Convert.ToDateTime(txtNgayKT.Text);

                int a = dataAccess.ExecuteNonQuery("INSERT_KM", p);
                if (a > 0)
                {
                    Label1.Text = "Thêm mới thành công!";
                }
                else
                {
                    Label1.Text = "Thêm mới thất bại!";
                }

                dataAccess.DongKetNoiCSDL();
            }

            catch
            {

            }
            
        }
    }
}