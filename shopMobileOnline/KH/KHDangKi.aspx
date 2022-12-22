<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="KHDangKi.aspx.cs" Inherits="shopMobileOnline.KH.DangKi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        * {
            color: #2b2b2b;
        }



        .khdangki-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            padding: 15px 0;
        }

        .content-container {
            box-shadow: rgba(0,0,0,0.2) 0px 6px 10px;
            width: 50%;
            max-width: 500px;
            border-radius: 0 0 6px 6px;
        }

        .content-header {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 17px;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
        }

            .content-header p {
                width: 50%;
                text-align: center;
                margin: 0;
                padding: 15px 0;
            }

            .content-header a {
                display: block;
                width: 50%;
                text-decoration: none;
                background: #f7faff;
                box-shadow: rgba(0,0,0,0.2) -2px -2px 5px inset;
                height: 100%;
                text-align: center;
                padding: 15px 0;
                color: #171717;
            }

        .content-body {
            padding: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

            .content-body .img {
                font-size: 100px;
                text-align: center;
                display: block;
                color: #2f3542;
                justify-content: center;
            }

        .content-body-header p {
            text-align: center;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
            font-weight: bold;
            margin: 15px;
        }

        .content-body-items {
            width: 70%;
            margin: 0px auto 20px;
        }

        .content-item {
            display: flex;
            align-items: center;
        }

        .content-txt {
            margin: 10px;
        }

        .content-item i {
            margin-right: 8px;
            width: 8%;
        }

        .content-item div {
            width: 92%
        }

        .content-txt input {
            width: 100%;
            padding: 7px;
        }


        .content-checkbox {
            margin-left: 10px;
        }

            .content-checkbox input {
                margin-right: 8px;
                display: block;
                width: 15px;
                height: 15px;
            }

            .content-checkbox p {
                font-size: 14px;
            }

        .txtDiaChi {
            width: 100%;
            resize: none;
            overflow-y: scroll;
            height: 80px;
            padding: 7px;
        }



        .btnDangKi {
            background: #B2D426;
            padding: 10px 15px;
            border: none;
            color: white;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            margin: 0 auto;
            cursor: pointer;
        }

            .btnDangKi:hover {
                background: tomato;
                transition: all 0.2s ease-in;
            }

        .txterror {
            color: tomato;
            display: block;
            margin-top: 5px;
        }

        .lbThongBao {
            text-align: center;
        }

        .dauSao {
            font-size: 13px;
            color: tomato;
        }
        input {
            border: none;
            outline: none;
        }
        .txtInput {
            border: solid 2px;
            border-radius: 5px;
            border-color: black;
            transition: 0.2s;
        }
       .txtInput:focus{
           border: solid 3px;
           transform: scale(1.05);
           border-color: #B2D426;   
       }

       .popup{
    width: 300px;
    height: 170px;
    background-color: whitesmoke;
    margin-left: auto;
    margin-right: auto;
    margin-top: 16%;
    border-radius: 8px;
    box-shadow: 2px 4px 10px rgb(75, 75, 75);
}
        .container-popup {
            width: 100%;
            height: 730px;
            position: fixed;
            background-color: rgba(0, 0, 0, 0.473);
            display: none;
            top: 0;
        }

       .text-popup{
    font-weight: 600;
    color: rgb(97, 97, 97);
    margin-left: 28%;
    margin-top: 30px;
}
       .x-icon{
    font-size: 35px;
    margin-left: 45%;
    margin-top: 40px;
    color: #a9ca25;
}
.active{
    display: block;
}
        .forquit {
            display: none!important;
        }
        .txtCaptcha{
            border: 0;
            border-bottom: 2px solid gray;
            outline: 0;
            font-size: 1.3rem;
            color: white;
            padding: 7px 0;
            background: transparent;
            transition: border-color 0.2s;
            color: #B2D426;
            width: 50%;
            text-align: center;
            border-color: yellowgreen;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="containerpu" class="container-popup" runat="server">
        <div class="popup">
            <i class="far fa-times-circle x-icon"></i>
            <p style="font-family:sans-serif;" class="text-popup">SAI MÃ CAPTCHA</p>
        </div>
    </div>
    <div class="khdangki-container">
        <!--<p style="text-align: center; font-size: 30px; font-weight: bold; color: #262626; margin-bottom: 20px">Đăng nhập dành cho Admin</p>
            -->
        <div class="content-container">
            <div class="content-header">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="KHDangNhap.aspx">Đăng nhập</asp:HyperLink>
                <p>Đăng ký</p>
            </div>
            <div class="content-body">
                <div class="content-body-header">
                    <i class="fas fa-user-circle img"></i>
                    <p>CUSTOMER</p>
                </div>
                <div class="content-body-items">
                    <div class="content-item content-txt">
                        <i class="fas fa-user"></i>
                        <div>
                            <asp:TextBox ID="txtTenDangNhap" CssClass="txtInput" runat="server" placeholder="Tên đăng nhập (*)"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập" ControlToValidate="txtTenDangNhap" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-lock"></i>
                        <div>
                            <asp:TextBox ID="txtMatKhau" CssClass="txtInput" runat="server" placeholder="Mật khẩu (*)" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập mật khẩu" ControlToValidate="txtMatKhau" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-lock"></i>
                        <div>
                            <asp:TextBox ID="txtNhapLaiMatKhau" CssClass="txtInput" runat="server" placeholder="Nhập lại mật khẩu (*)" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu không trùng khớp" ControlToValidate="txtNhapLaiMatKhau" ControlToCompare="txtMatKhau" Type="String" CssClass="txterror" Display="Dynamic"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-user-circle"></i>
                        <div>
                            <asp:TextBox ID="txtHoTen" CssClass="txtInput" runat="server" placeholder="Họ tên"></asp:TextBox>
                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-envelope"></i>
                        <div>
                            <asp:TextBox ID="txtEmail" CssClass="txtInput" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" CssClass="txterror" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-phone"></i>
                        <div>
                            <asp:TextBox ID="txtSDT" CssClass="txtInput" runat="server" placeholder="Số điện thoại (*)" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bạn chưa nhập số điện thoại" ControlToValidate="txtSDT" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-txt">
                        <i class="fas fa-map-marker-alt"></i>
                        <div>
                            <asp:TextBox ID="txtDiaChi" CssClass="txtDiaChi txtInput" runat="server" placeholder="Địa chỉ nhận hàng (*)" TextMode="MultiLine" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn phải nhập địa chỉ" ControlToValidate="txtDiaChi" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="content-item content-checkbox">
                        <asp:CheckBox ID="cbGhiNho"  runat="server" />
                        <p>Ghi nhớ đăng nhập sau khi đăng ký</p>
                    </div>
                    <div class="content-item content-txt">
                        <asp:Image ID="imgCaptcha" CssClass="content-txt" runat="server" ImageUrl="~/CaptchaImage.aspx" />
                        <asp:TextBox ID="txtCaptchaText" CssClass="txtCaptcha content-txt"  runat="server" Width="100px" />
                    </div>
                    <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror lbThongBao"></asp:Label>
                </div>
                <asp:Button ID="btnDangKi" runat="server" Text="Đăng ký" OnClick="btnDangKi_Click" CssClass="btnDangKi" />
            </div>

        </div>
    </div>
    <script>
            document.addEventListener("DOMContentLoaded", function () {
                var background = document.querySelector('.container-popup');

                background.addEventListener('click', function () {
                    background.classList.remove('active');
                    background.classList.add('forquit');
                })
            })
    </script>
</asp:Content>
