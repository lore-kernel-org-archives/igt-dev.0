Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Mon, 4 Mar 2019 12:32:08 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <f721ca0d8367607136e076b1870c4cbcbecb8848.1551712108.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
Subject: [Intel-gfx] [PATCH i-g-t 7/7] kms_flip: Standardize return value
 for fb_is_bound
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1761115235=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1761115235==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n5cbc5s6uybfywb6"
Content-Disposition: inline


--n5cbc5s6uybfywb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The function fb_is_bound() mix integer value with booleans for handling
the return value. This commit standardizes the return value of
fb_is_bound() for using only booleans.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 tests/kms_flip.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index de3ab600..abfdd363 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -947,8 +947,7 @@ static void paint_flip_mode(struct igt_fb *fb, bool odd=
_frame)
 	igt_put_cairo_ctx(drm_fd, fb, cr);
 }
=20
-static int
-fb_is_bound(struct test_output *o, int fb)
+static bool fb_is_bound(struct test_output *o, int fb)
 {
 	int n;
=20
@@ -958,7 +957,7 @@ fb_is_bound(struct test_output *o, int fb)
 		};
=20
 		if (drmIoctl(drm_fd, DRM_IOCTL_MODE_GETCRTC, &mode))
-			return 0;
+			return false;
=20
 		if (!mode.mode_valid || mode.fb_id !=3D fb)
 			return false;
--=20
2.21.0

--n5cbc5s6uybfywb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlx9RPcACgkQWJzP/com
vP8P/w//WrKlk8xWBLCby5D43ClvSufkGCgQvwI3J7Lcic88W9FViYf5lKt/qNGF
E3xzF0aPORE9xJWIY1VO114I1DB2bVkKVuGZFH/KzaWLH/+zVgEW3H9I7Hp2xe4+
HbuvS6zGg63X3bWDRj8fEblSDPYoFldJSueiChDznx1rFRq8vVKtBgu5n/aE93uD
PRyYepIMhDrSlP2p0h2QsFPnDOWFudRlQnd3nRFowGp0U9HdFCxgyHXvG3lKyWO/
cFu06kyf3DFCvOFTIBZe9Dx2Ol0MZfuISGR8d9Eq9F+YpczIjPwAvpfHrTddZwoj
52V1Zvlqdakjgvj5sObP7kQObhsLeTNHKmYqWqp708xYzY+eOsNETVYH1QrkZZg4
MbzzeEjQVxyWN6MN6Lku/D5TEZxL6PrU/3Y1Or5sJPB9lBojnLXj+yG2UXcFHZoJ
9KEPhNJsUd6k6YsYxtS+cjSaguc6r1HLWTfaEMXfJOlERwNN8g928dnS9RmBHCFK
zvXNjf9FjJyRovl3GQiRynQ1uiaxbUTg/SpwpX0LJtL0ffn7AorrcHoPtNLGEH9a
EhhHUnM2uTXrlDvw1Rc1nKQmCPmq/I93T4zKbDh6ZKtqiEgT/KLMlmfb5WvnB6En
/grtPOVk4RPCaab3UMHbO+8gzhrVhZfLwgPdao+mu4ThDGaUqGc=
=yuIf
-----END PGP SIGNATURE-----

--n5cbc5s6uybfywb6--

--===============1761115235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============1761115235==--
