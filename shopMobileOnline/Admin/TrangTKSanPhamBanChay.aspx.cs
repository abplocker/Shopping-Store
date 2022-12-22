using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.Admin
{
    public partial class TrangTKSanPhamBanChay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
           
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sqlDHChoDuyet = "SELECT TENSP,SOLUONG_DABAN,DONGIA FrOM SANPHAM WHERE SOLUONG_DABAN>'" + Int32.Parse(TextBox1.Text) + "' AND TINHTRANG=1";

            DataTable dtDHChoDuyet = dataAccess.LayBangDuLieu(sqlDHChoDuyet);

            StringBuilder table = new StringBuilder();
            if (dtDHChoDuyet != null && dtDHChoDuyet.Rows.Count > 0)
            {
                foreach (DataRow dr in dtDHChoDuyet.Rows)
                {
                    table.Append("<tr class=\"table-tr\">");

                    table.Append("<td class=\"table-td table-item\">" + dr["TENSP"] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + dr["SOLUONG_DABAN"] + "</td>");
                    //table.Append("<td class=\"table-td table-item\">" + dr["TONGSL"] + "</td>");

                    table.Append("<td class=\"table-td table-item\">" + String.Format("{0:N0}", int.Parse(dr["DONGIA"].ToString())) + "</td>");

                    //table.Append("<td class=\"table-td table-item\"><a href=\"/Admin/ADChiTietDonHang.aspx?t=3&idDH=" + dr["ID_DONHANG"] + "\" class=\"qldh-btnXem\">Xem</a> </td>");
                }

                Panel1.Controls.Add(new Label { Text = table.ToString() });

                dataAccess.DongKetNoiCSDL();
            }
        }
    }
}