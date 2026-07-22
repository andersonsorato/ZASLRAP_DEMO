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
         ( matnr = '1' description = 'Celular' language = 'P' )
         ( matnr = '2' description = 'Televisao' language = 'P'  )
         ( matnr = '3' description = 'Computador' language = 'P' )
         ( matnr = '1' description = 'Phone'    language = 'E' )
         ( matnr = '2' description = 'Television' language = 'E'  )
         ( matnr = '3' description = 'Computer' language = 'E' )
         ).
         MODIFY zaslrap_product from TABLE @lt_product.
  ENDMETHOD.

ENDCLASS.
