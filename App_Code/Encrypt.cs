using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// 字符串MD5加密
/// </summary>
public class Encrypt
{

    public static String getMD5(String test)
    {
        System.Security.Cryptography.MD5CryptoServiceProvider md5CSP = new System.Security.Cryptography.MD5CryptoServiceProvider();

        //获取要加密的字段，并转化为Byte[]数组  
        byte[] testEncrypt = System.Text.Encoding.Unicode.GetBytes(test);

        //加密Byte[]数组  
        byte[] resultEncrypt = md5CSP.ComputeHash(testEncrypt);

        //将加密后的数组转化为字段(普通加密)  
        string testResult = System.Text.Encoding.Unicode.GetString(resultEncrypt);

        //作为密码方式加密   
        string PWD = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(test, "MD5");

        return PWD;
    }

}