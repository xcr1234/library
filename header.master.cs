using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;

public partial class header : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string username = lgnMain.UserName;
        string password = lgnMain.Password;
        string vcode = Session["vcode"].ToString();
        string code = (lgnMain.FindControl("txtCode") as TextBox).Text;

        if (code.ToUpper() != vcode)
        {
            alert("验证码不正确！");
            e.Authenticated = false;
            return;
        }

        managerTableAdapter manger = new managerTableAdapter();
        if (!manger.userExists(username))
        {
            alert("用户不存在！");
            e.Authenticated = false;
            return;
        }

        if (!manger.IsValidUserST(username, password))
        {
            alert("密码错误！");
            e.Authenticated = false;
            return;
        }
        Session.Timeout = 60 * 24;
        Session["username"] = username;
        
        e.Authenticated = true;
    }

    public void alert(string str)
    {
        Response.Write("<script>alert(\"" + str + "\")</script>");
    }
    protected void lkbQuery_Click(object sender, EventArgs e)
    {
        doSearch();
    }

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        doSearch();
    }
    protected void doSearch()
    {
        if (txtSearch.Text == "")
        {
            return;
        }
        Session["SysQuery"] = txtSearch.Text;
        if (ddlType.SelectedIndex == 0)
        {
            Response.Redirect("querybooks.aspx");
        }
        else
        {
            Response.Redirect("querynews.aspx");
        }
    }
}
