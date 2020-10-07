/* Formatted on 2004/10/21 04:20 (Formatter Plus v4.7.0) */
SELECT   b.description, a.actual_start_date, a.actual_completion_date,
         a.request_id,
         TRUNC ((a.actual_completion_date - a.actual_start_date) * 60 * 24
               ) tempo
--   SUBSTR(a.completion_text,1,20)
FROM     apps.fnd_concurrent_requests a, apps.fnd_concurrent_programs_tl b
   WHERE TRUNC (request_date) = '04/AUG/2005'
--     WHERE TRUNC (request_date) < (select sysdate from dual)-1
     AND b.LANGUAGE = 'PTB'
     AND a.concurrent_program_id = b.concurrent_program_id
     AND a.program_application_id = b.application_id
     AND TRUNC ((a.actual_completion_date - a.actual_start_date) * 60 * 24) IS NOT NULL
/*O Item abaixo seleciona os concurrents que executaram em "X" minutos*, deixei
comentado apenas para pegar as ocorr�ncias todas de um periodo de 24 horas*/
--AND TRUNC((a.actual_completion_date-a.actual_start_date)*60*24) > 10
ORDER BY 5 DESC
/

