# Audit complet du site — 21 avril 2026

Score global : **8.2 / 10**

---

## PRIORITAIRES (à corriger en premier)

### 1. Accessibilité — Menu hamburger (tous les fichiers HTML)
- **Gravité** : Critique
- **Fichiers** : index.html, cabinet.html, contact.html, equipe.html, traitements.html, engagements.html, ressources.html, mentions-legales.html
- **Problème** : Le bouton hamburger (menu mobile) n'a pas d'attribut `aria-label` ni `aria-expanded`. Les lecteurs d'écran ne peuvent pas l'identifier.
- **Correction** : Ajouter `aria-label="Menu" aria-expanded="false"` sur le bouton, et mettre à jour l'état avec JavaScript.

### 2. Alt text des vidéos YouTube (ressources.html)
- **Gravité** : Critique
- **Fichier** : ressources.html, ligne ~551
- **Problème** : Les 12 miniatures vidéo ont toutes `alt="Vidéo"` au lieu du titre de chaque vidéo. Mauvais pour l'accessibilité et le SEO.
- **Correction** : Utiliser le titre de la vidéo dans l'attribut alt (ex: `alt="Vidéo : C'est quoi la malocclusion"`).

### 3. Mentions légales — Sous-traitants manquants
- **Gravité** : Critique (obligation RGPD)
- **Fichier** : mentions-legales.html
- **Problème** : FormSubmit.co (qui traite les données du formulaire de contact) n'est pas mentionné comme sous-traitant.
- **Correction** : Ajouter une section "Sous-traitants" mentionnant FormSubmit.co (formulaire), Google (reCAPTCHA, Translate), GitHub Pages (hébergement).

---

## IMPORTANTS (à améliorer)

### 4. CSS dupliqué dans contact.html
- **Gravité** : Important
- **Fichier** : contact.html, lignes 23-217
- **Problème** : Plus de 200 lignes de CSS en inline dans la page, redondantes avec style.css. Alourdit la page.
- **Correction** : Déplacer le CSS spécifique au contact dans style.css et supprimer le bloc inline.

### 5. Popup fermeture — Accessibilité
- **Gravité** : Important
- **Fichiers** : Tous les fichiers HTML
- **Problème** : La popup de fermeture (closure-overlay) n'a pas d'attribut `role="dialog"` ni `aria-modal="true"`.
- **Correction** : Ajouter `role="dialog" aria-modal="true" aria-labelledby="closureTitle"` sur le div closureOverlay.

### 6. og:image manquante sur certaines pages
- **Gravité** : Important
- **Fichiers** : engagements.html, ressources.html (et potentiellement d'autres)
- **Problème** : Pas de balise `og:image`. Quand ces pages sont partagées sur Facebook/LinkedIn, aucune image d'aperçu ne s'affiche.
- **Correction** : Ajouter `<meta property="og:image" content="https://preve-orthodontiste-grenoble.fr/img/og-image.jpg">` sur chaque page.

### 7. JSON-LD uniquement sur la page d'accueil
- **Gravité** : Important (SEO)
- **Fichiers** : cabinet.html, equipe.html, traitements.html, contact.html, engagements.html, ressources.html
- **Problème** : Les données structurées (schema.org) ne sont présentes que sur index.html. Google ne comprend pas bien la nature des autres pages.
- **Correction** : Ajouter un JSON-LD adapté à chaque page (ex: MedicalBusiness pour cabinet, ContactPage pour contact).

### 8. Slideshow — DIVs au lieu de BUTTONS
- **Gravité** : Important (accessibilité)
- **Fichiers** : index.html, traitements.html
- **Problème** : Les dots du slideshow sont des `<div>` avec onclick. Ils ne sont pas navigables au clavier.
- **Correction** : Remplacer par `<button class="dot" aria-label="Slide X">`.

---

## MINEURS (recommandations)

### 9. URLs protocol-relative pour Google Translate
- **Fichiers** : Tous les fichiers HTML
- **Problème** : `src="//translate.google.com/..."` au lieu de `https://`.
- **Correction** : Remplacer par `src="https://translate.google.com/..."`.

### 10. sameAs vide dans JSON-LD
- **Fichier** : index.html
- **Problème** : Le champ `sameAs` est un tableau vide []. Il manque les profils Google Business, réseaux sociaux.
- **Correction** : Ajouter les URLs des profils (Google Business Profile, etc.).

### 11. Hébergeur incorrect dans mentions légales
- **Fichier** : mentions-legales.html
- **Problème** : L'hébergeur indiqué est "Netlify, Inc." alors que le site est maintenant sur GitHub Pages.
- **Correction** : Remplacer par "GitHub, Inc. — 88 Colin P Kelly Jr St, San Francisco, CA 94107, États-Unis".

### 12. Page Politique de Confidentialité dédiée
- **Problème** : Les informations RGPD sont dans les mentions légales. Une page dédiée serait plus claire.
- **Correction** : Créer une page confidentialite.html avec politique de confidentialité détaillée (optionnel).

### 13. Externaliser le JavaScript inline
- **Fichiers** : Tous les fichiers HTML
- **Problème** : 40+ lignes de JS inline par page (animations, menu, horaires). Duplication de code.
- **Correction** : Créer un fichier script.js commun (suggestion d'amélioration, pas urgent).

---

## CE QUI EST TRES BIEN

- Contenu professionnel, cohérent et sans fautes
- Design responsive et moderne
- SEO de base bien fait (meta, canonical, sitemap, robots.txt)
- Formulaire sécurisé (reCAPTCHA + honeypot anti-spam)
- Ressources pédagogiques riches (12 vidéos)
- Page engagements écoresponsables (différenciateur fort)
- Mentions légales et cookie consent en place
- Excellent contraste des couleurs (WCAG AAA)
- Navigation bien structurée
- CTAs clairs et bien placés
