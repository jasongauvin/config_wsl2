#!/usr/bin/env bash

# Interrompt le script en cas d'erreur
set -e

echo "🚀 Démarrage de l'installation de ton environnement Cyberdeck/Dev..."

# 1. Mise à jour du système
echo "🔄 Mise à jour des paquets Ubuntu..."
sudo apt update && sudo apt upgrade -y

# 2. Ajout du dépôt officiel pour GitHub CLI (gh)
echo "🔑 Configuration du dépôt officiel GitHub CLI..."
sudo mkdir -p -m 755 /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update

# 3. Installation des outils de base, de navigation, SSH et GitHub CLI
echo "🛠️ Installation des utilitaires essentiels..."
sudo apt install -y \
    build-essential \
    curl \
    wget \
    git \
    tmux \
    htop \
    tree \
    jq \
    fzf \
    zsh \
    keychain \
    gh

# 4. Installation des outils Android (ADB & Fastboot)
echo "🤖 Installation des outils Android (ADB et Fastboot)..."
sudo apt install -y android-tools-adb android-tools-fastboot

# 5. Configuration de Python et installation de TLDR via pip3 (avec contournement PEP 668)
echo "🐍 Configuration de l'environnement Python et installation de TLDR..."
sudo apt install -y python3-pip python3-venv python3-dev
pip3 install --user --break-system-packages pyserial requests tldr

# 6. Installation de LazyGit (Extraction d'URL ultra-robuste via jq)
echo "🐙 Installation de LazyGit..."
# On extrait directement l'URL de l'asset Linux x86_64 via jq
LAZYGIT_URL=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | jq -r '.assets[] | select(.name | contains("Linux_x86_64") and contains(".tar.gz")) | .browser_download_url' || echo "")

# Si l'API GitHub a bloqué la requête, on utilise une version de secours fixe
if [ -z "$LAZYGIT_URL" ] || [ "$LAZYGIT_URL" == "null" ]; then
    echo "⚠️ Impossible de joindre l'API GitHub (Rate limit ?). Utilisation du lien de secours..."
    LAZYGIT_URL="https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Linux_x86_64.tar.gz"
fi

curl -Lo lazygit.tar.gz "$LAZYGIT_URL"
tar xmf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit

# 7. Installation de Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "🐚 Installation de Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 8. Installation des plugins Zsh (Highlighting et Autosuggestions)
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
echo "✨ Installation des plugins de coloration et d'auto-completion..."

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# 9. Configuration du fichier .zshrc (Plugins + Automatisation SSH)
echo "📝 Configuration du fichier .zshrc..."

# Activation des plugins Zsh
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf)/g' "$HOME/.zshrc"

# Ajout de la configuration Keychain pour automatiser les clés SSH
if ! grep -q "keychain" "$HOME/.zshrc"; then
    echo -e "\n# Configuration de Keychain pour automatiser les clés SSH" >> "$HOME/.zshrc"
    echo "eval \$(keychain --eval --agents ssh id_ed25519)" >> "$HOME/.zshrc"
fi

# 10. Changement de shell par défaut vers Zsh
echo "🔄 Passage à Zsh par défaut..."
sudo chsh -s $(which zsh) $(whoami)

echo "🎉 Tout est configuré avec succès ! Redémarre ton Windows Terminal."
