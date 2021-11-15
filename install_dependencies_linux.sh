echo 'apt updating updating...'
sudo apt update -y
echo 'nvm installing...'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
echo 'rbenv and its dependencies installing installing...'
sudo apt install rbenv
sudo apt-get install -y mime-support
echo 'fzf installing...'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo 'vim plug installing...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'neovim and its dependencies installing...'
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt install neovim -y
pip3 install --user pynvim
echo 'moving nvim config in to your ~/.config folder'
mkdir ~/.config
cp -r nvim ~/.config/nvim
echo 'installation completed'
