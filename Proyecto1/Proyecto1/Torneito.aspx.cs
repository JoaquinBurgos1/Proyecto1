using Proyecto1.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto1
{
    public partial class Torneito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarTblTorneito();
        }

        private void CargarTblTorneito()
        {
            Database obj = new Database();
            var param = new Dictionary<string, object>()
            {
                {"OP","ListarTablaResultados" }
            };
            DataTable dt = obj.ExecSp("SP_FutbolTest", param);
            rpTablaTorneito.DataSource = dt;
            rpTablaTorneito.DataBind();
        }
    }
}