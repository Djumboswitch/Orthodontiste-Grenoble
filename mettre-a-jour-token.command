#!/bin/bash
cd ~/Documents/Claude/Projects/site

echo ""
echo "═══════════════════════════════════════════"
echo "  Mise à jour du token GitHub"
echo "═══════════════════════════════════════════"
echo ""
echo "1. Ouvre Dashlane"
echo "2. Copie ton nouveau token (celui qui commence par ghp_)"
echo "3. Colle-le ci-dessous avec Cmd+V et appuie sur Entrée"
echo ""
echo "(Le token ne s'affichera pas pendant la saisie, c'est normal — sécurité)"
echo ""
echo -n "Token : "
read -s TOKEN
echo ""
echo ""

if [[ ! "$TOKEN" =~ ^ghp_ ]]; then
    echo "❌ Erreur : le token doit commencer par 'ghp_'."
    echo "   Relance le script et réessaie."
    echo ""
    read -p "Appuyez sur Entrée pour fermer..."
    exit 1
fi

git remote set-url origin "https://${TOKEN}@github.com/Djumboswitch/Orthodontiste-Grenoble.git"

echo "✅ Token mis à jour avec succès !"
echo ""
echo "Tu peux maintenant relancer 🚀 Déployer.command depuis le bureau"
echo "pour vérifier que tout fonctionne avec le nouveau token."
echo ""
read -p "Appuyez sur Entrée pour fermer..."
