using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addbook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.IsAuthenticated)
        {
            Response.Redirect("default.aspx");
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {

        if (file.HasFile)
        {

            string FileName = Guid.NewGuid().ToString() + "." + Common.getExten(file.FileName);
            string path = "fileUpload/book/" + FileName;
            file.SaveAs(Server.MapPath(path));
            imgBook.ImageUrl = path;
            hdfFile.Value = path;
        }
        else
        {
            lblResult.Text = "您未选择任何文件！";
        }
        
        
    }
    protected void btnSuccess_Click(object sender, EventArgs e)
    {

       
        if (txtName.Text == string.Empty)
        {
            lblResult.Text = "请输入图书名称！";
            return;
        }
        if (txtNo.Text == string.Empty)
        {
            lblResult.Text = "请输入豆瓣编号！";
            return;
        }
        if (txtAuthor.Text == string.Empty)
        {
            lblResult.Text = "请输入作者！";
            return;
        }
        if (txtPress.Text == string.Empty)
        {
            lblResult.Text = "请输入出版社！";
            return;
        }
        if (txtPrice.Text == string.Empty)
        {
            lblResult.Text = "请输入价格！";
            return;
        }
        if (hdfFile.Value == string.Empty)
        {
            lblResult.Text = "请上传图片！";
            return;
        }
        if (txtDescription.Text == string.Empty)
        {
            lblResult.Text = "请输入描述！";
            return;
        }
       


        DataSetTableAdapters.bookTableAdapter adapter = new DataSetTableAdapters.bookTableAdapter();

        int r =adapter.InsertBook(txtNo.Text,txtName.Text,txtAuthor.Text,hdfFile.Value,txtPress.Text,
            double.Parse(txtPrice.Text),txtDescription.Text,txtDate.Text,int.Parse(ddlType.SelectedValue),double.Parse(txtScore.Text));
        if (r > 0)
        {
            lblResult.Text = "添加成功";
        }
        else
        {
            lblResult.Text = "添加失败";
        }
    }
}