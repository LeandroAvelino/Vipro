using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SGELibrary.Businees;
using SGELibrary.Data;

namespace SGE_Danfe_XML
{
    public partial class frmPrincipal : Form
    {

        private DbNFe nfeDb = null;  // classe NFe de dados.
        private NFe nfeNeg = null;   // classe NFe de negócio.

        public frmPrincipal()
        {
            InitializeComponent();
            this.nfeDb = new DbNFe();
            this.nfeNeg = new NFe();
        }

        private void timerCheckRetorno_Tick(object sender, EventArgs e)
        {
            // desligando o timer para evitar um novo ciclo de processamento sem que o processamento anterior esteja concluído.
            timerCheckRetorno.Enabled = false;  

            var tbl = nfeDb.GetNotasTransmitidas();  // buscando as notas que foram transmitidas
            foreach (DataRow row in tbl.Rows)
            {
                // verificando se as notas transmitidas já foram processadas pela SEFAZ.
                addLog("Verificando NF: " + row["NR_NF_INTERNO"].ToString() +
                       ", protocolo: " + row["NR_PROTOCOLO_SEFAZ"].ToString()
                       );
                var ret = nfeNeg.consulta_retorno_processamento_NFe(row["NR_PROTOCOLO_SEFAZ"].ToString());

                addLog("....status: " + ret.CodigoStatus.ToString() +
                       ", mensagem: " + ret.Mensagem
                       );
                if (ret.CodigoStatus != 0)
                {
                    nfeDb.GravarRetorno(Convert.ToInt32(row["ID_NFE_TRANSMITIR"].ToString()), 
                                        ret
                                        );

                    nfeDb.GravarAtualizarStatusTransmitir(Convert.ToInt32(row["ID_NFE_TRANSMITIR"].ToString()),
                                                          (ret.CodigoStatus != 105) // Lote em processamento
                                                          );
                }
            }
            tbl.Dispose();

            // ativando novamente o timer.
            timerCheckRetorno.Enabled = true;
        }

        private void addLog(string pMsg)
        {
            var vTxt = new StringBuilder();
            vTxt.AppendLine(txtLog.Text);
            vTxt.AppendLine(pMsg);
            txtLog.Text = vTxt.ToString();
        }

    }
}
