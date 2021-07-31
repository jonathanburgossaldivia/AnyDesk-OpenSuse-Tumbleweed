sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
sudo rm -rf /etc/zypp/repos.d/vscodium.repo
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg" |sudo tee -a /etc/zypp/repos.d/vscodium.repo

sudo zypper in codium
sudo zypper in ruby-devel
sudo gem install solargraph
sudo gem install rubocop
sudo ln -s /usr/bin/solargraph.ruby2.7 /usr/bin/solargraph
sudo ln -s /usr/bin/rubocop.ruby2.7 /usr/bin/rubocop

data='"serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
"cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
"itemUrl": "https://marketplace.visualstudio.com/items"'

sudo sed -i '/itemUrl/d' /usr/share/codium/resources/app/product.json
perl -spe 's/.serviceUrl.*/$var/' -- -var="$data"  /usr/share/codium/resources/app/product.json > /tmp/product.json
sudo cp /tmp/product.json /usr/share/codium/resources/app/product.json
