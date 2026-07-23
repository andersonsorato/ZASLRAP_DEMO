CLASS zcx_aslrap_certificate DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    DATA: ATTR1 TYPE STRING READ-ONLY,
          ATTR2 TYPE STRING READ-ONLY,
          ATTR3 TYPE STRING READ-ONLY,
          ATTR4 TYPE STRING READ-ONLY.

    CONSTANTS: BEGIN OF material_unknown,
                 msgid TYPE symsgid VALUE 'ZASLRAP_MANAGED',
                 msgno TYPE symsgno VALUE '001',
                 attr1 TYPE scx_attrname VALUE 'ATTR1',
                 attr2 TYPE scx_attrname VALUE 'ATTR2',
                 attr3 TYPE scx_attrname VALUE 'ATTR3',
                 attr4 TYPE scx_attrname VALUE 'ATTR4',
               END OF material_unknown.

    METHODS constructor
      IMPORTING severity TYPE if_abap_behv_message=>t_severity DEFAULT
                  if_abap_behv_message=>severity-error
                textid   LIKE if_t100_message=>t100key OPTIONAL
                previous TYPE REF TO cx_root OPTIONAL
                ATTR1    TYPE STRING OPTIONAL
                ATTR2    TYPE STRING OPTIONAL
                ATTR3    TYPE STRING OPTIONAL
                ATTR4    TYPE STRING OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_aslrap_certificate IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    CALL METHOD super->constructor
      EXPORTING
        previous = previous.

    CLEAR me->textid.

    IF textid IS INITIAL.
      if_t100_message~t100key =
        if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->ATTR1 = |{ ATTR1 ALPHA = OUT }|.
    me->ATTR2 = |{ ATTR2 ALPHA = OUT }|.
    me->ATTR3 = |{ ATTR3 ALPHA = OUT }|.
    me->ATTR4 = |{ ATTR4 ALPHA = OUT }|.

  ENDMETHOD.
ENDCLASS.
