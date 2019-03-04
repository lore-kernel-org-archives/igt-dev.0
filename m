Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 4 Mar 2019 12:31:46 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <ff2e2b0c5d4addbb921121dc230613b24bd36a7b.1551712108.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 6/7] kms_flip: Rework set_mode()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1074944387=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1074944387==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2sb4fvqap5cschar"
Content-Disposition: inline


--2sb4fvqap5cschar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch removes the duplicate code inside the function set_mode().

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 tests/kms_flip.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 42ae3ebc..de3ab600 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -609,22 +609,24 @@ static bool is_wedged(int fd)
=20
 static int set_mode(struct test_output *o, uint32_t fb, int x, int y)
 {
-	int n;
+	int n, ret;
=20
 	for (n =3D o->count - 1; n >=3D 0; n--) {
+		uint32_t buffer_id =3D fb, x_crtc =3D x, y_crtc =3D y;
+		uint32_t *conn =3D &o->_connector[n];
+		int count =3D 1;
+		drmModeModeInfoPtr mode =3D &o->kmode[n];
+
 		if (fb =3D=3D 0) {
-			int ret =3D drmModeSetCrtc(drm_fd, o->_crtc[n],
-						 0, 0, 0,
-						 0, 0, 0);
-			if (ret)
-				return ret;
-		} else {
-			int ret =3D drmModeSetCrtc(drm_fd, o->_crtc[n],
-						 fb, x, y,
-						 &o->_connector[n], 1, &o->kmode[n]);
-			if (ret)
-				return ret;
+			buffer_id =3D x_crtc =3D y_crtc =3D count =3D 0;
+			conn =3D NULL; mode =3D NULL;
 		}
+
+		ret =3D drmModeSetCrtc(drm_fd, o->_crtc[n],
+				     buffer_id, x_crtc, y_crtc,
+				     conn, count, mode);
+		if (ret)
+			return ret;
 	}
=20
 	return 0;
--=20
2.21.0

--2sb4fvqap5cschar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlx9ROEACgkQWJzP/com
vP+tfBAAwDWyIijiWqGhohHEguh3FFiSC7fu3aE0YhDUiM883eCtLyqCGdZmUSBW
0JzOo7wsFuyhAvH343aszVE5jG4sNXjLbC0AXdt0q5Tomhx0V/Cu7RXqeWDdrgcj
KiE/LTJXhMRrC8lJL40nbdgda2LHfW/q+kD2XJ81Ns1QcQMQCc45JBpGxckwwwpD
PqL3M9KgwMoO6Ud3pEijknDQPFK3Lw3ERO34R4F1druS6JzQ9auTPClINCKZW1KS
eVKPA6KUb2oXkNhAwsknlDIpMituAWjnvjyx6HbNX1RVLv7543uzH5t/MeHQfSMR
i1QiRdfcq6EKV+ieV/M/gof7pIjlRAWHSA5rhAAHFAi00pvokUotPnW00pTJBt1O
wIu3S2zkfnmc3PAYNoWORQ5W/E/gMPRR9HAPahYvkAuz2OEaLSsMafcLEEvqWkHm
/+YyvH04sxrmeEkHurmNcbD+1KUCxaqvOlcnVv9yMr2STGVDPoRybu/wiohUGLIU
axEpuz/1yzJuABWCCRfBOy9dNNNIRVMXn0ePxOX1SrOL1DgaCr4hTniTjmSSTdcU
TFgsQqMIKBVfGQLpjm1u1z2BjWFsCO3SON9O43C6k0loPaI9JRRZCaH3ZRBvkPhz
wvRKMBeqo9i9IOUvDD71/ZUwxkbvbgsqLrZsxS2sxDX7PZHkVmA=
=6s8m
-----END PGP SIGNATURE-----

--2sb4fvqap5cschar--

--===============1074944387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1074944387==--
