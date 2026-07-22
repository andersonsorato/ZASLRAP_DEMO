@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Produtos'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_ASLRAP_PRODUCT as select from zaslrap_product
{
    key matnr as Matnr,
    key language as language,
    description as Description    
}
