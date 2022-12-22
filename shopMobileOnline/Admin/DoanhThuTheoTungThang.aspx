<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="DoanhThuTheoTungThang.aspx.cs" Inherits="shopMobileOnline.Admin.DoanhThuTheoTungThang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         .adtrangchu-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 0;
        }

        

        .section-thongKe {
            width: 60%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-left:auto;
            margin-right:auto;
        }


        .section-item {
            //border: 1px solid #052f87;
            height: 140px;
            box-shadow: rgba(0,0,0,0.15) 0px 2px 8px;
            border-radius: 5px;
        }

        .section-item-header {
            width: 100%;
            text-align: center;
            font-size: 15px;
            font-weight: bold;
            font-family: Arial, sans-serif;
            background: #2f3542;
            padding: 12px 0;
            color: white;
            //border-radius: 4px;
           

        }
        

        .section-item-number {
            display: flex;
            height: 100px;
            justify-content: center;
            align-items: center
        }
        .section-item-number span {
            font-size: 24px;
            font-family:  Arial, sans-serif;
            color: #052f87;
        }
        .qldh-container{
            margin: 0 0px;
            max-width: 100%;
            min-width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
           padding-bottom: 80px;
           overflow-y: scroll;
           
        }
        .qldh-container h4 {
            margin: 0 auto;
            font-size: 30px;
            font-weight: bold; 
            color: #262626;
        }
        
        .table {
            width: 100%;
            margin-left: auto;
            margin-right:auto
        }
        .table1 {
            width: 100%;
            margin-left: auto;
            margin-right:auto
        }
        .table,
        .table-th,
        .table-tr,
        .table1,
        .table1-th,
        .table1-tr,
        .table-item {
            border: 1px solid #adc9fa;  
            text-align: left;
            line-height: 1.3;
            color: #333333;
        }
         .table-td {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            font-family:Arial, sans-serif;
            
        }
        .table-th{
           padding: 10px;
           text-align: center;
           vertical-align: middle;
           font-weight: bold;
           background: #ffe4da
        }
        .table-item {
            padding: 10px;
        }
         .table-tr:nth-child(even){
            background: #fff9f9;
        }
         #table-item-tensp a {
            font-weight: bold;
            color: #031a43
        }
        #table-item-tensp a:hover{
            color: #0654a9;
            transition : all 0.1s ease-in;
        }
        .table1-item {
            border: 1px solid #adc9fa;  
            text-align: left;
            line-height: 1.3;
            color: #333333;
        }
        .table1-th{
           padding: 10px;
           text-align: center;
           vertical-align: middle;
           font-weight: bold;
           background: #ffe4da
        }
       
        .table1-td {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            font-family:Arial, sans-serif;
            
        }
        
        .table1-item {
            padding: 10px;
        }
       
        .table1-tr:nth-child(even){
            background: #fff9f9;
        }
       
        #table1-item-tensp a {
            font-weight: bold;
            color: #031a43
        }
        #table1-item-tensp a:hover{
            color: #0654a9;
            transition : all 0.1s ease-in;
        }
        .qldh-btnXem {
            color: #052f87;
        }
        .nut{
            margin-left:40%;
            padding-top:20px;
        }
        
        .btnTim:hover{
            background-color:#d63031;
        }
        .btnTim{
            background-color:#e77f67;
            width:80px;
            height:40px;
            border:none;
            color:white
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
            width: 50%;
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
            margin-left: 34%;
            outline: none;
            border: none;
        }
        .button-active:hover{
            background-color: white;
            border: 1px solid yellowgreen;
            color: yellowgreen;
        }
        .container-sum{
            width: 300px;
            height: 150px;
            border: 1px solid yellowgreen;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            text-align: center;
        }
        .content-sum{
            padding-top: 20px;
            color: rgb(131, 131, 131);
        }
        .auto-style1{
            margin-left:auto;
            margin-right:auto;
            margin-top: 70px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-sum">
        <p class="content-sum">Nhập tháng cần thống kê</p>
         <asp:TextBox CssClass="input-percent" ID="TextBox1" runat="server"></asp:TextBox>
         <asp:Button ID="btnTim"  runat="server" Text="Thống kê" CssClass="button-active" OnClick="btnTim_Click" Height="26px" />
    </div
    <div class="adtrangchu-container">
         <section class="section-thongKe">
            <div class="auto-style1">
                <p class="section-item-header header-choDuyet">Doanh Thu Theo Từng Tháng</p>
                <table class="table" border="1">
                <tr  class="table-tr" >
                    <th class="table-th" style="max-width:40px">Tên Sản Phẩm</th>
                    <th class="table-th" style="max-width:40px">Tháng</th>
                    <th class="table-th" style="max-width:100px">Số Lượng Bán Ra</th>
                    <th class="table-th">Tổng Doanh Thu</th>
                    <%--<th class="table-th"  style="min-width: 80px">Xem</th>--%>
                </tr>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </table>
                <table class="table1" border="1">
                <tr  class="table1-tr" >
                                       
                    <th class="table1-th">Tổng Doanh Thu Của Tháng</th>
                    <%--<th class="table-th"  style="min-width: 80px">Xem</th>--%>
                </tr>
                <asp:Panel ID="Panel2" runat="server"></asp:Panel>
            </table>

            </div>
</asp:Content>
