#!/bin/bash
cd ~/Desktop/site
git add .
git commit -m "Mise à jour du site"
git push origin main
echo ""
echo "✅ Site déployé avec succès ! Visible sur orthodontiste-grenoble.fr dans ~15 secondes."
echo ""
read -p "Appuyez sur Entrée pour fermer..."
