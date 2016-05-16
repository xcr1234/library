using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// 存放程序用到的一些常用静态方法
/// </summary>
public class Common
{
	public Common()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    ///   <summary>   
    ///   将指定字符串按指定长度进行截取并加上指定的后缀  
    ///   </summary>   
    ///   <param   name= "oldStr"> 需要截断的字符串 </param>   
    ///   <param   name= "maxLength"> 字符串的最大长度 </param>   
    ///   <param   name= "endWith"> 超过长度的后缀 </param>   
    ///   <returns> 如果超过长度，返回截断后的新字符串加上后缀，否则，返回原字符串 </returns>   
    public static string StringTruncat(string oldStr, int maxLength, string endWith)
    {
        //判断原字符串是否为空  
        if (string.IsNullOrEmpty(oldStr))
            return oldStr + endWith;


        //返回字符串的长度必须大于1  
        if (maxLength < 1)
            throw new Exception("返回的字符串长度必须大于[0] ");


        //判断原字符串是否大于最大长度  
        if (oldStr.Length > maxLength)
        {
            //截取原字符串  
            string strTmp = oldStr.Substring(0, maxLength);


            //判断后缀是否为空  
            if (string.IsNullOrEmpty(endWith))
                return strTmp;
            else
                return strTmp + endWith;
        }
        return oldStr;
    }   
    public static string indexSpilt(string str){
        return StringTruncat(str, 9, string.Empty);
    }
    public static string houtaiSplit(string str)
    {
        return StringTruncat(str, 7, string.Empty);
    }
    public static string getExten(string filename)
    {
        string[] arr = filename.Split('.');
        return arr[arr.Length - 1];
    }
}