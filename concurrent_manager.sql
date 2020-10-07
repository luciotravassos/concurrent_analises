/* Esse script monitora o concurrent manager e os seus processos */
SELECT   SUBSTR (user_concurrent_queue_name, 1, 30) "CONCURRENT",
         SUBSTR (target_node, 1, 12) "SERVIDOR", max_processes "PROCESSO"
         ,description,concurrent_queue_name
    FROM apps.fnd_concurrent_queues_vl
   WHERE enabled_flag = 'Y'
ORDER BY DECODE (application_id, 0, DECODE (concurrent_queue_id, 1, 1, 4, 2)),
         SIGN (max_processes) DESC,
         concurrent_queue_name,
         application_id
         

