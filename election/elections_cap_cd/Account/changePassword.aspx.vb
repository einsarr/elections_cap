﻿Imports System.Data.SqlClient
Imports System.Data
Partial Class elections_cap_cd_Account_changePassword
    Inherits System.Web.UI.Page
    Sub initialiserChamps()
        Try
            TXT_PasswordNew.Text = ""
            TXT_PasswordNew2.Text = ""
            TXT_PasswordInit.Focus()
        Catch ex As Exception

        End Try
    End Sub

    Public Sub AfficherMessage(ByVal Message As String)
        Try

            Response.Write("<script language=""javascript"" type=""text/javascript""  > " _
         & " alert(""" & Message & """); " _
    & "  </script>")

        Catch ex As Exception
            'ex = Nothing

        End Try
    End Sub

    Protected Sub BtValid_Click(sender As Object, e As EventArgs) Handles BtValid.Click
        Try

            If TXT_PasswordNew.Text <> TXT_PasswordNew2.Text Then
                LabelMsg.Text = "Le nouveau mot de passe et sa confirmation ne correspondent pas! Merci de vérifier."
                initialiserChamps()

            Else

                ModifPassWord()

            End If
        Catch ex As Exception

        End Try
    End Sub


    Sub ModifPassWord()

        'MsgBox(Session("Passw").ToString)
        'MsgBox(TXT_PasswordInit.Text)
        Try
            Dim Passwcrypt As String
            Dim Cryp As New Crypto


            Passwcrypt = Cryp.AES_Encrypt(TXT_PasswordNew.Text, "AxZD1&&é&é%é&&xDSDZA124_312143896")

            'TODO : Tester si ancien password OK


            If Session("Passw").ToString = TXT_PasswordInit.Text Then




                Dim sqlEnsUpdate As New SqlCommand("UPDATE ENSEIGNANT " _
    & " SET    PASSWORD_VALIDE = 1," _
    & "        PASSWORD_ENSEIGNANT = '" & Passwcrypt & "'" _
    & " WHERE  IDENTIFIANT_ENSEIGNANT ='" & Session("id_ens").ToString & "'")

                'Remise nouveau password en session
                Session("Passw") = TXT_PasswordNew.Text
                Dim ResultSetEns As DataSet
                Dim con As New Connect
                ResultSetEns = con.RunQuery(sqlEnsUpdate)

                AfficherMessage("Changement de mot de passe bien effectué.")
                Session("connexion_ok") = 1
                Server.Transfer("~/voeux/listemvmt.aspx")
            Else
                LabelMsg.Text = "Mot de passe initial incorrect"
            End If


        Catch ex As Exception

        End Try
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'LabelMsg.Text = ""
        'Try
        '    LabelMatricule.Text = Session("t_prenoms") & " " & Session("t_nom") & ", Matricule " & Session("t_matricule")
        '    If Session("id_ens") = "" Then

        '        Server.Transfer("~/Default.aspx")

        '    End If
        'Catch ex As Exception
        '    Server.Transfer("~/Default.aspx")
        'End Try
    End Sub
End Class
