<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="QLYDanhMuc.aspx.cs" Inherits="shopMobileOnline.Admin.QLYDanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
         .qldm-container{
            margin: 0 0px;
            max-width: 100%;
            min-width: 100%;
            padding: 35px 0;
        }
        .qldm-header {
             display: flex;
             justify-content: center;
             align-items: center;
             margin-bottom: 30px;
        }
        h3{
            text-transform: uppercase;
            padding-top: 4%;
            color: #B2D426;
            font-weight: 600;
        }
        .qldm-btnThemMoi-container {
            position: absolute;
            right: 40px;
            background: #031a43;
            padding: 11px 13px;
            border-radius: 5px;
        }

        .qldm-btnThemMoi-container:hover {
            background: #155e98;
            transition : all 0.2s ease-in;
        }

        .qldm-btnThemMoi-container a {
            display: flex;
            align-items: center;
        }
        .qldm-btnThemMoi-container i,
        .qldm-btnThemMoi-container span {
            display: block;
            color: white;
            
        }
        .qldm-btnThemMoi-container i {
            font-size: 12px;
        }
        .qldm-btnThemMoi-container span{
            font-size: 16px;
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-left: 10px;
        }
        .qldm-table{
            margin:auto;
            left:500px;
        }
        .qldm-table,
        .qldm-column,
        .qldm-row,
        .qldm-item {
             margin:auto;
            border: 1px solid #adc9fa;  
            text-align: left;
            line-height: 1.3;
            color: #2f3542;
        }
        .qldm-column{
           padding: 10px;
           text-align: center;
           vertical-align: middle;
           font-weight: bold;
           background-color: #B2D426;
        }
        .qldm-item {
            padding: 10px;
        }
        .qldm-row:nth-child(even){
            background: #fff9f9;
        }
        #qldm-item-tendm a {
            font-weight: bold;
            color: #031a43
        }
        #qldm-item-tendm a:hover{
            color: #0654a9;
            transition : all 0.1s ease-in;
        }
        .qldm-btnCapNhat {
            color: #0654a9;
            font-weight: bold;
            font-size: 14px;
        }
        .qldm-btnCapNhat:hover{
            color: #0094ff;
        }
        .qldm-btnXoa {
            color: tomato;
            font-weight: bold;
            font-size: 14px;
        }
        .qldm-btnXoa:hover{
            color: #f62d2d;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="qldm-container">
        <div class="qldm-header">
            <h3 style="text-align: center;">Danh sách các nhà sản xuất</h3>
        </div>
        <table class="qldm-table">
            <thead>
                <tr>
                    <th class="qldm-column" style="min-width: 200px" >Tên NSX</th>   
                    <th class="qldm-column" style="min-width: 30px">Cập nhật</th>
                    <th class="qldm-column" style="min-width: 30px">Xóa</th>
                </tr>
            </thead>
            <tbody>
                <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>   
        <div class="qldm-btnThemMoi-container" style="margin: 30px auto 0px;position: initial;width: 95px;">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/TrangThemMoiNSX.aspx">
                    <i class="fas fa-plus"></i>
                    <span>Thêm mới</span>
                </asp:HyperLink>
            </div>
    </div>
</asp:Content>
