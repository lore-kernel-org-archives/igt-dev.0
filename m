Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 4 Mar 2019 12:30:01 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <3656fa026ef33f6ce2ddffe9de64b88372df0642.1551712108.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/7] kms_flip: Removes unreachable code
 related to TEST_TS_CONT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2014077332=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============2014077332==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="45mzjn257qx2bht7"
Content-Disposition: inline


--45mzjn257qx2bht7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This commit removes the code related to TEST_TS_CONT test because the
kms_flip never sets this flags, i.e., TEST_TS_CONT is not used. Take a
look at commit 07a3fccf to see why this flag is never set.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 tests/kms_flip.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index f769d30e..0d261b77 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -69,7 +69,6 @@
 #define TEST_FENCE_STRESS	(1 << 23)
 #define TEST_VBLANK_RACE	(1 << 24)
 #define TEST_SUSPEND		(1 << 26)
-#define TEST_TS_CONT		(1 << 27)
 #define TEST_BO_TOOBIG		(1 << 28)
=20
 #define TEST_BASIC		(1 << 30)
@@ -497,21 +496,6 @@ static void check_state(const struct test_output *o, c=
onst struct event_state *e
 			     "unexpected %s seq %u, should be >=3D %u\n",
 			     es->name, es->current_seq, es->last_seq + o->seq_step);
=20
-	/* Check that the vblank frame didn't wrap unexpectedly. */
-	if (o->flags & TEST_TS_CONT) {
-		/* Ignore seq_step here since vblank waits time out immediately
-		 * when we kill the crtc. */
-		igt_assert_f(es->current_seq - es->last_seq >=3D 0,
-			     "unexpected %s seq %u, should be >=3D %u\n",
-			     es->name, es->current_seq, es->last_seq);
-		igt_assert_f(es->current_seq - es->last_seq <=3D 150,
-			     "unexpected %s seq %u, should be < %u\n",
-			     es->name, es->current_seq, es->last_seq + 150);
-
-		igt_debug("testing ts continuity: Current frame %u, old frame %u\n",
-			  es->current_seq, es->last_seq);
-	}
-
 	if (o->flags & TEST_CHECK_TS) {
 		double elapsed, expected;
=20
--=20
2.21.0

--45mzjn257qx2bht7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlx9RHgACgkQWJzP/com
vP/DRA/+MyTzGmY9YJNQqJN0lUHWjDJs6luZoOcZ0e55hc00sik1TIkE3x5uhfO1
XOu2QNODoPrCT6lBdWXUTv9BG2Dami8qVFJuTw0FC1GUEUA6F/9+n1BNgs9kNX6D
3zT52asuUiCLGAehuldVMHP1LOkuXSNIffuPFazRPl2JfU+DI2sCANBXEyD0LE42
Ajngca9qXTWpMGxxAd/gT59N/HCHISRsJCEnH0XEw4GZKz2NI3NqEFVCD0JXGko1
wE63X1qPto8v6s02/Og7EQe/FtP4+3GDsUnJIIhn8LqHHcaQvj1C8HPuwicZQhr2
d9/zKRU87BUY4AfwTkgLNuoNOEuPoOx8wwWQuPxUK9c5DiOTumcPX3F9f89CiT0y
WScCCLs+CnvL34ldc/uv0xNp/sqoIayJdI6Pl/JIrVwKy66zNXQPb2dDY7AXwpZZ
3QhPWwJ2KMWXgf+RqLGb2wRrP7KNiEShzHdgJ8LHmi7KHUBCZ4fTdnA+maiQF8f5
eAYbX4EXdW80uaIyPfL0EZa1uGhsfqnLMcgw9bdK75bFuYGMhgutwcE2Q8Cex/OZ
jvSMQMnRKHgQQsG03xelEE3UCrdXDLPYj6PHuXVo4jvVhVvGzoShGFptYBrcmNOi
dSAn0l16l5dKMWadKiDKBUfJ+dAnATcMyiU+kJ5VEFUhV5jRsxs=
=d4o/
-----END PGP SIGNATURE-----

--45mzjn257qx2bht7--

--===============2014077332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============2014077332==--
