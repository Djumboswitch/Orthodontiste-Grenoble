# Website

Dépôt de code rattaché au chantier **Cabinet - Site web** sur Claude.ai.

## Architecture globale

Le cabinet d'orthodontie du Dr Prévé organise ses chantiers transverses
dans Claude.ai (Projects), qui sert de poste de pilotage : contexte
fonctionnel, prestataires, procédures, communications, décisions.

Les dépôts de code Claude Code (dont celui-ci) sont les outils
techniques rattachés à ces chantiers. Ils contiennent uniquement le
code et la documentation technique.

Projets Claude.ai actifs :
- Cabinet - Communication
- Cabinet - Comptabilité
- Cabinet - Juridique
- Cabinet - Maintenance
- Cabinet - Organisation
- Cabinet - Site web
- Cabinet - Stock & Commandes
- Cabinet - Outils Photos / 3D

## Rattachement

Ce dépôt est rattaché à : **Cabinet - Site web**

Pour toute question fonctionnelle (périmètre, contraintes métier,
décisions, contexte utilisateur), se référer au projet Claude.ai
correspondant. Ce CLAUDE.md couvre uniquement la partie technique.

## Périmètre technique

Site vitrine statique du Cabinet d'Orthodontie des Docteurs PRÉVÉ
(Grenoble), hébergé sur GitHub Pages avec domaine personnalisé
`preve-orthodontiste-grenoble.fr` (HTTPS via certificat Let's Encrypt
fourni par GitHub).

Pages publiques (8) :
- `index.html` — accueil
- `cabinet.html` — présentation du cabinet
- `equipe.html` — équipe soignante
- `traitements.html` — types de traitements proposés
- `engagements.html` — engagements environnementaux et qualité
- `ressources.html` — ressources patients
- `contact.html` — formulaire de contact + coordonnées
- `mentions-legales.html` — mentions légales

Fonctionnalités côté client :
- Formulaire de contact via **FormSubmit.co** (action vers
  `contact@orthopreve.com`) avec **Google reCAPTCHA v2**
- Protection anti-double-soumission en 3 couches via `localStorage`
  (désactivation immédiate du bouton, verrou « en cours » 2 min,
  cooldown post-succès 30 min)
- SEO : `sitemap.xml`, `robots.txt`, balises `canonical`, Open Graph,
  JSON-LD `Dentist`/`Schema.org`, fichiers de vérification Google
  Search Console
- PWA légère : `site.webmanifest` + favicons
- Données de fermetures du cabinet dans `fermetures.json`

Domaine secondaire `orthodontiste-grenoble.fr` : redirection 301 vers
le domaine principal, gérée via un **dépôt séparé** `site-redirect/`
(GitHub Pages indépendant, sa propre CNAME). Ne pas fusionner les deux
dépôts (GitHub Pages = un seul domaine personnalisé par repo).

## Stack

- **HTML5 / CSS3 / JavaScript vanilla** — aucun framework, aucun build
- **Pas de bundler / pas de package.json** — fichiers servis tels quels
- **GitHub Pages** — hébergement, domaine via fichier `CNAME`
- **FormSubmit.co** — backend du formulaire (pas de serveur custom)
- **Google reCAPTCHA v2** — anti-spam formulaire
- **Python `http.server`** — serveur de développement local

## Structure du dépôt

```
site/
├── CNAME                          # Domaine GitHub Pages (preve-orthodontiste-grenoble.fr)
├── index.html                     # Accueil
├── cabinet.html
├── equipe.html
├── traitements.html
├── engagements.html
├── ressources.html
├── contact.html                   # Formulaire FormSubmit + reCAPTCHA + anti-doublons
├── mentions-legales.html
├── style.css                      # Feuille de style unique
├── fermetures.json                # Dates de fermeture du cabinet
├── sitemap.xml
├── robots.txt
├── favicon.ico
├── site.webmanifest
├── google*.html                   # Vérification Google Search Console
├── img/                           # 57 fichiers (photos, logos, drapeaux, etc.)
├── À mettre en place/             # Sources / idées en attente d'intégration
│   ├── Idées pour le site.docx
│   ├── Translation Cabinet Webpages.docx
│   ├── Nos mesures pour l'environnement.pdf
│   └── Balises.png
├── À corriger/
│   └── Audit du site — 21 avril 2026.md
├── 🚀 Déployer.command            # Script macOS : git add/commit/push
├── 🔍 Aperçu local.command        # Script macOS : serveur local port 8080
└── mettre-a-jour-token.command    # Script macOS : rotation du PAT GitHub
```

Dépôt jumeau (hors de cette arborescence) :
`~/Documents/Claude/Projects/site-redirect/` — gère la redirection
HTTPS de `orthodontiste-grenoble.fr` vers le domaine principal.

## Commandes utiles

### Aperçu local (sans déploiement)

```bash
./🔍\ Aperçu\ local.command
```
Lance un serveur Python sur `http://localhost:8080` et ouvre le
navigateur. Tue automatiquement tout serveur déjà actif sur le port.

Équivalent manuel :
```bash
python3 -m http.server 8080
```

### Déploiement en production

```bash
./🚀\ Déployer.command
```
Effectue `git add . && git commit -m "Mise à jour du site" && git push origin main`.
Le site est visible sur `preve-orthodontiste-grenoble.fr` ~15 secondes
après le push (build GitHub Pages).

Équivalent manuel :
```bash
git add .
git commit -m "Mise à jour du site"
git push origin main
```

### Rotation du token GitHub (PAT)

```bash
./mettre-a-jour-token.command
```
À utiliser quand le Personal Access Token GitHub expire. Le nouveau
token (récupéré dans Dashlane, format `ghp_...`) est injecté dans
l'URL du remote `origin`.

### Vérifications DNS / HTTPS (debug)

```bash
dig +short preve-orthodontiste-grenoble.fr
dig +short @8.8.8.8 preve-orthodontiste-grenoble.fr
curl -sI https://preve-orthodontiste-grenoble.fr/
```

## Conventions

- Communication : français, ton professionnel, signature Dr Prévé
  pour tout contenu utilisateur (emails, messages, interfaces)
- Code : commentaires en français acceptés, noms de variables en anglais
- Commits : messages clairs en français, format conventionnel si déjà
  en place dans le dépôt
- Déploiement : passer par `🚀 Déployer.command` côté Dr Prévé pour
  garder le message de commit homogène (`Mise à jour du site`)
- Ne jamais exposer le PAT GitHub dans un fichier versionné
  (il vit uniquement dans l'URL du remote local et dans Dashlane)
- Tester en local avec `🔍 Aperçu local.command` avant tout
  déploiement — GitHub Pages n'a pas d'environnement de staging
