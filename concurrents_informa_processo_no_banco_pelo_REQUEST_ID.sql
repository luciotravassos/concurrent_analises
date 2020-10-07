/* Script traz o SID, SERIAL# e REQUEST_ID */
SELECT   a.SID, a.serial#, a.osuser, a.username "user_id", a.module,
         b.os_process_id "os_process", b.request_id,
         TO_CHAR (b.actual_start_date, 'dd-mon-yyyy hh24:mi:ss') "Started"
    FROM v$session a, apps.fnd_concurrent_requests b
   WHERE a.module IS NOT NULL
     AND a.audsid = b.oracle_session_id
     AND phase_code IN ('R', 'E', 'D', 'M', 'I')
     --AND b.status_code = 'R'
     AND b.request_id = 2245641
ORDER BY b.actual_start_date
/

