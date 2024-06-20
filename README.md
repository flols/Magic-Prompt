# My Magic Prompt

## Description
My Magic Prompt est un script Bash interactif offrant une variété de fonctionnalités utiles pour la gestion des fichiers et des dossiers, l'accès aux informations système, l'envoi de mails, et bien plus encore.

## Installation

### Prérequis
- Bash
- WSL (Windows Subsystem for Linux) sous Windows 10 ou 11
- Utilitaires `curl` et `mailutils`

### Utilisation
Pour démarrer le prompt, exécutez le script main.sh :

```bash
    ./main.sh
```

Vous serez invité à entrer un login et un mot de passe. Par défaut, le login est user et le mot de passe est password.

### Commandes Disponibles

*   help : Affiche les commandes disponibles
    
*   ls : Liste les fichiers et dossiers (visibles et cachés)
    
*   rm : Supprime un fichier
    
*   rmd ou rmdir : Supprime un dossier
    
*   about : Affiche une description du programme
    
*   version ou --v ou vers : Affiche la version du prompt
    
*   age : Demande votre âge et indique si vous êtes majeur ou mineur
    
*   profil : Affiche toutes les informations sur vous-même (prénom, nom, âge, email)
    
*   passw : Change le mot de passe avec une demande de confirmation
    
*   cd : Va dans un dossier que vous venez de créer ou revient au dossier précédent
    
*   pwd : Indique le répertoire courant
    
*   hour : Donne l'heure actuelle
    
*   httpget : Télécharge le code source HTML d'une page web et l'enregistre dans un fichier spécifique
    
*   smtp : Envoie un mail avec une adresse, un sujet et le corps du mail
    
*   open : Ouvre un fichier directement dans l'éditeur VIM même si le fichier n'existe pas
    
*   rps : Permet de jouer à Rock Paper Scissors entre deux joueurs
    
*   rmdirwtf : Supprime un ou plusieurs dossiers avec une protection par mot de passe
    
*   quit : Quitte le prompt