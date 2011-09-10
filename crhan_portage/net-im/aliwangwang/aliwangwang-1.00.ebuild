# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="AliWangWang for Linux"
HOMEPAGE="http://www.taobao.com/wangwang"
SRC_URI="amd64? ( http://10.20.1.137/aliww/${PN}_${PV}-00_amd64.deb )
	x86? ( http://10.20.1.137/aliww/${PN}_${PV}-00_i386.deb )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	x11-libs/qt-webkit
	x11-libs/qt-sql"
DEPEND=""

S=${WORKDIR}

src_unpack() {
	default_src_unpack
	unpack ./data.tar.gz
}

src_install() {
	cp -r usr "${D}"
}
