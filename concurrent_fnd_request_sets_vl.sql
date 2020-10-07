/* Formatted on 2004/12/21 23:48 (Formatter Plus v4.7.0) */
SELECT user_request_set_name,
       request_set_name,
       description,
       start_date_active,
       end_date_active,
       print_together_flag,
       allow_constraints_flag,
       request_set_id,
       application_id,
       concurrent_program_id,
       owner,
       created_by,
       creation_date,
       last_update_date,
       last_updated_by,
       last_update_login,
       icon_name,
       printer,
       start_stage
  FROM apps.fnd_request_sets_vl
--ORDER BY application_id, request_set_name
 ORDER BY DESCRIPTION