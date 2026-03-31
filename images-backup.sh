#!/bin/bash

set -a && source .env && set +a

echo "--- Starting Library Backup ---"

restic backup --verbose "$IMMICH_LIBRARY" \
	--exclude="encoded-video" \
	--exclude="thumbs" \
	--exclude="backups" \
	--tag "immich-library"
