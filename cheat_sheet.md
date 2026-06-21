# 📄 Cheat Sheet 1 : Linux Global, Gestion de Fichiers & Navigation

## 🧭 Navigation & Informations Système
* `pwd` : Affiche le chemin complet (textuel) du dossier où tu te trouves actuellement.
* `ls -la` : Liste tout le contenu du dossier (détails, tailles, permissions et fichiers cachés en `.`).
* `cd -` : Bascule instantanément dans le dossier où tu étais juste avant.
* `tldr <commande>` : Affiche une antisèche simplifiée avec les 5 exemples les plus courants d'une commande (ex: `tldr tar`).

## 📁 Création & Gestion des Dossiers et Fichiers (CRUD)
* `mkdir -p projet/src/tests` : Crée toute l'arborescence de dossiers d'un coup (génère les dossiers parents si nécessaires).
* `touch index.js script.py` : Crée un ou plusieurs fichiers vides.
* `cat fichier.txt` : Affiche tout le contenu d'un fichier directement dans le terminal.
* `less fichier.log` : Ouvre un fichier long avec navigation au clavier (flèches pour défiler, touche `Q` pour quitter).

## 🔀 Redirections & Écriture
* `echo "texte" > fichier.txt` : Crée un fichier (ou l'écrase complètement s'il existe déjà) en écrivant dedans.
* `echo "texte" >> fichier.txt` : Ajoute du texte à la fin d'un fichier existant sans effacer le contenu actuel.

## ✂️ Déplacer, Copier, Supprimer & Droits
* `cp fichier.txt copie.txt` : Copie un fichier.
* `cp -r dossier/ dossier_copie/` : Copie un dossier entier et tout son contenu de manière récursive.
* `mv ancien_nom.txt nouveau_nom.txt` : Renomme un fichier ou un dossier.
* `mv fichier.txt ../destination/` : Déplace un fichier vers un autre dossier.
* `rm fichier.txt` : Supprime un fichier définitivement (attention, pas de corbeille en CLI !).
* `rm -rf dossier/` : Force la suppression d'un dossier et de tout ce qu'il contient (à manipuler avec de grands pouvoirs).
* `sudo chown -R $(whoami):$(whoami) dossier/` : Réattribue la propriété d'un dossier bloqué à ton utilisateur actuel (règle les erreurs *Permission Denied*).

## 📝 Éditeur Nano (Raccourcis clés)
* `nano fichier.txt` : Ouvre ou crée le fichier dans l'éditeur.
* `Ctrl + O` puis `Entrée` : Sauvegarde les modifications (Écrire).
* `Ctrl + W` : Cherche un mot ou une phrase dans le texte.
* `Ctrl + K` : Coupe la ligne actuelle (équivalent d'un Ctrl+X sur une ligne).
* `Ctrl + U` : Colle la ligne qui vient d'être coupée.
* `Ctrl + X` : Quitte l'éditeur (te propose de sauvegarder si des changements ont eu lieu).