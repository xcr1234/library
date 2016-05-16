using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class comment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lvComment_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        this.lvComment.EditIndex = e.NewEditIndex;
        this.lvComment.DataBind();
        TextBox txtContents = this.lvComment.EditItem.FindControl("txtContents") as TextBox;
        string id = txtContents.ClientID;
        string code = "<script>KindEditor.ready(function (K) {window.editor = K.create('#" + id + "', {uploadJson: 'fileupload/upload_json.ashx',fileManagerJson: 'fileupload/file_manager_json.ashx',allowFileManager: true}); }); </script>";
        ltlKindeditor.Text = code;
    }
}