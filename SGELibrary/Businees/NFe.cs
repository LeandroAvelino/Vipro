using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Security.Cryptography.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography.Pkcs;
using System.Xml;
using System.Xml.Schema;
using SGELibrary;
using SGELibrary.Data;

namespace SGELibrary.Businees
{
    /// <summary>
    /// Classe de negócio utilizada para tratar de NFe.
    /// <remarks>
    /// Ações da classe:
    /// Validar XML, Assinar XML, Transmitir XML.
    /// </remarks>
    /// </summary>
    public class NFe
    {
        #region Variáveis da classe
        private string _path_certificado_digital = "";  // path do certificado digital.
        private string _path_schema_xsd = "";  // path dos schemas xsd.
        private string _path_arquivo_xml = "";  // path do arquivo XML da NFe.
        private string _arquivo_certificado_digital = "";  // nome do arquivo do certificado digital.
        private string _certificado_digital_senha = "";  // senha do certificado digital.
        private string _certificado_digital_tipo = "";  // tipo do certificado.
        private string _codigo_estado = "";  // código do município para o arquivo XML.
        private enum TipoAmbiente { Producao = 1, Homologacao = 2 }
        private TipoAmbiente _tipo_ambiente;
        private string _tpAmb = "";  // identifica o tipo de ambiente para o arquivo XML.
        private string _nfe_versao = "";  // identifica a versão da NFe utilizado.
        private TValidarXML _validarXML;
        private byte[] _rawDataCertificado;
        private DbNFe _dbnfe = null;  // identifica uma instância da classe de dados do NFe.
        #endregion

        /// <summary>
        /// Construtor da classe.
        /// </summary>
        public NFe()
        {
            #region Carregando as variáveis da classe.
            this._tipo_ambiente = (TipoAmbiente)Enum.Parse(typeof(TipoAmbiente), Util.get_settings("nfe_tipo_ambiente"));
            this._tpAmb = Util.get_settings("nfe_tipo_ambiente");
            this._path_certificado_digital = Util.get_settings("nfe_path_certificado_digital");
            this._path_schema_xsd = Util.get_settings("nfe_path_schema_xsd");
            this._path_arquivo_xml = Util.get_settings("nfe_path_arquivo_xml");
            this._arquivo_certificado_digital = Util.get_settings("nfe_arquivo_certificado_digital");
            this._certificado_digital_senha = Util.get_settings("nfe_certificado_digital_senha");
            this._certificado_digital_tipo = Util.get_settings("nfe_certificado_digital_tipo");
            this._codigo_estado = Util.get_settings("nfe_codigo_estado");
            this._nfe_versao = Util.get_settings("nfe_versao");
            this._validarXML.Valido = false;
            this._validarXML.Mensagens = new List<string>();
            this._dbnfe = new DbNFe();
            #endregion
        }

        #region propriedades
        public string prop_path_arquivo_xml { get { return this._path_arquivo_xml; } }
        #endregion

        //Reads a file.
        internal static byte[] ReadFile(string fileName)
        {
            FileStream f = new FileStream(fileName, FileMode.Open, FileAccess.Read);
            int size = (int)f.Length;
            byte[] data = new byte[size];
            size = f.Read(data, 0, size);
            f.Close();
            return data;
        }

        /// <summary>
        /// Retorna o certificado digital.
        /// </summary>
        /// <returns></returns>
        private X509Certificate2 get_certificado_digital()
        {
            X509Certificate2 result = null;


            if (this._certificado_digital_tipo == "ARQUIVO")
            {
                result = new X509Certificate2(this._path_certificado_digital + this._arquivo_certificado_digital,
                                                  this._certificado_digital_senha);
            }
            else
            {
                X509Certificate2 _X509Cert = new X509Certificate2();
                string Nome = "JRC";
                try
                {
                    var certificados = new X509Store(StoreName.My, StoreLocation.CurrentUser);
                    certificados.Open(OpenFlags.ReadOnly);
                    var certificados_lista = (X509Certificate2Collection)certificados.Certificates;
                    var colecao = X509Certificate2UI.SelectFromCollection(certificados_lista, "CERTIFICADOS", "Selecione", X509SelectionFlag.SingleSelection);
                    foreach (X509Certificate2 cd in certificados_lista)
                    {
                        if (cd.Subject.Contains("VIPRO ROLAMENTOS"))
                            _X509Cert = cd;
                    }
                    certificados.Close();

                    /*X509Store store = new X509Store(StoreName.My, StoreLocation.LocalMachine);
                    store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);
                    X509Certificate2Collection collection = (X509Certificate2Collection)store.Certificates;
                    X509Certificate2Collection collection1 = (X509Certificate2Collection)collection.Find(X509FindType.FindByTimeValid, DateTime.Now, false);
                    X509Certificate2Collection collection2 = (X509Certificate2Collection)collection.Find(X509FindType.FindByKeyUsage, X509KeyUsageFlags.DigitalSignature, false);

                    if (Nome.Trim() != "")
                    {
                        X509Certificate2Collection scollection = (X509Certificate2Collection)collection2.Find(X509FindType.FindBySubjectDistinguishedName, Nome, false);
                        if (scollection.Count == 0)
                        {
                            _X509Cert = null;
                        }
                        else
                        {
                            _X509Cert = scollection[0];
                        }
                    }
                    else
                    {
                        _X509Cert = null;
                    }
                    store.Close();
                     */

                    result = _X509Cert;
                }
                catch (System.Exception ex)
                {
                    _X509Cert = null;
                    result = _X509Cert;
                }
            }

            return result;
        }

