#!/bin/bash
# Aperçu local du site — aucun déploiement, aucun crédit consommé

SITE_DIR="$(cd "$(dirname "$0")" && pwd)"
PORT=8080

cd "$SITE_DIR"

# Arrêter un éventuel serveur déjà lancé sur ce port
lsof -ti tcp:$PORT | xargs kill -9 2>/dev/null

echo ""
echo "🔍  Lancement de l'aperçu local..."
echo "──────────────────────────────────"
echo "📂  Dossier : $SITE_DIR"
echo "🌐  Adresse : http://localhost:$PORT"
echo ""
echo "→ Fermez cette fenêtre pour arrêter le serveur."
echo ""

# Ouvrir le navigateur après 1 seconde
sleep 1 && open "http://localhost:$PORT" &

# Lancer le serveur Python
python3 -m http.server $PORT
