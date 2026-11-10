# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

MY_PN="QSVEnc"
MY_TAG="8.37"
DESCRIPTION="Intel Quick Sync Video Encoder (Command line version)"
HOMEPAGE="https://github.com/rigaya/${MY_PN}"
EGIT_REPO_URI="https://github.com/rigaya/${MY_PN}.git"
#EGIT_COMMIT="v${MY_TAG}"
EGIT_SUBMODULES=( '*' )

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="vapoursynth"

RDEPEND="
    media-video/ffmpeg
    media-libs/libva
    media-libs/vapoursynth
    media-libs/libdovi
    sci-libs/onnxruntime
    media-libs/libass



"
DEPEND="${RDEPEND}"
BDEPEND="
    dev-build/cmake
    virtual/pkgconfig
    app-arch/unzip
    dev-build/meson
    dev-lang/python
    dev-vcs/git

"

src_configure() {

        meson setup ./build --buildtype=release \
       
       
}

src_compile() {
    meson compile -C ./build
}

src_install() {
    DESTDIR="${D}" meson install -C ./build
}


