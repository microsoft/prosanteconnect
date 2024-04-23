# Moyens d'identification électronique (MIE) et méthodes d'authentification Microsoft Entra ID 

Le projet de Pro Santé Connect (PSC) pour le mode sans couture permet d'envisager l'utilisation de différents moyens d'identification électronique (MIE) pour une expérience de navigation sans couture. 

## Prise en charge des MIE conformes aux exigences de l’ANS dans Entra ID

Les sections suivantes proposent des informations sur la prise en charge des MIE conformes aux exigences de l'Agence du Numérique en Santé (ANS) dans [Microsoft Entra ID](https://www.microsoft.com/security/business/identity-access/microsoft-entra-id). 

### Utilisation des certificats X.509 de la carte CPx physique

Un PS peut utiliser le certificat X.509 de sa [carte de professionnel de santé](https://industriels.esante.gouv.fr/produits-services/cps-et-socle-technique/caracteristiques-de-la-cps3), ou carte CPx pour s’authentifier sur son locataire Entra ID et ainsi accéder à des services numériques connectés à PSC sans avoir besoin de se réauthentifier. 

Le POC technique raccordement cible plus spécifiquement cette utilisation.

Les éléments de configuration pour les cartes CPx physiques sont décrits dans le [Guide de configuration des cartes CPx à destination des établissements de santé](https://aka.ms/psc_mie_cpx_entraid). Nous invitons le lectorat à s’y reporter.  

### Utilisation d’une clé de sécurité FIDO2

De la même façon, un PS peut utiliser une clé de sécurité FIDO2. 

L’authentification [FIDO2](https://fidoalliance.org/) ou Fast ID Online v2.0 est un standard ouvert pour l’authentification sans mot de pass. Il permet aux PS et autres utilisateurs de se connecter à leurs appareils et applications à l’aide de l’authentification biométrique ou d’une clé de sécurité physique, sans avoir besoin d’un mot de passe traditionnel.

Le POC technique sécurisation cible plus spécifiquement cette utilisation. Dans ce cadre, la fourniture d’une clé de sécurité FIDO2 est à la charge de l’ES.

**Le POC technique et les retours terrain et métier permettront d’affiner les exigences quant à la définition d’un MIE 2FA conforme de type clé FIDO2.**

Les éléments de configuration pour les clés de sécurité FIDO2 sont décrits dans le [Guide de configuration des clés de sécurité FIDO2 à destination des établissements de santé](https://aka.ms/psc_mie_fido2_entraid). Nous invitons le lectorat à s’y reporter.  

### Utilisation de Microsoft Authenticator

L’application [Microsoft Authenticator](https://www.microsoft.com/fr-fr/security/mobile-authenticator-app) peut être utilisée dans ce contexte comme MIE 2FA conforme.

Les éléments de configuration pour Microsoft Authenticator sont décrits dans le [Guide de configuration de Microsoft Authenticator à destination des établissements de santé](https://aka.ms/psc_mie_auth_entraid). Nous invitons le lectorat à s’y reporter.  

### Utilisation de Windows Hello Entreprise

[Windows Hello Entreprise](https://learn.microsoft.com/fr-fr/windows/security/identity-protection/hello-for-business/) peut enfin être utilisé à cet effet dans ce contexte comme clé de sécurité FIDO2.

La prise en charge de FIDO2 dans Windows Hello Entreprise offre une couche supplémentaire de sécurité et de commodité pour les PS et autres utilisateurs, tout en réduisant le risque d’attaques par mot de passe.

Windows Hello Entreprise utilise une méthode d’authentification à deux facteurs qui combine des informations d’identification spécifiques à l’appareil avec un mouvement biométrique ou code PIN. Ces informations d’identification sont liées au lié au FI, ici Microsoft Entra ID ,dans le contexte de ce guide, et peuvent être utilisées pour accéder à PSC et à ses services.

Les éléments de configuration pour Windows Hello Entreprise sont décrits dans le [Guide de configuration de Windows Hello Entreprise à destination des établissements de santé](https://aka.ms/psc_mie_whe_entraid). Nous invitons le lectorat à s’y reporter.  

## Non prise en charge de la e-CPS 

L'[application mobile d'identification et d'accès aux Services Numériques e-CPS](https://esante.gouv.fr/produits-services/e-cps) n’est PAS prise en charge dans le cadre proposé. Le flux « découplé » CIBA ([Client-Initiated Backchannel Authentication](https://openid.net/specs/openid-client-initiated-backchannel-authentication-core-1_0.html)) n’est en effet PAS pris en charge par l'implémentation du [protocole OpenID Connect (OIDC) sur la plateforme d’identité Microsoft Entra ID](https://learn.microsoft.com/fr-fr/entra/identity-platform/v2-protocols-oidc).

**Il convient de noter que la e-CPS reste cependant disponible avec PSC pour réaliser l’appairage.**

## MIE et méthodes d'authentification Microsoft Entra ID

Microsoft Entra ID propose de nombreuses [méthodes d'authentification](https://learn.microsoft.com/fr-fr/entra/identity/authentication/concept-authentication-methods-manage) qui peuvent être utilisées pour l’authentification multifacteur (MFA) dans le cadre de PSC avec les MIE précédents pris en charge. Pour plus d'informations sur leur mise en oeuvre, voir la [Configuration des méthodes d’authentification pour les moyens d'identification électronique (MIE) approuvés](./AUTHMETHODS.md). 

## MIE et navigation sans couture

Il est possible de plus de tirer parti à la fois de l’authentification Microsoft Entra ID avec ces MIE et de la possibilité de jointure (hybride ou non) des appareils Windows 10 ou ultérieur avec un locataire Microsoft Entra ID pour offrir une navigation sans couture afin d’accéder à un service numérique connecté à PSC.

Ainsi, par exemple, l’ouverture de session Windows par carte à puce avec les cartes CPx physiques délivrées par l’ANS aux PS est utilisée par de (très) nombreux ES. Le projet Pro Santé Connect sans couture vise donc naturellement à capitaliser à la fois sur ce mécanisme et l’expérience utilisateur associée. 

**Pour autant, les prérequis pour cette navigation sans couture ne font pas partie du cadre minimum défini par l’ANS. Ils sont néanmoins couverts dans le cas présent.**

Pour plus d'informations, voir l'[expérience Pro Santé Connect sans couture](./SEAMLESSNAV.md). 

## Axes d’extensibilité futurs prévisibles

L’intégration courante de PSC avec Microsoft Entra ID telle que décrite dans ses modalités opérationnelles dans le cadre de cette expérimentation vise à établir une fondation technique pérenne qui pourra être étendue tant d’un point de vue fonctionnel que technique afin de répondre aux attentes exprimées par les ES et PS.   

Ainsi, l’ouverture de session et la capacité de navigation sans couture résultante pourront être étendues par la suite après qualification et validation. Ainsi, par exemple, l’ouverture de session avec Microsoft Entra ID pourra être effectuée depuis une session de terminal Windows à distance avec les fonctionnalités proposées par [Microsoft Entra Private Access](https://www.microsoft.com/security/business/identity-access/microsoft-entra-private-access), un produit de type ZTNA (Zero Trust Network Access) centré sur l'identité, pour l’intégration étendue avec les environnements existants en local.  

La version courante des différents documents n’aborde pas cette dimension et ce qu’elle suppose en termes de mise en œuvre. Nous invitons pour cela le lectorat à se reporter d’une façon générale au site de l’ANS pour une information à jour ainsi que vis-à-vis de la seconde dimension au [Guide de configuration de Microsoft Entra Private Access à destination des établissements de santé](https://aka.ms/psc_pa_entraid) pour les éléments de configuration associés et éventuels prérequis.
