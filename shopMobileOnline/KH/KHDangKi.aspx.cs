using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

namespace shopMobileOnline.KH
{
    public partial class DangKi : System.Web.UI.Page
    {
        static String activationcode;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangKi_Click(object sender, EventArgs e)
        {
            bool isCaptchaValid = false;
            if (Session["CaptchaText"] != null && Session["CaptchaText"].ToString() == txtCaptchaText.Text)
            {
                isCaptchaValid = true;
            }
            if (isCaptchaValid)
            {
                //Tri code gui ma xac nhan qua Email
                Random random = new Random();
                activationcode = random.Next(1001,9999).ToString().Trim();

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                SqlCommand cmd = new SqlCommand("INSERT_KH", dataAccess.getConnection());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TENDANGNHAP", txtTenDangNhap.Text);
                cmd.Parameters.AddWithValue("@MATKHAU", txtMatKhau.Text);
                cmd.Parameters.AddWithValue("@HOTEN", txtHoTen.Text);
                cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                cmd.Parameters.AddWithValue("@DIACHI", txtDiaChi.Text);
                cmd.Parameters.AddWithValue("@SDT", txtSDT.Text);
                cmd.Parameters.AddWithValue("@STATUS", "Unverified");
                cmd.Parameters.AddWithValue("@ACTIVATIONCODE",activationcode.Trim());
                cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                int a = cmd.ExecuteNonQuery();
                

                //co the thu int a = cmd.ExecuteNonQuery(); de check so row effected
                if (a > 0)
                {
                    sendcode();
                    lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
                    Response.Redirect("MailActive.aspx?emailadd="+txtEmail.Text);

                }
                else
                {
                    lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
                }
            }
            else
            {
                containerpu.Style.Add("display", "block");
            }
            

        }

        //Tri code ham gui ma xac nhan qua Email
        private void sendcode()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("proxgroupcdio4@gmail.com","Prox123456");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Xác nhận email của bạn";
            msg.Body = "Chào " + txtEmail.Text + ", Mã xác nhận của bạn là: " + activationcode + " cảm ơn bạn đã đăng ký!";
            string toaddress = txtEmail.Text;
            msg.To.Add(toaddress);
            string fromaddress = "From ProXGroup <proxgroupcdio4@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }
        }
    }
}