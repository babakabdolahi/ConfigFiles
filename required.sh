# this is for installing Vim-Plug                                       
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#installing fzf                                                         
git clone --depth 1 https://github.com/junegunn/fzf.git
cd ~/fzf
~/fzf/install
#installing ag package                                                  
sudo apt-get install silversearcher-ag
#install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#install starship
curl -sS https://starship.rs/install.sh | sh
# installing apt
sudo wget https://github.com/sharkdp/bat/releases/download/v0.18.1/bat-musl_0.18.1_amd64.deb
sudo dpkg -i bat_0.18.1_amd64.deb
