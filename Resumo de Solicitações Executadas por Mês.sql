select /*+ ALL_ROWS */
       to_char(actual_start_date, 'YYYY - MM') "Ano - Mês",
       round(sum(greatest(actual_completion_date - actual_start_date,0))*60*24, 2) "Duração Total (mín.)",
       round(avg(greatest(actual_completion_date - actual_start_date,0))*60*24, 2) "Duração Média (mín.)",
       count(*) "Número de Solicitações"
  from
       fnd_concurrent_requests fcr
 where
       fcr.phase_code = 'C'
       and fcr.actual_completion_date is not null
       and actual_start_date is not null
       and trunc(actual_start_date) between trunc(to_date('&inicial', 'YYYY-MM-DD')) and trunc(to_date('&final', 'YYYY-MM-DD'))
 group by
       to_char(actual_start_date, 'YYYY - MM')
 order by
       "Ano - Mês";
