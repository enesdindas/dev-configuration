curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
sudo apt install rbenv
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update -y
sudo apt install neovim -y
pip3 install --user pynvim
mkdir ~/.config
cp -r nvim ~/.config/nvim
