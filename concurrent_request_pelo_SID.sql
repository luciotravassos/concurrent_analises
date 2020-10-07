/* Formatted on 2004/12/21 03:33 (Formatter Plus v4.7.0) */
SELECT SUBSTR (LTRIM (req.request_id), 1, 15) concreq,
       SUBSTR (proc.os_process_id, 1, 15) clproc,
       SUBSTR (LTRIM (proc.oracle_process_id), 1, 15) opid,
       SUBSTR (look.meaning, 1, 10) reqph, SUBSTR (look1.meaning, 1,
                                                   10) reqst,
       SUBSTR (vsess.username, 1, 10) dbuser,
       SUBSTR (vproc.spid, 1, 10) svrproc
  FROM apps.fnd_concurrent_requests req,
       apps.fnd_concurrent_processes proc,
       apps.fnd_lookups look,
       apps.fnd_lookups look1,
       v$process vproc,
       v$session vsess
 WHERE req.controlling_manager = proc.concurrent_process_id(+)
   AND req.status_code = look.lookup_code
   AND look.lookup_type = 'CP_STATUS_CODE'
   AND req.phase_code = look1.lookup_code
   AND look1.lookup_type = 'CP_PHASE_CODE'
   AND proc.oracle_process_id = 117
   AND proc.oracle_process_id = vproc.pid(+)
   AND vproc.addr = vsess.paddr(+)
/

