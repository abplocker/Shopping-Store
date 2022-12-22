<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="KHDangNhap.aspx.cs" Inherits="shopMobileOnline.KH.KHDangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        input{
            outline:none;
            border:none;
        }

        .khdangnhap-container {
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
                box-shadow: rgba(0,0,0,0.2) 2px -2px 5px inset;
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
        .content-body-header p{
            text-align: center;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
            font-weight: bold;
            margin: 15px;
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
            width: 92%
        }
        .content-txt input{
            width: 100%;
            padding: 7px;
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
        .btnDangNhap {
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
            .btnDangNhap:hover {
                background: tomato;
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
        #lblMessage {
            text-align: center;
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
.btn-google{
    background:#DB4437!important;
    color:white!important;
    margin-top: 5px;
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
    <script src="index.js"></script>
    <div class="khdangnhap-container">
            <div class="content-container">
                <div class="content-header">
                    <p>Đăng nhập</p>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="KHDangKi.aspx">Đăng ký</asp:HyperLink>
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
                                <asp:TextBox ID="txtTenDangNhap" CssClass="txtInput" runat="server" placeholder="Tên đăng nhập"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập" ControlToValidate="txtTenDangNhap" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="content-item content-txt">
                            <i class="fas fa-lock"></i>
                            <div>
                                <asp:TextBox ID="txtMatKhau" CssClass="txtInput" runat="server" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập mật khẩu" ControlToValidate="txtMatKhau" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="content-item content-checkbox">
                            <asp:CheckBox ID="cbGhiNho" runat="server" />
                            <p>Ghi nhớ đăng nhập</p>
                        </div>
                         <asp:Label ID="lblMessage" runat="server" CssClass="txterror" />
                        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>
                    </div>
                    <asp:Button ID="btnDangNhap" runat="server" Text="Đăng nhập " OnClick="btnDangNhap_Click" CssClass="btnDangNhap" />
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
