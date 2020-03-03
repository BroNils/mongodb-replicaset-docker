# mongodb-replicaset-docker
Setup MongoDB in Docker Container With Replicaset

# How to
Before doing step below, please configure your username or password by edit file named `docker-compose.yml` and `./setup/setup.sh`

1. Compose first with `docker-compose build` or you can use `docker-compose up` for build & run.
2. When compose done, connect to your primary container by using this `docker-compose exec mongo-rs0-1 mongo -u "root" -p "root"`.
3. And when mongo shell popup, you need to check is it primary or secondary by `db.isMaster()`.
   - (a). You got some returned value, check the object value called by `"ismaster" : true` or `"primary" : "mongo-rs0-1:27017"`.
   - (b). When it's in primary cluster, continue to step 4. When it's not, continue to 3b.
   - (<zero-width space>c). To make your current cluster become primary, execute command below (one by one)
      - `cfg = rs.conf();`
      - `cfg.members[0].priority = 2;`
      - `rs.reconfig(cfg);`
   - (d). Now check the cluster state again, is it primary or not?
4. Create or Add user to your admin database by using this `db.createUser({user: "admin",pwd: "admin",roles: [ { role: "userAdminAnyDatabase", db: "admin" },  { "role" : "clusterAdmin", "db" : "admin" } ]});`
5. Now you're done :D
