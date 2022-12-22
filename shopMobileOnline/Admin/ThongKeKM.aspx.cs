using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

namespace shopMobileOnline.Admin
{
    public partial class QuanLyKM : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            //check xem nguoi dung co dang trong phien dang nhap
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT CHITIETKM.MAKM, KHUYENMAI.TENKM,NHASANXUAT.TENNSX ,CHITIETKM.PHANTRAMKHUYENMAI,CASE CHITIETKM.TRANGTHAI WHEN '1' THEN N'Mở' WHEN '0' THEN N'Đóng' END AS TINHTRANG,'TrangCapNhatKM.aspx?id='+CAST(CHITIETKM.MAKM AS NVARCHAR) AS CAPNHAT, 'TrangXoaKM.aspx?id='+CAST(KHUYENMAI.MAKM AS NVARCHAR) AS XOA FROM KHUYENMAI, CHITIETKM, NHASANXUAT WHERE CHITIETKM.MAKM = KHUYENMAI.MAKM AND NHASANXUAT.ID_NSX = CHITIETKM.ID_NSX ";


            cmd.Connection = dataAccess.getConnection();
            SqlDataReader rd = cmd.ExecuteReader();

            StringBuilder table = new StringBuilder();

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    table.Append("<tr class=\"table-tr\">");
                    table.Append("<td class=\"table-td table-item\">" + rd[0] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[1] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[2] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[3] + "</td>");
                    table.Append("<td class=\"table-td table-item\">" + rd[4] + "</td>");
                    table.Append("<td class=\"table-td table-item\"><a href=\"/Admin/" + rd[5] + "\" class=\"qlkm-btnCapNhat\">Cập nhật</a> </td>");
                    table.Append("</tr>");
                }

            }
            table.Append("</table>");
            PlaceHolder2.Controls.Add(new Literal { Text = table.ToString() });
            rd.Close();
        }   
    }
}