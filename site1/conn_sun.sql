drop database link chittagong;

create database link chittagong
 connect to system identified by "1234"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.30.141)
		 (PORT = 1521))
       ) 
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  

---sun er pc
drop database link dhaka;

create database link dhaka
 connect to system identified by "1234"
 using '(DESCRIPTION =
       (ADDRESS_LIST =
         (ADDRESS = (PROTOCOL = TCP)
		 (HOST = 192.168.43.176)
		 (PORT = 1521))
       ) 
       (CONNECT_DATA =
         (SID = XE)
       )
     )'
;  
