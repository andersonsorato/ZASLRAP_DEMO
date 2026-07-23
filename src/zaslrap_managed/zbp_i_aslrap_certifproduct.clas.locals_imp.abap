CLASS lhc_Cetificate DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Certificate RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Certificate RESULT result.

    METHODS setInitialValues FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Certificate~setInitialValues.
    METHODS checkMaterial FOR VALIDATE ON SAVE
      IMPORTING keys FOR Certificate~checkMaterial.

ENDCLASS.

CLASS lhc_Cetificate IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
    IF requested_authorizations-%create = if_abap_behv=>mk-on.
      result-%create = if_abap_behv=>auth-allowed.
    ENDIF.
  ENDMETHOD.

  METHOD setInitialValues.

    READ ENTITIES OF zi_aslrap_certifproduct IN LOCAL MODE
         ENTITY Certificate
         FIELDS ( CertStatus )
         WITH CORRESPONDING #( keys )
         RESULT DATA(lt_results).

    IF lt_results IS NOT INITIAL.
      MODIFY ENTITIES OF zi_aslrap_certifproduct IN LOCAL MODE
      ENTITY Certificate
      UPDATE
      FIELDS ( Version CertStatus )
      WITH VALUE #(  FOR ls_result IN lt_results ( %tky = ls_result-%tky Version = '001' CertStatus = '01' ) ).
    ENDIF.

    DATA: lt_state       TYPE TABLE FOR CREATE zi_aslrap_certifproduct\_stats,
          ls_state       LIKE LINE OF lt_state,
          ls_state_value LIKE LINE OF ls_state-%target.

    LOOP AT lt_results INTO DATA(ls_certificates).
      ls_state-%key = ls_certificates-%key.
      ls_state-CertUuid = ls_state_value-CertUuid = ls_certificates-CertUuid.

      ls_state_value-Version   = '001'.
      ls_state_value-StatusOld = space.
      ls_state_value-Status    = '01'.

      ls_state_value-%control-Version       = if_abap_behv=>mk-on.
      ls_state_value-%control-StatusOld     = if_abap_behv=>mk-on.
      ls_state_value-%control-Status        = if_abap_behv=>mk-on.
      ls_state_value-%control-LastChangedAt = if_abap_behv=>mk-on.
      ls_state_value-%control-LastChangedBy = if_abap_behv=>mk-on.

      APPEND ls_state_value TO ls_state-%target.

      APPEND ls_state TO lt_state.

      MODIFY ENTITIES OF zi_aslrap_certifproduct IN LOCAL MODE
        ENTITY Certificate
        CREATE BY \_stats
        FROM lt_state
            REPORTED DATA(ls_return_ass)
            MAPPED DATA(ls_mapped_ass)
            FAILED DATA(ls_failed_ass).
    ENDLOOP.
  ENDMETHOD.

  METHOD checkMaterial.

    READ ENTITIES OF zi_aslrap_certifproduct IN LOCAL MODE
           ENTITY Certificate
           FIELDS ( CertStatus )
           WITH CORRESPONDING #( keys )
           RESULT DATA(lt_results).

    CHECK lt_results IS NOT INITIAL.

    SELECT *
    FROM    zaslrap_product
    INTO TABLE @DATA(lt_material).

    LOOP AT lt_results INTO DATA(ls_result).
      IF  ls_result-Matnr IS INITIAL OR NOT line_exists( lt_material[ matnr = ls_result-Matnr ] ).
*        APPEND VALUE #( %tky = ls_result-%tky ) TO failed-certificate.
        APPEND VALUE #(
                      %tky        = ls_result-%tky
                      %state_area = 'MATERIAL_UNKNOWN'
                      %msg        = NEW zcx_aslrap_certificate(
                        severity = if_abap_behv_message=>severity-error
                        textid   = zcx_aslrap_certificate=>material_unknown
                        attr1 = CONV string( ls_result-Matnr )
                      )
                    ) TO reported-certificate.
      ENDIF.
    ENDLOOP..


  ENDMETHOD.



ENDCLASS.
