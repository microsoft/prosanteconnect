# Socle technique minimal pour la mise en oeuvre de PSC avec Microsoft Entra ID

Un socle technique minimal est nécessaire à l’intégration de PSC Microsoft Entra ID en termes de prérequis technique de raccordement. Pour mémoire, [Azure Active Directory (Azure AD) est devenu Microsoft Entra ID](https://techcommunity.microsoft.com/t5/microsoft-entra-azure-ad-blog/azure-ad-is-becoming-microsoft-entra-id/ba-p/2520436). Il s’agit du produit fondamental de la famille de produits Microsoft Entra.

La mise en place de ce socle est optionnelle en fonction de l’existant de l’ES. Il s'agit pour l'ES de s'assurer que les éléments suivants sont en place avant de procéder aux étapes de raccordement :
*   Disposer d’un locataire Microsoft Entra ID configuré en fonction de son existant, avec par exemple une synchronisation d’annuaire, et respectant les exigences de sécurité du référentiel d’exigence PSC sans couture ;
*   Avoir déployé et configuré un ou plusieurs moyens d'identification électronique (MIE) conformes avec les exigences établies.

Les éléments décrits ci-après pour le volet Microsoft Entra ID ne soustraient pas l’ES à la responsabilité qu’il a de s’assurer des bonnes pratiques de sécurité quant à l’administration et la maintenance qu’il opère et dont il a la resposanbilité sur son locataire Entra ID. Comme indiqué par l'ANS, l’ES est responsable du respect des exigences liés aux usages de fédération d’identité avec PSC et doit s’assurer de la bonne configuration et bonne gestion de son locataire Entra ID.

Le volet MIE est couvert dans le [Guide de configuration des moyens d’identification électronique (MIE) et de la navigation sans couture à destination des établissements de santé](https://aka.ms/psc_mie_entraid) proposé dans le cadre de ce projet.

##	Création d’un locataire Microsoft Entra ID  

Un locataire est une instance Microsoft Entra ID regroupant un ensemble d’utilisateurs d’une même organisation. A l’aide de Microsoft Entra External ID (anciennement Azure Active Directory External Identities), des utilisateurs externes à l’organisation, des utilisateurs d’organisations partenaires et/ou des utilisateurs individuels, peuvent être également référencés de façon à leur permettre de collaborer ou d’accéder à certains services numériques proposés. 

Le locataire porte la gestion des stratégies d’authentification et la gestion de l’accès aux ressources (stratégie d’accès).

**Prérequis :** La mise en place de l’environnement cible suppose pour l’ES l’existence d’au moins un locataire Microsoft Entra ID fonctionnel avec des licences Microsoft Entra ID P1, P2 ou des licences d’essai activées :
*   Microsoft Entra ID P1 est nécessaire pour définir des stratégies d’accès conditionnel comme couvert dans le cadre de ce projet. Cette licence est déjà disponible pour le Secteur Public ;
*   Microsoft Entra ID P2 est également nécessaire pour inclure le risque Identity Protection dans les stratégies d’accès conditionnel. Cette capacité n’est pas couverte dans la version courante de ce projet.

Si nécessaire, créer un locataire gratuitement : https://azure.microsoft.com/free/?WT.mc_id=A261C142F.

## Déclaration des comptes des PS dans Microsoft Entra ID

Dans le cadre de la mise en oeuvre technique, l’identification d’un point de contact au sein de l’ES et des tous premiers utilisateurs est nécessaire.

Pour l'activation de la fonction sans couture pour les utilisateurs, il est recommandé d’expérimenter le comportement sur dans l’ES au sein d’un sous ensemble d’utilisateurs sélectionnés afin de limiter de potentielles perturbation et donc l’identification plus largement de la population de test est nécessaire. 

Il s’agit donc également le cas échéant de créer pour la circonstance de nouveaux utilisateurs et groupes dans le locataire de l’ES prévu à cet effet.

### Création de nouveaux utilisateurs et groupes dans Microsoft Entra ID

Des comptes utilisateur doivent être disponibles pour les PS futurs bénéficiaires de l’intégration entre PSC et Microsoft Entra ID.

**Prérequis :** Des utilisateurs test (non-administrateur) pour les PS permettent de vérifier que les éléments d’intégration décrits dans le présent document sont opérationnels et que les stratégies d’accès conditionnels envisagées dans ce contexte fonctionnent comme prévu avant le déploiement vers des utilisateurs réels, ici des PS. 

Si des utilisateurs test doivent être créés, consulter : https://learn.microsoft.com/fr-fr/entra/fundamentals/add-users.

L’utilisateur d’un groupe dont l’utilisateur non-administrateur est membre est vivement conseillée. Si un tel groupe doit être créé, consulter : https://learn.microsoft.com/fr-fr/entra/fundamentals/how-to-manage-groups.

**Recommandation :** Nous préconisons de limiter les premiers tests aux équipes techniques de la DSI de l’ES et à un faible nombre de PS pour recueillir des retours terrain et métier sur les cinématiques et l’expérience utilisateur (UX).

### Synchronisation d’annuaire avec un environnement Active Directory existant

De nombreuses organisations disposent d’une infrastructure hybride qui englobe les composants locaux et cloud. La synchronisation des identités des utilisateurs entre les annuaires locaux et dans le cloud permet aux utilisateurs d’accéder aux ressources avec un ensemble unique d’informations d’identification.

La synchronisation d'annuaire permet de synchroniser les données d'identité d’environnements Active Directory (AD) sur site existante avec Microsoft Entra ID.

Microsoft met à disposition pour cela l'application Microsoft Entra Connect ainsi que la synchronisation cloud Microsoft Entra Connect pour aider les organisations à atteindre leurs objectifs d'identité hybride en matière de synchronisation des utilisateurs, des groupes et des contacts avec Microsoft Entra ID. La synchronisation cloud Microsoft Entra Connect utilise l'agent de provisionnement cloud Microsoft Entra au lieu de l'application Microsoft Entra Connect.

La mise en place de la synchronisation dépasse le cadre et les objectifs du POC techniques. 

Pour plus d'informations, voir les articles suivants de la documentation sur Microsoft Learn : 
*   [Microsoft Entra Connect](https://learn.microsoft.com/fr-fr/entra/architecture/sync-directory) ;
*   [Synchronisation cloud Microsoft Entra Connect](https://learn.microsoft.com/fr-fr/entra/identity/hybrid/cloud-sync/what-is-cloud-sync).

## Jointure des appareils Windows avec Microsoft Entra ID

Un appareil joint à Microsoft Entra ID permet d’offrir une navigation sans couture dès l’ouverture de session. Les prérequis pour la mise en place de ces éléments ne font pas partie du cadre minimum défini par l’ANS mais sont partagés dans le cadre de ce projet au travers du [Guide de configuration des moyens d’identification électronique (MIE) et de la navigation sans couture à destination des établissements de santé](https://aka.ms/psc_mie_entraid). 

Un appareil joint à Microsoft Entra ID permet en outre de bénéficier de stratégies d'accès conditionnel prenant en compte l'identité de l'appareil. En utilisant les informations sur les appareils, il est ainsi possible de mettre en place des contrôles pour toujours vérifier l'identité de l'utilisateur et de l’appareil. Ceci permet de réduire les risques liés aux sessions utilisateurs et s'inscrit dans les principes de Zero Trust qui prône notamment une vérification constante. 

Les appareils Windows 10 ou ultérieurs sont pris en charge pour l’intégration de PSC avec Microsoft Entra ID. Il existe deux types principaux de jointure d'un appareil Windows à Microsoft Entra ID :  
1.	**Jointure hybride Microsoft Entra** : Avec un environnement Active Directory (AD) local, les appareils liés à un  domaine Active Directory Domain Services (AD DS) peuvent être également joints à Microsoft Entra ID en effectuant une jointure hybride Microsoft Entra.  Les ES disposant d'Active Directory en local peuvent bénéficier de certaines des fonctionnalités fournies par Microsoft Entra ID en mettant en œuvre cette méthode. Des tels appareils sont joints à l’Active Directory local de l’ES et enregistrés avec Microsoft Entra ID ;
2.	**Jonction Microsoft Entra** : Cette méthode est utilisée pour joindre directement des appareils à Microsoft Entra ID sans passer par un domaine AD DS local. C'est généralement la manière recommandée pour les nouveaux appareils qui permet de bénéficier de toutes les fonctionnalités d’Entra ID, comme une mise en œuvre simplifiée de Windows Hello Entreprise sans avoir besoin de connectivité vers un contrôleur de domaine par exemple. 

**Prérequis :** 
*   Les versions Windows suivantes des appareils Windows 10 ou ultérieurs sont prises en charge pour l’intégration de PSC avec Microsoft Entra ID : Windows 10 20H1 et ultérieures,Windows 11 21H2+ et ultérieures, et Windows Server 2019 et ultérieures.
*   Les éditions Professionnel, Education ou Entreprise des appareils Windows 10 ou ultérieures sont prises en charge. Les éditions Windows Home ne prennent pas en charge la jointure Entra ID ;
*   L’appareil Windows 10 ou ultérieur doit être connecté à Internet pour finaliser la jointure à Microsoft Entra ID ;
*   Les utilisateurs de Windows 11 peuvent joindre de nouveaux appareils Windows à Microsoft Entra ID lors de la [première expérience prête à l’emploi](https://learn.microsoft.com/fr-fr/windows-hardware/customize/desktop/customize-oobe-in-windows-11) (Out of Box Experience (OOBE). 

Pour plus d'informations, voir les articles suivants de la documentation sur Microsoft Learn : 
*   [Planifier le déploiement de votre appareil Microsoft Entra](https://learn.microsoft.com/fr-FR/entra/identity/devices/plan-device-deployment) ;
*   [Rejoindre un nouvel appareil Windows pendant l'expérience prête à l'emploi](https://learn.microsoft.com/fr-fr/entra/identity/devices/device-join-out-of-box) ;
*   [Appareils hybrides joints Microsoft Entra](https://learn.microsoft.com/fr-fr/entra/identity/devices/concept-hybrid-join) ;
*   [Stratégie d’accès conditionnel commune, exiger un appareil conforme, un appareil avec jointure hybride Microsoft Entra ou une authentification multifacteur pour tous les utilisateurs](https://learn.microsoft.com/fr-fr/entra/identity/conditional-access/howto-conditional-access-policy-compliant-device).