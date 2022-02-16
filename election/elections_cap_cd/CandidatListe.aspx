﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CandidatListe.aspx.vb" Inherits="elections_Candidat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>SYNDICAT</h1>
    <p>
        <asp:Button ID="btnShowModal" data-backdrop="static" data-keyboard="false" runat="server" Text="Nouveau" CssClass="btn btn-primary" data-target="#formulaire"
        data-toggle="modal" OnClientClick="javascript:return false;"/>
    </p>
    
        <br />
     <div class="col-md-12">
        <div class="table-responsive">
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID_CANDIDAT" DataSourceID="SqlDataSource1">
                <Columns>
                    <%--<asp:BoundField DataField="PHOTO_SG" HeaderText="PHOTO_SG" SortExpression="PHOTO_SG" />--%>
                
                    <asp:BoundField DataField="ID_CANDIDAT" HeaderText="ID_CANDIDAT" InsertVisible="False" ReadOnly="True" SortExpression="ID_CANDIDAT" />
                    <asp:BoundField DataField="LIBELLE_CORPS_GROUPES" HeaderText="LIBELLE_CORPS_GROUPES" SortExpression="LIBELLE_CORPS_GROUPES" />
                    <asp:BoundField DataField="CODE_SYNDICAT" HeaderText="CODE_SYNDICAT" SortExpression="CODE_SYNDICAT" />
                    <%--<asp:BoundField DataField="PHOTO_SG" HeaderText="PHOTO_SG" SortExpression="PHOTO_SG" />--%>
                    <asp:BoundField DataField="LIBELLE_CLASSE" HeaderText="LIBELLE_CLASSE" SortExpression="LIBELLE_CLASSE" />
                    <asp:TemplateField HeaderText="LOGO">
                        <ItemTemplate>
                            <asp:Image ID="PHOTO_SG" Width="25%" runat="server" ImageUrl='<%# Eval("PHOTO_SG", "~/elections/images/{0}") %>' AlternateText="Le ticket a été modifié" Visible="true" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
            </asp:GridView>

             
        </div>
    </div>

     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FUPConnectionString %>" SelectCommand="SELECT ELECTION_CAP_CANDIDAT.ID_CANDIDAT, ELECTION_CAP_CORPS_GROUPES.LIBELLE_CORPS_GROUPES, ELECTION_CAP_SYNDICAT.PHOTO_SG, ELECTION_CAP_SYNDICAT.CODE_SYNDICAT, ELECTION_CAP_CLASSE.LIBELLE_CLASSE FROM ELECTION_CAP_CANDIDAT INNER JOIN ELECTION_CAP_SYNDICAT ON ELECTION_CAP_CANDIDAT.ID_SYNDICAT = ELECTION_CAP_SYNDICAT.ID_SYNDICAT INNER JOIN ELECTION_CAP_CORPS_GROUPES ON ELECTION_CAP_CANDIDAT.ID_CORPS_GROUPES = ELECTION_CAP_CORPS_GROUPES.ID_CORPS_GROUPES LEFT JOIN ELECTION_CAP_CLASSE ON ELECTION_CAP_CANDIDAT.ID_CLASSE = ELECTION_CAP_CLASSE.ID_CLASSE"></asp:SqlDataSource>

    <div class="modal fade" id="formulaire" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle2">Nouveau syndicat</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
               

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="DLL_CORPS_GROUPES">ELECTEUR</asp:Label>
                    <asp:DROPDOWNLIST runat="server" ID="DLL_CORPS_GROUPES" DataSourceID="SqlDLL_CORPS_GROUPES" CssClass="form-control" DataTextField="LIBELLE_CORPS_GROUPES" DataValueField="ID_CORPS_GROUPES"></asp:DROPDOWNLIST>
                    <asp:SqlDataSource ID="SqlDLL_CORPS_GROUPES" runat="server" ConnectionString="<%$ ConnectionStrings:FUPConnectionString %>" SelectCommand="SELECT NULL AS ID_ELECTEUR, '--------' AS LIBELLE_CORPS_GROUPES UNION SELECT ID_CORPS_GROUPES, LIBELLE_CORPS_GROUPES FROM ELECTION_CAP_CORPS_GROUPES ORDER BY LIBELLE_CORPS_GROUPES"></asp:SqlDataSource>
                 </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="DLL_SYNDICAT">SYNDICAT</asp:Label>
                    <asp:DROPDOWNLIST runat="server" ID="DLL_SYNDICAT" DataSourceID="SQL_DLL_SYNDICAT" CssClass="form-control" DataTextField="CODE_SYNDICAT" DataValueField="ID_SYNDICAT"></asp:DROPDOWNLIST>
                    <asp:SqlDataSource ID="SQL_DLL_SYNDICAT" runat="server" ConnectionString="<%$ ConnectionStrings:FUPConnectionString %>" SelectCommand="SELECT NULL AS ID_ELECTEUR, '--------' AS NOM_ELECTEUR UNION SELECT ID_SYNDICAT, CONCAT(PRENOM_ELECTEUR,NOM_ELECTEUR) AS NOM_ELECTEUR FROM ELECTION_CAP_ELECTEURS ORDER BY NOM_ELECTEUR"></asp:SqlDataSource>
                 </div>

                <div class="form-group">
                    <label for="TXT_RANG">Rang</label>
                    <asp:TextBox ID="TXT_RANG" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                 </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btn_add_candidat" runat="server" CssClass="btn btn-primary" Text="Enregistrer" Width="146px" TabIndex="1" Enabled="true"/><br />
            </div>
        </div>
        </div>
       
    </div>




</asp:Content>





