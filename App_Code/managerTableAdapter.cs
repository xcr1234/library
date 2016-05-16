using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace DataSetTableAdapters
{
    /// <summary>
    /// 对用户表manager进行操作的类。
    /// </summary>
    public partial class managerTableAdapter
    {
        public bool IsValidUserST(String username, String password)
        {
            return Convert.ToBoolean(this.IsValidUser(username, Encrypt.getMD5(password)));
        }

        public bool userExists(string username)
        {
            DataSet.managerDataTable data = this.GetUserByUsername(username);
            return data.Rows.Count > 0;
        }

        public bool changePasswordST(string password,string username)
        {
            return this.changePassword(Encrypt.getMD5(password),username)>0;
        }
    }
}