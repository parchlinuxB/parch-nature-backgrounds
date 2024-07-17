# Maintainer: Parch Linux Distribution Team <feedback@parchlinux.ir>

pkgname=parch-nature-backgrounds
pkgver=1.0
pkgrel=1
pkgdesc='Parch Linux nature Wallpapers'
arch=('any')
url="https://github.com/parchlinuxb/parch-nature-backgrounds"
license=('GPL')
source=("wallpapers.zip")
sha256sums=('SKIP')

package() {
    cd "wallpapers"
    install -d "${pkgdir}/usr/share/wallpapers/parch-nature/"
    install -Dm 644 *.jpg "${pkgdir}/usr/share/wallpapers/parch-nature/"
    install -Dm 644 parch-nature.xml "${pkgdir}/usr/share/gnome-background-properties/parch-nature.xml"
}
