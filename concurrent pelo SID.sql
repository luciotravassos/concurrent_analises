--prompt SELECIONA REQUEST ID E  SERIAL PELO SID
SELECT DISTINCT (c.SID), a.serial#, b.request_id, d.spid, b.phase_code,
                b.status_code, b.actual_start_date, b.actual_completion_date,
                b.description, b.requested_by, b.req_information,
                b.logfile_name, b.logfile_node_name, b.outfile_name,
                b.outfile_node_name
           FROM v$session a,
                apps.fnd_concurrent_requests b,
                v$session c,
                v$process d
          WHERE a.process = b.os_process_id AND c.SID = 503
--and a.serial# = 8105
--and d.spid = 19645
--AND b.status_code = 'R'
--AND b.phase_code = 'R'

