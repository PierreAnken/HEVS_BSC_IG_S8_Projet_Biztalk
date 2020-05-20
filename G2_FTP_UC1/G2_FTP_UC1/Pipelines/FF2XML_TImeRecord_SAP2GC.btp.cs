namespace G2_FTP_UC1.Pipelines
{
    using System;
    using System.Collections.Generic;
    using Microsoft.BizTalk.PipelineOM;
    using Microsoft.BizTalk.Component;
    using Microsoft.BizTalk.Component.Interop;
    
    
    public sealed class FF2XML_TImeRecord_SAP2GC : Microsoft.BizTalk.PipelineOM.ReceivePipeline
    {
        
        private const string _strPipeline = "<?xml version=\"1.0\" encoding=\"utf-16\"?><Document xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instanc"+
"e\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" MajorVersion=\"1\" MinorVersion=\"0\">  <Description /> "+
" <CategoryId>f66b9f5e-43ff-4f5f-ba46-885348ae1b4e</CategoryId>  <FriendlyName>Receive</FriendlyName>"+
"  <Stages>    <Stage>      <PolicyFileStage _locAttrData=\"Name\" _locID=\"1\" Name=\"Decode\" minOccurs=\""+
"0\" maxOccurs=\"-1\" execMethod=\"All\" stageId=\"9d0e4103-4cce-4536-83fa-4a5040674ad6\" />      <Component"+
"s />    </Stage>    <Stage>      <PolicyFileStage _locAttrData=\"Name\" _locID=\"2\" Name=\"Disassemble\" "+
"minOccurs=\"0\" maxOccurs=\"-1\" execMethod=\"FirstMatch\" stageId=\"9d0e4105-4cce-4536-83fa-4a5040674ad6\" "+
"/>      <Components>        <Component>          <Name>Microsoft.BizTalk.Component.FFDasmComp,Micros"+
"oft.BizTalk.Pipeline.Components, Version=3.0.1.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35</"+
"Name>          <ComponentName>Flat file disassembler</ComponentName>          <Description>Streaming"+
" flat file disassembler component</Description>          <Version>1.0</Version>          <Properties"+
">            <Property Name=\"HeaderSpecName\">              <Value xsi:type=\"xsd:string\" />          "+
"  </Property>            <Property Name=\"DocumentSpecName\">              <Value xsi:type=\"xsd:string"+
"\">G2_FTP_UC1.XSD.FF_TimeRecord_GC2SAP</Value>            </Property>            <Property Name=\"Trai"+
"lerSpecName\" />            <Property Name=\"PreserveHeader\">              <Value xsi:type=\"xsd:boolea"+
"n\">false</Value>            </Property>            <Property Name=\"ValidateDocumentStructure\">      "+
"        <Value xsi:type=\"xsd:boolean\">false</Value>            </Property>            <Property Name"+
"=\"RecoverableInterchangeProcessing\">              <Value xsi:type=\"xsd:boolean\">false</Value>       "+
"     </Property>          </Properties>          <CachedDisplayName>Flat file disassembler</CachedDi"+
"splayName>          <CachedIsManaged>true</CachedIsManaged>        </Component>      </Components>  "+
"  </Stage>    <Stage>      <PolicyFileStage _locAttrData=\"Name\" _locID=\"3\" Name=\"Validate\" minOccurs"+
"=\"0\" maxOccurs=\"-1\" execMethod=\"All\" stageId=\"9d0e410d-4cce-4536-83fa-4a5040674ad6\" />      <Compone"+
"nts />    </Stage>    <Stage>      <PolicyFileStage _locAttrData=\"Name\" _locID=\"4\" Name=\"ResolvePart"+
"y\" minOccurs=\"0\" maxOccurs=\"-1\" execMethod=\"All\" stageId=\"9d0e410e-4cce-4536-83fa-4a5040674ad6\" />  "+
"    <Components />    </Stage>  </Stages></Document>";
        
        private const string _versionDependentGuid = "d93f37c4-d10d-45c3-8636-d789fded67c9";
        
        public FF2XML_TImeRecord_SAP2GC()
        {
            Microsoft.BizTalk.PipelineOM.Stage stage = this.AddStage(new System.Guid("9d0e4105-4cce-4536-83fa-4a5040674ad6"), Microsoft.BizTalk.PipelineOM.ExecutionMode.firstRecognized);
            IBaseComponent comp0 = Microsoft.BizTalk.PipelineOM.PipelineManager.CreateComponent("Microsoft.BizTalk.Component.FFDasmComp,Microsoft.BizTalk.Pipeline.Components, Version=3.0.1.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35");;
            if (comp0 is IPersistPropertyBag)
            {
                string comp0XmlProperties = "<?xml version=\"1.0\" encoding=\"utf-16\"?><PropertyBag xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-inst"+
"ance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\">  <Properties>    <Property Name=\"HeaderSpecName\""+
">      <Value xsi:type=\"xsd:string\" />    </Property>    <Property Name=\"DocumentSpecName\">      <Va"+
"lue xsi:type=\"xsd:string\">G2_FTP_UC1.XSD.FF_TimeRecord_GC2SAP</Value>    </Property>    <Property Na"+
"me=\"TrailerSpecName\" />    <Property Name=\"PreserveHeader\">      <Value xsi:type=\"xsd:boolean\">false"+
"</Value>    </Property>    <Property Name=\"ValidateDocumentStructure\">      <Value xsi:type=\"xsd:boo"+
"lean\">false</Value>    </Property>    <Property Name=\"RecoverableInterchangeProcessing\">      <Value"+
" xsi:type=\"xsd:boolean\">false</Value>    </Property>  </Properties></PropertyBag>";
                PropertyBag pb = PropertyBag.DeserializeFromXml(comp0XmlProperties);;
                ((IPersistPropertyBag)(comp0)).Load(pb, 0);
            }
            this.AddComponent(stage, comp0);
        }
        
        public override string XmlContent
        {
            get
            {
                return _strPipeline;
            }
        }
        
        public override System.Guid VersionDependentGuid
        {
            get
            {
                return new System.Guid(_versionDependentGuid);
            }
        }
    }
}
