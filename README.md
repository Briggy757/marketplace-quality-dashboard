# marketplace-quality-dashboard
Marketplace Quality Dashboard
# Définition des KPI Qualité — Marketplace

Ce document décrit les principaux KPI utilisés pour piloter la qualité d’une Marketplace.

---

## 1. KPI Tests

### 1.1 Taux d’exécution des tests
**Définition :**  
Nombre de cas de test exécutés / nombre de cas de test planifiés.

**Objectif :**  
Mesurer l’avancement de la campagne de tests.

---

### 1.2 Taux de réussite des tests
**Définition :**  
Nombre de cas de test « Passés » / nombre de cas de test exécutés.

**Utilisation :**
- Suivi par sprint / release
- Support aux décisions Go/NoGo

---

### 1.3 Couverture des fonctionnalités critiques
**Définition :**  
% des fonctionnalités critiques pour lesquelles au moins un cas de test a été exécuté.

Exemples de fonctionnalités critiques Marketplace :
- Création de compte / Login
- Recherche produit + filtres
- Ajout au panier
- Passage de commande
- Paiement (3DS, CB, etc.)
- Intégration Marketplace (Mirakl, SAP CC, ERP…)

---

### 1.4 Taux d’automatisation
**Définition :**  
Nombre de cas de test automatisés / nombre total de cas de test.

**Intérêt :**
- Mesurer la maturité QA
- Justifier l’investissement dans l’automatisation

---

## 2. KPI Anomalies

### 2.1 Volume d’anomalies ouvertes
**Définition :**  
Nombre d’anomalies en statut « Open / In progress / Reopened ».

**Analyse utile :**
- Par sévérité
- Par composant

---

### 2.2 Temps moyen de résolution (MTTR)
**Définition :**  
Durée moyenne entre la création et la résolution d’une anomalie.

**Intérêt :**
- Mesurer la réactivité de l’équipe de dev / support
- Identifier les goulets d’étranglement

---

### 2.3 Taux de réouverture
**Définition :**  
Nombre d’anomalies réouvertes / nombre d’anomalies fermées.

**Signal :**
- Si élevé → qualité des correctifs insuffisante
- Besoin d’améliorer tests de non-régression et revues techniques

---

### 2.4 Anomalies détectées en production
**Définition :**  
Nombre d’anomalies découvertes en production sur une période donnée.

**Vue utile :**
- Par release
- Par type de fonctionnalité
- Par sévérité

---

## 3. KPI Usage & Business

### 3.1 Volume de commandes
**Définition :**  
Nombre de commandes validées sur une période (jour / semaine / mois).

### 3.2 Chiffre d’affaires (CA)
**Définition :**  
Somme du montant des commandes validées sur la période.

### 3.3 Clients les plus actifs
**Définition :**  
Top N clients par nombre de commandes et CA.

**Utilisation QA :**
- Surveiller la qualité sur les segments de clients à forte valeur.

---

## 4. KPI Synthèse : Release Quality Index

**Idée :**  
Score composite sur 100 qui agrège plusieurs dimensions :

- Taux de réussite des tests
- Nombre d’anomalies critiques ouvertes
- Taux de réouverture
- Anomalies prod détectées sur la release

Permet de donner une vue simple et communicable à la direction :
- > 85 : Release de bonne qualité
- 70–85 : Vigilance
- < 70 : Release à risque
