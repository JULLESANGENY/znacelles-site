---
name: znacelles-ops
description: >-
  Runbook de build, synchronisation et déploiement continu pour le site Z Nacelles. À utiliser lors de toute modification de contenu ou de code pour assurer le build Astro, la synchronisation HTML et le push vers les deux remotes Git connectés à Hostinger.
---

# Skill : Exploitation & Déploiement Z Nacelles

Ce skill détaille les procédures strictes pour maintenir et déployer le site sans interruption de service ni désynchronisation avec Hostinger.

## 1. Contraintes Métier Immuables
- **Hauteur de travail** : Toujours mentionner **47 mètres** (`Jusqu'à 47 mètres`) pour le porteur MAN.
- **Opérateur CACES®** : Formule clé en main avec chauffeur CACES® R486 (1B & 3B) systématiquement inclus.
- **Caution** : Ne jamais réintroduire de mention de caution (non demandée par le client).
- **Formulaire de contact** :
  - Destination : `https://formsubmit.co/ajax/z.nacelles@gmail.com`
  - Méthode : AJAX via `fetch()` avec headers JSON et gestion propre du feedback de succès.

## 2. Procédure de Synchronisation des Fichiers HTML
Hostinger sert les fichiers statiques depuis la racine ou le sous-dossier `znacelles/`. Il est obligatoire de synchroniser :
1. Fichier source : `src/pages/index.astro`
2. Exécuter le build : `npm run build`
3. Copier le résultat généré :
   ```bash
   cp dist/index.html ./index.html
   cp dist/index.html ./znacelles/index.html
   ```

## 3. Déploiement Dual-Remote Git
Le projet est connecté à deux dépôts distants sur GitHub :
- `origin` : `https://github.com/JULLESANGENY/Site-Nacelle.git`
- `repo-znacelles-site` : `https://github.com/JULLESANGENY/znacelles-site.git` (relié au webhook Hostinger)

Commandes de déploiement sécurisé :
```bash
git add -A
git commit -m "type(scope): description claire"
git push origin main
git push repo-znacelles-site main:main
```

## 4. Vérification Post-Déploiement
Toujours valider le déploiement réel sur le site en production :
```bash
curl -sL -A "Mozilla/5.0" "https://www.znacelles.fr/?cb=$(date +%s)" | grep -o -E ".{0,40}47 mètres.{0,40}"
```

