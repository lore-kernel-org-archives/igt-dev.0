Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 4 Jun 2019 23:30:53 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190605023053.h7q2ei2b7gf2k5pn@smtp.gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH V8 i-g-t] tests/kms_flip: Skip VBlank tests in
 modules without VBlank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0414185245=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Simon Ser <simon.ser@intel.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0414185245==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t5c3chhpaeuuwpgl"
Content-Disposition: inline


--t5c3chhpaeuuwpgl
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

V7: Changes since V6
 - Skip TEST_DPMS with TEST_MODESET and TEST_EBUSY if the device does
   not support vblank

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
 tests/kms_flip.c | 24 +++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d7d711a7..8a465f67 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1673,6 +1673,27 @@ void igt_assert_plane_visible(int fd, enum pipe pipe=
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
index 4ac28131..5b5cf274 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -229,6 +229,8 @@ void kmstest_wait_for_pageflip(int fd);
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
index d7c1f9cf..2a158d97 100755
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
+			   TEST_CHECK_TS | TEST_VBLANK_RACE | TEST_EBUSY;
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
@@ -494,7 +507,7 @@ static void check_state(const struct test_output *o, co=
nst struct event_state *e
 	/* check only valid if no modeset happens in between, that increments by
 	 * (1 << 23) on each step. This bounding matches the one in
 	 * DRM_IOCTL_WAIT_VBLANK. */
-	if (!(o->flags & (TEST_DPMS | TEST_MODESET)))
+	if (!(o->flags & (TEST_DPMS | TEST_MODESET | TEST_NO_VBLANK)))
 		igt_assert_f(es->current_seq - (es->last_seq + o->seq_step) <=3D 1UL << =
23,
 			     "unexpected %s seq %u, should be >=3D %u\n",
 			     es->name, es->current_seq, es->last_seq + o->seq_step);
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

--t5c3chhpaeuuwpgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlz3KV0ACgkQWJzP/com
vP8i4xAAuN3PU0aa0nxzEdBGmSrZQDjJc4JPmndKSTdxRLvkteTytlo7j12NGqpU
5QcVjBjGrXUMlNzxCm7qIRczSa20iNx+g7tnKpA2l5HZo5xjbM0xmCWH0XBVESYt
xu/HskNKU6pYrz3E3K4qvWV1XFGkO6XEVgEeXpEZr0H5ULyBM+SaEm6Wgf2h2kau
3KwPZ1B9LJ06caocV9RFF6YVlTcQXNxliybGg46rwKx8fyRUT3Cpjm0ijnvUbnpX
Q3oLaypcf0Vza+XY8Jb4WcKkOp8FVdwwmpVcqYJiDkpLEvZEm+cbl2ePXeyRlVWd
nJR9Y069Xs1bW7RJvZHDKpuA5dgh17qkcMJCnA5Sp7mLHQs3vnuWSq/XNjZInq5D
wBP5sBkvluATKwo+dOk/g1UP7QnJhbUykfShaFsdpcPDsMV4fhuHaQmGxiH0a38F
BZjhMLSaaumaKjE/cAO/ObXEgGkeXkuSLbyLOBI/Dq8Z6eGAZs6G81xyMxlTioio
sCYD5OL5p38YLmG9Zmg2ij8YoQbxCF4qeJe2sG/R+vC3/9W9fpmV44NUGmZkUnMY
+1Iv13Auh4OoCdyxhdxMHzjt3dRWE53vS+pSnu9c0z47q6yGtJ7lGYgYF27yHNeA
0EhTxT8yEGLwaZ0scZPQGrXwfgCp/7FNjiwDUm+B4E01h7ZCErY=
=cH9R
-----END PGP SIGNATURE-----

--t5c3chhpaeuuwpgl--

--===============0414185245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0414185245==--
