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
    public partial class HistorialFutbol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarHistorial();
            }
        }



        private void cargarHistorial()
        {
            Database objDB = new Database();
            var param = new Dictionary<string, object>()
            {
                {"OP","CargarHistorial" }
            };
            var ds = objDB.ExecSp("SP_Futbol", param);
            rpHistorial.DataSource = ds;
            rpHistorial.DataBind();
        }

        protected void rpHistorial_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                Database objDB = new Database();
                var param = new Dictionary<string, object>();
                Button btnCancelar = (Button)e.Item.FindControl("btnCancelar");
                Button btnConfirmar = (Button)e.Item.FindControl("btnConfirmar");
                Button btnConfirmarResultado = (Button)e.Item.FindControl("btnConfirmarResultado");
                Button btnEditar = (Button)e.Item.FindControl("btnEditar");
                Button btnEliminar = (Button)e.Item.FindControl("btnEliminar");

                TextBox txtObservacion = (TextBox)e.Item.FindControl("txtObservacion");
                TextBox txtResultado1 = (TextBox)e.Item.FindControl("txtResultado1");
                TextBox txtResultado2 = (TextBox)e.Item.FindControl("txtResultado2");
                Label lblGuion = (Label)e.Item.FindControl("lblGuion");
                Label lblResultado = (Label)e.Item.FindControl("lblResultado");
                Label lblGanador = (Label)e.Item.FindControl("lblGanador");
                Label lblObservacion = (Label)e.Item.FindControl("lblObservacion");
                DropDownList ddlGanador = (DropDownList)e.Item.FindControl("ddlGanador");


                

                switch (e.CommandName)
                {
                    case "Editar":

                        btnConfirmar.Visible = true;
                        btnEditar.Visible = false;
                        btnEliminar.Visible = false;
                        btnCancelar.Visible = true;
                        txtResultado1.Visible = true;
                        txtResultado2.Visible = true;
                        lblGuion.Visible = true;

                        txtObservacion.Visible = true;
                        btnConfirmarResultado.Visible = true;
                        ddlGanador.Visible = true;

                        lblResultado.Visible = false;
                        
                        lblGanador.Visible = false;
                        lblObservacion.Visible = false;
                        break;

                    case "Eliminar":
                        param.Add("OP", "EliminarResultado");
                        param.Add("idResultado",e.CommandArgument.ToString() );
                        objDB.ExecSp("SP_Futbol", param);
                        param.Clear();
                        break;

                    case "Confirmar":

                        string Resultado = txtResultado1.Text + "-" + txtResultado2.Text;
                        string Perdedor = "";
                        if (ddlGanador.SelectedItem.Text == "Joabu") Perdedor = "Merqui";
                        else if (ddlGanador.SelectedItem.Text == "Merqui") Perdedor = "Joabu";
                        param.Add("OP", "EditarResultado");
                        param.Add("idResultado", e.CommandArgument.ToString());
                        param.Add("Resultado", Resultado);
                        param.Add("Ganador", ddlGanador.SelectedItem.Text);
                        param.Add("Observaciones", txtObservacion.Text);
                        param.Add("Perdedor", Perdedor);
                        objDB.ExecSp("SP_Futbol", param);
                        param.Clear();
                        break;

                    case "ConfirmarResultado":

                        if ((Convert.ToInt32(txtResultado1.Text) - Convert.ToInt32(txtResultado2.Text)) == 0)
                        {
                            cargarDdlGanador(ddlGanador,"Empate");
                        }
                        else
                        {
                            cargarDdlGanador(ddlGanador, "Ganador");
                        }

                        break;

                    case "Cancelar":
                        Page.Response.Redirect("HistorialFutbol.aspx", false);
                        break;

                }
                
                
                
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void rpHistorial_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DropDownList ddlGanador = (DropDownList)e.Item.FindControl("ddlGanador");
            ddlGanador.Items.Add(new ListItem("Ingrese un resultado", "-1"));

        }

        private void cargarDdlGanador(DropDownList ddlGanador,string Resultado)
        {
            ddlGanador.Items.Clear();
            if (Resultado == "Empate")
            {
                ddlGanador.Items.Add(new ListItem("Empate", "0"));
            }
            else
            {
                Database objDB = new Database();
                DataTable dt = new DataTable();
                var param = new Dictionary<string, object>()
            {
                {"OP", "CargarJugadores" }

            };
                dt = objDB.ExecSp("SP_Futbol", param);


                if (dt.Rows.Count > 0)
                {
                    ddlGanador.Items.Add(new ListItem("Seleccione un Ganador", "-1"));
                    
                    foreach (DataRow dr in dt.Rows)
                    {
                        ListItem item = new ListItem(dr["Nombre"].ToString(), dr["idJugador"].ToString());

                        ddlGanador.Items.Add(item);
                    }
                }
            }
        }
    }
}