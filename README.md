Dockerfile for [pg_rman](http://ossc-db.github.io/pg_rman/)
===========================================================

⚠ Before You Pull
------------------

** Use appropriate tag for corresponding postgresql version. **

For example:

```bash
# for postgres 9.6
$ docker pull mecab/pg_rman:pg-9.6

# for postgres 9.5
$ docker pull mecab/pg_rman:pg-9.5
```

Examples
--------

```bash
$ docker run --rm \
             -v /pg_data:/path/to/postgres_data_dir \
             -v /backup:/path/to/backup_dir \
             mecab/pg_rman init

$ docker run --rm \
             -v /pg_data:/path/to/postgres_data_dir \
             -v /backup:/path/to/backup_dir \
             mecab/pg_rman backup -h {hostname} -p {port} -d {dbname} \
             -U {username} -W {password} \
             --backup-mode=full --compress-data --progress

# You can use the environment variables as well.

$ docker run --rm \
             -v /pg_data:/path/to/postgres_data_dir \
             -v /backup:/path/to/backup_dir \
             -e PGHOST={hostname} \
             -e PGPORT={port} \
             -e PGDATABASE={dbname} \
             -e PGUSER={username} \
             -e PGPASSWORD={password} \
             mecab/pg_rman backup --backup-mode=full --compress-data --progress
```
