# Marketplace Quality Dashboard — Exemple de structure

Ce document décrit la structure d’un tableau de bord qualité pour une Marketplace
e-commerce (site + Marketplace + ERP).

---

## 1. Vue globale (Release Overview)

**Objectif :** donner en un coup d’œil le niveau de qualité de la dernière release.

KPI proposés :
- Taux de tests passés (TNR / campagne de recette)
- Nombre total d’anomalies ouvertes vs fermées
- Nombre d’anomalies critiques (Sev 1 / Sev 2)
- Release Quality Index (score composite, ex : /100)
- Volume de commandes sur les 7 derniers jours vs N-1

Visuels possibles :
- Gauge ou score (Release Quality Index)
- Barres : anomalies par sévérité
- Ligne : commandes / jour, J-7 vs J-7 N-1

---

## 2. Vue Tests & Couverture

**Objectif :** piloter la qualité de la recette et la couverture fonctionnelle.

KPI :
- Nombre de cas de test planifiés vs exécutés
- Taux de réussite des tests par sprint / par release
- Couverture des fonctionnalités critiques (paiement, login, panier, catalogue…)
- Taux de tests automatisés vs manuels

Visuels :
- Barres empilées : Passé / Echoué / Bloqué par sprint
- Heatmap : couverture par domaine fonctionnel (Payments, Orders, Catalog, Search…)

---

## 3. Vue Anomalies & Stabilité

**Objectif :** suivre la santé du système du point de vue bugs.

KPI :
- Nombre d’anomalies ouvertes (par sévérité, par composant)
- Temps moyen de résolution (MTTR)
- Taux de réouverture
- Nombre d’anomalies détectées en production vs recette

Visuels :
- Ligne : anomalies créées vs résolues par semaine
- Pie chart : répartition par sévérité
- Barres : anomalies par composant (Checkout, Account, Pricing, Catalog…)

---

## 4. Vue Usage & Impact Business

**Objectif :** connecter la qualité technique à l’impact business.

KPI :
- Volume de commandes / mois
- CA / mois
- Taux de conversion (visites → commandes) si données disponibles
- Top clients « actifs » (par commandes et CA)
- Pages / fonctionnalités les plus utilisées

Visuels :
- Ligne : CA par mois
- Barres : top 10 clients par CA
- Table : top 10 produits / catégories par volume

---

## 5. Vue Risques & Actions

**Objectif :** préparer les comités de pilotage et décisions Go / No Go.

Contenus :
- Top 5 risques qualité identifiés
- Actions correctives / préventives
- Décisions à prendre (arbitrages, priorisation, budget)
- Synthèse : « Ce qu’il faut surveiller sur la prochaine release »

Visuels :
- Simple table « Risque / Impact / Probabilité / Plan d’action / Responsable / Due date »

---
