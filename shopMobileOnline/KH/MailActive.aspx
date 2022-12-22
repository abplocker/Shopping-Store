<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPageKH.Master" AutoEventWireup="true" CodeBehind="MailActive.aspx.cs" Inherits="shopMobileOnline.KH.MailActive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input{
    border: none;
    outline: none;
}
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
    padding-top: 5%;
    font-weight: 400;
}
.subcontent-active{
    padding-top: 5px;
    text-align: center;
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
    margin-left: 40%;
    border-radius: 2px;
}
.button-active:hover{
    background-color: white;
    border: 1px solid yellowgreen;
    color: yellowgreen;
}
.mail-address{
    display:block;
    padding-top: 20px;
    text-align: center;
    color: #B2D426;
}
.input-email{
    border: solid 1px #B2D426;
    margin-left: 32%;
    margin-top: 4%;
}
.label-thongbao{
    display:block;
    text-align:center;
    padding-top: 5%;
    color: #DB5461;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-active">
        <p class="content-active">Vui lòng nhập mã xác minh</p>
        <p class="subcontent-active">Mã xác minh của bạn đã được gửi đến địa chỉ mail</p>
        <asp:Label ID="Label1" runat="server" Text="Label" CssClass="mail-address">gahanthao@gmail.com</asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="input-email"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Xác nhận" OnClick="Button1_Click" CssClass="button-active" />
        <asp:Label ID="Label2" runat="server" Text="" CssClass="label-thongbao"></asp:Label>
    </div>



    
</asp:Content>
