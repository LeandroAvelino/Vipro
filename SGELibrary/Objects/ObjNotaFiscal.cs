using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SGELibrary.Businees;
using SGELibrary.Objects;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjNotaFiscal
    {
        // propriedades
        public ObjNotaFiscalDadosBase Base { get; set; }
        public ObjNotaFiscalEmitente Emitente { get; set; }
        public ObjNotaFiscalDestinatario Destinatario { get; set; }
        public List<ObjPedidoProduto> Produtos { get; set; }
        public ObjNotaFiscalTransportador Transportador { get; set; }
        public ObjNotaFiscalTotais Totais { get; set; }
        public List<ObjNotaFiscalCobrancaParcela> Cobranca { get; set; }
        public List<string> ListaPedidos { get; set; }

        // construtor
        public ObjNotaFiscal()
        {
            // iniciando objetos
            this.Base = new ObjNotaFiscalDadosBase();
            this.Emitente = new ObjNotaFiscalEmitente();
            this.Destinatario = new ObjNotaFiscalDestinatario();
            this.Produtos = new List<ObjPedidoProduto>();
            this.Transportador = new ObjNotaFiscalTransportador();
            this.Totais = new ObjNotaFiscalTotais();
            this.Cobranca = new List<ObjNotaFiscalCobrancaParcela>();
            this.ListaPedidos = new List<string>();
        }
    }

    [Serializable]
    public class ObjNotaFiscalEmitente
    {
        // variáveis
        private string _razaoSocial = "JRC CONSULTORIA EM TECNOLOGIA DE INFORMACAO LTDA."; //"VIPRO ROLAMENTOS LTDA.";
        private string _inscricao = ""; //"109889711117";
        private string _cnpj = "05875230000118"; //"49783814000139";
        private string _logr = "RUA INHAMUNS";
        private string _logrNumero = "226";
        private string _logrBairro = "VILA PRUDENTE";
        private string _municipio = "SAO PAULO";
        private string _municipioIBGE = "3550308";
        private string _uf = "SP";
        private string _cep = "03156220";
        private string _fone = "1120206611";

        // propriedades
        public string propRazaoSocial { get { return this._razaoSocial; } }
        public string propInscricaoEstadual { get { return this._inscricao; } }
        public string propCNPJ { get { return this._cnpj; } }
        public string propLogradouro { get { return this._logr; } }
        public string propLogradouroNumero { get { return this._logrNumero; } }
        public string propLogradouroBairro { get { return this._logrBairro; } }
        public string propMunicipio { get { return this._municipio; } }
        public string propMunicipioIBGE { get { return this._municipioIBGE; } }
        public string propUF { get { return this._uf; } }
        public string propCEP { get { return this._cep; } }
        public string propFone { get { return this._fone; } }
    }

    [Serializable]
    public class ObjNotaFiscalDestinatario
    {
        // propriedades
        public int propCodigoID { get; set; }
        public string propRazaoSocial { get; set; }
        public string propCNPJ { get; set; }
        public string propInscrEstadual { get; set; }
        public string propEndereco { get; set; }
        public string propEnderecoNro { get; set; }
        public string propBairro { get; set; }
        public string propCEP { get; set; }
        public string propMunicipio { get; set; }
        public string propMunicipioCodigoIBGE { get; set; }
        public string propUF { get; set; }
        public string propTelefone { get; set; }
        public string propEmailNFe { get; set; }
        public Tipos.TipoPessoa propTipoPessoa { get; set; }
    }

    [Serializable]
    public class ObjNotaFiscalTransportador
    {
        public int CodigoID { get; set; }
    }

    [Serializable]
    public class ObjNotaFiscalDadosBase
    {
        public int Representante { get; set; }
        public string saida_entrada { get; set; }
        public int nota_numero { get; set; }
        public DateTime data_emissao { get; set; }
        public string natureza_operacao { get; set; }
        public string CFOP { get; set; }
        public string tipo_pagamento { get; set; }
        public string tipo_cobranca { get; set; }
        public int qtd_parcelas_pagamento { get; set; }
        public decimal valor_total_nf { get; set; }
        public string tipo_frete { get; set; }
        public string volume_quantidade { get; set; }
        public string volume_especie { get; set; }
        public string volume_marca { get; set; }
        public string volume_numero { get; set; }
        public string volume_peso_bruto { get; set; }
        public string volume_peso_liquido { get; set; }
        public string informacoes_adicionais { get; set; }
    }

    [Serializable]
    public class ObjNotaFiscalTotais
    {
        public decimal base_icms { get; set; }
        public decimal icms { get; set; }
        public decimal produtos { get; set; }
        public decimal frete { get; set; }
        public decimal seguro { get; set; }
        public decimal outros { get; set; }
        public decimal ipi { get; set; }
        public decimal base_icms_st { get; set; }
        public decimal icms_st { get; set; }
    }

    [Serializable]
    public class ObjNotaFiscalCobrancaParcela
    {
        public int numero { get; set; }
        public string letra { get; set; }
        public DateTime vencimento { get; set; }
        public decimal valor { get; set; }
        public int posicao { get; set; }
    }
}
