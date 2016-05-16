<%@ WebHandler Language="C#" Class="Code" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web.SessionState;

public class Code : IHttpHandler, IRequiresSessionState
{
    private int codeLen = 4;//验证码长度 
    private int fineness = 85;//图片清晰度 
    private int imgWidth = 60;//图片宽度 
    private int imgHeight = 27;//图片高度 
    
    private int fontSize = 14;//字体大小 
    //private int fontStyle = 0;//字体样式 
    private int posX = 0;//绘制起始坐标X 
    private int posY = 0;//绘制坐标Y 
    private ImageFormat format = ImageFormat.Gif;

    private const string SessionString = "vcode";
    
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/GIF";
        HttpResponse Response = context.Response;
        HttpSessionState Session = context.Session;
        Bitmap bitmap = new Bitmap(imgWidth, imgHeight);//生成Bitmap图像 
        
        Graphics g = Graphics.FromImage(bitmap);//获取绘制器对象 
        
        Random random = new Random();  //生成随机数对象
        
        g.Clear(getRandColor(100, 250));  //设置背景颜色

        g.DrawRectangle(new Pen(new Color()), 0, 0, imgWidth - 1, imgHeight - 1); // 画边框

        // 产生干扰线

       
        for (int i = 0; i < 155; i++)
        {
            Pen p = new Pen(getRandColor(160, 200));
            int x = random.Next(imgWidth);
            int y = random.Next(imgHeight);
            int x1 = random.Next(12);
            int y1 = random.Next(12);
            g.DrawLine(p, x, y, x1, y1);
        }
        
        // 取随机产生的验证码
                String sRand = "";
        for (int i = 0; i < 4; i++)
        {
            string rand = constant[random.Next(constant.Length)].ToString();
            sRand += rand;
            Font font = new Font(fonts[random.Next(fonts.Length)], fontSize);
            SolidBrush sb = new SolidBrush(Color.FromArgb(20 + random.Next(110), 20 + random.Next(110), 20 + random.Next(110)));
            g.DrawString(rand, font, sb, posX+fontSize*i, posY);  //画出一个字符
            
            
            
                
        }
       
       
        Session[SessionString] = sRand; //保存session

        bitmap.Save(Response.OutputStream, format);
        //输出
        
  
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
   
    private Color getRandColor(int fc, int bc)
    {//给定范围获得随机颜色
        Random random = new Random();
        if (fc > 255) fc = 255;
        if (bc > 255) bc = 255;
        int r = fc + random.Next(bc - fc);
        int g = fc + random.Next(bc - fc);
        int b = fc + random.Next(bc - fc);
        return Color.FromArgb(r, g, b);
    }
    private static char[] constant =   
      {   
        '0','1','2','3','4','5','6','7','8','9',   'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'   
      };
    private static string[] fonts = { 
         "Times New Roman","Arial Black","Verdana","Trebuchet MS","Tahoma","Bookman Old Style","Palatino Linotype"
    };
}