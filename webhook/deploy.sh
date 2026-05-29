#!/bin/bash

# Prehod v mapo projekta (nujno, če webhook vsebnik ne ve, kje je compose)
cd /app

echo "--- Začetek posodobitve ---"

# 1. Poteži najnovejše slike iz Docker Hub-a
# (Ker ste v GitHub Actions nastavili push, bodo nove slike na Docker Hubu)
docker-compose pull web

# 2. Ponovno zaženi samo 'web' storitev
# --no-deps zagotavlja, da ne restartamo baze podatkov ali drugih servisov brez potrebe
docker-compose up -d --no-deps web

# 3. Počisti "dangling" slike, da ne zasedejo vsega prostora na disku
docker image prune -f

echo "--- Posodobitev končana ---"