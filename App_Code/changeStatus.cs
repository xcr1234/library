using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
/// <summary>
/// ajax处理接口
/// </summary>
public class Status
{

    public bool status;
    public string msg;
    public Status(bool st, string msg)
    {
        this.status = st;
        this.msg = msg;
    }

    public Status(string jsonString)
    {
        Status cs = (Status)JsonConvert.DeserializeObject(jsonString, typeof(Status));
        this.status = cs.status;
        this.msg = cs.msg;
    }


    public string toJSONString()
    {
        return JsonConvert.SerializeObject(this);
    }

}