        /// <summary>
        /// Verificar se o serviço está ativo em operação.
        /// </summary>
        /// <returns>true=ativo, false=inativo</returns>
        public bool get_status_servico()
        {
            var s = new StringBuilder();
            s.AppendLine("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            s.AppendLine("<retorno>");

            XmlNode _ret = null;
            switch (this._tipo_ambiente)
            {
                case TipoAmbiente.Homologacao:
                    var _cabec = new NFeWS.Homolocacao.StatusServico.nfeCabecMsg();
                    var _ws = new NFeWS.Homolocacao.StatusServico.NfeStatusServico2();
                    _cabec.cUF = this._codigo_estado;
                    _cabec.versaoDados = this._nfe_versao;
                    _ws.nfeCabecMsgValue = _cabec;
                    _ws.ClientCertificates.Add(get_certificado_digital());
                    _ret = _ws.nfeStatusServicoNF2(get_xml_status_servico());
                    s.AppendLine(_ret.InnerXml);
                    _ws.Dispose();
                    break;
                case TipoAmbiente.Producao:
                    break;
            }
            
            s.AppendLine("</retorno>");

            var doc = new XmlDocument();
            doc.LoadXml(s.ToString());
            var nodeStatus = doc.GetElementsByTagName("cStat");

            return (nodeStatus.Item(0).InnerText == "107");
        }

        /// <summary>
        /// Retorna o XML para enviar ao web service de consulta do status do serviço.
        /// </summary>
        /// <returns></returns>
        private XmlNode get_xml_status_servico()
        {
            var _xml = new XmlDocument();
            var _decl = _xml.CreateXmlDeclaration("1.0", "UTF-8", null);
            _xml.AppendChild(_decl);

            var _node = _xml.CreateElement("consStatServ");
            _node.SetAttribute("xmlns", "http://www.portalfiscal.inf.br/nfe");
            _node.SetAttribute("versao", this._nfe_versao);

            var _tpAmb = _xml.CreateElement("tpAmb");
            _tpAmb.InnerText = this._tpAmb;
            _node.AppendChild(_tpAmb);

            var _cUF = _xml.CreateElement("cUF");
            _cUF.InnerText = this._codigo_estado;
            _node.AppendChild(_cUF);

            var _xServ = _xml.CreateElement("xServ");
            _xServ.InnerText = "STATUS";
            _node.AppendChild(_xServ);

            _xml.AppendChild(_node);

            return _node;
        }


        /// <summary>
        /// Consultar o cadastro do contribuinte na secretaria da fazenda.
        /// </summary>
        /// <param name="pCNPJ">CNPJ para pessoa jurídica</param>
        /// <param name="pCPF">CPF para pessoa física</param>
        /// <returns></returns>
        public Tipos.NFeConsultaCadastro getConsultaCadastro(string pCNPJ, string pCPF, string pUF, string pIE)
        {
            #region XML para consulta
            var xml = new XmlDocument();
            var decl = xml.CreateXmlDeclaration("1.0", "UTF-8", null);
            xml.AppendChild(decl);

            var node = xml.CreateElement("ConsCad");
            node.SetAttribute("xmlns", "http://www.portalfiscal.inf.br/nfe");
            node.SetAttribute("versao", _nfe_versao);

            var inf = xml.CreateElement("infCons");

            var xserv = xml.CreateElement("xServ");
            xserv.InnerText = "CONS-CAD";
            inf.AppendChild(xserv);

            var uf = xml.CreateElement("UF");
            uf.InnerText = pUF;
            inf.AppendChild(uf);

            var cnpj = xml.CreateElement("CNPJ");
            cnpj.InnerText = pCNPJ;
            inf.AppendChild(cnpj);

            node.AppendChild(inf);
            xml.AppendChild(node);
            #endregion

            var consulta = new Tipos.NFeConsultaCadastro();
            switch (this._tipo_ambiente)
            {
                case TipoAmbiente.Homologacao:
                    var cabec = new NFeWS.Homolocacao.ConsultaCadastro.nfeCabecMsg();
                    cabec.cUF = "35";
                    cabec.versaoDados = "2.00";

                    var ws = new NFeWS.Homolocacao.ConsultaCadastro.CadConsultaCadastro2();
                    ws.ClientCertificates.Add(get_certificado_digital());
                    ws.nfeCabecMsgValue = cabec;
                    ws.SoapVersion = System.Web.Services.Protocols.SoapProtocolVersion.Soap12;

                    var ret = ws.consultaCadastro2(node);
                    ws.Dispose();
                    break;
                case TipoAmbiente.Producao:
                    break;
            }

            return consulta;
        }


        /// <summary>
        /// Validar XML contra o schema XSD
        /// </summary>
        /// <param name="_arquivo">Nome do arquivo XML</param>
        /// <param name="_schema">Nome do arquivo XSD</param>
        public TValidarXML validaXML(string _arquivo, string _schema)
        {
            this._validarXML.Mensagens.Clear();

            // Create a new validating reader
            XmlValidatingReader reader = new XmlValidatingReader(new XmlTextReader(new StreamReader(_arquivo)));

            // Create a schema collection, add the xsd to it
            XmlSchemaCollection schemaCollection = new XmlSchemaCollection();
            schemaCollection.Add("http://www.portalfiscal.inf.br/nfe", this._path_schema_xsd + _schema);

            // Add the schema collection to the XmlValidatingReader
            reader.Schemas.Add(schemaCollection);

            //Console.Write("Início da validação...\n");
            // Wire up the call back.  The ValidationEvent is fired when the
            // XmlValidatingReader hits an issue validating a section of the xml

            reader.ValidationEventHandler += new ValidationEventHandler(reader_ValidationEventHandler);

            // Iterate through the xml document

            while (reader.Read()) { }

            //Console.WriteLine("\rFim de validação\n");
            //Console.ReadLine();

            this._validarXML.Valido = (this._validarXML.Mensagens.Count == 0);

            return this._validarXML;
        }

        private void reader_ValidationEventHandler(object sender, ValidationEventArgs e)
        {
            // Report back error information to the console...
            //Console.WriteLine("\rLinha:{0} Coluna:{1} Erro:{2}\r", e.Exception.LinePosition, e.Exception.LineNumber, e.Exception.Message);

            this._validarXML.Mensagens.Add("Linha: " + e.Exception.LinePosition.ToString() +
                " Coluna: " + e.Exception.LineNumber.ToString() +
                " Erro: " + e.Exception.Message);
        }

        /// <summary>
        /// O método assina digitalmente o arquivo XML passado por parâmetro e 
        /// grava o XML assinado com o mesmo nome, sobreponto o XML informado por parâmetro.
        /// Disponibiliza também uma propriedade com uma string do xml assinado (this.vXmlStringAssinado)
        /// </summary>
        /// <param name="arqXMLAssinar">Nome do arquivo XML a ser assinado</param>
        /// <param name="tagAssinatura">Nome da tag onde é para ficar a assinatura</param>
        /// <param name="tagAtributoId">Nome da tag que tem o atributo ID, tag que vai ser assinada</param>
        /// <param name="x509Cert">Certificado a ser utilizado na assinatura</param>
        /// <remarks>
        /// Autor: Wandrey Mundin Ferreira
        /// Data: 04/06/2008
        /// </remarks>
        public void Assinar(string arqXMLAssinar, string tagAssinatura, string tagAtributoId)
        {
            if (String.IsNullOrEmpty(tagAssinatura))
                return;

            var x509Cert = get_certificado_digital();

            StreamReader SR = null;

            try
            {
                //Abrir o arquivo XML a ser assinado e ler o seu conteúdo
                SR = File.OpenText(arqXMLAssinar);
                string xmlString = SR.ReadToEnd();
                SR.Close();
                SR = null;

                try
                {
                    // Create a new XML document.
                    XmlDocument doc = new XmlDocument();

                    // Format the document to ignore white spaces.
                    doc.PreserveWhitespace = false;

                    // Load the passed XML file using it’s name.
                    try
                    {
                        doc.LoadXml(xmlString);

                        if (doc.GetElementsByTagName(tagAssinatura).Count == 0)
                        {
                            throw new Exception("A tag de assinatura " + tagAssinatura.Trim() + " não existe no XML. (Código do Erro: 5)");
                        }
                        else if (doc.GetElementsByTagName(tagAtributoId).Count == 0)
                        {
                            throw new Exception("A tag de assinatura " + tagAtributoId.Trim() + " não existe no XML. (Código do Erro: 4)");
                        }
                        // Existe mais de uma tag a ser assinada
                        else
                        {
                            try
                            {
                                XmlDocument XMLDoc;

                                XmlNodeList lists = doc.GetElementsByTagName(tagAssinatura);
                                foreach (XmlNode nodes in lists)
                                {
                                    foreach (XmlNode childNodes in nodes.ChildNodes)
                                    {
                                        if (!childNodes.Name.Equals(tagAtributoId))
                                            continue;

                                        if (childNodes.NextSibling != null && childNodes.NextSibling.Name.Equals("Signature"))
                                            continue;

                                        // Create a reference to be signed
                                        Reference reference = new Reference();
                                        reference.Uri = "";

                                        // pega o uri que deve ser assinada                                       
                                        XmlElement childElemen = (XmlElement)childNodes;
                                        if (childElemen.GetAttributeNode("Id") != null)
                                        {
                                            reference.Uri = "#" + childElemen.GetAttributeNode("Id").Value;
                                        }
                                        else if (childElemen.GetAttributeNode("id") != null)
                                        {
                                            reference.Uri = "#" + childElemen.GetAttributeNode("id").Value;
                                        }
                                        /*
                                        XmlAttributeCollection _Uri = childElemen.GetElementsByTagName(tagAtributoId).Item(0).Attributes;

                                        if (_Uri.Count > 0)
                                            foreach (XmlAttribute _atributo in _Uri)
                                            {
                                                if (_atributo.Name == "Id" || _atributo.Name == "id")
                                                {
                                                    reference.Uri = "#" + _atributo.InnerText;
                                                }
                                            }
                                        */

                                        // Create a SignedXml object.
                                        SignedXml signedXml = new SignedXml(doc);

                                        // Add the key to the SignedXml document
                                        if (x509Cert.HasPrivateKey)
                                        {
                                            signedXml.SigningKey = x509Cert.PrivateKey;
                                        }

                                        // Add an enveloped transformation to the reference.
                                        XmlDsigEnvelopedSignatureTransform env = new XmlDsigEnvelopedSignatureTransform();
                                        reference.AddTransform(env);

                                        XmlDsigC14NTransform c14 = new XmlDsigC14NTransform();
                                        reference.AddTransform(c14);

                                        // Add the reference to the SignedXml object.
                                        signedXml.AddReference(reference);

                                        // Create a new KeyInfo object
                                        KeyInfo keyInfo = new KeyInfo();

                                        // Load the certificate into a KeyInfoX509Data object
                                        // and add it to the KeyInfo object.
                                        keyInfo.AddClause(new KeyInfoX509Data(x509Cert));

                                        // Add the KeyInfo object to the SignedXml object.
                                        signedXml.KeyInfo = keyInfo;
                                        signedXml.ComputeSignature();

                                        // Get the XML representation of the signature and save
                                        // it to an XmlElement object.
                                        XmlElement xmlDigitalSignature = signedXml.GetXml();

                                        // Gravar o elemento no documento XML
                                        nodes.AppendChild(doc.ImportNode(xmlDigitalSignature, true));
                                    }
                                }

                                XMLDoc = new XmlDocument();
                                XMLDoc.PreserveWhitespace = false;
                                XMLDoc = doc;

                                // Atualizar a string do XML já assinada
                                string StringXMLAssinado = XMLDoc.OuterXml;

                                // Gravar o XML Assinado no HD
                                StreamWriter SW_2 = File.CreateText(arqXMLAssinar);
                                SW_2.Write(StringXMLAssinado);
                                SW_2.Close();
                            }
                            catch (Exception caught)
                            {
                                throw (caught);
                            }
                        }
                    }
                    catch (Exception caught)
                    {
                        throw (caught);
                    }
                }
                catch (Exception caught)
                {
                    throw (caught);
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                if (SR != null)
                    SR.Close();
            }
        }

        public string Transmitir(string arqXml, int pNumeroNota)
        {
            var _cabec = new NFeWS.Homolocacao.TransmitirLote.nfeCabecMsg();
            var _ws = new NFeWS.Homolocacao.TransmitirLote.NfeRecepcao2();
            XmlNode _retorno = null;
            XmlNode _xmlTransmitido = get_xml_transmitir(ref arqXml);
            _cabec.cUF = "35";
            _cabec.versaoDados = "2.00";
            _ws.nfeCabecMsgValue = _cabec;
            _ws.ClientCertificates.Add(get_certificado_digital());
            _retorno = _ws.nfeRecepcaoLote2(_xmlTransmitido);

            #region recuperando o número do recibo
            var s = new StringBuilder();
            s.AppendLine("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            s.AppendLine("<retorno>");
            s.AppendLine(_retorno.InnerXml);
            s.AppendLine("</retorno>");
            var doc = new XmlDocument();
            doc.LoadXml(s.ToString());
            var nodeStatus = doc.GetElementsByTagName("nRec");

            _dbnfe.GravarTransmitir(_xmlTransmitido.InnerXml,
                                    _retorno.InnerXml,
                                    nodeStatus.Item(0).InnerText,
                                    pNumeroNota
                                    );

            return nodeStatus.Item(0).InnerText;
            #endregion
             
        }

        private XmlNode get_xml_transmitir(ref string xmlValue)
        {
            var _xml = new XmlDocument();
            _xml.Load(xmlValue);

            return _xml.ChildNodes[1];
            //return _xml;
        }

        public Tipos.NFeRetornoProcessamentoLote consulta_retorno_processamento_NFe(string numero_recibo)
        {
            var s = new StringBuilder();
            s.AppendLine("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            s.AppendLine("<retorno>");

            XmlNode _ret = null;
            switch (this._tipo_ambiente)
            {
                case TipoAmbiente.Homologacao:
                    var _cabec = new NFeWS.Homolocacao.VerificarLote.nfeCabecMsg();
                    var _ws = new NFeWS.Homolocacao.VerificarLote.NfeRetRecepcao2();
                    _cabec.cUF = this._codigo_estado;
                    _cabec.versaoDados = this._nfe_versao;
                    _ws.nfeCabecMsgValue = _cabec;
                    _ws.ClientCertificates.Add(get_certificado_digital());
                    _ret = _ws.nfeRetRecepcao2(get_xml_retorno_processamento(numero_recibo));
                    s.AppendLine(_ret.InnerXml);
                    _ws.Dispose();
                    break;
                case TipoAmbiente.Producao:
                    break;
            }

            s.AppendLine("</retorno>");
            
            var doc = new XmlDocument();
            doc.LoadXml(s.ToString());
            var nodeStatus = doc.GetElementsByTagName("cStat");
            var msg = doc.GetElementsByTagName("xMotivo");
            var chaveAcesso = doc.GetElementsByTagName("chNFe");

            #region Dados do protocolo
            string protocoloNumero = "";
            try
            {
                protocoloNumero = doc.GetElementsByTagName("nProt").Item(0).InnerText;
            }
            catch (Exception ex)
            {
                protocoloNumero = "";
            }
            var protocoloStatus = Convert.ToInt32(nodeStatus.Item(1).InnerText);
            var protocoloMotivo = msg.Item(1).InnerText;
            #endregion

            var ret = new Tipos.NFeRetornoProcessamentoLote(Convert.ToInt32(nodeStatus.Item(0).InnerText),
                                                            msg.Item(0).InnerText,
                                                            (nodeStatus.Item(0).InnerText == "104"),
                                                            _ret.InnerXml,
                                                            chaveAcesso.Item(0).InnerText,
                                                            protocoloNumero,
                                                            protocoloStatus,
                                                            protocoloMotivo
                                                            );
            return ret;
        }

        private XmlNode get_xml_retorno_processamento(string numero_recibo)
        {
            var _xml = new XmlDocument();
            var _decl = _xml.CreateXmlDeclaration("1.0", "UTF-8", null);
            _xml.AppendChild(_decl);

            var _node = _xml.CreateElement("consReciNFe");
            _node.SetAttribute("xmlns", "http://www.portalfiscal.inf.br/nfe");
            _node.SetAttribute("versao", this._nfe_versao);

            var _tpAmb = _xml.CreateElement("tpAmb");
            _tpAmb.InnerText = this._tpAmb;
            _node.AppendChild(_tpAmb);

            var _nRec = _xml.CreateElement("nRec");
            _nRec.InnerText = numero_recibo;
            _node.AppendChild(_nRec);

            _xml.AppendChild(_node);

            return _node;
        }

    }

    public struct TValidarXML
    {
        public bool Valido { get; set; }
        public List<string> Mensagens { get; set; }
    }
}
