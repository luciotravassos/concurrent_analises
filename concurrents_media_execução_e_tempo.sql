SELECT q.concurrent_queue_name, COUNT (*) N_de_Processos,
       SUM (r.actual_completion_date - r.actual_start_date) * 24 elapsed,
       AVG (r.actual_completion_date - r.actual_start_date) * 24 average,
       SUM (r.actual_start_date - r.requested_start_date) * 24 waited,
       AVG (r.actual_start_date - r.requested_start_date) * 24 avewait
  FROM apps.fnd_concurrent_programs p,
       apps.fnd_concurrent_requests r,
       apps.fnd_concurrent_queues q,
       apps.fnd_concurrent_processes p
 WHERE r.program_application_id = p.application_id
   AND r.concurrent_program_id = p.concurrent_program_id
   AND r.status_code IN ('C', 'G')
   AND r.controlling_manager = p.concurrent_process_id
   AND q.concurrent_queue_id = p.concurrent_queue_id
   AND r.concurrent_program_id =
          p.concurrent_program_id                 
          and actual_start_date between '10-oct-2006' and '11-oct-2006'
        --actual_start_date between '16-Feb-05' and '17-Feb-05'
group by q.concurrent_queue_name
order by N_de_Processos desc

