/* BUSCA PELO PROGRAM SHORT NAME PARA ACHAR O NOME DO PROGRAMA QUE ESTÁ EM EXECUÇÃO */
SELECT DISTINCT fcpt.user_concurrent_program_name program,
                fcp.concurrent_program_name short_name,
                fa.application_name application
           FROM apps.fnd_application_tl fa,
                apps.fnd_concurrent_programs fcp,
                apps.fnd_concurrent_programs_tl fcpt
          WHERE fa.application_id = fcpt.application_id
            AND fcp.application_id = fcpt.application_id
            AND fcp.concurrent_program_id = fcpt.concurrent_program_id
            -- A linha abaixo localizar o complete name pelo short name
            --AND fcp.concurrent_program_name LIKE '%PAXACMPT_SINGLE%'
            -- A linha abaixo localiza o short name pelo complete name
            and fcpt.user_concurrent_program_name like 'OS - Controle de Entrega de Materiais (VISA)'
/

