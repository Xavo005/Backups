@echo off
REM === 1. CREAR BACKUP CON PG_DUMP ===

set FECHA=%date:~-4%-%date:~3,2%-%date:~0,2%
set ARCHIVO=Respaldito_%FECHA%.backup

echo Creando backup: %ARCHIVO%
pg_dump --host localhost --port 5432 --username "postgres" --format custom --file "C:\Users\losru\OneDrive\Escritorio\Backups\%ARCHIVO%" "Chamba"

REM === 2. MOVERSE A LA CARPETA DEL REPO ===
cd /d "C:\Users\losru\OneDrive\Escritorio\Backups"

REM === 3. AGREGAR CAMBIOS A GIT ===
git add .
git commit -m "Backup automatico %FECHA%"
git push origin main

echo.
echo TODO COMPLETADO EXITOSAMENTE
pause
