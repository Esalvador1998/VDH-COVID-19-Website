<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Salvador.Master"
    CodeBehind="cases.aspx.vb" Inherits="Salvador_Home.cases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
       <strong>Current Cases</strong></p>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:{Salvador}connect1 %>" ProviderName="<%$ ConnectionStrings:{Salvador}connect1.ProviderName %>" SelectCommand="SELECT [Report Date] AS Report_Date, [VDH Health District] AS VDH_Health_District FROM [Virginia_COVID19]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:{Salvador}connect1 %>" 
        ProviderName="<%$ ConnectionStrings:{Salvador}connect1.ProviderName %>" 
        SelectCommand="SELECT [Report Date] AS Report_Date, [VDH Health District] AS VDH_Health_District FROM [Virginia_COVID19]">
    </asp:SqlDataSource>

    <p style="text-align: center">
        Date:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Report_Date" DataValueField="Report_Date">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Health District:
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="VDH_Health_District" DataValueField="VDH_Health_District">
        </asp:DropDownList>
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Go" />
    </p>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:{Salvador}connect1 %>" ProviderName="<%$ ConnectionStrings:{Salvador}connect1.ProviderName %>" SelectCommand="SELECT [Report Date] AS Report_Date, [Locality], [VDH Health District] AS VDH_Health_District, [Total Cases] AS Total_Cases, [Hospitalizations], [Deaths] FROM [Virginia_COVID19] WHERE (([Report Date] = ?) AND ([VDH Health District] = ?))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Report_Date" PropertyName="SelectedValue" Type="DateTime" />
            <asp:ControlParameter ControlID="DropDownList2" Name="VDH_Health_District" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" CssClass="ES2" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="Report_Date" HeaderText="Report_Date" SortExpression="Report_Date" />
            <asp:BoundField DataField="Locality" HeaderText="Locality" SortExpression="Locality" />
            <asp:BoundField DataField="VDH_Health_District" HeaderText="VDH_Health_District" SortExpression="VDH_Health_District" />
            <asp:BoundField DataField="Total_Cases" HeaderText="Total_Cases" SortExpression="Total_Cases" />
            <asp:BoundField DataField="Hospitalizations" HeaderText="Hospitalizations" SortExpression="Hospitalizations" />
            <asp:BoundField DataField="Deaths" HeaderText="Deaths" SortExpression="Deaths" />
        </Columns>
        <HeaderStyle CssClass="ES1" />
    </asp:GridView>

</asp:Content>
