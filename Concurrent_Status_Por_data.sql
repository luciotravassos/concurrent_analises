select b.program,a.request_id,to_char(a.actual_start_date,'DD/MM/YY HH24:MI:SS') strttime, 
       to_char(a.actual_completion_date,'DD/MM/YY HH24:MI:SS') endtime,
       round((a.actual_completion_date - a.actual_start_date)*(60*24),2) rtime,
       a.outcome_code,a.phase_code, a.completion_text
 from  APPS.fnd_concurrent_requests a,
 apps.fnd_conc_req_summary_v b
 where to_char(a.actual_completion_date,'DD/MM/YYYY') = '31/08/2005'
 --and to_char(a.actual_completion_date,'DD/MM/YYYY HH24:MI:SS') <= '05/08/2005 12:50:00'
 and a.request_id = b.REQUEST_ID
 order by endtime desc
