# locale
sudo locale-gen
locale -a
locale

# time
sudo timedatectl set-ntp true

# network
nmtui

# install git
sudo pacman -S git

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# install dependencies
yay -Syu xorg-server xorg-xinit xterm stacer visual-studio-code-bin termite feh wmname xorg-xsetroot curl unzip wget neovim slim spotify terminus-font discord ttf-dejavu noto-fonts-cjk ibus ibus-hangul zsh zsh-completionsrsync python psmisc wireless_tools openbox obconf alsa-utils brightnessctl nitrogen dunst tint2 gsimplecal rofi lxappearance qt5ct qt5-styleplugins lxsession xautolock rxvt-unicode-patched xclip scrot thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer tumbler w3m geany viewnior mpv mpd mpc ncmpcpp pavucontrol parcellite neofetch htop picom-git obmenu-generator gtk2-perl imagemagick ffmpeg playerctl xsettingsd pulseaudio flameshot sxhkd
pacman -Q | wc -l

# zsh
chsh -s `which zsh`
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# xinit, sxhkd
cd ..
git clone https://github.com/sizlinx/arch-auto-set
cp arch-auto-set/.xinitrc ~/.xinitrc
mkdir ~/.config/sxhkd
cp arch-auto-set/.sxhkdrc ~/.config/sxhkd/sxhkdrc

# ibus
ibus-setup

# slim
sudo systemctl enable slim

# dotfiles
git clone https://github.com/owl4ce/dotfiles.git && cd dotfiles
rsync -avzP --exclude '.git*' .* ~/
cd ~/.icons
tar -Jxvf Papirus-Custom.tar.xz && tar -Jxvf Papirus-Dark-Custom.tar.xz
sudo rsync -avzP Papirus-{Custom,Dark-Custom} /usr/share/icons/
rm -r ~/.icons/Papirus-*
cd ..
rm -rf dotfiles

# refresh font cache
fc-cache -rv

# starship
curl -fsSL https://starship.rs/install.sh | bash
echo "eval "$(starship init zsh)"" >> ~/.zshrc