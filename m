Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 12 Jun 2019 23:14:58 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH V6 i-g-t 0/6] igt: Add support for testing
 writeback connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1978925373=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1978925373==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w2hus3bqse4zgnjo"
Content-Disposition: inline


--w2hus3bqse4zgnjo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

DRM already have writeback connectors support, which is a way to expose
in DRM the hardware functionality from display engines that allows
writing back into memory the result of the DE's composition of supported
planes.

These days, I'm working to add the writeback support into the vkms[1],
and I used the kms_writeback to validate my implementation. As a result,
I had to rebase the v5 version of Liviu's series, and I also fixed a
small issue in the first path (lib/igt_kms: Add writeback support).

Patches have been originally implemented by Brian, Liviu has done the v3
and v4 updates to them. I=E2=80=99m just sending a v6.

1. https://patchwork.freedesktop.org/series/61738/

Brian Starkey (6):
  lib/igt_kms: Add writeback support
  kms_writeback: Add initial writeback tests
  lib: Add function to hash a framebuffer
  kms_writeback: Add writeback-check-output
  lib/igt_kms: Add igt_output_clone_pipe for cloning
  kms_writeback: Add tests using a cloned output

 lib/igt_fb.c           |  66 ++++++
 lib/igt_fb.h           |   3 +
 lib/igt_kms.c          | 157 +++++++++----
 lib/igt_kms.h          |  10 +
 tests/Makefile.sources |   1 +
 tests/kms_writeback.c  | 492 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 7 files changed, 692 insertions(+), 38 deletions(-)
 create mode 100644 tests/kms_writeback.c

--=20
2.21.0


--=20
Rodrigo Siqueira
https://siqueira.tech

--w2hus3bqse4zgnjo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0BsaIACgkQWJzP/com
vP9wShAAwUxKd6e+ZfaLU6tD+nchKtf2qIaB9Bnd+pBHwBGqPcDFlROYv7+tivw+
O3byk4ggHEjdwxq8QzE2nTWdrXudjjLBs9KGMVwd7cjyHJrYat7bs4GPmElrynar
V7u8TdTCi++g4MsNJ0sTeJG5u2/28s5g5xkiOkgx3SFsk+s08O8cKWMM2GE1j3me
BkpN7uvDDst7ckZhTlNVjVe4Nap5voMS+u8vbhF0/DdobqDG4j8gE3LIYY0C3NAY
fP6oc6UNqIkgCjiIOiYXvydOtJu1X/x+lUcL84O7Pa7wzAib3mSJoi8L7OAFTae3
JCvY8cLucAr5PL6EbmtKw84mG6vgVnMC0Ate7Ydqu/CPQ7emQ3SbPLtWMUpBE96O
1Y6jcuJuWvDeXkpb5/NOUk6os636AxT2Nbvtf1I3RUyptHXs8MdkKW1LdvLlVB6U
5DNcF9kc+kSXdycvQZuIFqOQNHo4A49od5Nt6g/pQvGYA03IgrrbgTB9YBSQbfaT
Ha5YPo8Gy8jitM/bsJn1VM8VyePyq890LgzrQ2V31yP9juHXXBqb1EkxRBYCuTN8
6/chFmWc2ynHeUpg+o3nITeBGOV62UoUNerbbmcwGeM0sSeg82edpDHUhPEckQtm
T9QAw/OcbTtRXOCqUVMXKg+EzxK7HulDaSK05oALL0z+VL+uKgg=
=c007
-----END PGP SIGNATURE-----

--w2hus3bqse4zgnjo--

--===============1978925373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1978925373==--
