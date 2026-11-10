# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake


DESCRIPTION="OBS plugin for removing background"
HOMEPAGE="https://github.com/occ-ai/obs-backgroundremoval"
SRC_URI="
	https://github.com/occ-ai/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtbase:6[widgets]
	>=media-video/obs-studio-29
	>=media-libs/opencv-4.7.0:=
"
RDEPEND="${DEPEND}"
BDEPEND="app-admin/chrpath"

QA_PRESTRIPPED="/usr/lib64/obs-plugins/obs-backgroundremoval/libonnxruntime.so.${ONNXRUNTIME_VERSION} /usr/lib64/obs-plugins/obs-backgroundremoval/libonnxruntime_providers_shared.so"


src_configure() {
	mycmakeargs=(
		
		-B "${BUILD_DIR}"
		-Donnxruntime_DIR="${EPREFIX}/usr/lib64/cmake/onnxruntime"	
	)
	cmake_src_configure
}

src_compile() {
	

	cmake_src_compile
}
