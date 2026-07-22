@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Certificado Status com produto'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_ASLRAP_CERTIFSTPRODUCTS as select from ZI_ASLRAP_CERT_SF
association to parent ZI_ASLRAP_CERTIFPRODUCT as _certif on $projection.CertUuid = _certif.CertUuid
association [1..1] to ZI_ASLRAP_PRODUCT as _prod on $projection.Matnr = _prod.Matnr
                                                  and _prod.language = $session.system_language
{
    key StateUuid,
    CertUuid,
    Matnr,
    _prod.Description as description,
    Version,
    Status,
    StatusOld,
    @Semantics.user.lastChangedBy: true
    LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangedAt,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    
    _certif
}
