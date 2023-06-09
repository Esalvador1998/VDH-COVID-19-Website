<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Salvador.Master"
    CodeBehind="cases2bar.aspx.vb" Inherits="Salvador_Home.cases2bar" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <strong class="ES2">Current Cases Bar
</strong>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <p style="text-align: center">
        Report Data Cumulative COVID-19 Cases in Virginia</p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:{Salvador}connect1 %>" 
        ProviderName="<%$ ConnectionStrings:{Salvador}connect1.ProviderName %>" 
        SelectCommand="SELECT [Report Date] AS Report_Date, [Total Cases] AS Total_Cases FROM [Virginia_COVID19]">
    </asp:SqlDataSource>
    <asp:Chart ID="Chart1" runat="server" BackColor="PowderBlue" BackImageTransparentColor="White" BackSecondaryColor="White" DataSourceID="SqlDataSource1" style="margin-left: 377px" Width="490px">
        <Series>
            <asp:Series Name="Series1" Color="Green" XValueMember="Report_Date" YValueMembers="Total_Cases"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" BackColor="192, 255, 255"></asp:ChartArea>
        </ChartAreas>
        <BorderSkin BackSecondaryColor="White" PageColor="Transparent" />
    </asp:Chart>
</asp:Content>
