Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Sun, 19 May 2019 21:09:55 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190520000955.qhgzmoianlvcuzgz@smtp.gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [RESEND PATCH V7 i-g-t] tests/kms_flip: Skip VBlank tests
 in modules without VBlank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1093457174=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1093457174==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f3eynezcf2sclown"
Content-Disposition: inline


--f3eynezcf2sclown
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The kms_flip test relies on VBlank support, and this situation may
exclude some virtual drivers to take advantage of this set of tests.
This commit adds a mechanism that checks if a module has VBlank. If the
target module has VBlank support, kms_flip will run all the VBlank
tests; otherwise, the VBlank tests will be skipped. Additionally, this
commit improves the test coverage by checks if the function
drmWaitVBlank() returns EOPNOTSUPP (i.e., no VBlank support).

V6: Set errno to zero before call drmWaitVBlank() (Chris Wilson)

V5: Drop the DRM_VBLANK_NEXTONMISS (Chris Wilson)

V4: Replace DRM_VBLANK_ABSOLUTE by DRM_VBLANK_RELATIVE and
DRM_VBLANK_NEXTONMISS

V3: Add documentation (Daniel Vetter)

V2: Add new branch coverage to check if VBlank is enabled or not and
update commit message

V1: Chris Wilson
  - Change function name from igt_there_is_vblank to kms_has_vblank
  - Move vblank function check from igt_aux to igt_kms
  - Utilizes memset in dummy_vbl variable
  - Directly return the result of drmWaitVBlank()

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 lib/igt_kms.c    | 21 +++++++++++++++++++++
 lib/igt_kms.h    |  2 ++
 tests/kms_flip.c | 22 ++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index df9aafd2..ca3073a0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1656,6 +1656,27 @@ void igt_assert_plane_visible(int fd, enum pipe pipe=
, int plane_index, bool visi
 	igt_assert_eq(visible, visibility);
 }
=20
+/**
+ * kms_has_vblank:
+ * @fd: DRM fd
+ *
+ * Get the VBlank errno after an attempt to call drmWaitVBlank(). This
+ * function is useful for checking if a driver has support or not for VBla=
nk.
+ *
+ * Returns: true if target driver has VBlank support, otherwise return fal=
se.
+ */
+bool kms_has_vblank(int fd)
+{
+	drmVBlank dummy_vbl;
+
+	memset(&dummy_vbl, 0, sizeof(drmVBlank));
+	dummy_vbl.request.type =3D DRM_VBLANK_RELATIVE;
+
+	errno =3D 0;
+	drmWaitVBlank(fd, &dummy_vbl);
+	return (errno !=3D EOPNOTSUPP);
+}
+
 /*
  * A small modeset API
  */
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 38bdc08f..b0ff79ab 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -230,6 +230,8 @@ void kmstest_wait_for_pageflip(int fd);
 unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
 void igt_assert_plane_visible(int fd, enum pipe pipe, int plane_index, boo=
l visibility);
=20
+bool kms_has_vblank(int fd);
+
 /*
  * A small modeset API
  */
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 8c17c8da..4d1bf69b 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -71,6 +71,7 @@
 #define TEST_SUSPEND		(1 << 26)
 #define TEST_BO_TOOBIG		(1 << 28)
=20
+#define TEST_NO_VBLANK		(1 << 29)
 #define TEST_BASIC		(1 << 30)
=20
 #define EVENT_FLIP		(1 << 0)
@@ -126,6 +127,18 @@ struct event_state {
 	int seq_step;
 };
=20
+static bool vblank_dependence(int flags)
+{
+	int vblank_flags =3D TEST_VBLANK | TEST_VBLANK_BLOCK |
+			   TEST_VBLANK_ABSOLUTE | TEST_VBLANK_EXPIRED_SEQ |
+			   TEST_CHECK_TS | TEST_VBLANK_RACE;
+
+	if (flags & vblank_flags)
+		return true;
+
+	return false;
+}
+
 static float timeval_float(const struct timeval *tv)
 {
 	return tv->tv_sec + tv->tv_usec / 1000000.0f;
@@ -1176,6 +1189,7 @@ static void run_test_on_crtc_set(struct test_output *=
o, int *crtc_idxs,
 	unsigned bo_size =3D 0;
 	uint64_t tiling;
 	int i;
+	bool vblank =3D true;
=20
 	switch (crtc_count) {
 	case RUN_TEST:
@@ -1259,6 +1273,14 @@ static void run_test_on_crtc_set(struct test_output =
*o, int *crtc_idxs,
 	}
 	igt_assert(fb_is_bound(o, o->fb_ids[0]));
=20
+	vblank =3D kms_has_vblank(drm_fd);
+	if (!vblank) {
+		if (vblank_dependence(o->flags))
+			igt_require_f(vblank, "There is no VBlank\n");
+		else
+			o->flags |=3D TEST_NO_VBLANK;
+	}
+
 	/* quiescent the hw a bit so ensure we don't miss a single frame */
 	if (o->flags & TEST_CHECK_TS)
 		calibrate_ts(o, crtc_idxs[0]);
--=20
2.21.0

--f3eynezcf2sclown
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlzh8FIACgkQWJzP/com
vP9WgxAAgs2+C0r/DU27JUw+Gz39dlC3VwSgg9u9gv7+Dswii+lxF3LCvTU/EO3+
+avOVI4Lj0xMw6fdxgOeq+l/1XOtiGL/F0Rnt9ilNW57C712hldx1nUuwgB7Mom6
MOnrXk8boY26aaMGIpv0jOvBL0/FzXb5morWruFkALsE6+b6ziUJPaL1NlX0Xpj1
WLuNRp5f9R5IN+Yl8oouo2o5O5MRbDO8yRPt/8cm6GS24vgIqRXqWhMJ3JB2Lnjy
hGP5RcEFGD9vd3q2sdgILccSIxGElqRk0+BVsUGoSAU+4Iw1d+9kX7HLpIPIIEfi
1oCAtxwoYnS0Z9lxYZ6s/3RqT0nbb1XCyy86OS3tRhYIkMPLEw7zuCHTkCX8Nbwb
08T29zxYG8dbZ+czgsV+x7cPl4qEcOAqYYnRj3CU2AdCVG79mjnJM4XO6milMuwM
9i1/fRZApQt/8rC6fZD2bnxrxL91fTQ5hgueUuI+tvTurU/r3fHLG3Q0ig1gtYzI
gtCZ5ipm8UJmcjoB9zPIel7PeWKLkJLpsHYfrSEkFx0GDqBN/+ol0Wqa1GI+M0Uo
90pU4PLSGZ5RRUOikkwi6+ypt7gcfLoU0v0zgBU6t3wb5tg6xSH3CZTUD9ZaSLyD
gKyBD7Us3djEYV8uEhRUCseNKZYTi12aDC70efUZkrigWih8Hf8=
=Pey5
-----END PGP SIGNATURE-----

--f3eynezcf2sclown--

--===============1093457174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1093457174==--
