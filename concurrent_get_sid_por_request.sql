/* Com a mesma finalidade do ver concurrent, basta informar o request_id */
SELECT a.request_id, d.SID, d.serial#, d.osuser, d.process
  FROM apps.fnd_concurrent_requests a,
       apps.fnd_concurrent_processes b,
       v$process c,
       v$session d
 WHERE a.controlling_manager = b.concurrent_process_id
   AND c.pid = b.oracle_process_id
   AND b.session_id = d.audsid
   /*opção variável ou fixo */
  AND a.request_id = 922840
   --and d.sid = '225'
   --AND a.phase_code = 'R'
   --and c.spid = 922840

