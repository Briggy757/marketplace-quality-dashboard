# Exemple de Rapport de Risques Qualité — Release R2025-11

## 1. Synthèse

- Release : R2025-11
- Périmètre : Amélioration du checkout, correction bugs pricing, évolutions Marketplace
- Release Quality Index : 78 / 100 → Niveau « Vigilance »

Décision proposée : **Go avec plan de mitigation**, sous surveillance renforcée sur les flux de paiement.

---

## 2. Top 5 risques qualité

| # | Risque                                                                      | Impact                            | Probabilité | Niveau | Plan d’action                                                                 | Responsable | Échéance   |
|---|-----------------------------------------------------------------------------|-----------------------------------|-------------|--------|------------------------------------------------------------------------------|-------------|-----------|
| 1 | Régressions sur le checkout CB 3DS après refonte UI                         | Perte de CA, abandon de panier   | Élevée      | Critique | Campagne TNR ciblée + tests de charge allégés sur checkout                   | QA Lead     | Avant MEP |
| 2 | Intégration Marketplace instable sur la synchro catalogue                   | Produits non disponibles en ligne | Moyenne     | Élevé  | Monitoring amélioré + rollback possible sur flux de synchro                  | Tech Lead   | J+1 MEP   |
| 3 | Taux de réouverture élevé sur les bugs pricing                              | Prix erronés en prod             | Moyenne     | Élevé  | Revues de code obligatoires + tests exploratoires pricing                    | Dev Lead    | En cours  |
| 4 | Couverture de test faible sur les devices mobiles anciens                   | Expérience dégradée sur mobile   | Faible      | Moyen  | Ajouter tests manuels exploratoires device farm                              | QA          | Sprint+1  |
| 5 | Charge projet élevée sur l’équipe QA (3 releases parallèles)                | Retard de test, baisse de qualité | Moyenne   | Élevé  | Repriorisation du backlog + réduction du périmètre de la release si nécessaire | PO / PMO  | Immédiat  |

---

## 3. Indicateurs supports

- Taux de tests passés : 92 %  
- Anomalies ouvertes : 14 (dont 2 Sev 1, 4 Sev 2)  
- Temps moyen de résolution (MTTR) : 3,5 jours  
- Taux de réouverture : 18 %  

---

## 4. Recommandations

1. Ne pas ajouter de nouvelles User Stories sur le périmètre paiement avant stabilisation.
2. Bloquer la mise en prod si une anomalie Sev 1 reste ouverte sur le checkout.
3. Planifier un bilan qualité à J+7 avec revue des anomalies prod et retours clients.

---

## 5. Historique des décisions

- Comex IT du 10/11/2025 : Accord de principe pour MEP sous conditions.
- COPIL projet du 12/11/2025 : Validation Go avec plan de mitigation sur les flux de paiement.

