CLASS zcl_c_certif DEFINITION

  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_c_certif IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES tt_certif TYPE TABLE of zaslrap_certif WITH DEFAULT KEY.
    DELETE from zaslrap_certif.
    TRY.
        data(lt_certif) = VALUE tt_certif(
             ( cert_uuid = cl_system_uuid=>create_uuid_x16_static( ) matnr = '1' )
             ( cert_uuid = cl_system_uuid=>create_uuid_x16_static( ) matnr = '2' )
             ( cert_uuid = cl_system_uuid=>create_uuid_x16_static( ) matnr = '3' )
             ).
             MODIFY zaslrap_certif from TABLE @lt_certif.
         out->write( 'Dados de certificados inseridos com sucesso!' ).
      CATCH cx_uuid_error.
       out->write( 'Registros inseridos com sucesso na tabela ZASLRAP_CERTIF.' ).
        out->write( lt_certif ).
        "handle exception
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
