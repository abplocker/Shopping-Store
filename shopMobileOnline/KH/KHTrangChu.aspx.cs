using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shopMobileOnline.admin
{
    public partial class TrangDanhSachSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            string sql = "SELECT SP.ID_SP,SP.PHANTRAMKHUYENMAI, ID_NSX, ID_LOAI, TENSP, HINH, SOLUONG, CAST((100 - PHANTRAMKHUYENMAI)*DONGIA/100 AS INT) AS GIAKM, DONGIA, CAST(CAST((100 - PHANTRAMKHUYENMAI)*DONGIA/100 AS INT)*0.4 AS INT) AS GIATRATRUOC FROM SANPHAM SP WHERE TINHTRANG = 1 AND SOLUONG > 0";  

            DataTable dt = dataAccess.LayBangDuLieu(sql);

            if(dt != null && dt.Rows.Count >0)
            {
                this.rptItem.DataSource = dt;
                this.rptItem.DataBind();
            }

            dataAccess.DongKetNoiCSDL();
        }
    }
}