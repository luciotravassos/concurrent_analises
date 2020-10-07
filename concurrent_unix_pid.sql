/* PROCURA O PID NO SO UNIX - VERSÃO EM TESTE*/
SELECT DISTINCT fvp.pid PID,
                fvp.spid c2,
                vp.spid SPID,
                fcr.request_id REQUEST_ID,
                SUBSTR(fu.user_name, 0, 10) USER_NAME,
                SUBSTR(TO_CHAR(actual_start_date, 'DD-MON-YY HH24:MI'),
                       0,
                       15) c6,
                SUBSTR(concurrent_program_name, 0, 15) PROGRAM_NAME
  FROM apps.fnd_concurrent_requests fcr,
       apps.fnd_concurrent_programs fcp,
       apps.fnd_logins              fl1,
       apps.fnd_logins              fl2,
       apps.fnd_user                fu,
       apps.fnd_v$process           fvp,
       v$process                    vp
 WHERE fl1.login_id = fcr.conc_login_id
   AND fcr.program_application_id = fcp.application_id
   AND fcr.concurrent_program_id = fcp.concurrent_program_id
   AND fl1.submitted_login_id = fl2.login_id
   AND fu.user_id = fl1.user_id
      --AND fcr.phase_code = 'R'
   AND fcr.request_id = 5811330
   AND fvp.pid(+) = fl2.pid
   AND vp.pid(+) = fl2.pid;