<%@ WebHandler Language="C#" Class="fileupload_Ajax" %>

using System;
using System.Web;

public class fileupload_Ajax : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        HttpFileCollection files = context.Request.Files;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}