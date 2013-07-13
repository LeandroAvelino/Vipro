using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SGELibrary.Businees;

namespace SGELibrary.Objects
{
    [Serializable]
    public class ObjClienteFull
    {
        #region propriedades
        // dados gerais
        public int CodigoID { get; set; }
        public string NomeFantasia { get; set; }
        public string RazaoSocial { get; set; }
        public bool SituacaoAtivo { get; set; }
        public bool Restricao { get; set; }
        public string RestricaoTxt { get; set; }
        public string RestricaoTipo { get; set; }
        public string CNPJ { get; set; }
        public string InscricaoEstadual { get; set; }
        public bool PosicaoFinanceiraTituloEmAtraso { get; set; }
        public string PosicaoFinanceiraTituloEmAtrasoData { get; set; }
        public List<int> PadraoFaturamento { get; set; }
        public Tipos.TipoPessoa TipoPessoa { get; set; }
        // dados utilizados na emissão de NF-e
        public string emailNFe { get; set; }
        public string CodigoMunicipioIBGE { get; set; }
        public string CodigoEstadoIBGE { get; set; }
        // endereços
        public string Endereco { get; set; }
        public string EnderecoNro { get; set; }
        public string EnderecoBairro { get; set; }
        public string EnderecoCEP { get; set; }
        public string EnderecoMunicipio { get; set; }
        public string EnderecoUF { get; set; }
        public string LocalEntrega { get; set; }
        public string LocalEntregaNro { get; set; }
        public string LocalEntregaBairro { get; set; }
        public string LocalEntregaCEP { get; set; }
        public string LocalEntregaMunicipio { get; set; }
        public string LocalEntregaMunicipioIBGE { get; set; }
        public string LocalEntregaFone { get; set; }
        public string LocalEntregaContato { get; set; }
        public string LocalEntregaUF { get; set; }
        // transportadora
        public int TransportadoraCodigoID { get; set; }
        public string Transportadora { get; set; }
        public string TransportadoraEndereco { get; set; }
        public string TransportadoraBairro { get; set; }
        public string TransportadoraCEP { get; set; }
        public string TransportadoraMunicipio { get; set; }
        public string TransportadoraUF { get; set; }
        public string TransportadoraCNPJ { get; set; }
        public string TransportadoraInscricao { get; set; }
        // telefones
        public List<Tipos.Telefone> Telefones { get; set; }
        #endregion

        #region construtor
        public ObjClienteFull()
        {
            this.Telefones = new List<Tipos.Telefone>();
            this.PadraoFaturamento = new List<int>();
        }
        #endregion
    }
}
