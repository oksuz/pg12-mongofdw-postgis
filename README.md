## Postgresql 12 & Mongo FDW & Postgis

Postgis and MongoDB FDW enabled [Official PostgreSQL 12](https://hub.docker.com/_/postgres) image

Start using with pulling from docker hub:

```
docker pull oksuz/pgsql12-mongofdw-postgis
```

Before using extensions use `CREATE EXTENSIONS` syntax:

```sql
CREATE EXTENSION mongo_fdw;
CREATE EXTENSION postgis;
```

For more details checkout following pages:

* [PostgreSQL 12 Official Image](https://hub.docker.com/_/postgres) 
* [MongoDB Fdw Repository](https://github.com/EnterpriseDB/mongo_fdw)
* [Postgis Web Page](https://postgis.net/)


## LICENSE

MIT
