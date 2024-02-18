# Gestion de Comptes Personnels

[This page in english.](README.md)

[Logiciel de gestion de comptes personnels](https://comptespersonnels.olfsoftware.fr/) pour saisir des dépenses et des recettes attachées à un compte (recueillant plusieurs écritures) et une catégories (pour faire des classements ensuite).

La saisie des comptes, des catégories et des écritures est opérationnelle, il ne vous reste plus qu'à ajouter des fonctionnalités comme :
- la modification d'une ligne dépense ou recette existante
- le changement des couleurs du programme et des boutons de saisie
- l'ajout d'un mot de passe à la base de données de production et le changement du dossier dans lequel elle est stockée
- la possibilité de créer plusieurs bases de données de saisie (donc un choix au démarrage du programme)
- des synchronisations ou partages de bases de données entre différents appareils
- pouvoir saisir des dépenses depuis un smartphone et les enregistrer ou importer dans la base stockée sur Windows, macOS ou Linux
- l'ajout de graphiques par compte, catégorie, des tableaux de récapitulation des dépenses etrecettes courantes, ...

En bref, cette version 1.x est une base de travail que vous pouvez faire évoluer. Un lien vers ici dans les remerciements ou crédits étant toujours les bienvenus.

La première version de ce logiciel a été développée lors d'une session de [codage en direct sur Twitch](https://www.twitch.tv/patrickpremartin) le [18 février 2021](https://developpeur-pascal.fr/live-stream-delphi-du-18-fevrier-2021-codage-d-un-logiciel-multiplateforme-de-gestion-de-comptes-personnels.html). [Une page VOD](https://serialstreameur.fr/poc-comptes-personnels.php) lui est consacrée sur [Serial Streameur](https://serialstreameur.fr) et plus de détails sur le fonctionnement du programme seront proposés sur [Développeur Pascal](https://developpeur-pascal.fr).

Ce dépôt de code contient un projet développé en langage Pascal Objet sous Delphi. Vous ne savez pas ce qu'est Dephi ni où le télécharger ? Vous en saurez plus [sur ce site web](https://delphi-resources.developpeur-pascal.fr/).

## Utiliser ce logiciel

Ce logiciel est disponible dans une version de production directement installable ou exécutable. Il est distribué en shareware.

Vous pouvez le télécharger et le rediffuser gratuitement à condition de ne pas en modifier le contenu (installeur, programme, fichiers annexes, ...).

[Télécharger le programme ou son installeur](DDD) (bientôt)

Si vous utilisez régulièrement ce logiciel et en êtes satisfait vous êtes invité à en acheter une licence d'utilisateur final. L'achat d'une licence vous donnera accès aux mises à jour du logiciel en plus d'activer d'évenuelles fonctionnalités optionnelles.

[Acheter une licence](FFF) (bientôt)

Vous pouvez aussi [consulter le site du logiciel](EEE) pour en savoir plus sur son fonctionnement, accéder à des vidéos et articles, connaître les différentes versions disponibles et leurs fonctionnalités, contacter le support utilisateurs...

## Installation des codes sources

Pour télécharger ce dépôt de code il est recommandé de passer par "git" mais vous pouvez aussi télécharger un ZIP directement depuis [son dépôt GitHub](https://github.com/DeveloppeurPascal/GestionComptesPersonnels).

Ce projet utilise des dépendances sous forme de sous modules. Ils seront absents du fichier ZIP. Vous devrez les télécharger à la main.

* [DeveloppeurPascal/AboutDialog-Delphi-Component](https://github.com/DeveloppeurPascal/AboutDialog-Delphi-Component) doit être installé dans le sous dossier ./lib-externes/AboutDialog-Delphi-Component subfolder.
* [DeveloppeurPascal/librairies](https://github.com/DeveloppeurPascal/librairies) doit être installé dans le sous dossier ./lib-externes/librairies subfolder.

## Version(s) alternative(s)

[Serge Girard](https://github.com/Serge-Girard) a proposé une version alternative basée sur les fonctionnalités de bases de la 1.0 montrée en stream. Elle est disponible sur [son dépôt de code](https://github.com/Serge-Girard/GestionComptesPersonnels). Il y a intégré deux thèmes (clair / sombres) et quelques fonctionnalités complémentaires.

Il a pu commenter sa version lors d'une autre session de développement proposée sur [Twitch](https://www.twitch.tv/patrickpremartin) dont la rediffusion sera prochainement mise en ligne.

Si la publication de ces dépôts de code vous a inspiré et que vous développez votre propre versions ou voulez partager un projet similaire plus ancien (dont vous avez bien entendu les droits), ajoutez "gestion-comptes-personnels" dans les mots clés de votre dépôt pour qu'ils soient liés les uns aux autres et prévenez moi pour que j'ajoute un éventuel lien ici, sur un blog ou en parle lors d'une future session de codage sur Twitch.

## Licence d'utilisation de ce dépôt de code et de son contenu

Ces codes sources sont distribués sous licence [AGPL 3.0 ou ultérieure] (https://choosealicense.com/licenses/agpl-3.0/).

Vous êtes globalement libre d'utiliser le contenu de ce dépôt de code n'importe où à condition :
* d'en faire mention dans vos projets
* de diffuser les modifications apportées aux fichiers fournis dans ce projet sous licence AGPL (en y laissant les mentions de copyright d'origine (auteur, lien vers ce dépôt, licence) obligatoirement complétées par les vôtres)
* de diffuser les codes sources de vos créations sous licence AGPL

Si cette licence ne convient pas à vos besoins vous pouvez acheter un droit d'utilisation de ce projet sous la licence [Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/) ou une licence commerciale dédiée ([contactez l'auteur](https://developpeur-pascal.fr/nous-contacter.php) pour discuter de vos besoins).

Ces codes sources sont fournis en l'état sans garantie d'aucune sorte.

Certains éléments inclus dans ce dépôt peuvent dépendre de droits d'utilisation de tiers (images, sons, ...). Ils ne sont pas réutilisables dans vos projets sauf mention contraire.

## Comment demander une nouvelle fonctionnalité, signaler un bogue ou une faille de sécurité ?

Si vous voulez une réponse du propriétaire de ce dépôt la meilleure façon de procéder pour demander une nouvelle fonctionnalité ou signaler une anomalie est d'aller sur [le dépôt de code sur GitHub](https://github.com/DeveloppeurPascal/GestionComptesPersonnels) et [d'ouvrir un ticket](https://github.com/DeveloppeurPascal/GestionComptesPersonnels/issues).

Si vous avez trouvé une faille de sécurité n'en parlez pas en public avant qu'un correctif n'ait été déployé ou soit disponible. [Contactez l'auteur du dépôt en privé](https://developpeur-pascal.fr/nous-contacter.php) pour expliquer votre trouvaille.

Vous pouvez aussi cloner ce dépôt de code et participer à ses évolutions en soumettant vos modifications si vous le désirez. Lisez les explications dans le fichier [CONTRIBUTING.md](CONTRIBUTING.md).

## Supportez ce projet et son auteur

Si vous trouvez ce dépôt de code utile et voulez le montrer, merci de faire une donation [à son auteur](https://github.com/DeveloppeurPascal). Ca aidera à maintenir le projet (codes sources et binaires).

Vous pouvez utiliser l'un de ces services :

* [GitHub Sponsors](https://github.com/sponsors/DeveloppeurPascal)
* [Liberapay](https://liberapay.com/PatrickPremartin)
* [Patreon](https://www.patreon.com/patrickpremartin)
* [Paypal](https://www.paypal.com/paypalme/patrickpremartin)

ou si vous parlez français vous pouvez [vous abonner à Zone Abo](https://zone-abo.fr/nos-abonnements.php) sur une base mensuelle ou annuelle et avoir en plus accès à de nombreuses ressources en ligne (vidéos et articles).
