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
	public partial class QLYDanhMuc : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            //hien thi ten nguoi dung o goc tren phai

            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();

            //Lay du lieu tu dtb luu vao dataTable
            string sql = "SELECT ID_NSX, TENNSX, 'TrangCapNhatSP.aspx?idSP=' + CAST(ID_NSX AS NVARCHAR) AS CAPNHAT, ID_NSX AS XOA FROM NHASANXUAT";

            DataTable dtNSX = dataAccess.LayBangDuLieu(sql);

            //Tao html dong duoi dang string de tao bang show du lieu
            if (dtNSX != null && dtNSX.Rows.Count > 0)
            {

                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dtNSX.Rows)
                {
                    sb.Append("<tr class=\"qldm-row\">");
                    foreach (DataColumn dc in dtNSX.Columns)
                    {
                        if (dc.ColumnName == "CAPNHAT")
                        {
                            sb.Append("<th class=\"qldm-item\">");
                            sb.Append("<a href=\"TrangCapNhatNSX.aspx?idNSX=" + dr["ID_NSX"] + "\" class=\"qldm-btnCapNhat\">Cập Nhật</a>");
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "TENNSX")
                        {
                            sb.Append("<th class=\"qldm-item\" id=\"qldm-item-tendm\">");
                            sb.Append("<a href=\"/KH/TrangSPTheoNSX.aspx?idNSX=" + dr["ID_NSX"] + "\">" + dr[dc.ColumnName].ToString() + "</a");
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "XOA")
                        {
                            sb.Append("<th class=\"qldm-item\" id=\"qldm-item-xoa\">");
                            sb.Append("<a href=\"TrangXoaNSX.aspx?idNSX=" + dr["ID_NSX"] + "\" class=\"qldm-btnXoa\">Xóa</a>");
                            sb.Append("</th>");
                        }

                    }
                    sb.Append("</tr>");
                }

                //Ket noi string html vao trang asp
                Panel1.Controls.Add(new Label { Text = sb.ToString() });

                //dong connection
                //if (connection.State == ConnectionState.Closed)
                //    connection.Close();
                dataAccess.DongKetNoiCSDL();
            }

        }
    }
}