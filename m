Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 4 Mar 2019 12:30:30 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <127b743d899c62b62921dffa629cfcd469390adf.1551712108.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 3/7] kms_flip: Fix warning related to i915
 gem dependence
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0361176583=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0361176583==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ecj3rf7ntoee2hbp"
Content-Disposition: inline


--ecj3rf7ntoee2hbp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In the kms_flip tests has an igt_fixture that allocates memory for i915
driver with =E2=80=9Cdrm_intel_bufmgr_gem_init()=E2=80=9D, which produces t=
he following
warning:

 IGT-Version: 1.23-g8d81c2c2 (x86_64) (Linux: 5.0.0-rc7-VKMS-RULES+ x86_64)
 Using monotonic timestamps
 DRM_IOCTL_I915_GEM_APERTURE failed: Invalid argument
 Assuming 131072kB available aperture size.
 May lead to reduced performance or incorrect rendering.
 get chip id failed: -1 [22]

This commit handles this specific dependence with the i915 driver which
make the kms_flip logs better.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 tests/kms_flip.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 0d261b77..57138ec1 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1528,10 +1528,12 @@ int main(int argc, char **argv)
 		igt_install_exit_handler(kms_flip_exit_handler);
 		get_timestamp_format();
=20
-		bufmgr =3D drm_intel_bufmgr_gem_init(drm_fd, 4096);
-		if (bufmgr) {
-			devid =3D intel_get_drm_devid(drm_fd);
-			batch =3D intel_batchbuffer_alloc(bufmgr, devid);
+		if (is_i915_device(drm_fd)) {
+			bufmgr =3D drm_intel_bufmgr_gem_init(drm_fd, 4096);
+			if (bufmgr) {
+				devid =3D intel_get_drm_devid(drm_fd);
+				batch =3D intel_batchbuffer_alloc(bufmgr, devid);
+			}
 		}
 	}
=20
--=20
2.21.0

--ecj3rf7ntoee2hbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlx9RJUACgkQWJzP/com
vP+8kA//Z7dicukzWGJENurEO6nfLRsZMJQa8IMzQ0TWxco+lLLx0xNI3Ci3K82i
dOt9LqXiFrHqep5trH0IcqatUcNr90DE83Q4sXMgNDPH2M4EWM0OHiOBL4DZzsqY
aafMUwwh28r63jUdmCGttu1X2d3vtmv4icNBllrAnUWg5EAsIeRQcnnXrTwpCX5j
ZMiVavHUdH6Kni000SYT1YtAmCvswam7BgeV3skD5mZApHf7cDG52y9J15odAT2A
/vP7BPuhluKranff+P47msqKcQrJfififPHpRLT4iXG8E5C0EY+dDBNAnPYQsah9
xhAu0W+eFaAO00skGlmpBLBZxQdtTRQDL2rdwiiCOkTZuP8c4jYL9SI2cYQ5FW4y
HPFi5b2Ee7UL0zNBCY9sw4H7KjnNImuN5KU8VPNzSzdoDScWULoz+t9cJMqirWj2
BOVpdbpD+YsYufw/aZcG3P7EdzHR454AJgi8sFBp5zBwBGASbcM9+/O3HY7Xdh5W
cUGi2qBG+DBgHVUXRy5zyaFZBedeMb0HyLSG/RScoRrmuy73/LcXcc7xRP/kL/J1
Y343vSOTPrOJ7wUHj/0yhaTuTFROesv9y8WVQm8DrYeCC7WbDUazniM/rctFW6Ci
gBNpVaUsRR/caA/Jl3CeKzT7YhPoRiRmntTYhjJiRo5sUM8NTlE=
=ZPzW
-----END PGP SIGNATURE-----

--ecj3rf7ntoee2hbp--

--===============0361176583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0361176583==--
