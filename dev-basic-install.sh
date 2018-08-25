#!/bin/sh



# functions

msg() {
  echo -e "\n........................................................"
  echo -e " [*] $1\n"
}

help() {
  echo '--------------------------------------------------------'
  echo '| Script para instalar pacotes essenciais para desenvolvedores'
  echo '| A princípio roda apenas em Linux (Debian e Ubuntu)'
  echo '|'
  echo '| Importante!'
  echo '| Torne o arquivo executável antes de utiliza-lo, com o comando:'
  echo '|'
  echo '|   chmod +x dev-basic-install.sh'
  echo '|'  
  echo '|'
  echo '| Sintaxe: '
  echo '|   ./dev-basic-install.sh [nome-do-pacote]'
  echo '|'
  echo '| Exemplo:'
  echo '|   ./dev-basic-install.sh dropbox'
  echo '|'
  echo '| Pacotes disponíveis para instalação: '
  echo '|   [*] sublime .....: Sublime Text 3 '
  echo '|   [*] chrome ......: Google Chrome '
  echo '|   [*] vscode ......: Visual Studio Code '
  echo '|   [*] virtualbox ..: Virtual Box '
  echo '|   [*] dropbox .....: DropboxVirtual Box '
  echo '|   [*] teamviewer ..: Teamviewer '
  echo '|   [*] git .........: Git '
  echo '|   [*] nvm .........: NVM '
  echo '|   [*] all .........: Todos os pacotes acima '
  echo '|'
  echo '--------------------------------------------------------'
  exit 1
}

[ ! $1 ] && help

install_chrome() {
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome-stable_current_amd64.deb
  apt-get -f install
}

install_sublime() {
  msg "Instalando Sublime Text 3..."
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt-get install apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text
}

install_vscode() {
  msg "Instalando Visual Studio Code..."
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt-get install apt-transport-https
  sudo apt-get update
  sudo apt-get install code # or code-insiders
}

install_virtualbox() {
  msg "Instalando virtualbox..."
  wget -q https://download.virtualbox.org/virtualbox/5.2.18/virtualbox-5.2_5.2.18-124319~Debian~stretch_amd64.deb
  sudo dpkg -i https://download.virtualbox.org/virtualbox/5.2.18/virtualbox-5.2_5.2.18-124319~Debian~stretch_amd64.deb

}

install_teamviewer() {
  wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
  dpkg -i https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
}

install_chrome_remote_desktop() {

}

insatll_dropbox() {
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  ~/.dropbox-dist/dropboxd
}

install_all() {
  install_sublime
  install_chrome
  install_vscode
  install_virtualbox
  install_teamviewer
  msg "Instalando Git..." && apt-get install git
  msg "Istalando NVM..."  && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash 
}

# Init

[ "$1" = "sublime"]    && install_sublime
[ "$1" = "chrome"]     && install_chrome
[ "$1" = "vscode"]     && install_vscode
[ "$1" = "virtualbox"] && install_virtualbox
[ "$1" = "dropbox"]    && insatll_dropbox
[ "$1" = "teamviewer"] && install_teamviewer
[ "$1" = "git"]        && msg "Instalando Git..." && apt-get install git 
[ "$1" = "nvm"]        && msg "Istalando NVM..."  && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
[ "$1" = "all"]        && install_all

source ~/.bashrc 
source ~/.profile 
