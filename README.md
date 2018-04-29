
# Setup

## Terminal

### Linux

Assuming [AUR package manager](https://github.com/polygamma/aurman)

```bash
aurman -S hyper
```

### MacOS

```bash
brew update
brew cask install hyper
```

## Font 

### Linux / MacOS

```bash
brew tap caskroom/fonts
brew cask install font-fira-code
```

### Windows

```bash
choco install firacode
```

## NeoVim

### MacOS

```bash
brew install neovim
pip3 install neovim
```

### Linux

```bash
sudo apt-get install neovim
```

### Windows

```bash
choco install neovim
```

## Fish Shell

### Linux / MacOS

```bash
brew install fish
curl -L https://get.oh-my.fish | fish
```

And follow the prompts.

## Link dotfiles

### Linux / MacOS

```bash
ln -si ./.hyper.js ~/.hyper.js
ln -si ./.init.vim ~/.config/nvim/init.vim
ln -si ./config.fish ~/.config/fish/config.fish
```

### Windows

_... use Windows Subsystem Linux and follow above instructions? :)_

