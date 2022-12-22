<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="QuanLyKMNSX.aspx.cs" Inherits="shopMobileOnline.Admin.QuanLyKMNSX" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container-discount{
            width: 970px;
            height: 560px;
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
            font-weight:600;
        }
        .discount-wrapper{
            background-color: white;
            display: inline-block;
            height: 350px;
            width: 700px;
            margin-left: 30px;
            margin-top: 7%;
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
        .p-success{
            color: #B2D426;  
            display:none;
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
            width: 20%;
            text-align: center;
            border-color: yellowgreen;
        }
        .button-active{
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
            border: 1px solid yellowgreen!important;
            color: yellowgreen;
        }
        .edit-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 50%;
            margin-left:25%;    
            margin-top:10px;
            color:rgb(131, 131, 131);
            height:30px;
            border-color:yellowgreen;
            color:yellowgreen;
        }
        .edit-container i {
            font-size: 20px;
            margin-left: 20px;
        }
        .error{
            color:#840032;  
            margin-top:50px;
            font-size:18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-discount">
        <h3 class="header-discount">Áp dụng khuyến mãi theo nhà sản xuất</h3>
        <div class="discount-wrapper">
            <p class="p-discount p-type">Chọn nhà sản xuất:</p>
            <div class="edit-container">
                <asp:DropDownList CssClass="edit-container" ID="ddNSX" runat="server"></asp:DropDownList>
            </div>
            <p class="p-discount p-type">Chọn đợt khuyến mãi:</p>
            <div class="edit-container">
                <asp:DropDownList CssClass="edit-container" ID="ddKM" runat="server"></asp:DropDownList>
            </div>
            <p class="p-discount p-percent">Nhập phần trăm khuyến mãi</p>
            <asp:TextBox CssClass="input-percent" ID="txtPhanTramKH" runat="server"></asp:TextBox><br /> 
             <asp:Button CssClass="button-active" ID="Button1" runat="server" Text="Áp dụng" OnClick="Button1_Click" BorderStyle="None" /><br />
             <asp:Label ID="Label1" CssClass="p-success" runat="server" Text=""></asp:Label>
            <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtPhanTramKH" runat="server" 
                 ErrorMessage="Giá trị phải trong khoảng từ 1-100"  
                MinimumValue="1"
                MaximumValue="100"
                 Type="Integer"
                CssClass="error">
            </asp:RangeValidator>
        </div>
    </div>
    
   
</asp:Content>
