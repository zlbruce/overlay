# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="A Minimalistic Text Based Status Bar"
HOMEPAGE="http://projects.haskell.org/xmobar/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xft unicode mail mpd mpris alsa timezone wifi dbus"
REQUIRED_USE="mpris? ( dbus )"

RDEPEND="x11-libs/libXrandr
	wifi? ( net-wireless/wireless-tools )
	"
DEPEND="${RDEPEND}
		>=dev-lang/ghc-6.10.4
		>=dev-haskell/cabal-1.6
		>=dev-haskell/mtl-2.0
		<dev-haskell/mtl-2.2
		=dev-haskell/parsec-3.1*
		>=dev-haskell/stm-2.3
		<dev-haskell/stm-2.5
		=dev-haskell/x11-1.6*
		alsa? ( =dev-haskell/alsa-mixer-0.1*
			=dev-haskell/alsa-core-0.5*
		)
		dbus? ( >=dev-haskell/dbus-0.10 )
		mail? ( =dev-haskell/hinotify-0.3* )
		mpd? ( =dev-haskell/libmpd-0.8* )
		mpris? ( >=dev-haskell/dbus-0.10 )
		timezone? ( =dev-haskell/timezone-olson-0.1*
			=dev-haskell/timezone-series-0.1*
		)
		xft? ( =dev-haskell/utf8-string-0.3*
			=dev-haskell/x11-xft-0.3*
		)
		"
RDEPEND+="mpd? ( media-sound/mpd )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-pipereader.patch
}

src_configure() {
	# with_threaded is to workaround http://hackage.haskell.org/trac/ghc/ticket/4934
	# but it's broken in current master:
	#    https://github.com/jaor/xmobar/issues/77
	cabal_src_configure \
		--flags=-with_threaded \
		$(cabal_flag xft with_xft) \
		$(cabal_flag unicode with_utf8) \
		$(cabal_flag mail with_inotify) \
		$(cabal_flag mpd with_mpd) \
		$(cabal_flag alsa with_alsa) \
		$(cabal_flag timezone with_datezone) \
		$(cabal_flag wifi with_iwlib)
		$(cabal_flag dbus with_wbus)
		$(cabal_flag mpris with_mpris)
}

src_install() {
	cabal_src_install

	dodoc samples/xmobar.config readme.md news.md
}
