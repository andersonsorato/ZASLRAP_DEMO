@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Certificados'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_ASLRAP_CERTIFPRODUTCT
  provider contract transactional_query as projection on ZI_ASLRAP_CERTIFPRODUCT
{
   
    key CertUuid,
    Matnr,
    Description,
    Version,
    CertStatus,
    CertCe,
    CertGs,
    CertFcc,
    CertIso,
    CertTuev,
    LocalLastChangedAt,    
    Icon,
    /* Associations */
    _prod,
    _stats: redirected to composition child ZC_ASLRAP_CERTIFSTPRODUCT
}
