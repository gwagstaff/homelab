# Naphal's Security HomeLab

Docker Structure:

1) docker-compose.yml:
   + Main lab services that should always be running
     - Database - PostGresSQL
     - ~~Remote Control - Guacamole~~
     - ~~Secret Management - VaultWarden~~ 
     - ~~Config Management - Ansible~~


Environment Files:
+ .env - holds  usernames, db names, and docker secret locations


Secrets:
+ PostgresSQL
  + db password
+ Guacamole
  + db password
  + root password