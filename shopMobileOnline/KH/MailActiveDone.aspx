<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="MailActiveDone.aspx.cs" Inherits="shopMobileOnline.KH.MailActiveDone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        button{
    border: none;
    outline: none;
}
.container-active{
    height: 280px;
    width: 500px;
    margin-right: auto;
    margin-left: auto;
    background-color: white;
    margin-top: 2%;
    box-shadow: 0 3px 10px 0 rgb(0 0 0 / 14%);
    border-radius: 3px;
    
}
.content-active{
    text-align: center;
    padding-top: 20%;
    font-weight: 400;
}
.button-active{
    outline:none;
    border:none;
    font-size: 18px;
    background-color: #B2D426;
    color: white;
    height: 35px;
    width: 130px;
    margin-top: 5%;
    cursor: pointer;
    transition: 0.25s;
    display: block;
    margin-left: 38%;
    border-radius: 2px;
}
.button-active:hover{
    background-color: white;
    border: 1px solid yellowgreen;
    color: yellowgreen;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-active">
        <p class="content-active">Xác nhận email thành công!</p>
        <asp:Button ID="Button1" runat="server" CssClass="button-active" Text="Đăng nhập" OnClick="Button1_Click" />
    </div>
</asp:Content>
