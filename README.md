# Icinga2 Docker Container

Contains Icinga 2 and Icinga Web 2. Requires an external Postgres database server.

## Setup

You must provide a Postgres server with two databases and user accounts to access them. See the
environment section for details on how to set those.

On first run the container will initialize all of the configuration files if they don't already
appear to be set up.

## Environment

You can configure the database access via environment variables. These are only used on the first
run.

* `POSTGRES_HOST`: Defaults to `postgres`.
* `POSTGRES_PORT`: Defaults to `5432`
* `ICINGA_DB`: Defaults to `icinga`
* `ICINGA_DB_USER`: Defaults to `icinga`
* `ICINGA_DB_PASS`: Defaults to `icinga`
* `ICINGAWEB_DB`: Defaults to `icinga-web`
* `ICINGAWEB_DB_USER`: Defaults to `icinga`
* `ICINGAWEB_DB_PASS`: Defaults to `icinga`
* `DIRECTOR_DB`: Defaults to `icinga-director`
* `DIRECTOR_DB_USER`: Defaults to `icinga`
* `DIRECTOR_DB_PASS`: Defaults to `icinga`
* `ADMIN_USER`: Defaults to `admin`
* `ADMIN_PASS`: Defaults to `admin`
