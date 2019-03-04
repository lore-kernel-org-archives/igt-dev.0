Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 4 Mar 2019 12:29:27 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <69730596ecfc3dc7e7ad1e2b8f28e59ca8c72e8e.1551712108.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 1/7] kms_flip: Removes unreachable code
 related to TEST_RPM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1334059887=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1334059887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="573h6ssxvu46gssg"
Content-Disposition: inline


--573h6ssxvu46gssg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This commit removes the code related to TEST_RPM test because the
kms_flip never sets this flags, i.e., TEST_RPM is not used. Take a look
at commit 07a3fccf to see why this flag is never set.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 tests/kms_flip.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 798fc4e8..f769d30e 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -68,7 +68,6 @@
 #define TEST_ENOENT		(1 << 22)
 #define TEST_FENCE_STRESS	(1 << 23)
 #define TEST_VBLANK_RACE	(1 << 24)
-#define TEST_RPM		(1 << 25)
 #define TEST_SUSPEND		(1 << 26)
 #define TEST_TS_CONT		(1 << 27)
 #define TEST_BO_TOOBIG		(1 << 28)
@@ -809,9 +808,6 @@ static unsigned int run_test_step(struct test_output *o)
 			     "failed to disable output: %s\n",
 			     strerror(errno));
=20
-	if (o->flags & TEST_RPM)
-		igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
-
 	if (o->flags & TEST_SUSPEND)
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
 					      SUSPEND_TEST_NONE);
@@ -1321,9 +1317,6 @@ static int run_test(int duration, int flags)
=20
 	igt_require((flags & TEST_HANG) =3D=3D 0 || !is_wedged(drm_fd));
=20
-	if (flags & TEST_RPM)
-		igt_require(igt_setup_runtime_pm());
-
 	resources =3D drmModeGetResources(drm_fd);
 	igt_require(resources);
=20
@@ -1570,10 +1563,6 @@ int main(int argc, char **argv)
 		if (tests[i].flags & TEST_NO_2X_OUTPUT)
 			continue;
=20
-		/* code doesn't disable all crtcs, so skip rpm tests */
-		if (tests[i].flags & TEST_RPM)
-			continue;
-
 		igt_subtest_f( "2x-%s", tests[i].name)
 			run_pair(tests[i].duration, tests[i].flags);
 	}
@@ -1592,10 +1581,6 @@ int main(int argc, char **argv)
 		if (tests[i].flags & TEST_NO_2X_OUTPUT)
 			continue;
=20
-		/* code doesn't disable all crtcs, so skip rpm tests */
-		if (tests[i].flags & TEST_RPM)
-			continue;
-
 		igt_subtest_f( "2x-%s-interruptible", tests[i].name)
 			run_pair(tests[i].duration, tests[i].flags);
 	}
--=20
2.21.0


--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=E3o Paulo

--573h6ssxvu46gssg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlx9RFYACgkQWJzP/com
vP8e9A/9FexPFq6wHB5U+cfyWgUVrsBAVDNxSrL2ssZph6LPdOvwlMGIcGXCuCqH
+haseLuyYj6zQAKpiWnu6PJS8Br4eZcTpsVCr6rxy4MTlJ5DjHUYRDnzT9ekNZBy
8/Qx6f/tuZHvewGCTlDIuzcdG0c1uhXHi8D0JaADSm/meZ0muuIL/t4thdcEVZza
F2QT3790hyRUVAgt3Y+arXpWiKCpvZLGXagil6HkU6Uts4NBlHtCLEqfeV//ti8K
QhfUqMGONGsmEDuc/YJS0FRoHKugRzL/bTYub0kxuR7vLuliax+8E1fEZT9mmuSR
OTYy4UNzGwHMjEspLjtiIDHVScJBWXYIfbJ62gnk03btcCM0ED8v219W++d7doC+
pF5GitWnPqOE6D+fVjYzCLW5A9LXn/W04aXC+BdpFNwuCZM9BdQkmeQQkDJIRUnD
kETfymBXZnlu9TQ103XoMSrleh9m03D+X7Vc5taxqCguQXqK1XG8EemeU9sDVtbq
4BGAY/1FyJamJhCBV/jbEq/h0WP1MYF3TUOgQaUQ3Jt67Vu/aPDJ1BRRHGjaGwhQ
QXwrki+Tk3SXAt7BOJLnINtqgl4YnLp6BfrKrXn/fsLC//KuNhPP22iPlCaTv69r
3CTE1lKQXilUW/DqjuriofDW6u78RZkh5FqpjLW4fWS9Mua6Wi4=
=golK
-----END PGP SIGNATURE-----

--573h6ssxvu46gssg--

--===============1334059887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1334059887==--
