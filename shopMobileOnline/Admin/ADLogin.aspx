<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADLogin.aspx.cs" Inherits="shopMobileOnline.Admin.ADLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <link rel="icon" href="../images/3.png" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <style>
        * {
            color: #2b2b2b;
        }
        

        .adlogin-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }

        .content-container {
            box-shadow: rgba(0,0,0,0.2) 0px 6px 10px;
            width: 50%;
            max-width: 500px;
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

            .content-header input {
                display: block;
                width: 50%;
                text-decoration: none;
                background: #f7faff;
                box-shadow: rgba(0,0,0,0.2) 2px -2px 5px inset;
                height: 100%;
                text-align: center;
                padding: 15px 0;
                color: #171717;
                border: none;
                font-weight: bold;
                cursor: pointer;
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
            color: #515151;
            justify-content: center;
        }
        .content-body-header p{
            text-align: center;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
            font-weight: bold
        }
        .content-body-items {
            width: 60%;
            margin: 0px auto 20px;
           
        }
        .content-item {
            display: flex;
            align-items: center;
        }
        .content-txt {
            margin: 10px;
         }
        .content-item i{
            margin-right: 8px;
            width: 8%;
        }
        .content-item div {
            width: 90%
        }
        .content-txt input{
            width: 95%;
            padding: 7px;
        }
        .content-txt input:focus
         {
            background: #fffaf7;
            transition: all 0.2s ease-in;
           border: 1.1px solid #aaaaaa;
        }
        .content-checkbox{
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
        #btnDangNhap {
            background: #052f87;
            padding: 10px 15px;
            border: none;
            color: white;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            margin: 0 auto;
            cursor: pointer;
        }
            #btnDangNhap:hover {
                background: #1d4ebd;
                transition: all 0.2s ease-in;
            }
        .txterror {
            color: tomato;
            display: block;
            margin-top: 5px;
        }
        #lbThongBao {
            text-align: center;
        }
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
       .container-popup{
            width: 100%;
            height: 730px;
            position: fixed;
            background-color: rgba(0, 0, 0, 0.473);
            display: none;
            top:0;
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
        .x-icon{
            font-size: 35px;
            margin-left: 45%;
            margin-top: 40px;
            color: #a9ca25;
        }
        .text-popup{
            font-weight: 600;
            color: rgb(97, 97, 97);
            margin-left: 28%;
            margin-top: 30px;
        }                                      
        .active{
            display: block;
           }
        .forquit {
            display: none!important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="containerpu" class="container-popup" runat="server">
        <div class="popup">
            <i class="far fa-times-circle x-icon"></i>
            <p style="font-family:sans-serif;" class="text-popup">SAI MÃ CAPTCHA</p>
        </div>
    </div>
        <div class="adlogin-container">
            <!--<p style="text-align: center; font-size: 30px; font-weight: bold; color: #262626; margin-bottom: 20px">Đăng nhập dành cho Admin</p>
            -->
            <div class="content-container">
                <div class="content-header">
                    <p>Đăng nhập</p>
                    <asp:Button ID="btnDangKi" OnClientClick="alert()" runat="server" Text="Đăng ký" ToolTip="Bạn không được phép đăng kí Admin. Để đăng kí, vui lòng đăng nhập với tư cách Admin, sau đó vào quản lí tài khoản Admin để tiếp tục" />
                </div>
                <div class="content-body">
                    <div class="content-body-header">
                        <i class="fas fa-user-circle img"></i>
                        <p>ADMIN</p>
                    </div>
                    <div class="content-body-items">
                        <div class="content-item content-txt">
                            <i class="fas fa-user"></i>
                            <div>
                                <asp:TextBox ID="txtTenDangNhap" runat="server" placeholder="Tên đăng nhập"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập" ControlToValidate="txtTenDangNhap" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="content-item content-txt">
                            <i class="fas fa-lock"></i>
                            <div>
                                <asp:TextBox ID="txtMatKhau" runat="server" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập mật khẩu" ControlToValidate="txtMatKhau" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="content-item content-checkbox">
                            <asp:CheckBox ID="cbGhiNho" runat="server" />
                            <p style="font-family:sans-serif">Ghi nhớ đăng nhập</p>
                        </div>
                    <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>
                    </div>
                    <asp:Button ID="btnDangNhap" runat="server" Text="Đăng nhập " OnClick="btnDangNhap_Click" />
                </div>

            </div>
        </div>
    </form>
     <script>
            document.addEventListener("DOMContentLoaded", function () {
                var background = document.querySelector('.container-popup');

                background.addEventListener('click', function () {
                    background.classList.remove('active');
                    background.classList.add('forquit');
                })

            })
         function alert() {
                alert("I am an alert box!");
            }
     </script>
</body>
</html>
