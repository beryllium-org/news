# Maintainer: Bill Sideris <bill88t@feline.gr>

pkgname=beryllium-news
pkgver=1.26.0
pkgrel=1
pkgdesc='Beryllium OS news and system information utility'
arch=('any')
url=https://github.com/beryllium-org/news
license=('GPL3')
groups=(beryllium)

replaces=('bredos-news')
provides=('bredos-news')
conflicts=('bredos-news')

depends=(
    'python'
    'python-requests'
    'python-psutil'
    'python-pyinotify'
    'smartmontools'
    'mmc-utils-git'
    'pacman-contrib'
    'sudo'
)

optdepends=(
    'yay: Check for updatable development packages'
    'flatpak: Check for flatpak updates'
    'upower: For battery readings'
    'procps-ng: For live monitoring of flatpak changes'
)

makedepends=()
install=news.install

source=(
  'client.py'
  'server.py'
  '99-beryllium-news.sh'
  'beryllium-news-update.service'
  'beryllium-news.1'
)

sha256sums=('e47ebbf2d7bf5badbfa0b44245f50106fe90660e6c507c87f5798aed1628b0ca'
            'ab3c5913d1d4c31e06f04faa818033a472e402c380ed6ce2304ae49d4b905784'
            '9d08f7f5dd0e1986fa1d87761ce73d802d2964238f8dfbd103ea78d511a3e6ac'
            'ca4a741e2f21ce9703783db15752638acd73a6d6be496a694461c70b53388b88'
            '820ab72d1eac2aebf6a46c3128062860b9092d107ee645cf10c82233ddd0257b')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/beryllium-news"
    install -d "$pkgdir/usr/share/man/man1"
    install -d "$pkgdir/etc/profile.d"
    install -d "$pkgdir/usr/lib/systemd/system"

    # Main things
    install -m755 "$srcdir/client.py" "$pkgdir/usr/bin/beryllium-news"
    ln -s /usr/bin/beryllium-news "$pkgdir/usr/bin/bredos-news"
    ln -s /usr/bin/beryllium-news "$pkgdir/usr/bin/beryl-news"
    install -m755 "$srcdir/server.py" "$pkgdir/usr/bin/beryllium-news-server"

    # Service and manpage
    install -m644 "$srcdir/beryllium-news-update.service" "$pkgdir/usr/lib/systemd/system/beryllium-news-update.service"
    install -m644 "$srcdir/beryllium-news.1" "$pkgdir/usr/share/man/man1/beryllium-news.1"

    # Profile script
    install -m755 "$srcdir/99-beryllium-news.sh" "$pkgdir/etc/profile.d/99-beryllium-news.sh"
}
