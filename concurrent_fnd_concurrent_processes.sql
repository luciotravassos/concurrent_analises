SELECT proc.concurrent_process_id concproc,
       SUBSTR(proc.os_process_id,1,6) clproc,
       SUBSTR(LTRIM(proc.oracle_process_id),1,15) opid,
       SUBSTR(vproc.spid,1,10) svrproc,
       DECODE(proc.process_status_code,'A','Ativo',
              proc.process_status_code) cstat,
       SUBSTR(concq.concurrent_queue_name,1,30) qnam,
--       SUBSTR(proc.logfile_name,1,20) lnam,
       SUBSTR(proc.node_name,1,10) nnam,
       SUBSTR(proc.db_name,1,8) dbnam,
       SUBSTR(proc.db_instance,1,8) dbinst,
       SUBSTR(vsess.username,1,10) dbuser
  FROM apps.fnd_concurrent_processes proc,
       apps.fnd_concurrent_queues concq,
       v$process vproc,
       v$session vsess
 WHERE proc.process_status_code = 'A'
   AND proc.queue_application_id = concq.application_id
   AND proc.concurrent_queue_id = concq.concurrent_queue_id
   AND proc.oracle_process_id = vproc.pid(+)
   AND vproc.addr = vsess.paddr(+)
 ORDER BY proc.queue_application_id, 
       proc.concurrent_queue_id

