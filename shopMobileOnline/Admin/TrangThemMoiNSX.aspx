<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="TrangThemMoiNSX.aspx.cs" Inherits="shopMobileOnline.Admin.TrangThemMoiNSX" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .tmdm-container{
           display:flex;
           flex-direction: column;
           padding: 35px 0;
        }
       
        h3{
            text-transform: uppercase;
            color: #B2D426;
            font-weight: 600;
        }
        .body{
            width:500px;
            margin:auto;
            margin-top:50px;
             box-shadow: 0 3px 10px 0 rgb(0 0 0 / 14%);
             border-radius: 3px;
             border: none;
             transition:1.5s
        }
        .body:hover{
            box-shadow: 2px 4px 10px #B2D426;
        }
        .title{
            width:200px;
            margin:auto;
        }
        h4{
           font-weight: bold;
           color: rgb(141, 141, 141);
           text-align:center;
            margin-top:20px;
        }
        .tmdm-ten{
            margin:auto;
            margin-left:165px;
            margin-top:20px;
            border: 0;
            border-bottom: 2px solid gray;
            outline: 0;
            font-size: 1.3rem;
            background: transparent;
            transition: border-color 0.2s;
            color: #B2D426;
            width: 150px;
            text-align: center;
            border-color: yellowgreen;
        }
        .nut{
            margin-left:35%;
           margin-top:20px;
            padding-bottom:20px;
        }
        .btnThem{
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
        .btnHuy{
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
        .btnThem:hover{
            background-color: white;
            border: 1px solid yellowgreen!important;
            color: yellowgreen;
        }
        .btnHuy:hover{
            background-color:white;
            color:#b2bec3;
            border: 1px solid #b2bec3;
        }
        .tmdm-error {
            font-size:18px;
            font-weight:bold;
            color:#e55039;
           margin-left:31%;
           margin-top:20px;
        }
        .lblThongBao{
         font-size:18px;
            font-weight:bold;
            color:#e55039;
            margin-left:31%;
            margin-top:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tmdm-container">
        <h3 style="text-align: center;">Thêm nhà sản xuất mới</h3>
       <div class="body" >
            <asp:Table ID="tb1" runat="server" CssClass="tb1" Width="480px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" CssClass="title">
                    <h4>Nhập Tên Nhà Sản Xuất</h4>
                </asp:TableCell>
            </asp:TableRow>
                <asp:TableRow> <asp:TableCell runat="server">
                    <asp:TextBox ID="txtTenNSX" runat="server" CssClass="tmdm-ten"></asp:TextBox>
                    <br />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên nhà sản xuất" ControlToValidate="txtTenNSX" CssClass="tmdm-error" Display="Dynamic"></asp:RequiredFieldValidator>
                </asp:TableCell>
                </asp:TableRow>
        </asp:Table>
         <asp:Label ID="lblThongBao" runat="server" Text="" CssClass="lblThongBao"></asp:Label>
        <div class="nut">
            <asp:Button ID="btnThem"  runat="server" Text="Thêm" Class="btnThem" OnClick="btnThem_Click"  />
            <asp:Button ID="btnHuy"  runat="server" Text="Hủy" Class="btnHuy"  CausesValidation="false" OnClick="btnHuy_Click"/>
        </div>
       </div>
    </div>
</asp:Content>
