<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="shopMobileOnline.Admin.QLSanPham" %>
<%@ MasterType VirtualPath="~/Admin/MasterPageAD.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .qlsp-container{
            margin: 0 0px;
            max-width: 100%;
            min-width: 100%;
            padding: 35px 0;
        }
        .qlsp-header {
             display: flex;
             justify-content: center;
             align-items: center;
             margin-bottom: 30px;
        }
        .qlsp-btnThemMoi-container {
            position: absolute;
            right: 40px;
            background: #031a43;
            padding: 11px 13px;
            border-radius: 5px;
        }

        .qlsp-btnThemMoi-container:hover {
            background: #155e98;
            transition : all 0.2s ease-in;
        }

        .qlsp-btnThemMoi-container a {
            display: flex;
            align-items: center;
        }
        .qlsp-btnThemMoi-container i,
        .qlsp-btnThemMoi-container span {
            display: block;
            color: white;
            
        }
        .qlsp-btnThemMoi-container i {
            font-size: 12px;
        }
        .qlsp-btnThemMoi-container span{
            font-size: 16px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-left: 10px;
        }
        .qlsp-table,
        .qlsp-column,
        .qlsp-row,
        .qlsp-item {
            border: 1px solid #adc9fa;  
            text-align: left;
            line-height: 1.3;
            color: #333333;
        }
        .qlsp-table{
            width: 80%;
            margin: 0 auto;
        }
        .qlsp-column{
           padding: 10px;
           text-align: center;
           vertical-align: middle;
           font-weight: bold;
           background: #ffe4da
        }
        .qlsp-item {
            padding: 10px;
        }
        .qlsp-row:nth-child(even){
            background: #fff9f9;
        }
        #qlsp-item-tensp a {
            font-weight: bold;
            color: #031a43
        }
        #qlsp-item-tensp a:hover{
            color: #0654a9;
            transition : all 0.1s ease-in;
        }
        .qlsp-btnCapNhat {
            color: #0654a9;
            font-weight: bold;
            font-size: 14px;
        }
        .qlsp-btnCapNhat:hover{
            color: #0094ff;
        }
        .qlsp-btnXoa {
            color: tomato;
            font-weight: bold;
            font-size: 14px;
        }
        .qlsp-btnXoa:hover{
            color: #f62d2d;
        }
       
            .txt_search{
            width: 155px;
            height: 30px;
            box-shadow: 1px 1px 5px #636e72;
            border: 1px solid gray;
            border-radius: 3px;
        }
        .btn_search{
            border-radius: 3px;
            background-color: #B2D426;
            padding: 5px 18px ;
            font-size: 15px;
            color: whitesmoke;
            border: 1px solid gray;
            margin-left: 20px;
            box-shadow: 1px 1px 5px #636e72;
            cursor:pointer;

        }
        .bao{
            margin: 20px 134px;
        }
        .bao_button{
            display: flex;
           margin: 30px auto 0px;
           justify-content:space-around;
           width: 120px;
           
          

            
        }
        .text_trang{
            font-size: 16px;
            text-align: center;
        }
        .btn_trang{
            border-radius: 3px;
            background-color: #B2D426;
            padding: 3px 10px ;
            font-size: 15px;
            color: whitesmoke;
            border: 1px solid gray;
            box-shadow: 1px 1px 5px #636e72;
            cursor:pointer;
           

        }
        .text_lable{
            font-size: 16px;
            text-align: center;
            margin-left: 4px;
        }
        .bao_trang{
             display: flex;
           margin: 10px auto 0px;
           justify-content:center;
           width: 120px;
        }
  
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="qlsp-container">
        <div class="qlsp-header">
            <h3 style="text-align: center; font-size: 30px; font-weight: bold; color: #262626;">Danh sách sản phẩm</h3>
             
            
            <div class="qlsp-btnThemMoi-container">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/TrangThemMoiSP.aspx">
                    <i class="fas fa-plus"></i>
                    <span>Thêm mới</span>
                </asp:HyperLink>
            </div>
        </div>
         <div class="bao">
                <asp:TextBox ID="txt_Loc" CssClass="txt_search" runat="server" placeholder="Type filter" ></asp:TextBox>
                <asp:Button ID="btn_Loc" runat="server" CssClass="btn_search"  OnClick="btn_Loc_Click" Text="Lọc"/>

            </div>
        <table class="qlsp-table">
            <thead>
                <tr>
                    <th class="qlsp-column" style="min-width: 10px" >ID</th>
                    <th class="qlsp-column" style="min-width: 85px" >Sản phẩm</th>
                    <th class="qlsp-column" style="min-width: 30px" >NSX</th>                    
                    <th class="qlsp-column" style="min-width: 30px" >Loại</th>                       
                    <th class="qlsp-column" style="min-width: 40px">Giá</th>
                    <th class="qlsp-column" style="min-width: 10px">Đã bán</th>
                    <th class="qlsp-column" style="min-width: 20px">Tình trạng</th>
                    <th class="qlsp-column" style="min-width: 30px">Cập nhật</th>
                    <th class="qlsp-column" style="min-width: 30px">Xóa</th>
                </tr>
            </thead>
            <tbody>
                <asp:Panel ID="Panel1" runat="server" ></asp:Panel>
            </tbody>
        </table> 
        <div class="bao_button" > 
            <asp:Button ID="Button1" runat="server" CssClass="btn_trang" Text="1" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="2" CssClass="btn_trang" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="3" CssClass="btn_trang" OnClick="Button3_Click" />
            
        </div>
        <div class="bao_trang" >
            <p class="text_trang">Trang</p>
        <asp:Label CssClass="text_lable" ID="Label1" runat="server" Text=""></asp:Label>
        </div>
        <div class="qlsp-btnThemMoi-container" style="margin: 30px auto 0px;position: initial;width: 95px;">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/TrangThemMoiSP.aspx">
                    <i class="fas fa-plus"></i>
                    <span>Thêm mới</span>
                </asp:HyperLink>
            </div>
    </div>
</asp:Content>
