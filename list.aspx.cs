using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbAll_Click(null,null);
    }
    protected void lbLeft_Click(object sender, EventArgs e)
    {
        lvBooks.DataSourceID = sdsBooks.ID;
        LinkButton lb = sender as LinkButton;
        Session["TypeName"] = lb.CommandName;

    }
    protected void lbAll_Click(object sender, EventArgs e)
    {
        lvBooks.DataSourceID = sdsBooks2.ID;
        Session.Remove("TypeName");
    }
}