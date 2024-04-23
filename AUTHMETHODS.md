# Configuration des méthodes d’authentification pour les moyens d'identification électronique (MIE) approuvés 

[Microsoft Entra ID](https://www.microsoft.com/security/business/identity-access/microsoft-entra-id) propose de nombreuses [méthodes d'authentification](https://learn.microsoft.com/fr-fr/entra/identity/authentication/concept-authentication-methods-manage) qui peuvent être utilisées de concert avec les moyens d'identification électronique (MIe) conformes aux exigences de l’ANS. 

Vous pouvez effectuer votre choix parmi la liste des méthodes d’authentification disponibles, en évaluant chacune d’elles sur le plan de la sécurité, de la facilité d’utilisation et de la disponibilité. Ces différentes méthodes décrites dans le guide [Planifier un déploiement d'authentification multifacteur Microsoft Entra](https://learn.microsoft.com/fr-fr/entra/identity/authentication/howto-mfa-getstarted) peuvent être ainsi utilisées pour l’authentification multifacteur (MFA) des professionnels de santé (PS) et autres utilisateurs de PSC.

A ce propos, l’ES doit s’assurer que ces méthodes correspondent à des MIE autorisés et dûment configurés afin de permettre l’accès transparent à PSC et ses services.

L’ES aura à cible la charge de faire homologuer si nécessaire les MIE qu’il souhaite déployer et de leur compatibilité avec Microsoft Entra ID et les méthodes d’authentification proposées.

Afin de gérer les moyens d’authentifications autorisés pour les PS :
1.	Depuis un navigateur, aller sur le Centre d’administration Microsoft Entra à l’adresse Internet https://entra.microsoft.com, puis sur la vue d’ensemble Identité de Microsoft Entra ID. L’adresse https://entra.microsoft.com/#view/Microsoft_AAD_IAM/TenantOverview.ReactView peut être utilisée pour un accès direct.
2.	Se diriger dans l’onglet **Protection** > **Méthodes d’authentification** > **Stratégies**.

Cette page permet de configurer les différents moyens d’authentification du projet Pro Santé Connect sans couture à intégrer dans le cadre des POC technique raccordement vs. sécurisation
  
C’est l’objet des guides suivants :
* [Guide de configuration des cartes CPx à destination des établissements de santé](https://aka.ms/psc_mie_cpx_entraid) ;
* [Guide de configuration des clés de sécurité FIDO2 à destination des établissements de santé](https://aka.ms/psc_mie_fido2_entraid) ;
* [Guide de configuration de Microsoft Authenticator à destination des établissements de santé](https://aka.ms/psc_mie_auth_entraid) ;
* [Guide de configuration de Windows Hello Entreprise à destination des établissements de santé](https://aka.ms/psc_mie_whe_entraid).

Nous invitons le lectorat à s’y reporter.
