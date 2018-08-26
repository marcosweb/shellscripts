
  Script que facilita a instalação e configuração de pacotes essenciais para desenvolvedores.
  Compatível com Debian Linux. 
  Testado em Debian 9 (stretch).

## Importante

  Torne o arquivo executável antes de utiliza-lo, com o comando:
  
```
  chmod +x dev-basic-install.sh
 ```
## Sintaxe

```
  ./dev-basic-install.sh [nome-do-pacote]
```

## Exemplo

```
  ./dev-basic-install.sh dropbox
```

## Pacotes disponíveis para instalação:

```
  sublime .....: Sublime Text 3
  chrome ......: Google Chrome
  vscode ......: Visual Studio Code
  virtualbox ..: Virtual Box
  dropbox .....: DropboxVirtual Box
  teamviewer ..: Teamviewer
  git .........: Git
  nvm .........: NVM
  all .........: Todos os pacotes acima
```

Se tiver problemas com sudo ao rodar o script, use:

```
  sudo bash ./dev-basic-install.sh all
```

Se for solicitado cd-rom de instalacao do debian, abra o arquivo `/etc/apt/sources.list` e comente a linha que inicia com `#deb cdrom:[Debian GNU...`
