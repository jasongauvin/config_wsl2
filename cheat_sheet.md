# 📄 Cheat Sheet 1 : Linux Global & Gestion de Fichiers

## 🧭 Navigation & Informations
* `pwd` : Affiche le dossier textuel où tu te trouves actuellement.
* `ls -la` : Liste tout le contenu du dossier (détails, tailles et fichiers cachés en `.`).
* `cd -` : Bascule instantanément dans le dossier où tu étais juste avant.

## 📁 Gestion des Dossiers & Fichiers (CRUD)
* `mkdir -p projet/src/tests` : Crée toute l'arborescence de dossiers d'un coup.
* `touch index.js script.py` : Crée un ou plusieurs fichiers vides.
* `echo "texte" > fichier.txt` : Crée un fichier (ou l'écrase) en écrivant dedans.
* `echo "texte" >> fichier.txt` : Ajoute du texte à la fin d'un fichier existant sans l'effacer.
* `cat fichier.txt` : Affiche tout le contenu d'un fichier dans le terminal.
* `less fichier.log` : Ouvre un fichier long (navigation avec les flèches, touche `Q` pour quitter).

## ✂️ Déplacer, Copier, Supprimer
* `cp fichier.txt copie.txt` : Copie un fichier.
* `cp -r dossier/ dossier_copie/` : Copie un dossier entier et son contenu.
* `mv ancien_nom.txt nouveau_nom.txt` : Renomme un fichier ou un dossier.
* `mv fichier.txt ../destination/` : Déplace un fichier vers un autre dossier.
* `rm fichier.txt` : Supprime un fichier définitivement (pas de corbeille).
* `rm -rf dossier/` : Force la suppression d'un dossier et de tout ce qu'il contient.

## 📝 Éditeur Nano (Raccourcis clés)
* `nano fichier.txt` : Ouvre ou crée le fichier dans l'éditeur.
* `Ctrl + O` puis `Entrée` : Sauvegarde les modifications.
* `Ctrl + W` : Cherche un mot dans le texte.
* `Ctrl + K` / `Ctrl + U` : Coupe une ligne / Colle la ligne.
* `Ctrl + X` : Quitte l'éditeur (te demande de sauvegarder si des changements ont eu lieu).

---

# 📄 Cheat Sheet 2 : Cyberdeck & Hardware

## 🩺 Diagnostic Système & Réseau
* `htop` : Gestionnaire de tâches interactif (processeur, RAM, processus). Touche `Q` pour quitter.
* `df -h` : État de l'espace disque (crucial pour surveiller le stockage des cartes SD).
* `ip a` : Récupère les adresses IP de tes interfaces réseau (pour trouver ta machine WSL).
* `ping 192.168.1.X` : Vérifie si un appareil (ESP32, téléphone) répond sur le réseau local.

## 🔌 Gestion du Matériel & USB
* `lsusb` : Liste tous les périphériques USB branchés (vérifie si l'Arduino est détecté).
* `dmesg -w` : Flux de logs kernel en temps réel. Branche/débranche ton Arduino pour voir sur quel port il se monte (ex: `/dev/ttyUSB0`).
* `ls -l /dev/tty*` : Liste les ports série disponibles.
* `sudo chmod 666 /dev/ttyUSB0` : Donne les autorisations d'écriture sur le port de l'Arduino si le téléversement bloque.

## 📱 Stack Android (ADB & Fastboot)
* `adb devices` : Liste les téléphones Android connectés et autorisés en mode debug.
* `adb shell` : Ouvre un terminal Linux directement à l'intérieur du téléphone Android.
* `adb connect IP:PORT` : Connecte un téléphone en Wi-Fi sans câble (Wi-Fi Debugging).
* `adb push local.txt /sdcard/` : Envoie un fichier du PC vers le téléphone.
* `adb pull /sdcard/photo.jpg .` : Récupère un fichier du téléphone vers le PC.
* `adb reboot bootloader` : Redémarre le téléphone en mode Fastboot pour le flasher.
* `fastboot devices` : Vérifie si le téléphone est bien détecté en mode flashage.

---

# 📄 Cheat Sheet 3 : Git CLI (Workflow Moderne)

## ⚙️ Configuration & Initialisation
* `git init` : Initialise un nouveau dépôt Git local.
* `git clone <url_du_repo>` : Télécharge un projet GitHub.

## 🔄 Le Cycle Quotidien
* `git status` : L'état des lieux (fichiers modifiés, indexés ou non suivis).
* `git diff` : Montre précisément les lignes de code modifiées avant de faire un commit.
* `git add <fichier>` : Prépare un fichier spécifique pour le commit.
* `git add .` : Prépare tous les fichiers modifiés et nouveaux.
* `git commit -m "ton message"` : Enregistre l'état dans l'historique local.

## 🌿 Branches & Fusion (Commandes switch)
* `git branch` : Liste tes branches locales.
* `git switch -c ma-nouvelle-branche` : Crée une branche et bascule dessus immédiatement.
* `git switch main` : Revient sur la branche principale.
* `git merge nom-de-la-branche` : Fusionne les modifications de la branche nommée dans la branche actuelle.
* `git branch -d nom-de-la-branche` : Supprime une branche proprement après fusion.

## ☁️ Synchronisation avec le Serveur
* `git pull origin main` : Récupère et fusionne le code distant sur ta machine.
* `git push origin main` : Envoie tes commits locaux vers GitHub.

## 🕰️ Navigation dans l'historique
* `lazygit` : Lance l'interface graphique ultra-claire dans ton terminal.
* `git log --oneline --graph --all` : Affiche un arbre visuel propre de tes commits directement en CLI.
* `git restore fichier.py` : Annule les modifications non commitées sur un fichier pour revenir au dernier état propre.