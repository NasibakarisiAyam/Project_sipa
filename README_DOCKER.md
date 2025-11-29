# Docker deployment for this project

1) Copy example env files (PowerShell):

```powershell
Copy-Item .env.example .env
Copy-Item backend\.env.example backend\.env
```

Edit `.env` and `backend/.env` to set secure database passwords. The root `.env` is used by `docker-compose` for variable substitution; `backend/.env` is mounted into the PHP container so `backend/koneksi.php` reads the DB settings.

2) Start services:

```powershell
# From project root
docker compose up -d --build
```

3) Access the app and admin tools:

- Web app: http://localhost:8080 (or the port you set in `.env` `APACHE_PORT`)
- phpMyAdmin: http://localhost:8081 — use the DB user/password from `.env`

4) Import your database schema/data:

Use phpMyAdmin or the `mysql` client to import a SQL dump into the `MYSQL_DATABASE` you configured.

5) Volumes:

- `db_data` stores MySQL data persistently
- `./uploads` on host is mounted to `/var/www/html/uploads` in container — keep/uploaded files here

Security notes:

- Change `MYSQL_ROOT_PASSWORD` and `MYSQL_PASSWORD` before exposing ports publicly.
- Consider adding HTTPS (proxy with Caddy/Traefik) for production.