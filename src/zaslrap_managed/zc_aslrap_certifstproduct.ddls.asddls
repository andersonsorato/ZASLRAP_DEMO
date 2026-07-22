@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Status Certificado'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_ASLRAP_CERTIFSTPRODUCT as projection on ZI_ASLRAP_CERTIFSTPRODUCTS
{
    key StateUuid,
    CertUuid,
    Matnr,
    description,
    Version,
    Status,
    StatusOld,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _certif: redirected to parent ZC_ASLRAP_CERTIFPRODUTCT
}
