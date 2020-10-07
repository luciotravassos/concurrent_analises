SELECT request_id,
       b.SID,
       b.serial#,
       b.osuser,
       TO_CHAR(request_date, 'dd/mm/yy hh24:MI') "Time",
       requested_by,
       SUBSTR(phase_code, 1, 30) "Phase",
       SUBSTR(status_code, 1, 30) "Status",
       oracle_id,
       --SUBSTR(oracle_process_id, 1, 30) oracle_id,
       --oracle_session_id,
       --os_process_id,
       b.process,
       b.MODULE
       --c.spid
  FROM apps.fnd_concurrent_requests a, v$session b, v$process c
 WHERE phase_code IN ('R', 'E', 'D', 'M', 'I')
   AND oracle_session_id = audsid
   AND a.request_id = &requestid
   AND b.paddr = c.addr