/* VERIFICA O STATUS E PID DO CONCURRENT MANAGER */
SELECT os_process_id AS os_pid
  FROM apps.fnd_concurrent_queues fcq, apps.fnd_concurrent_processes fcp
 WHERE concurrent_queue_name = 'FNDICM'
   AND fcq.concurrent_queue_id = fcp.concurrent_queue_id
   AND fcq.application_id = fcp.queue_application_id
   AND process_status_code NOT IN ('K', 'S');

