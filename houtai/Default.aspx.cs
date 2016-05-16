using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.Security;
public partial class houtai_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSetTableAdapters.managerTableAdapter adapter = new DataSetTableAdapters.managerTableAdapter();

        string no = HttpContext.Current.User.Identity.Name;
        string photo = (string)adapter.GetPhoto(no);
        imgLogo.ImageUrl = "~/"+photo;
        imgDefault.ImageUrl ="~/"+ photo;
       
    }
    protected void TemplatePagerField_OnPagerCommand(object sender, DataPagerCommandEventArgs e)
    {

        // Check which button raised the event
        switch (e.CommandName)
        {

            case "Next":
                int newIndex = e.Item.Pager.StartRowIndex + e.Item.Pager.PageSize;
                if (newIndex <= e.TotalRowCount)
                {
                    e.NewStartRowIndex = newIndex;
                    e.NewMaximumRows = e.Item.Pager.MaximumRows;
                }
                break;
            case "Previous":
                e.NewStartRowIndex = e.Item.Pager.StartRowIndex - e.Item.Pager.PageSize;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "First":
                e.NewStartRowIndex = 0;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            case "Last":
                e.NewStartRowIndex = e.Item.Pager.MaximumRows;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;
                break;
            default:
                int index = Convert.ToInt32(e.CommandName);
                e.NewStartRowIndex = 0 + e.Item.Pager.PageSize * index;
                e.NewMaximumRows = e.Item.Pager.MaximumRows;

                break;
        }
    }
    protected void lnbDel_Click(object sender, EventArgs e)
    {

        DataSetTableAdapters.newsTableAdapter adapter = new DataSetTableAdapters.newsTableAdapter();
        int i = 0;
        foreach (ListViewItem lvi in this.lvNews.Items) //遍历所有项
        {

            CheckBox ckb = lvi.FindControl("ckbNews") as CheckBox;

            if (ckb.Checked)
            {

                adapter.DeleteNews(decimal.Parse(ckb.ToolTip));
                    

            }
            i++;


        }
        Response.Write("<script>location.href='default.aspx?r='+Math.random()</script>");
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string from = txtFrom.Text;
        string time = txtTime.Text;
        string content = txtEdit.Text;
        if(title==string.Empty||from==string.Empty||time==string.Empty||content==string.Empty){
            Response.Write("<script>alert('请填写完整的新闻信息！')</script>");
            return;
        }
        DataSetTableAdapters.newsTableAdapter adapter = new DataSetTableAdapters.newsTableAdapter();
        if (adapter.InsertQuery(title, content, time, from) > 0)
        {
            Response.Write("<script>alert('添加新闻成功！');location.href='default.aspx?r='+Math.random()</script>");
            return;
        }
        else
        {
            Response.Write("<script>alert('添加新闻失败！')</script>");
            return;
        }
       
    }
    protected void lnbImg_Click(object sender, EventArgs e)
    {
        LinkButton lbnImg = sender as LinkButton;
        FileUpload fileImg = lbnImg.Parent.FindControl("fileImg") as FileUpload;
        if (fileImg.HasFile)
        {

            


            string FileName = Guid.NewGuid().ToString() + "." + Common.getExten(fileImg.FileName);
            string path = "~/fileUpload/users/"+FileName;
            fileImg.SaveAs(Server.MapPath(path));
            string sqlpath = "fileUpload/users/" + FileName;
            DataSetTableAdapters.managerTableAdapter adapter = new DataSetTableAdapters.managerTableAdapter();
            adapter.SetPhoto(sqlpath, (string)Session["username"]);
            Response.Write("<script>location.href='default.aspx?r='+Math.random()</script>");
        }
    }
    protected void lvPersonal_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        litEdit.Text = "<script>$(function(){showSection('infor');});</script>";
    }
    protected void lvBooks_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
    {
        litEdit.Text = "";
    }
    protected void lvPersonal_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        litEdit.Text = "";
    }
}