/* Script que identifica o processo em LOCKS*/
SELECT   SUBSTR (a.spid, 1, 10) pid, SUBSTR (b.SID, 1, 5) SID,
         SUBSTR (b.serial#, 1, 5) ser#, SUBSTR (b.username, 1, 15) username,
         SUBSTR (TO_CHAR (b.logon_time, 'DD/MM/YYYY HH24:MI'),
                 1,
                 16
                ) data_hora,
         b.server, b.status, b.lockwait, SUBSTR (b.osuser, 1, 10) os_user,
         SUBSTR (b.machine, 1, 20) box, b.process "Processo", b.module,
         b.program program,fcr.request_id
    FROM v$session b, v$process a,apps.fnd_concurrent_requests fcr
     where b.lockwait is not null
     AND b.paddr = a.addr
     AND fcr.request_id = 79277764
   ORDER BY b.status, b.username

