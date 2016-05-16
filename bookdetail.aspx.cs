using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class book : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lvNews_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        this.lvNews.EditIndex = e.NewEditIndex;
        this.lvNews.DataBind();
        TextBox txtDescription = this.lvNews.EditItem.FindControl("txtDescription") as TextBox;
        string id = txtDescription.ClientID;
        string code = "<script>KindEditor.ready(function (K) {window.editor = K.create('#" + id + "', {uploadJson: 'fileupload/upload_json.ashx',fileManagerJson: 'fileupload/file_manager_json.ashx',allowFileManager: true}); }); </script>";
        ltrKindeditor.Text = code;
    }
   
   
}