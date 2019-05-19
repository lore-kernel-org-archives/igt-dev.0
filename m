Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Sun, 19 May 2019 20:00:36 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190519230036.y73fer7uq4i7lpat@smtp.gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH V2 i-g-t] lib: Drop __kms_addfb() wrapper
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2012715975=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============2012715975==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dlulvy3vwqzgcvoq"
Content-Disposition: inline


--dlulvy3vwqzgcvoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The function __kms_addfb() and drmModeAddFB2WithModifiers() have a
similar code. Due to this similarity, this commit replaces all the
occurrences of  __kms_addfb() by drmModeAddFB2WithModifiers() and adds
the required adaptations.

V1: Arkadiusz Hiler
 - Fix array initialization
 - Drop __kms_addfb()

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 lib/igt_fb.c                    | 14 +++++++++-----
 lib/ioctl_wrappers.c            | 33 ---------------------------------
 lib/ioctl_wrappers.h            | 11 -----------
 tests/kms_available_modes_crc.c | 14 +++++++++-----
 tests/kms_draw_crc.c            | 10 ++++++----
 tests/prime_vgem.c              | 14 ++++++++------
 6 files changed, 32 insertions(+), 64 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d4929019..bac3b21c 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1235,6 +1235,9 @@ igt_create_fb_with_bo_size(int fd, int width, int hei=
ght,
 			   struct igt_fb *fb, uint64_t bo_size,
 			   unsigned bo_stride)
 {
+	uint32_t handles[4] =3D {};
+	uint64_t modifiers[4] =3D {};
+
 	/* FIXME allow the caller to pass these in */
 	enum igt_color_encoding color_encoding =3D IGT_COLOR_YCBCR_BT709;
 	enum igt_color_range color_range =3D IGT_COLOR_YCBCR_LIMITED_RANGE;
@@ -1262,11 +1265,12 @@ igt_create_fb_with_bo_size(int fd, int width, int h=
eight,
 	if (fb->modifier || igt_has_fb_modifiers(fd))
 		flags =3D LOCAL_DRM_MODE_FB_MODIFIERS;
=20
-	do_or_die(__kms_addfb(fb->fd, fb->gem_handle,
-			      fb->width, fb->height,
-			      fb->drm_format, fb->modifier,
-			      fb->strides, fb->offsets, fb->num_planes, flags,
-			      &fb->fb_id));
+	memset(handles, fb->gem_handle, fb->num_planes);
+	memset(modifiers, modifier, fb->num_planes);
+	do_or_die(drmModeAddFB2WithModifiers(fb->fd, fb->width, fb->height,
+					     fb->drm_format, handles,
+					     fb->strides, fb->offsets,
+					     modifiers, &fb->fb_id, flags));
=20
 	return fb->fb_id;
 }
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 280fdd62..0f00971d 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1453,36 +1453,3 @@ void igt_require_fb_modifiers(int fd)
 {
 	igt_require(igt_has_fb_modifiers(fd));
 }
-
-int __kms_addfb(int fd, uint32_t handle,
-		uint32_t width, uint32_t height,
-		uint32_t pixel_format, uint64_t modifier,
-		uint32_t strides[4], uint32_t offsets[4],
-		int num_planes, uint32_t flags, uint32_t *buf_id)
-{
-	struct drm_mode_fb_cmd2 f;
-	int ret, i;
-
-	if (flags & DRM_MODE_FB_MODIFIERS)
-		igt_require_fb_modifiers(fd);
-
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
-}
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 03211c97..4afc3e09 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -209,17 +209,6 @@ struct local_drm_mode_fb_cmd2 {
 bool igt_has_fb_modifiers(int fd);
 void igt_require_fb_modifiers(int fd);
=20
-/**
- * __kms_addfb:
- *
- * Creates a framebuffer object.
- */
-int __kms_addfb(int fd, uint32_t handle,
-		uint32_t width, uint32_t height,
-		uint32_t pixel_format, uint64_t modifier,
-		uint32_t strides[4], uint32_t offsets[4],
-		int num_planes, uint32_t flags, uint32_t *buf_id);
-
 /**
  * to_user_pointer:
  *
diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_cr=
c.c
index 50b5522a..9e5f1fd5 100644
--- a/tests/kms_available_modes_crc.c
+++ b/tests/kms_available_modes_crc.c
@@ -172,9 +172,10 @@ static bool setup_fb(data_t *data, igt_output_t *outpu=
t, igt_plane_t *plane,
 {
 	drmModeModeInfo *mode;
 	uint64_t w, h;
+	uint32_t handles[4] =3D {};
+	uint64_t modifiers[4] =3D {};
 	signed ret, gemsize =3D 0;
 	unsigned tile_width, tile_height;
-	int num_planes =3D 1;
 	uint64_t tiling;
 	int bpp =3D 0;
 	int i;
@@ -225,10 +226,13 @@ static bool setup_fb(data_t *data, igt_output_t *outp=
ut, igt_plane_t *plane,
=20
 	igt_assert_eq(ret, 0);
=20
-	ret =3D __kms_addfb(data->gfx_fd, data->gem_handle, w, h,
-			  format, tiling, data->fb.strides, data->fb.offsets,
-			  num_planes, LOCAL_DRM_MODE_FB_MODIFIERS,
-			  &data->fb.fb_id);
+	memset(handles, data->gem_handle, 1);
+	memset(modifiers, tiling, 1);
+	ret =3D drmModeAddFB2WithModifiers(data->gfx_fd, w, h, format,
+					 handles, data->fb.strides,
+					 data->fb.offsets, modifiers,
+					 &data->fb.fb_id,
+					 LOCAL_DRM_MODE_FB_MODIFIERS);
=20
 	if(ret < 0) {
 		igt_info("Creating fb for format %s failed, return code %d\n",
diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index ea14db9a..507e6a7c 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -155,17 +155,19 @@ static void get_method_crc(enum igt_draw_method metho=
d, uint32_t drm_format,
=20
 static bool format_is_supported(uint32_t format, uint64_t modifier)
 {
-	uint32_t gem_handle, fb_id;
+	uint32_t gem_handle, fb_id, handles[4] =3D {};
 	unsigned int offsets[4] =3D {};
 	unsigned int strides[4] =3D {};
+	uint64_t modifiers[4] =3D {};
 	int ret;
=20
 	gem_handle =3D igt_create_bo_with_dimensions(drm_fd, 64, 64,
 						   format, modifier,
 						   0, NULL, &strides[0], NULL);
-	ret =3D  __kms_addfb(drm_fd, gem_handle, 64, 64,
-			   format, modifier, strides, offsets, 1,
-			   LOCAL_DRM_MODE_FB_MODIFIERS, &fb_id);
+	memset(handles, gem_handle, 1);
+	ret =3D drmModeAddFB2WithModifiers(drm_fd, 64, 64, format, handles,
+					 strides, offsets, modifiers, &fb_id,
+					 LOCAL_DRM_MODE_FB_MODIFIERS);
 	drmModeRmFB(drm_fd, fb_id);
 	gem_close(drm_fd, gem_handle);
=20
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 09e3373b..286957e8 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -761,6 +761,7 @@ static void test_flip(int i915, int vgem, unsigned hang)
 	for (int i =3D 0; i < 2; i++) {
 		uint32_t strides[4] =3D {};
 		uint32_t offsets[4] =3D {};
+		uint32_t handles[4] =3D {};
 		int fd;
=20
 		bo[i].width =3D mode->hdisplay;
@@ -776,12 +777,13 @@ static void test_flip(int i915, int vgem, unsigned ha=
ng)
 		strides[0] =3D bo[i].pitch;
=20
 		/* May skip if i915 has no displays */
-		igt_require(__kms_addfb(i915, handle[i],
-					bo[i].width, bo[i].height,
-					DRM_FORMAT_XRGB8888, I915_TILING_NONE,
-					strides, offsets, 1,
-					LOCAL_DRM_MODE_FB_MODIFIERS,
-					&fb_id[i]) =3D=3D 0);
+		memset(handles, handle[i],1);
+		igt_require(drmModeAddFB2WithModifiers(i915, bo[i].width, bo[i].height,
+						       DRM_FORMAT_XRGB8888,
+						       handles, strides, offsets,
+						       I915_TILING_NONE, &fb_id[i],
+						       LOCAL_DRM_MODE_FB_MODIFIERS) =3D=3D 0);
+
 		igt_assert(fb_id[i]);
 	}
=20
--=20
2.21.0

--dlulvy3vwqzgcvoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlzh4BMACgkQWJzP/com
vP/iZRAArqgDnM2Q2Gm2Ep9b9aFS431U3ifNQWTewmXzZK4c1Yh8k1BL8eGYcXyz
qwEUGq9idQIFSyYV9aMKGKf5gMBQWeqjfrHnL021xZn94K3dkXIb+dAlG3/OsAl1
HC5XO/z9X2Mf+VeE6q0IuGJY0QSsl7PL8q0mpRv4a9oumJjpfpQ/SlJXI2STUiCh
d7ZeFc+HBr312IgAw5hc3XPNk6sUbxdN67TcosHb25WjhJ2Il0Mby4idLnW7Secg
BOZKr/FOVu0zkbuoCy4TYnE+4ZZJ95/ryRsQbqxXETGuDO2D+q/CyAHbDr1qw3p3
j5PRIbSEdBOdE9BkDctuz5by26QD5ca1iSura9h0cBM1T42GFnxMnlFzcRkhme9e
SuhJP0SHb81lm+4xU6d6ysGY1sny01ZTuDrKKd785NwVNM13N0vxZMU9Str6AT6U
yRAC21B1o76PG4mxzqecLufSqjPM2TUu7OTenxtCXLaY6Q7t+HptLrBjozJbB5G4
B9QZ3gCZ7/LhHI0foegtFJpSu30xlIUGRx/BxUhrc+2Bi+cKV/HIBVtMCuRnS+Va
5qR9QZXaH45NEBvSg16SMD9eeDU6mfHB/355WqdavXOFSW7zTR6FFmjAhHNfcRvL
BrurZ2xqFFkloLK9fMDG6XgujLV0VF7M/4AGrdhWSJo36vMt2V8=
=d3Ag
-----END PGP SIGNATURE-----

--dlulvy3vwqzgcvoq--

--===============2012715975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============2012715975==--
