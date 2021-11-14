curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
sudo apt install rbenv
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install -y
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update -y
sudo apt install neovim -y
mkdir ~/.config
cp -r nvim ~/.config/nvim
