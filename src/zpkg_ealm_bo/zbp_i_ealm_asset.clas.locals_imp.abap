CLASS lhc_Asset DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Asset RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Asset RESULT result.
    METHODS validate_scrapped_asset FOR VALIDATE ON SAVE
      IMPORTING keys FOR Maintenance~validate_scrapped_asset.
    METHODS set_initial_values FOR DETERMINE ON SAVE
      IMPORTING keys FOR Maintenance~set_initial_values.
    METHODS derive_asset_status FOR DETERMINE ON SAVE
      IMPORTING keys FOR Maintenance~derive_asset_status.

ENDCLASS.

CLASS lhc_Asset IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validate_scrapped_asset.



    READ ENTITIES OF zi_ealm_asset IN LOCAL MODE
   ENTITY Maintenance
   FIELDS ( AssetUuid ) WITH CORRESPONDING #( keys )
   RESULT DATA(lt_maint).

    READ TABLE lt_maint ASSIGNING FIELD-SYMBOL(<ls_maint>) INDEX 1.

    READ ENTITIES OF zi_ealm_asset IN LOCAL MODE
    ENTITY Asset
    FIELDS ( AssetUuid Status ) WITH VALUE #( ( AssetUuid = <ls_maint>-AssetUuid ) )
    RESULT DATA(lt_asset).

    READ TABLE lt_asset ASSIGNING FIELD-SYMBOL(<ls_asset>) INDEX 1.


    IF <ls_asset>-Status = 'SCRAPPED'.
      APPEND VALUE #( %tky = <ls_maint>-%tky ) TO failed-maintenance.

      APPEND VALUE #( %tky = <ls_maint>-%tky
                      %msg = new_message( id = 'ZMSG_EALM'
                                          number = '000'
                                          severity = if_abap_behv_message=>severity-error )
                     ) TO reported-maintenance.

    ENDIF.

  ENDMETHOD.

  METHOD set_initial_values.

    READ ENTITIES OF zi_ealm_asset IN LOCAL MODE
    ENTITY Maintenance
    FIELDS ( RequestedDate Currencycode Status ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_maint).

    LOOP AT lt_maint ASSIGNING FIELD-SYMBOL(<ls_maint>) .

      DATA(lv_change) = abap_false.


      IF <ls_maint>-RequestedDate IS INITIAL.

        <ls_maint>-RequestedDate = cl_abap_context_info=>get_system_date( ).
        lv_change = abap_true.

      ELSE.

        lv_change = abap_false.

      ENDIF.



      IF <ls_maint>-Currencycode IS INITIAL.

        <ls_maint>-Currencycode = 'INR'.
        lv_change = abap_true.

      ELSE.

        lv_change = abap_false.

      ENDIF.


      IF <ls_maint>-Status IS INITIAL.

        <ls_maint>-Status = 'OPEN'.
        lv_change = abap_true.

      ELSE.

        lv_change = abap_false.

      ENDIF.

*    <ls_maint>-RequestedDate = COND #( WHEN <ls_maint>-RequestedDate IS INITIAL
*                                       THEN cl_abap_context_info=>get_system_date( )
*                                       ELSE <ls_maint>-RequestedDate ).
*
*    <ls_maint>-Status = COND #( WHEN <ls_maint>-Status IS INITIAL
*                                       THEN 'OPEN'
*                                       ELSE <ls_maint>-Status ).
*
*    <ls_maint>-Currencycode = COND #( WHEN <ls_maint>-Currencycode IS INITIAL
*                                       THEN 'INR'
*                                       ELSE <ls_maint>-Currencycode ).

      IF lv_change = abap_true.

        MODIFY ENTITIES OF zi_ealm_asset IN LOCAL MODE
        ENTITY Maintenance
        UPDATE FIELDS ( RequestedDate Currencycode Status ) WITH VALUE #( ( %tky = <ls_maint>-%tky
                                                                            RequestedDate = <ls_maint>-RequestedDate
                                                                            Currencycode = <ls_maint>-Currencycode
                                                                            Status = <ls_maint>-Status ) )
               MAPPED DATA(lt_mapped)
               FAILED DATA(lt_failed)
               REPORTED DATA(lt_reported).
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD derive_asset_status.
  ENDMETHOD.

ENDCLASS.
