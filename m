Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 3 Apr 2019 19:24:39 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190403222439.jidjcpw7ywd6eomz@smtp.gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Rework __kms_addfb() function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0261247315=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0261247315==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7jwsye3ydyvdcffs"
Content-Disposition: inline


--7jwsye3ydyvdcffs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The function __kms_addfb() and drmModeAddFB2WithModifiers() have a
similar code. Due to this similarity, this commit replace part of the
code inside __kms_addfb() by using drmModeAddFB2WithModifiers().

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 lib/ioctl_wrappers.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 39920f87..4240d138 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -46,6 +46,7 @@
 #include <sys/utsname.h>
 #include <termios.h>
 #include <errno.h>
+#include <xf86drmMode.h>
=20
 #include "drmtest.h"
 #include "i915_drm.h"
@@ -1479,29 +1480,13 @@ int __kms_addfb(int fd, uint32_t handle,
 		uint32_t strides[4], uint32_t offsets[4],
 		int num_planes, uint32_t flags, uint32_t *buf_id)
 {
-	struct drm_mode_fb_cmd2 f;
-	int ret, i;
+	uint32_t handles[4] =3D {handle};
+	uint64_t modifiers[4] =3D {modifier};
=20
 	if (flags & DRM_MODE_FB_MODIFIERS)
 		igt_require_fb_modifiers(fd);
=20
-	memset(&f, 0, sizeof(f));
-
-	f.width  =3D width;
-	f.height =3D height;
-	f.pixel_format =3D pixel_format;
-	f.flags =3D flags;
-
-	for (i =3D 0; i < num_planes; i++) {
-		f.handles[i] =3D handle;
-		f.modifier[i] =3D modifier;
-		f.pitches[i] =3D strides[i];
-		f.offsets[i] =3D offsets[i];
-	}
-
-	ret =3D igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
-
-	*buf_id =3D f.fb_id;
-
-	return ret < 0 ? -errno : ret;
+	return drmModeAddFB2WithModifiers(fd, width, height, pixel_format,
+					  handles, strides, offsets, modifiers,
+					  buf_id, flags);
 }
--=20
2.21.0

--7jwsye3ydyvdcffs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlylMqcACgkQWJzP/com
vP/j4g/7BOv5fePaqIa1F/tRh12WVh/clygP+MqunKiBr6g7vP/iTh4mqkgE2KP1
e3pqkEIfGvxH/HhygZ/RzK+kDYcdRU8WJvkJo9QiiOGZbo77PEyu5QTrueQN0WsP
89Jk8ZhVmHurMyEnNoNsd0XoaLHf5HqI/uJmFOMpnd/ElITLIUIRfWFRFY+PbdnF
Pi6X8sjI22Kcjx0Ibkia/QPNkvqNrqmC70sHaOY3FPfaovvQdAS7IZiefaHbyQI/
nusIb5P3RrrrIf2w7ft75HLN9QlYW3l3wPFW+v6rzByFvYJOYElYQxtjaM2ForuC
MSi0/ls6FHW/NRhG3EkP9aph0aLuxWhJOTOcFWTgn2cgfM9a6bph9r+HaXNjV902
2cKQYeOOL2pmeAoBWLqgaP+X5Km6BC3LTIOtJS7ovEr1/pq9vi6aZVkui5vSzd3Z
TjNEVduouxUSJN9fiq/0YVpB+sv4J4ejEMNbiAN3bJ+mWe5vlykt6n24UfTtFMxM
4s9RwkMNb6bV7/SYmGlRdjzAd6k2hdnKvKVV3+neqsantab/pLyF8KjGX88EWiCI
5IYhEjS3pX+7P2rlnncE92OarT/3XeKuI8S2dhW9wex0FXSfDhRnob+vTiikBym2
ZCRcCqYQwb2/f4Xz7rKSwa9gHjpLxXM12EHL8Wwz5h49Vl3zm+o=
=sYzN
-----END PGP SIGNATURE-----

--7jwsye3ydyvdcffs--

--===============0261247315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0261247315==--
