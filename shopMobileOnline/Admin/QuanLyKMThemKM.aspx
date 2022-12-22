<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="QuanLyKMThemKM.aspx.cs" Inherits="shopMobileOnline.Admin.QuanLyKMTheoMua" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container-discount{
            width: 970px;
            height: 700px;
            background-color: white;
            box-shadow: 0 3px 10px 0 rgb(0 0 0 / 14%);
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            text-align: center;
        }
        button{
            outline: none;
            border: none;
            cursor: pointer;
        }
        .header-discount{
            text-transform: uppercase;
            padding-top: 4%;
            color:#B2D426;
        }
        .discount-wrapper{
            background-color: white;
            display: inline-block;
            height: 450px;
            width: 700px;
            margin-left: 30px;
            margin-top: 4%;
            box-shadow: 0 3px 10px 0 rgb(0 0 0 / 14%);
            border-radius: 3px;
            border: none;
            transition: 0.25s;      
            cursor: pointer;          
        }
        .discount-wrapper:hover{
            box-shadow: 2px 4px 10px #B2D426;
        }
        .p-type{
            margin-top: 2%;
        }
        .p-discount{
            color: rgb(141, 141, 141);
        }
        .p-percent{
            margin-top: 5%;
        }
        .input-percent{      
            border: 0;
            border-bottom: 2px solid gray;
            outline: 0;
            font-size: 1.3rem;
            color: white;
            padding: 7px 0;
            background: transparent;
            transition: border-color 0.2s;
            color: #B2D426;
            width: 40%;
            text-align: center;
            border-color: yellowgreen;
        }
        .button-active{
            outline: none;
            border: none;
            cursor: pointer;
            font-size: 18px;
            background-color: #B2D426;
            color: white;
            height: 30px;
            width: 100px;
            margin-top: 5%;
            cursor: pointer;
            transition: 0.25s;
            display: block;  
            border-radius: 2px;
            margin-left: 43%;
        }
        .button-active:hover{
            background-color: white;
            border: 1px solid yellowgreen;
            color: yellowgreen;
        }
        .tmsp-rblTrangThai{
            margin-left:auto;
            margin-right:auto;
            margin-top: 20px;
        }
        .lbSuccess{
            color: yellowgreen;
            margin-top:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-discount">
        <h3 class="header-discount">Thêm mới khuyến mãi</h3>
        <div class="discount-wrapper">
            <p class="p-discount p-type">Nhập tên khuyến mãi:</p>
            <asp:TextBox ID="txtTenKM" CssClass="input-percent" runat="server"></asp:TextBox>
            <p class="p-discount p-percent">Chọn ngày bắt đầu</p>
            <asp:TextBox ID="txtNgayBD" CssClass="input-percent" TextMode="Date" runat="server"></asp:TextBox>
            <p class="p-discount p-percent">Chọn ngày kết thúc</p>
            <asp:TextBox ID="txtNgayKT" CssClass="input-percent" TextMode="Date" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" CssClass="button-active" runat="server" Text="Thêm mới" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label1" CssClass="lbSuccess" runat="server" Text=""></asp:Label>
        </div>
    </div>   
</asp:Content>
