<%@ WebHandler Language="C#" Class="changePassword" %>

using System;
using System.Web;
using DataSetTableAdapters;

using System.Web.Security;
using System.Security.Cryptography; 
public class changePassword : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string username = context.Request.Form["username"];
        string oldpass = context.Request.Form["old"];
        string newpass = context.Request.Form["newpass"];
        

        if (username == null || oldpass == null || newpass == null)
        {
            Status cs = new Status(false, "参数错误！");
            string json = cs.toJSONString();
            context.Response.Write(json);
            return;
        }
        
        if(username==string.Empty||oldpass==string.Empty||newpass==string.Empty){
            Status cs = new Status(false, "参数错误！");
            string json = cs.toJSONString();
            context.Response.Write(json);
            return;
        }
        

        managerTableAdapter manager = new managerTableAdapter();
        if(!manager.IsValidUserST(username,oldpass)){
            Status cs = new Status(false, "原始密码不正确！");
            string json = cs.toJSONString();
            context.Response.Write(json);
            return;
        }
        
        if(manager.changePasswordST(newpass,username))
        {
            Status cs = new Status(true, "修改成功！");
            FormsAuthentication.SignOut(); 
            //修改成功后退出登录
            string json = cs.toJSONString();
            context.Response.Write(json);
            return;
        }
        else
        {
            Status cs = new Status(false, "修改失败！");
            string json = cs.toJSONString();
            context.Response.Write(json);
            return;
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

  
   
   
}