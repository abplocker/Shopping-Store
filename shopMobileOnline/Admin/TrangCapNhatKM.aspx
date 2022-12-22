<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAD.Master" AutoEventWireup="true" CodeBehind="TrangCapNhatKM.aspx.cs" Inherits="shopMobileOnline.Admin.TrangCapNhatKM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         .cnkm-container {
            display: flex;
            flex-direction: column;
            padding: 40px 0;
        }
        .cnkm-table-container{
            display: flex;
            width: 50%;
            margin: 0 auto;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
          h3 {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 10px;
        }
         table.cntk-table {
            width: 100%;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

            table.cntk-table tbody {
                width: 100%;
                display: block;
            }

                table.cntk-table tbody tr {
                    margin: 25px 0;
                    display: flex;
                    align-items: center;
                }

                    table.cntk-table tbody tr td:first-child {
                        width: 25%;
                        min-width: 150px;
                        font-weight: bold;
                    }

                    table.cntk-table tbody tr td:last-child:not(.cntk-rblTrangThai tbody tr td:last-child) {
                        width: 100%;
                        display: block;
                    }

                    table.cntk-table tbody tr input,
                    table.cntk-table tbody tr textarea,
                    table.cntk-table tbody tr select {
                        display: block;
                        width: 100%;
                        padding: 10px;
                        border-radius: 4px;
                        border: 1px #eeeeee solid;
                        background-color: #fffdfd;
                        font-size: 14px;
                    }

                        table.cntk-table tbody tr input:hover,
                        table.cntk-table tbody tr input:focus,
                        table.cntk-table tbody tr textarea:hover,
                        table.cntk-table tbody tr textarea:focus,
                        table.cntk-table tbody tr select:hover,
                        table.cntk-table tbody tr select:focus {
                            background-color: #f0f7fe;
                            transition: all 0.2s ease-in;
                        }

                    table.cntk-table tbody tr textarea {
                        resize: none;
                        height: 100px;
                        max-height: 300px;
                        font-family: Arial, sans-serif;
                        font-size: 14px;
                    }

                    table.cntk-table tbody tr select {
                        width: 104%
                    }
       .cntk-btns {
            margin: 0 auto;
            display: flex; 
              width:320px;
            display:inline-flex;
        }

        .cntk-btn {
            padding: 8px;
            width: 90px;
            font-size: 13.5px;
            font-weight: 500;
            background: #2768c3;
            color: white;
            outline: none;
            box-shadow: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 10px;
            border:none;
        }

        .cntk-btn-CapNhat {
            background: #2768c3;
        }

            .cntk-btn-CapNhat:hover {
                background: #0c2876;
                transition: all 0.2s ease-in;
            }

        .cntk-btn-Huy {
            background: #726f6f;
        }

            .cntk-btn-Huy:hover {
                background: #1a1a1a;
                transition: all 0.2s ease-in;
            }
            .btnMo{
            background:#B2D426;
           display:none;
        }
        .btnMo:hover{
            background: #6AB547;
            transition:0.25s ease-in;
        }
        .btnKhoa{
            background:#ED254E;
            width: 108px;
            display:none;
          
        }
        .btnKhoa:hover{
            background:#70161E;
            transition:0.25s;
        }
        .error{
              color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cnkm-container">
           <h3>Cập nhật Khuyến Mãi</h3>
        <div class="cnkm-table-container">
            <asp:Table ID="Table1" runat="server" CssClass="cntk-table">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Tên Khuyến Mãi</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Phần Trăm</asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtPhanTramKM" runat="server"></asp:TextBox>
                          <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtPhanTramKM" runat="server" 
                                     ErrorMessage="Giá trị phải trong khoảng từ 1-100"  
                                     MinimumValue="0"
                                     MaximumValue="100"
                                     Type="Integer"
                                      CssClass="error">
                           </asp:RangeValidator>
                    </asp:TableCell>
                </asp:TableRow>
             </asp:Table>
              <div class="cntk-btns">
                    <asp:Button ID="btncapnhat" runat="server" Text="Cập nhật" CssClass="cntk-btn cntk-btn-CapNhat" OnClick="btncapnhat_Click"/>
                    <asp:Button ID="btnHuy" CssClass="cntk-btn cntk-btn-Huy" runat="server" Text="Hủy" OnClick="btnHuy_Click"  />
                    <asp:Button ID="btnKhoa" CssClass="cntk-btn btnKhoa" runat="server" Text="Khoá" OnClick="btnKhoa_Click"   />
                    <asp:Button ID="btnMo" CssClass="cntk-btn  btnMo" runat="server" Text="Mở" OnClick="btnMo_Click"  />
        </div>
         </div>
    </div>
</asp:Content>
