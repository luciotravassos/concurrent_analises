/* Formatted on 2004/11/24 04:57 (Formatter Plus v4.7.0) */
SELECT   target_node, concurrent_queue_id, manager_type,
         last_update_date, last_updated_by, last_update_login, creation_date,
         created_by, processor_application_id, concurrent_processor_id,
         max_processes, running_processes, diagnostic_level,
         user_concurrent_queue_name, enabled_flag, concurrent_queue_name,
         description, data_group_id, resource_consumer_group, cache_size,
         node_name, os_queue, node_name2, os_queue2
    FROM apps.fnd_concurrent_queues_vl
   --WHERE (user_concurrent_queue_name LIKE '%W%')
   --WHERE user_concurrent_queue_name like '%212%'
   WHERE NODE_NAME = 'PRD212'
ORDER BY DECODE (manager_type, '1', 1, '3', 2, '2', 3, '0', 4),
         concurrent_queue_name

