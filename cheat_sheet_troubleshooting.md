# 🛠️ Guide de Résolution & Configurations Spécifiques (WSL, Git, Hardware)

## 💻 1. Dépannage WSL 2 & Script
**Erreur d'initialisation (0x80370114) :** À lancer dans PowerShell (Admin) puis redémarrer.
```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

**Rendre le script exécutable :**
```bash
chmod +x setup.sh
./setup.sh
```

## 📁 2. Droits & Permissions Linux
**Erreur "Permission denied" (dossier créé avec sudo) :** Réattribuer les droits à ton utilisateur.
```bash
sudo chown -R $(whoami):$(whoami) ~/dev
```

**Erreur Git "dubious ownership" :** Autoriser Git sur ce dossier ou sur tous les dossiers.
```bash
git config --global --add safe.directory /home/jasongauvin/dev/null-phone
# Ou pour tous les dossiers (Recommandé) :
git config --global --add safe.directory '*'
```

## 🔑 3. Authentification Git, SSH & GitHub CLI
**Configuration de base :**
```bash
git config --global user.name "Jasongauvin"
git config --global user.email "ton.email@exemple.com"
```

**Connexion via GitHub CLI (gh) - *Recommandé* :**
```bash
gh auth login
gh repo clone jasongauvin/null-phone
```

**Connexion via Clé SSH (Alternative classique) :**
```bash
ssh-keygen -t ed25519 -C "ton.email@exemple.com"
cat ~/.ssh/id_ed25519.pub # À copier dans les paramètres GitHub
git clone git@github.com:jasongauvin/null-phone.git
```

## 🤖 4. Outils Tiers (TLDR & Android)
**Initialiser TLDR (au premier lancement) :**
```bash
tldr --update
```

**Connexion ADB (Android) sans câble (Wi-Fi Debugging) :**
```bash
adb connect <ADRESSE_IP_DU_TELEPHONE>:<PORT>
adb shell
```