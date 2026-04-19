#!/bin/bash
cd ~/Documents/Claude/Projects/site
git add .
git commit -m "Mise à jour du site"
git push origin main
echo ""
echo "✅ Site déployé avec succès ! Visible sur preve-orthodontiste-grenoble.fr dans ~15 secondes."
echo ""
read -p "Appuyez sur Entrée pour fermer..."
