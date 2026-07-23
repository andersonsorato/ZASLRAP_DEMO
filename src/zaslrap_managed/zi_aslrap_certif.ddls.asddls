@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Certificados'
@Metadata.ignorePropagatedAnnotations: true
/*+[hideWarning] { "IDS" : [ "KEY_CHECK" ]  } */
define view entity ZI_ASLRAP_CERTIF as select from zaslrap_certif
{
   
    key cert_uuid as CertUuid,
    matnr as Matnr,
    version as Version,
    cert_status as CertStatus,
    cert_ce as CertCe,
    cert_gs as CertGs,
    cert_fcc as CertFcc,
    cert_iso as CertIso,
    cert_tuev as CertTuev,
    local_last_changed_at as LocalLastChangedAt
}
