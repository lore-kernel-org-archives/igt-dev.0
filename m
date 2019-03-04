Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 4 Mar 2019 12:31:20 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <d06e4c2299a6bf414560a60c8edd0ed6e89925ea.1551712108.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 5/7] kms_flip: Remove magic constant in
 run_test_on_crtc_set()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0714770129=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0714770129==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hgqpf5uv3tolp3w"
Content-Disposition: inline


--5hgqpf5uv3tolp3w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The function run_test_on_crtc_set() expects a parameter named crtc_count
which slight changes the behavior of the test. If this crtc_count is
=E2=80=981=E2=80=99, the test will run in a single CRTC; otherwise, it will=
 run in two
different CRTC. However, this function uses hardcoded literal 1 and 2
for each case. This patch creates two constant with the goal to improve
the readability.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 tests/kms_flip.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 9ef77de9..42ae3ebc 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -76,6 +76,9 @@
 #define EVENT_FLIP		(1 << 0)
 #define EVENT_VBLANK		(1 << 1)
=20
+#define RUN_TEST		1
+#define RUN_PAIR		2
+
 #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
@@ -1164,7 +1167,7 @@ static void run_test_on_crtc_set(struct test_output *=
o, int *crtc_idxs,
 	int i;
=20
 	switch (crtc_count) {
-	case 1:
+	case RUN_TEST:
 		connector_find_preferred_mode(o->_connector[0], crtc_idxs[0], o);
 		if (!o->mode_valid)
 			return;
@@ -1175,7 +1178,7 @@ static void run_test_on_crtc_set(struct test_output *=
o, int *crtc_idxs,
 			 kmstest_connector_type_str(o->kconnector[0]->connector_type),
 			 o->kconnector[0]->connector_type_id);
 		break;
-	case 2:
+	case RUN_PAIR:
 		connector_find_compatible_mode(crtc_idxs[0], crtc_idxs[1], o);
 		if (!o->mode_valid)
 			return;
@@ -1341,7 +1344,7 @@ static int run_test(int duration, int flags)
 			o.depth =3D 24;
=20
 			crtc_idx =3D n;
-			run_test_on_crtc_set(&o, &crtc_idx, 1, duration);
+			run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST, duration);
 		}
 	}
=20
@@ -1410,7 +1413,8 @@ static int run_pair(int duration, int flags)
 					crtc_idxs[0] =3D n;
 					crtc_idxs[1] =3D m;
=20
-					run_test_on_crtc_set(&o, crtc_idxs, 2,
+					run_test_on_crtc_set(&o, crtc_idxs,
+							     RUN_PAIR,
 							     duration);
 				}
 			}
--=20
2.21.0

--5hgqpf5uv3tolp3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlx9RMcACgkQWJzP/com
vP8DJA/9FOeIxHhQepK+oMjYKbyHOn9pTvGgz7dQ7Dq/w39ActciQo9gTw5Qh/Xc
siTc4i80k0eNSXgKLkRtd/s8xIHCBgH18or68OOe9xFBCvf+EHQA3dFCN7hQboSR
ts5GVjEZBlFJc6xm5717stUwggYfBXssjJSZmn/QbkJpZZpZOZ1CfFvt4As7HKPH
yWCcMOKHaoNwFZot1yziMSXdM659kMJAs/1tCtim5cOx0tKFPr6EII5V13Gt1an4
o0GAvxHFXoqHO4csdfSPvZctkiyVUFPrFFrJXbJm2t6nm/UIOLyDN+Famd0xaGSZ
xJQ3oA1rQiYWzEaurrTwjC88et+kiUWw26X3HPHIocZallTO69dqGdbCSO8kPx9u
SpX1sBudmvfDd7frwLB7C/DEVbEkxShWYDN8gj9AOoMqq6ojBJKiKJpY+CLsXHAl
qQOMpW8FWonst9KHwnWLtU8lhIF3xhrmNi4JRwFOQIJGTwx0XHrZU1EK7PoyPoBG
NvFBLUlh5R8DEa4eDVnrxXPYU0UiSoLWK5jUAzdJ0L941Huw2TUHISgnfzZD0adF
aMUPBihjMRUq58GQiO1uVKz+SgG6RgzG+olu20i4TJjzuXD8cMDNxI4BRsGT3uC/
asEintB4R9XC39hojTKSHG/O+Gl5mQvoLKKbkgMou1tWB/Wsjkw=
=DAv7
-----END PGP SIGNATURE-----

--5hgqpf5uv3tolp3w--

--===============0714770129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0714770129==--
