--prompt SELECIONA REQUEST ID E  SERIAL PELO SID

SELECT DISTINCT a.SID, a.serial#, b.request_id, a.status
           FROM v$session a, apps.fnd_concurrent_requests b
          WHERE a.process = b.os_process_id AND a.SID = 321
--and a.serial#=

