select /*+ ALL_ROWS */
 fatl.application_name "Aplicação",
 fcptl.user_concurrent_program_name "Programa",
 round(sum((actual_start_date -
           greatest(request_date,
                     greatest(nvl(crm_release_date, requested_start_date),
                              requested_start_date)))) * 60 * 24,
       2) "Espera Total (mín.)",
 round(avg((actual_start_date -
           greatest(request_date,
                     greatest(nvl(crm_release_date, requested_start_date),
                              requested_start_date)))) * 60 * 24,
       2) "Espera Média (mín.)",
 round(min((actual_start_date -
           greatest(request_date,
                     greatest(nvl(crm_release_date, requested_start_date),
                              requested_start_date)))) * 60 * 24,
       2) "Espera Mín. (mín.)",
 round(max((actual_start_date -
           greatest(request_date,
                     greatest(nvl(crm_release_date, requested_start_date),
                              requested_start_date)))) * 60 * 24,
       2) "Espera Máx. (mín.)",
 count(*) "Vezes Executado"
  from fnd_concurrent_programs_tl fcptl,
       fnd_application_tl         fatl,
       fnd_concurrent_requests    fcr
 where fcr.phase_code = 'C'
   and fcr.actual_start_date is not null
   and fcr.concurrent_program_id = fcptl.concurrent_program_id
   and fcr.program_application_id = fcptl.application_id
   and fcptl.language = userenv('LANG')
   and (actual_start_date -
       greatest(request_date,
                 greatest(nvl(crm_release_date, requested_start_date),
                          requested_start_date))) >= 100 / (24 * 60)
   and fatl.language = userenv('LANG')
   and fcr.program_application_id = fatl.application_id
   and trunc(actual_start_date) between
       trunc(to_date('&inicial', 'YYYY-MM-DD')) and
       trunc(to_date('&final', 'YYYY-MM-DD'))
 group by fcptl.user_concurrent_program_name, fatl.application_name
 order by "Espera Total (mín.)" desc;