/* verifica quais parametros estão setados para um programa */
SELECT   icon_name, row_id, user_concurrent_program_name, enabled_flag,
         concurrent_program_name, description, execution_options,
         request_priority, increment_proc, run_alone_flag, restart,
         enable_trace, nls_compliant, output_file_type, save_output_flag,
         print_flag, minimum_width, minimum_length, output_print_style,
         required_style, printer_name, application_id, last_update_date,
         execution_method_code, last_update_login, creation_date, created_by,
         executable_id, last_updated_by, executable_application_id,
         concurrent_program_id, concurrent_class_id, class_application_id,
         argument_method_code, request_set_flag, queue_method_code,
         queue_control_flag, srs_flag, cd_parameter, mls_executable_id,
         mls_executable_app_id, resource_consumer_group, rollback_segment,
         optimizer_mode, security_group_id, enable_time_statistics,
         refresh_portlet, program_type, activity_summarizer,
         allow_multiple_pending_request, delete_log_file
    FROM apps.fnd_concurrent_programs_vl
   WHERE queue_control_flag = 'N'
     AND (    UPPER (concurrent_program_name) = 'VISA_INV_PICK_TICKETS'
          
         )
ORDER BY application_id, user_concurrent_program_name

