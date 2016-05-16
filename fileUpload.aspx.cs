using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class fileUpload : System.Web.UI.Page
{
   


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {



       if (fulFile.HasFile)
       {


           string FileName;
           if (cbAutoName.Checked)
           {
               FileName = Guid.NewGuid().ToString() + "." +Common.getExten(fulFile.FileName);
           }
           else
           {
               FileName = fulFile.FileName;
           }
           
           string path = "~/fileUpload/" + ddlFolder.SelectedValue + "/" + FileName;
           fulFile.SaveAs(Server.MapPath(path));
           lblResult.Text = "上传成功。文件路径为："+path;
           hlOpen.NavigateUrl = path;
           hlOpen.Visible = true;

       }
    }

   
}  
