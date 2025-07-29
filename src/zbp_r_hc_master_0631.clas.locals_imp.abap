CLASS lcl_buffer DEFINITION.

  PUBLIC SECTION.

    CONSTANTS: created TYPE c LENGTH 1 VALUE 'C',
               updated TYPE c LENGTH 1 VALUE 'U',
               deleted TYPE c LENGTH 1 VALUE 'D'.

    TYPES: BEGIN OF ty_buffer_master.
             INCLUDE TYPE zhc_master_0631 AS data.
    TYPES:   flag TYPE c LENGTH 1,
           END OF ty_buffer_master.

    TYPES: tt_master TYPE SORTED TABLE OF ty_buffer_master WITH UNIQUE KEY e_name.

    CLASS-DATA mt_buffer_master TYPE tt_master.

ENDCLASS.

CLASS lhc_Z_R_HC_MASTER_0631 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR z_r_hc_master_0631 RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR z_r_hc_master_0631 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE z_r_hc_master_0631.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE z_r_hc_master_0631.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE z_r_hc_master_0631.

    METHODS read FOR READ
      IMPORTING keys FOR READ z_r_hc_master_0631 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK z_r_hc_master_0631.

ENDCLASS.

CLASS lhc_Z_R_HC_MASTER_0631 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.

    DATA ls_buffer TYPE  lcl_buffer=>ty_buffer_master.

    GET TIME STAMP FIELD DATA(lv_tsl).

    SELECT FROM zhc_master_0631
           FIELDS MAX( e_number ) AS e_number
           INTO @DATA(lv_e_number).

    LOOP AT entities INTO DATA(ls_entities).

      ls_buffer-data-e_number = lv_e_number + 1.
      ls_buffer-data-crea_date_time = lv_tsl.
      ls_buffer-data-crea_uname = sy-uname.
      ls_buffer-data-e_name = ls_entities-%data-EName.
      ls_buffer-data-e_department = ls_entities-%data-EDepartment.
      ls_buffer-data-job_title = ls_entities-%data-JobTitle.
      ls_buffer-data-status = ls_entities-%data-Status.
      ls_buffer-data-start_date = ls_entities-%data-StartDate.
      ls_buffer-data-end_date = ls_entities-%data-EndDate.
      ls_buffer-data-email = ls_entities-%data-Email.
      ls_buffer-data-m_number = ls_entities-%data-MNumber.
      ls_buffer-data-m_name = ls_entities-%data-MName.
      ls_buffer-data-m_department = ls_entities-%data-MDepartment.
      ls_buffer-data-crea_date_time = ls_entities-%data-CreaDateTime.
      ls_buffer-data-crea_uname = ls_entities-%data-CreaUname.

      ls_buffer-flag = lcl_buffer=>created.

      INSERT ls_buffer INTO TABLE lcl_buffer=>mt_buffer_master.

      IF ls_entities-%cid IS NOT INITIAL.
        INSERT VALUE #( %cid           = ls_entities-%cid

                        ENumber = ls_entities-ENumber ) INTO TABLE mapped-z_r_hc_master_0631.
      ENDIF.


    ENDLOOP.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z_R_HC_MASTER_0631 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Z_R_HC_MASTER_0631 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
