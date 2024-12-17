# Configuration des méthodes d’authentification pour les moyens d'identification électronique (MIE) approuvés 

Parallèlement à notre engagement à placer la sécurité au-dessus de tout par le biais de notre [initiative pour un avenir sûr (Secure Future Initiative)](https://www.microsoft.com/fr-fr/trust-center/security/secure-future-initiative), Microsoft s'engage à investir dans l'innovation en matière d'identité sécurisée et d'accès au réseau et en particulier afin que l’ère des mots de passe touche à sa fin. Les acteurs malveillants le savent, c’est pourquoi ils accélèrent désespérément les attaques liées aux mots de passe pendant qu’ils le peuvent encore.

Comme le révèle notre rapport [Microsoft Digital Defense 2024](https://cdn-dynmedia-1.microsoft.com/is/content/microsoftcorp/microsoft/final/en-us/microsoft-brand/documents/Microsoft%20Digital%20Defense%20Report%202024%20%281%29.pdf) publié en octobre 2024,  nous bloquons 7 000 attaques de mots de passe par seconde, soit près du double d’il y a un an. Dans le même temps, nous avons constaté une augmentation de 146 % des attaques d’hameçonnage (phishing) par adversaire d’une année sur l’autre.  

Heureusement, comme réponse à ces attaques omniprésentes, [Microsoft Entra ID](https://www.microsoft.com/security/business/identity-access/microsoft-entra-id) propose de nombreuses [méthodes d'authentification](https://learn.microsoft.com/fr-fr/entra/identity/authentication/concept-authentication-methods-manage) qui peuvent être utilisées de concert avec les moyens d'identification électronique (MIe) conformes aux exigences de l’ANS. 

Vous pouvez effectuer votre choix parmi la liste des méthodes d’authentification disponibles, en évaluant chacune d’elles sur le plan de la sécurité, de la facilité d’utilisation et de la disponibilité. Ces différentes méthodes décrites dans le guide [Planifier un déploiement d'authentification multifacteur Microsoft Entra](https://learn.microsoft.com/fr-fr/entra/identity/authentication/howto-mfa-getstarted) peuvent être ainsi utilisées pour une authentification multifacteur (MFA) resistante à l'hameçonage (phishing) des professionnels de santé (PS) et autres utilisateurs de PSC.

A ce propos, l’ES doit s’assurer que ces méthodes correspondent à des MIE autorisés et dûment configurés afin de permettre l’accès transparent à PSC et ses services.

L’ES aura à cible la charge de faire homologuer si nécessaire les MIE qu’il souhaite déployer et de leur compatibilité avec Microsoft Entra ID et les méthodes d’authentification proposées.

Afin de gérer les moyens d’authentifications autorisés pour les PS :
1.	Depuis un navigateur, aller sur le Centre d’administration Microsoft Entra à l’adresse Internet https://entra.microsoft.com, puis sur la vue d’ensemble Identité de Microsoft Entra ID. L’adresse https://entra.microsoft.com/#view/Microsoft_AAD_IAM/TenantOverview.ReactView peut être utilisée pour un accès direct.
2.	Se diriger dans l’onglet **Protection** > **Méthodes d’authentification** > **Points forts d’authentification**.

Cette page permet de configurer les différents moyens d’authentification du projet Pro Santé Connect sans couture à intégrer.
  
C’est l’objet des guides suivants :
* [Guide de configuration des cartes CPx à destination des établissements de santé](https://aka.ms/psc_mie_cpx_entraid) ;
* [Guide de configuration des clés de sécurité FIDO2 à destination des établissements de santé](https://aka.ms/psc_mie_fido2_entraid) ;
* [Guide de configuration de Microsoft Authenticator et des clés d'accès à destination des établissements de santé](https://aka.ms/psc_mie_auth_entraid) ;
* [Guide de configuration de Windows Hello Entreprise à destination des établissements de santé](https://aka.ms/psc_mie_whe_entraid).

Nous invitons le lectorat à s’y reporter.
