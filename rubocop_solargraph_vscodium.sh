sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" |sudo tee -a /etc/zypp/repos.d/vscodium.repo

sudo zypper in codium
sudo zypper in ruby-devel
sudo gem install solargraph
sudo gem install rubocop
sudo ln -s /usr/bin/solargraph.ruby2.7 /usr/bin/solargraph
sudo ln -s /usr/bin/rubocop.ruby2.7 /usr/bin/rubocop
