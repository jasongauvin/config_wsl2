# 📄 Cheat Sheet : Linux Global & Gestion de Fichiers

## 🧭 Navigation & Informations
* `pwd` : Affiche le chemin complet du dossier où tu te trouves actuellement.
* `ls -la` : Liste tout le contenu du dossier (détails, tailles, permissions et fichiers cachés en `.`).
* `cd -` : Bascule instantanément dans le dossier où tu étais juste avant.

## 📁 Gestion des Dossiers & Fichiers (CRUD)
* `mkdir -p projet/src/tests` : Crée toute l'arborescence de dossiers d'un coup (crée les parents si nécessaires).
* `touch index.js script.py` : Crée un ou plusieurs fichiers vides.
* `echo "texte" > fichier.txt` : Crée un fichier (ou l'écrase complètement) en écrivant dedans.
* `echo "texte" >> fichier.txt` : Ajoute du texte à la fin d'un fichier existant sans effacer le contenu actuel.
* `cat fichier.txt` : Affiche tout le contenu d'un fichier directement dans le terminal.
* `less fichier.log` : Ouvre un fichier long avec navigation au clavier (flèches pour défiler, touche `Q` pour quitter).

## ✂️ Déplacer, Copier, Supprimer
* `cp fichier.txt copie.txt` : Copie un fichier.
* `cp -r dossier/ dossier_copie/` : Copie un dossier entier et tout son contenu de manière récursive.
* `mv ancien_nom.txt nouveau_nom.txt` : Renomme un fichier ou un dossier.
* `mv fichier.txt ../destination/` : Déplace un fichier vers un autre dossier.
* `rm fichier.txt` : Supprime un fichier définitivement (attention, pas de corbeille en CLI !).
* `rm -rf dossier/` : Force la suppression d'un dossier et de tout ce qu'il contient (à manipuler avec de grands pouvoirs).

## 📝 Éditeur Nano (Raccourcis clés)
* `nano fichier.txt` : Ouvre ou crée le fichier dans l'éditeur.
* `Ctrl + O` puis `Entrée` : Sauvegarde les modifications (Écrire).
* `Ctrl + W` : Cherche un mot ou une phrase dans le texte.
* `Ctrl + K` : Coupe la ligne actuelle.
* `Ctrl + U` : Colle la ligne qui vient d'être coupée.
* `Ctrl + X` : Quitte l'éditeur (te propose de sauvegarder si des changements ont eu lieu).
