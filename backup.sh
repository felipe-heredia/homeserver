#!/bin/bash

set -a && source .env && set +a

mkdir -p "$BACKUP_ROOT"

echo "--- Starting Database Backup ---"

docker exec -t immich_postgres pg_dumpall -c -U postgres > "$BACKUP_ROOT/databases/immich_dump.sql"

echo "--- Uploading to Backblaze ---"

restic backup "$BACKUP_ROOT" --tag "databases"
