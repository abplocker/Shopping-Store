using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace shopMobileOnline.Admin
{
    public partial class AD_Loc_SP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string strSearch = Request.QueryString.Get("search2");
            
            if (Session["id"] == null)
            {
                Response.Redirect("ADLogin.aspx");
            }
            //hien thi ten nguoi dung o goc tren phai
            else
            {

                

            }

            if (!IsPostBack)
            {
                DataAccess dataAccess = new DataAccess();

                dataAccess.MoKetNoiCSDL();

                String sql = "";
                if (strSearch != null)
                {
                    sql = "SELECT ID_SP, TENSP, TENNSX, TENLOAI, DONGIA, SOLUONG_DABAN, CASE TINHTRANG WHEN 1 THEN N'Mở' ELSE N'Đóng' END AS TINHTRANG, 'TrangCapNhatSP.aspx?idSP=' + CAST(ID_SP AS NVARCHAR) AS CAPNHAT, ID_SP AS XOA FROM [SANPHAM], [NHASANXUAT], [LOAI] WHERE ( [SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI AND [NHASANXUAT].TENNSX like '%" + @strSearch + "%') OR ( [SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI AND [SANPHAM].TENSP like '%" + @strSearch + "%') OR ( [SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI AND [LOAI].TENLOAI like '%" + @strSearch + "%') OR ( [SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI AND TINHTRANG like '%" + @strSearch + "%')";
                }
                else
                {
                    sql = "SELECT ID_SP, TENSP, TENNSX, TENLOAI, DONGIA, SOLUONG_DABAN, CASE TINHTRANG WHEN 1 THEN N'Mở' ELSE N'Đóng' END AS TINHTRANG, 'TrangCapNhatSP.aspx?idSP=' + CAST(ID_SP AS NVARCHAR) AS CAPNHAT, ID_SP AS XOA FROM [SANPHAM], [NHASANXUAT], [LOAI] WHERE [SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI";
                }
                //Lay du lieu tu dtb luu vao dataTable


                DataTable dtSP = dataAccess.LayBangDuLieu(sql);

                //Tao html dong duoi dang string de tao bang show du lieu
                if (dtSP != null && dtSP.Rows.Count > 0)
                {

                    StringBuilder sb = new StringBuilder();

                    foreach (DataRow dr in dtSP.Rows)
                    {
                        sb.Append("<tr class=\"qlsp-row\">");
                        foreach (DataColumn dc in dtSP.Columns)
                        {
                            if (dc.ColumnName == "CAPNHAT")
                            {
                                sb.Append("<th class=\"qlsp-item\">");
                                sb.Append("<a href=\"" + dr[dc.ColumnName].ToString() + "\" class=\"qlsp-btnCapNhat\">Cập nhật</a>");
                                sb.Append("</th>");
                            }

                            else if (dc.ColumnName == "TENSP")
                            {
                                sb.Append("<th class=\"qlsp-item\" id=\"qlsp-item-tensp\">");
                                sb.Append("<a href=\"/KH/TrangChiTietSP.aspx?idSP=" + dr["ID_SP"] + "\">" + dr[dc.ColumnName].ToString() + "</a");
                                sb.Append("</th>");
                            }

                            else if (dc.ColumnName == "DONGIA")
                            {
                                sb.Append("<th class=\"qlsp-item\">");
                                sb.Append(String.Format("{0:n0}", dr["DONGIA"]).Trim());
                                sb.Append("</th>");
                            }

                            else if (dc.ColumnName == "XOA")
                            {
                                sb.Append("<th class=\"qlsp-item\" id=\"qlsp-item-xoa\">");
                                sb.Append("<a href=\"TrangXoaSP.aspx?idSP=" + dr["ID_SP"] + "\" class=\"qlsp-btnXoa\">Xóa</a>");
                                sb.Append("</th>");
                            }

                            else
                            {
                                sb.Append("<th class=\"qlsp-item\">");
                                sb.Append(dr[dc.ColumnName].ToString().Trim());
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();


            //Lay du lieu tu dtb luu vao dataTable

            string sql = "SELECT ID_SP, TENSP, TENNSX, TENLOAI, DONGIA, SOLUONG_DABAN, CASE TINHTRANG WHEN 1 THEN N'Mở' ELSE N'Đóng' END AS TINHTRANG, 'TrangCapNhatSP.aspx?idSP=' + CAST(ID_SP AS NVARCHAR) AS CAPNHAT, ID_SP AS XOA FROM [SANPHAM], [NHASANXUAT], [LOAI] WHERE[SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI ORDER BY LOAI.TENLOAI  ";
            DataTable dtSP = dataAccess.LayBangDuLieu(sql);

            //Tao html dong duoi dang string de tao bang show du lieu
            if (dtSP != null && dtSP.Rows.Count > 0)
            {

                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dtSP.Rows)
                {
                    sb.Append("<tr class=\"qlsp-row\">");
                    foreach (DataColumn dc in dtSP.Columns)
                    {
                        if (dc.ColumnName == "CAPNHAT")
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append("<a href=\"" + dr[dc.ColumnName].ToString() + "\" class=\"qlsp-btnCapNhat\">Cập nhật</a>");
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "TENSP")
                        {
                            sb.Append("<th class=\"qlsp-item\" id=\"qlsp-item-tensp\">");
                            sb.Append("<a href=\"/KH/TrangChiTietSP.aspx?idSP=" + dr["ID_SP"] + "\">" + dr[dc.ColumnName].ToString() + "</a");
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "DONGIA")
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append(String.Format("{0:n0}", dr["DONGIA"]).Trim());
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "XOA")
                        {
                            sb.Append("<th class=\"qlsp-item\" id=\"qlsp-item-xoa\">");
                            sb.Append("<a href=\"TrangXoaSP.aspx?idSP=" + dr["ID_SP"] + "\" class=\"qlsp-btnXoa\">Xóa</a>");
                            sb.Append("</th>");
                        }

                        else
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append(dr[dc.ColumnName].ToString().Trim());
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

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();


            //Lay du lieu tu dtb luu vao dataTable

            string sql = "SELECT ID_SP, TENSP, TENNSX, TENLOAI, DONGIA, SOLUONG_DABAN, CASE TINHTRANG WHEN 1 THEN N'Mở' ELSE N'Đóng' END AS TINHTRANG, 'TrangCapNhatSP.aspx?idSP=' + CAST(ID_SP AS NVARCHAR) AS CAPNHAT, ID_SP AS XOA FROM [SANPHAM], [NHASANXUAT], [LOAI] WHERE[SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI ORDER BY SANPHAM.DONGIA   ";
            DataTable dtSP = dataAccess.LayBangDuLieu(sql);

            //Tao html dong duoi dang string de tao bang show du lieu
            if (dtSP != null && dtSP.Rows.Count > 0)
            {

                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dtSP.Rows)
                {
                    sb.Append("<tr class=\"qlsp-row\">");
                    foreach (DataColumn dc in dtSP.Columns)
                    {
                        if (dc.ColumnName == "CAPNHAT")
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append("<a href=\"" + dr[dc.ColumnName].ToString() + "\" class=\"qlsp-btnCapNhat\">Cập nhật</a>");
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "TENSP")
                        {
                            sb.Append("<th class=\"qlsp-item\" id=\"qlsp-item-tensp\">");
                            sb.Append("<a href=\"/KH/TrangChiTietSP.aspx?idSP=" + dr["ID_SP"] + "\">" + dr[dc.ColumnName].ToString() + "</a");
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "DONGIA")
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append(String.Format("{0:n0}", dr["DONGIA"]).Trim());
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "XOA")
                        {
                            sb.Append("<th class=\"qlsp-item\" id=\"qlsp-item-xoa\">");
                            sb.Append("<a href=\"TrangXoaSP.aspx?idSP=" + dr["ID_SP"] + "\" class=\"qlsp-btnXoa\">Xóa</a>");
                            sb.Append("</th>");
                        }

                        else
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append(dr[dc.ColumnName].ToString().Trim());
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

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();


            //Lay du lieu tu dtb luu vao dataTable

            string sql = "SELECT ID_SP, TENSP, TENNSX, TENLOAI, DONGIA, SOLUONG_DABAN, CASE TINHTRANG WHEN 1 THEN N'Mở' ELSE N'Đóng' END AS TINHTRANG, 'TrangCapNhatSP.aspx?idSP=' + CAST(ID_SP AS NVARCHAR) AS CAPNHAT, ID_SP AS XOA FROM [SANPHAM], [NHASANXUAT], [LOAI] WHERE[SANPHAM].ID_NSX = [NHASANXUAT].ID_NSX AND [SANPHAM].ID_LOAI = [LOAI].ID_LOAI ORDER BY SANPHAM.TINHTRANG";
            DataTable dtSP = dataAccess.LayBangDuLieu(sql);

            //Tao html dong duoi dang string de tao bang show du lieu
            if (dtSP != null && dtSP.Rows.Count > 0)
            {

                StringBuilder sb = new StringBuilder();

                foreach (DataRow dr in dtSP.Rows)
                {
                    sb.Append("<tr class=\"qlsp-row\">");
                    foreach (DataColumn dc in dtSP.Columns)
                    {
                        if (dc.ColumnName == "CAPNHAT")
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append("<a href=\"" + dr[dc.ColumnName].ToString() + "\" class=\"qlsp-btnCapNhat\">Cập nhật</a>");
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "TENSP")
                        {
                            sb.Append("<th class=\"qlsp-item\" id=\"qlsp-item-tensp\">");
                            sb.Append("<a href=\"/KH/TrangChiTietSP.aspx?idSP=" + dr["ID_SP"] + "\">" + dr[dc.ColumnName].ToString() + "</a");
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "DONGIA")
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append(String.Format("{0:n0}", dr["DONGIA"]).Trim());
                            sb.Append("</th>");
                        }

                        else if (dc.ColumnName == "XOA")
                        {
                            sb.Append("<th class=\"qlsp-item\" id=\"qlsp-item-xoa\">");
                            sb.Append("<a href=\"TrangXoaSP.aspx?idSP=" + dr["ID_SP"] + "\" class=\"qlsp-btnXoa\">Xóa</a>");
                            sb.Append("</th>");
                        }

                        else
                        {
                            sb.Append("<th class=\"qlsp-item\">");
                            sb.Append(dr[dc.ColumnName].ToString().Trim());
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