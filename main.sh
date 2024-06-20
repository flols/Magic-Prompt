#!/bin/bash
source quit.sh

# Variables globales pour le login et mot de passe
LOGIN="user"
PASSWORD="password"

# Fonction de vérification du login et du mot de passe
auth() {
    read -p "Login: " input_login
    read -s -p "Password: " input_password
    echo

    if [[ "$input_login" == "$LOGIN" && "$input_password" == "$PASSWORD" ]]; then
        echo "Authentication successful"
    else
        echo "Authentication failed"
        exit 1
    fi
}

# Fonction help
help_command() {
    echo "Liste des commandes disponibles :"
    echo "help : Affiche les commandes disponibles"
    echo "ls : Liste les fichiers et dossiers (visibles et cachés)"
    echo "rm : Supprime un fichier"
    echo "rmd ou rmdir : Supprime un dossier"
    echo "about : Affiche une description du programme"
    echo "version : Affiche la version du prompt"
    echo "age : Demande votre âge et indique si vous êtes majeur ou mineur"
    echo "profil : Affiche toutes les informations sur vous-même (prénom, nom, âge, email)"
    echo "passw : Change le mot de passe avec une demande de confirmation"
    echo "cd : Va dans un dossier que vous venez de créer ou revient au dossier précédent"
    echo "pwd : Indique le répertoire courant"
    echo "hour : Donne l'heure actuelle"
    echo "* : Indique une commande inconnue"
    echo "httpget : Télécharge le code source HTML d'une page web et l'enregistre dans un fichier spécifique"
    echo "smtp : Envoie un mail avec une adresse, un sujet et le corps du mail"
    echo "open : Ouvre un fichier directement dans l'éditeur VIM même si le fichier n'existe pas"
    echo "rps : Permet de jouer à Rock Paper Scissors entre deux joueurs"
    echo "rmdirwtf : Supprime un ou plusieurs dossiers avec une protection par mot de passe"
    echo "quit : Quitte le prompt"
}

# Fonction ls
ls_command() {
    ls -a
}

# Fonction rm
rm_command() {
    read -p "Entrez le nom du fichier à supprimer : " filename
    rm -i "$filename"
}

# Fonction rmd/rmdir
rmd_command() {
    read -p "Entrez le nom du dossier à supprimer : " dirname
    rm -ri "$dirname"
}

# Fonction about
about_command() {
    echo "My Magic Prompt est un prompt interactif en bash script avec diverses fonctionnalités."
}

# Fonction version
version_command() {
    echo "Version 1.0"
}

# Fonction age
age_command() {
    read -p "Quel est votre âge ? " age
    if [ "$age" -ge 18 ]; then
        echo "Vous êtes majeur."
    else
        echo "Vous êtes mineur."
    fi
}

# Fonction profil
profil_command() {
    echo "Informations de profil :"
    echo "Prénom : Florian"
    echo "Nom : Le Saint"
    echo "Âge : 23"
    echo "Email : florian.lesaint@my-digital-school.org"
}

# Fonction passw
passw_command() {
    read -s -p "Entrez votre nouveau mot de passe : " new_pass
    echo
    read -s -p "Confirmez votre nouveau mot de passe : " confirm_pass
    echo
    if [ "$new_pass" == "$confirm_pass" ]; then
        PASSWORD="$new_pass"
        echo "Mot de passe changé avec succès."
    else
        echo "Les mots de passe ne correspondent pas."
    fi
}

# Fonction cd
cd_command() {
    read -p "Entrez le nom du dossier : " dirname
    cd "$dirname" || echo "Le dossier n'existe pas"
}

# Fonction pwd
pwd_command() {
    pwd
}

# Fonction hour
hour_command() {
    date +%H:%M
}

# Fonction httpget
httpget_command() {
    read -p "Entrez l'URL de la page web : " url
    read -p "Entrez le nom du fichier de destination : " filename
    curl -o "$filename" "$url"
}

# Fonction smtp
smtp_command() {
    read -p "Entrez l'adresse mail du destinataire : " to_email
    read -p "Entrez le sujet du mail : " subject
    read -p "Entrez le corps du mail : " body
    echo "$body" | mail -s "$subject" "$to_email"
}

# Fonction open
open_command() {
    read -p "Entrez le nom du fichier à ouvrir : " filename
    vim "$filename"
}

# Fonction rps
rps_command() {
    read -p "Nom du Joueur 1 : " player1
    read -p "Nom du Joueur 2 : " player2

    score1=0
    score2=0
    rounds=3

    choices=("rock" "paper" "scissors" "SuperKitty")

    for ((i=1; i<=$rounds; i++)); do
        echo "Manche $i"
        read -p "$player1, faites votre choix (rock/paper/scissors/SuperKitty) : " choice1
        read -p "$player2, faites votre choix (rock/paper/scissors/SuperKitty) : " choice2

        if [[ "$choice1" == "SuperKitty" ]]; then
            echo "$player1 gagne la manche $i"
            score1=$((score1 + 1))
        elif [[ "$choice2" == "SuperKitty" ]]; then
            echo "$player2 gagne la manche $i"
            score2=$((score2 + 1))
        elif [[ "$choice1" == "$choice2" ]]; then
            echo "Égalité pour la manche $i"
        elif [[ ( "$choice1" == "rock" && "$choice2" == "scissors" ) || 
                ( "$choice1" == "scissors" && "$choice2" == "paper" ) ||
                ( "$choice1" == "paper" && "$choice2" == "rock" ) ]]; then
            echo "$player1 gagne la manche $i"
            score1=$((score1 + 1))
        else
            echo "$player2 gagne la manche $i"
            score2=$((score2 + 1))
        fi
    done

    echo "Score final : $player1 $score1 - $player2 $score2"

    if [[ $score1 -gt $score2 ]]; then
        echo "$player1 est le vainqueur!"
    elif [[ $score2 -gt $score1 ]]; then
        echo "$player2 est le vainqueur!"
    else
        echo "Le jeu se termine par une égalité!"
    fi
}

# Fonction rmdirwtf
rmdirwtf_command() {
    read -s -p "Entrez le mot de passe : " input_password
    echo

    if [[ "$input_password" != "$PASSWORD" ]]; then
        echo "Mot de passe incorrect"
        return
    fi

    read -p "Entrez le ou les noms des dossiers à supprimer (séparés par des espaces) : " dirs
    rm -rf $dirs
    echo "Dossiers supprimés"
}

cmd() {
    local cmd=$1
    shift
    local argv=("$@")

    case "${cmd}" in
        help) help_command;;
        ls) ls_command;;
        rm) rm_command;;
        rmd | rmdir) rmd_command;;
        about) about_command;;
        version | --v | vers) version_command;;
        age) age_command;;
        profil) profil_command;;
        passw) passw_command;;
        cd) cd_command;;
        pwd) pwd_command;;
        hour) hour_command;;
        httpget) httpget_command;;
        smtp) smtp_command;;
        open) open_command;;
        rps) rps_command;;
        rmdirwtf) rmdirwtf_command;;
        quit | exit) quit;;
        *) echo "Commande inconnue";;
    esac
}

main() {
    auth

    local lineCount=1

    while true; do
        local date=$(date +%H:%M)
        echo -ne "${date} - [\033[31m${lineCount}\033[m] - \033[33mFlols\033[m ~ 👺 ~ "
        read -r string

        cmd $string
        lineCount=$((lineCount+1))
    done
}

main
