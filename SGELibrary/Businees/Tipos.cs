using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGELibrary.Businees
{
    [Serializable]
    public static class Tipos
    {
        [Serializable]
        public enum PesquisaTipo { Nome, CNPJ, CPF };

        [Serializable]
        public enum IcmsTipo { Isento, Tributado };

        [Serializable]
        public enum TipoPessoa { Juridica, Fisica };

        [Serializable]
        public struct IcmsAliquota
        {
            public string UF;
            public decimal Aliquota;
        }

        [Serializable]
        public struct Telefone
        {
            public string CodigoArea;
            public string Numero;

            public Telefone(string codArea, string numero)
            {
                CodigoArea = codArea;
                Numero = numero;
            }
        }

        [Serializable]
        public struct PadraoVencimentoVipro
        {
            public decimal ValorFaixaDe;
            public decimal ValorFaixaAte;
            public List<int> DiasAdd;

            public PadraoVencimentoVipro(decimal ValorDe, decimal ValorAte, List<int> Dias)
            {
                ValorFaixaDe = ValorDe;
                ValorFaixaAte = ValorAte;
                DiasAdd = Dias;
            }
        }

        [Serializable]
        public struct NFeRetornoProcessamentoLote
        {
            public int CodigoStatus;
            public string Mensagem;
            public bool Sucesso;
            public string XmlRetorno;
            public string ChaveAcesso;
            public string ProtocoloNumero;
            public int ProtocoloStatusCodigo;
            public string ProtocoloStatusMotivo;

            public NFeRetornoProcessamentoLote(int pCodigoStatus,
                                               string pMensagem,
                                               bool pSucesso,
                                               string pXmlRetorno,
                                               string pChaveAcesso,
                                               string pProtocoloNumero,
                                               int pProtocoloStatusCodigo,
                                               string pProtocoloStatusMotivo)
            {
                CodigoStatus = pCodigoStatus;
                Mensagem = pMensagem;
                Sucesso = pSucesso;
                XmlRetorno = pXmlRetorno;
                ChaveAcesso = pChaveAcesso;
                ProtocoloNumero = pProtocoloNumero;
                ProtocoloStatusCodigo = pProtocoloStatusCodigo;
                ProtocoloStatusMotivo = pProtocoloStatusMotivo;
            }
        }

        [Serializable]
        public struct NFeConsultaCadastro
        {
            public int CodigoStatus;
            public string Mensagem;
            public List<string> Informacoes;

            public void setCodigoStatus(int pCodigoStatus) { CodigoStatus = pCodigoStatus; }
            public void setMensagem(string pMensagem) { Mensagem = pMensagem; }
        }

    }

    [Serializable]
    public class ParcelaFaturamento
    {
        public int NumeroParcela { get; set; }
        public DateTime DataVencimento { get; set; }
        public int DataVencimentoDias { get; set; }
        public decimal ValorParcela { get; set; }

        public ParcelaFaturamento(int Numero, DateTime Vencimento, decimal Valor, int VencimentoDias)
        {
            this.NumeroParcela = Numero;
            this.DataVencimentoDias = VencimentoDias;
            this.DataVencimento = Vencimento;
            this.ValorParcela = Valor;
        }
    }
}
