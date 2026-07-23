CLASS zcl_c_products DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_c_products IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES tt_products TYPE TABLE of zaslrap_product WITH DEFAULT KEY.
    DELETE from zaslrap_product.
    DATA(lt_product) = value tt_products(
         ( matnr = '000000000000000001' description = 'Celular' language = 'P' )
         ( matnr = '000000000000000002' description = 'Televisao' language = 'P'  )
         ( matnr = '000000000000000003' description = 'Computador' language = 'P' )
         ( matnr = '000000000000000001' description = 'Phone'    language = 'E' )
         ( matnr = '000000000000000002' description = 'Television' language = 'E'  )
         ( matnr = '000000000000000003' description = 'Computer' language = 'E' )
         ).
         MODIFY zaslrap_product from TABLE @lt_product.
         out->write( 'pRODUTOS inseridos com sucesso na tabela .' ).
  ENDMETHOD.

ENDCLASS.
