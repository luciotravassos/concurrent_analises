/* Script que busca todos os concurrents pelos status */
SELECT   SUBSTR (a.request_id, 1, 20) request_id,
         SUBSTR (b.user_name, 1, 30) requestor,
         SUBSTR (a.completion_text, 1, 30) completion_text,
         a.phase_code "Phase Code", a.status_code,
         SUBSTR (a.program, 1, 40) program, a.actual_completion_date,
         a.priority, a.request_date,argument_text
    FROM apps.fnd_conc_req_summary_v a, apps.fnd_user b
   WHERE a.requested_by = b.user_id
     AND a.phase_code = 'R'
  AND a.status_code <> 'W'
--and
--  c.status = 'ACTIVE'
--AND
--    a.REQUEST_DATE < ((select sysdate from dual)-1)
ORDER BY a.request_id DESC
/

