# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/xhtml2pdf/xhtml2pdf-0.0.4.ebuild,v 1.1 2012/06/28 07:57:15 patrick Exp $

EAPI="4"

#PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit python-distutils-ng

DESCRIPTION="Keyboard Status Monitor"
HOMEPAGE="https://code.google.com/p/key-mon/"
#SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz"
SRC_URI="https://key-mon.googlecode.com/files/key-mon-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/python-xlib"
RDEPEND="${DEPEND}"
