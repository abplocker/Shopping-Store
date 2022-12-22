<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="TrangXoaKM.aspx.cs" Inherits="shopMobileOnline.Admin.TrangXoaKM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       .xoansx-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 35px 0;
            box-shadow: 0 3px 10px 0 rgb(0 0 0 / 14%);
             border-radius: 3px;
             border: none;
             transition:1.5s;
             width:800px;
             margin:auto;
             margin-top:200px;
             transition:1.5s;
        }
        .xoansx-container:hover{
             box-shadow: 2px 4px 10px #B2D426;
        }
        .xoansx-header {
            font-size: 18px;
            margin-bottom: 30px;
            text-transform: uppercase;
            color: rgb(141, 141, 141);
            font-weight: 600;
        }
        .lblNSX{
            font-size: 18px;
            color:  #B2D426;
            font-weight: bold;
        }
        .xoansx-btn {
            padding: 10px 15px;
            min-width: 85px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            
        }
        .xoansx-btn-xoa {
         font-size: 18px;
          background-color: #B2D426;
          color: white;
            width:80px;
           height:40px;
            cursor: pointer;
            transition: 0.25s;
            border-radius: 2px;
            border:none;
        }
        .xoansx-btn-xoa:hover{
           background-color: white;
            border: 1px solid yellowgreen!important;
            color: yellowgreen;
        }
        .xoansx-btn-huy {
            background-color:#b2bec3;
          font-size: 18px;
          color: white;
           width:80px;
           height:40px;
           cursor: pointer;
           transition: 0.25s;
           border-radius: 2px;
           border:none;
        }
        .xoansx-btn-huy:hover{
           background-color:white;
            color:#b2bec3;
            border: 1px solid #b2bec3;  
        }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="xoansx-container">
        <p class="xoansx-header">Bạn có chắc chắn muốn xóa mã khuyến mãi :
                       <asp:Label ID="lblTen" runat="server" Text="" CssClass="lblNSX"></asp:Label>  
        </p> 
             <div class="xoansx-btns">
                    <asp:Button ID="btnXoa" runat="server" Text="Xóa" class="xoansx-btn xoansx-btn-xoa" OnClick="btnXoa_Click" />
                    <asp:Button ID="btnHuy" runat="server" Text="Hủy" class="xoansx-btn xoansx-btn-huy" OnClick="btnHuy_Click"/>

          </div>
    </div>
</asp:Content>
