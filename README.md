# Mise en oeuvre de Pro Santé Connect (PSC) avec Microsoft Entra ID

 **Ce projet en cours d'élaboration** vient compléter la documentation officielle de l'[Agence du Numérique en Santé](https://esante.gouv.fr/lagence) (ANS) relative à l'intégration de Pro Santé Connect pour le mode sans couture et la délégation à un [fournisseur d'identité local](https://industriels.esante.gouv.fr/produits-et-services/pro-sante-connect/delegation-un-fournisseur-d-identite-local). Ces fonctionnalités permettent désormais aux utilisateurs de se connecter à Pro Santé Connect en utilisant l'identité numérique fournie par leur établissement de Santé (ES) d'origine. Les travaux en cours peuvent être suivis [ici](https://industriels.esante.gouv.fr/produits-et-services/pro-sante-connect/travaux-en-cours).

 Ce projet couvre les modalités de mise en oeuvre de cette délégation avec [Microsoft Entra ID](https://www.microsoft.com/fr-fr/security/business/identity-access/microsoft-entra-id), anciennement Azure Active Directory (Azure AD). Cette mise en oeuvre est d'ores et déjà opérationnelle dans l'environnement de Bac à sable Pro Santé Connect et actuellement en cours de planification pour l'environnement de Production. Ce projet propose des guides et des ressources pour activer les fonctionnalités de délégation avec Microsoft Entra ID. Microsoft Entra ID fait partie de la [liste des fournisseurs d'identité déjà supportés par PSC](https://industriels.esante.gouv.fr/produits-et-services/pro-sante-connect/documentation-technique-idp-externe).

## A propos de Pro Santé Connect (PSC)

[Pro Santé Connect](https://esante.gouv.fr/produits-services/pro-sante-connect) (PSC) est le fédérateur d’identités des professionnels des secteurs sanitaire, médico-social et social enregistrés au Répertoire Partagé des Professionnels de Santé (RPPS). Ce service socle est proposé par l’ANS en sa qualité d’autorité compétente. 

Il leur offre une manière simple, sécurisée et unifiée de se connecter à tous leurs services numériques en santé, en pouvant passer de l’un à l’autre de manière particulièrement fluide. Ces derniers peuvent implémenter gratuitement ce service socle basé sur des technologies standardisées. PSC leur permet : 
*   Une sécurisation de l’identification électronique des professionnels, protégeant les données de santé éventuellement traitées, et leur garantissant une conformité réglementaire sur le niveau de garantie de l’identification électronique de leurs usagers professionnels. A date en dehors de la délégation, les [cartes de Professionnels de Santé](https://esante.gouv.fr/produits-services/cartes-de-professionnels-de-sante) (c.à.d. les cartes CPx) et l'[application mobile d'identification et d'accès aux Services Numériques](https://esante.gouv.fr/produits-services/e-cps) (c.à.d. la e-CPS) sont les seuls moyens d’identification électroniques (MIE) aujourd’hui pris en charge par PSC ; 
*   Un engagement de leurs utilisateurs, familiers de ce mode d’identification électronique commun à de nombreux services ;
*   De récupérer les attributs de l’identité sectorielle (profession, savoir-faire, situation d’exercice, …) pour en faire la vérification et éventuellement automatiser leur contrôle d’accès sur cette base.  

PSC a fait l’objet d’une homologation [RGS (Référentiel Général de Sécurité)](https://cyber.gouv.fr/le-referentiel-general-de-securite-rgs). 

### Le projet Pro Santé Connect sans couture

Différents retours terrains ont mis en lumière la nécessité de faire évoluer le service pour simplifier les parcours d’accès aux services connectés à Pro Santé Connect ; notamment dans les contextes des établissements de santé (ES). L’objectif du projet PSC sans couture est de proposer des mesures organisationnelles et techniques permettant de fluidifier l’accès à ces services numériques. 

Le fédérateur d’identités PSC permet la délégation de l’authentification auprès de fournisseurs d’identités (FI) tiers. Une telle mise en œuvre et les capacités nouvelles ainsi proposées constituent un premier niveau de livrable du projet PSC sans couture. Pour plus d’informations, nous invitons le lectorat à consulter le guide **Mise en œuvre Pro Santé Connect - Guide d’intégration de PSC pour le mode sans couture à destination des établissements de santé** de l’ANS.

PSC est désormais en capacité de reconnaitre et d’accepter une authentification effectuée sur un locataire Entra ID autorisé. Ce projet précise notamment les éléments de configurations techniques à apporter à un locataire EntraID permettant le respect des exigences techniques de raccordement.

## A propos de Microsoft Entra ID

Microsoft Entra ID est un service de gestion des identités et des accès basé sur le cloud. Ce service multilocataire et géo-distribué de Microsoft connecte les collaborateurs d’organisations de toutes tailles et de toutes sortes – ici les professionnels de santé (PS), le personnel administratif et de direction, et les autres personnels des établissements de santé (ES) -, le cas échéant les partenaires et utilisateurs externes de ces mêmes organisations à leurs applications, appareils et données.

Microsoft Entra ID propose ainsi :
*   Un accès adaptatif sécurisé afin de protéger l’accès aux ressources et aux données en utilisant une authentification multifacteur (MFA) et des stratégies d’accès adaptatif fondées sur le risque, sans compromettre l’expérience utilisateur (UX) ; 
*   Il peut s’agir de ressources externes ; celles-ci incluent de façon non exhaustive Microsoft 365, Microsoft Dynamics 365, le portail et les services Microsoft Azure et des milliers d’autres applications de type logiciels sous la forme de services (SaaS). Microsoft Entra ID propose également l’accès aux ressources internes, notamment les applications situées sur l’intranet d’entreprise et les applications cloud développées pour ces mêmes organisations ;
*   Des expériences utilisateur intégrées afin de proposer une expérience de connexion simple et rapide dans l’environnement multicloud des organisations qui permet à leurs utilisateurs de rester efficaces, réduit le temps qu’ils consacrent à la gestion de leurs mots de passe et accroît leur productivité ;
*   Une gestion unifiée des identités afin de centraliser la gestion des identités de l’organisation et l’accès à ses applications hébergées dans le cloud ou localement, et de gagner en visibilité et en contrôle.

Parallèlement à notre engagement à placer la sécurité au-dessus de tout par le biais de notre [initiative pour un avenir sûr (Secure Future Initiative)](https://www.microsoft.com/fr-fr/trust-center/security/secure-future-initiative), Microsoft s'engage à investir dans l'innovation en matière d'identité sécurisée et d'accès au réseau.
A ce propos, le rapport [Microsoft Digital Defense 2024](https://cdn-dynmedia-1.microsoft.com/is/content/microsoftcorp/microsoft/final/en-us/microsoft-brand/documents/Microsoft%20Digital%20Defense%20Report%202024%20%281%29.pdf) révèle plus de 600 millions d’attaques d’identité par jour. Alors que l’authentification multifacteur (MFA) permet désormais de bloquer la plupart des attaques par mot de passe, nous assistons à un changement dans les tactiques des acteurs malveillants et à une convergence des menaces étatiques et cybercriminelles. Plus de 99 % des attaques d’identité sont (encore) des attaques de mots de passe, souvent dues à des comportements humains prévisibles tels que des mots de passe faciles à deviner, la réutilisation des mots de passe et le fait d’être la proie d’attaques d’hameçonnage (phishing). C’est pourquoi une gestion complète et intégrée des identités et des accès (IAM) comme le propose Microsoft Entra doit être au cœur de la défense de toutes les organisations contre les menaces. 

Aujourd’hui, nous avons l’honneur d’annoncer que, pour la huitième année consécutive, Microsoft a été nommé leader dans le [Magic Quadrant™ 2024 de Gartner® pour la gestion des accès (IAM)](https://www.gartner.com/reprints/?id=1-2JFXRFAU&ct=241125&st=sb), se classant au premier rang de l’axe de la capacité d’exécution.

Cette reconnaissance dans le Magic Quadrant™ 2024 de Gartner® valide notre engagement à fournir à nos clients un portefeuille d’identités complet, alimenté par l’IA et automatisé, avec lafamille de produits [Microsoft Entra](https://learn.microsoft.com/fr-fr/entra/). Microsoft Entra est une solution unifiée d’identité et d’accès au réseau qui protège toute identité et sécurise l’accès à toute application ou ressource, dans n’importe quel cloud ou sur site, avec une expérience utilisateur (UX) simplifiée pour les professionnels de la sécurité.

Au-delà de [Microsoft Entra ID](https://www.microsoft.com/security/business/identity-access/microsoft-entra-id) (anciennement Azure Active Directory), Microsoft Entra inclut : 
*   [Microsoft Entra External ID](https://www.microsoft.com/security/business/identity-access/microsoft-entra-external-id) (anciennement Azure AD External Identities) ;  
*   [Microsoft Entra Identity Governance](https://www.microsoft.com/security/business/identity-access/microsoft-entra-identity-governance), un produit complet de gouvernance des identités ;  
*   [Microsoft Entra Permissions Management](https://www.microsoft.com/security/business/identity-access/microsoft-entra-permissions-management), un produit de gestion des droits relatifs à l'infrastructure dans le cloud;  
*   [Microsoft Entra Verified ID](https://www.microsoft.com/security/business/identity-access/microsoft-entra-verified-id), un produit d'identité décentralisée ;  
*   [Microsoft Entra Workload ID](https://www.microsoft.com/security/business/identity-access/microsoft-entra-workload-identities), un produit qui apporte une sécurité et une gouvernance avancées aux identités non humaines ;  
*   [Microsoft Entra Internet Access](https://www.microsoft.com/security/business/identity-access/microsoft-entra-internet-access), un produit de type SWG (Secure Web Gateway) pour une passerelle web sécurisée centrée sur l'identité ;  
*   [Microsoft Entra Private Access](https://www.microsoft.com/security/business/identity-access/microsoft-entra-private-access), un produit de type ZTNA (Zero Trust Network Access) centré sur l'identité. 

Cette solution rend la gestion des identités et des accès (IAM) plus facile que jamais afin de fournir uniquement l'accès nécessaire grâce à des autorisations adaptées, à la gestion du cycle de vie des accès et à l'accès au moindre privilège pour toutes les identités internes et externes des organisation considérées.
Vous pouvez découvrir ces différents produits dans cette série de courtes vidéos [Microsoft Mechanics](https://aka.ms/EntraSuiteMechanics).

## Disposer du socle technique nécessaire avec Microsoft Entra ID

Un socle technique minimal est nécessaire à l’intégration de PSC avec Microsoft Entra ID et pour notamment permettre le respect des exigences techniques de raccordement.

La mise en place de ce socle est optionnelle en fonction de l’existant de l’ES. Pour plus d'informations sur les prérequis technique de raccordement, voir le [socle technique minimal Microsoft Entra ID](https://github.com/microsoft/prosanteconnect/blob/main/PREREQUISITES.md). 

## Activer les fonctionnalités de délégation d'authentification avec Microsoft Entra ID

Afin de permettre l’activation des fonctionnalités de délégation d’authentification, les étapes de configurations techniques listés ci-dessous sont à réaliser et sont détaillés dans les liens proposés.

1.	Partage des informations d’identification du locataire Microsoft Entra ID de l’ES. Pour plus d'informations, voir le [Guide de configuration de Pro Santé Connect à destination des établissements de santé](https://aka.ms/psc_int_entraid) ;
2.	Configuration des moyens d'identification électroniques (MIE) autorisés. Pour plus d'informations, voir les [Moyens d’identification électronique (MIE) et la navigation sans couture à destination](./IDMEANS.md) ; 
3.	Enregistrement de l’application PSC sur le locataire Microsoft Entra ID de l’ES. [PSC bac à sable](https://wallet.bas.psc.esante.gouv.fr/login-page), le portail de gestion utilisateur Bac à sable, est utilisé à titre d'illustration. Celle-ci peut être transposée pour la Production. Pour plus d'informations, voir le [Guide de configuration de Pro Santé Connect à destination des établissements de santé](https://aka.ms/psc_int_entraid) ;
4.	Configuration des stratégies d’accès conditionnelles. Pour plus d'informations, voir le [Guide de configuration de l’accès conditionnel à destination des établissements de santé](https://aka.ms/psc_ca_entraid) et l'[Atelier compagnon de l'accès conditionnel](https://aka.ms/psc_ca2_entraid) ;
5.	Activation de la fonction sans couture pour les utilisateurs ;

## En savoir plus sur Microsoft Entra

Prévenir les attaques d’identité, garantir un accès à moindre privilège, unifier les contrôles d’accès et améliorer l’expérience des utilisateurs, qu'il s'agisse des PS, du personnel administratif et de direction, et des autres personnels d'un ES, grâce à des solutions complètes d’identité et d’accès au réseau sur site et dans les clouds.  

*	[Actualités et perspectives sur Microsoft Entra | Blog sur la sécurité Microsoft](https://www.microsoft.com/fr-fr/security/blog/products/microsoft-entra/)
*	[Blog Microsoft Entra | Communauté technologique](https://techcommunity.microsoft.com/t5/microsoft-entra-blog/bg-p/Identity) 
*	[Documentation sur Microsoft Entra | Microsoft Learn](https://learn.microsoft.com/fr-fr/entra/) 
*	[Discussions sur Microsoft Entra | Communauté Microsoft](https://techcommunity.microsoft.com/t5/microsoft-entra/bd-p/Azure-Active-Directory)

# Contribuer

Ce projet est ouvert aux contributions et aux suggestions. La plupart des contributions nécessitent que vous acceptiez un contrat de licence de contributeur (Contributor License Agreement ou CLA) déclarant que vous avez le droit de nous accorder les droits d'utilisation de votre contribution et que vous le faites effectivement. Pour plus de détails, consultez le site https://cla.opensource.microsoft.com.

Lorsque vous soumettez une demande d'extraction (Pull Request ou PR), un robot CLA déterminera automatiquement si vous devez fournir un CLA et décorera la PR de manière appropriée (par exemple, vérification de l'état, commentaire). Suivez simplement les instructions fournies par le robot. Vous n'aurez à le faire qu'une seule fois pour tous les dépôts utilisant notre CLA.

Ce projet a adopté le [Code de conduite Microsoft Open Source](https://opensource.microsoft.com/codeofconduct/).
Pour plus d'informations, voir la [FAQ sur le code de conduite](https://opensource.microsoft.com/codeofconduct/faq/) ou contacter [opencode@microsoft.com](mailto:opencode@microsoft.com) pour toute question ou commentaire supplémentaire.

# Mentions légales

Microsoft et tous les contributeurs vous accordent une licence pour ce document sous la licence [Creative Commons Attribution 4.0 International Public License](https://creativecommons.org/licenses/by/4.0/legalcode), voir le fichier [LICENSE](LICENSE), et vous accordent une licence pour tout code dans le référentiel sous la [licence MIT](https://opensource.org/licenses/MIT), voir le fichier [LICENSE-CODE](LICENSE-CODE).

Microsoft, Windows, Microsoft Azure et/ou d'autres produits et services Microsoft référencés dans le document peuvent être des marques commerciales ou des marques déposées de Microsoft aux États-Unis et/ou dans d'autres pays. La licence de ce document ne vous donne pas le droit d'utiliser les noms, logos ou marques de Microsoft. Les directives générales de Microsoft en matière de marques sont disponibles à l'adresse suivante : http://go.microsoft.com/fwlink/?LinkID=254653.

Des informations sur la protection de la vie privée sont disponibles à l'adresse suivante : https://privacy.microsoft.com/fr-fr/ 

Microsoft et tous les contributeurs se réservent tous les autres droits, que ce soit au titre de leurs droits d'auteur, de leurs brevets ou de leurs marques respectives, que ce soit de manière implicite, par préclusion ou de toute autre manière.