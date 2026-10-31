---
name: web-performance-cwv
description: >-
  Directives et procédures d'optimisation de la performance web, du chargement mobile et des Core Web Vitals (LCP, INP, CLS) pour le site Z Nacelles. À utiliser lors de la modification du design, des polices, des images, des scripts ou de la mise en page.
---

# Skill : Performance Web & Core Web Vitals (Astro / Hostinger)

Ce skill garantit que le site Z Nacelles charge instantanément sur mobile en 4G/5G, crucial pour les artisans et chefs de chantier sur le terrain.

## 1. Principes Fondamentaux de Performance
- **Score Google PageSpeed Mobile visé** : 95-100.
- **LCP (Largest Contentful Paint)** : < 1.2s.
- **CLS (Cumulative Layout Shift)** : 0.
- **INP (Interaction to Next Paint)** : < 100ms.

## 2. Règles d'Architecture Spécifiques Hostinger
1. **Inlining CSS (`<style is:inline>`)** :
   - Sur l'hébergement Hostinger (Apache/LiteSpeed), les builds Vite éclatés (`_astro/*.css`) peuvent subir des problèmes de cache ou de chemin relatif.
   - Toujours conserver le CSS principal inline ou embarqué dans l'en-tête HTML pour éliminer tout blocage au rendu et éviter les pages blanches/non stylisées.
2. **Gestion des Polices Google Fonts** :
   - Polices utilisées : **Barlow** (titres BTP percutants) et **Inter** (corps de texte lisible).
   - Utiliser `preconnect` vers `https://fonts.googleapis.com` et `https://fonts.gstatic.com` avec `display=swap`.

## 3. Optimisation des Images & Médias
- Format universel WebP compressé avec dimensions explicites (`width` et `height`) pour éviter tout reflow (CLS=0).
- Image Hero (`camion-nacelle.webp`) : Attributs `fetchpriority="high"` et pas de `loading="lazy"`.
- Images sous la ligne de flottaison (services, carte France) : Attributs `loading="lazy"` et dimensions adaptées.

## 4. Scripts & Interactivité Ultra-légers
- Zéro framework JS lourd côté client (React/Vue non nécessaires pour cette landing page).
- Vanilla JavaScript pur (< 3 Ko) pour le menu mobile et l'accordéon FAQ.
- Soumission AJAX formulaire asynchrone avec feedback immédiat sans rechargement de page.

