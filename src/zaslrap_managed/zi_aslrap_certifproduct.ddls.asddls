@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite - Certificado com produto'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_ASLRAP_CERTIFPRODUCT
  as select from ZI_ASLRAP_CERTIF
  composition [1..*] of ZI_ASLRAP_CERTIFSTPRODUCTS as _stats  
  association [1..1] to ZI_ASLRAP_PRODUCT as _prod on $projection.Matnr = _prod.Matnr
                                                  and _prod.language = $session.system_language
                                                 
{
  key CertUuid,
      Matnr,
      _prod.Description as Description,
      Version,
      CertStatus,    
      CertCe,
      CertGs,
      CertFcc,
      CertIso,
      CertTuev,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      'sap-icom://accounting-document-verification' as Icon,
      
      _prod,
      _stats
}
