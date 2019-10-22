Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Date: Mon, 21 Oct 2019 22:00:39 -0300
Message-ID: <20191022010032.pgqop52v4gz5omlc@smtp.gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v7 i-g-t 4/4] kms_writeback: Add
 writeback-check-output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1082459543=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Simon Ser <contact@emersion.fr>, Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1082459543==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="djxf3u7nx2yfw33z"
Content-Disposition: inline


--djxf3u7nx2yfw33z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add a test which makes commits using the writeback connector, and
checks the output buffer hash to make sure it is/isn't written as
appropriate.

V6: Simon Ser
 - Add igt documentation with igt_describe
 - Replace int ret by unsigned int fd_id when calling igt_create_fb
 - Add a descriptive error message if sync_fence_wait fail
 - Replace color_idx variable by i
 - Use in_fb instead of out_fb for getting the expected CRC
 - Drop unnecessary parentheses
 - Replace igt_fb_mod_to_tiling to DRM_FORMAT_MOD_LINEAR

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
[rebased and updated the patch to address feedback]
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 tests/kms_writeback.c | 123 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index a373ec4d..068595b9 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -30,6 +30,7 @@
 #include "igt.h"
 #include "igt_core.h"
 #include "igt_fb.h"
+#include "sw_sync.h"
=20
 IGT_TEST_DESCRIPTION("Exercise writeback feature.");
=20
@@ -196,6 +197,115 @@ static void writeback_test_fb(igt_output_t *output, i=
gt_fb_t *valid_fb, igt_fb_t
 	igt_assert(ret =3D=3D -EINVAL);
 }
=20
+static void fill_fb(igt_fb_t *fb, double color[3])
+{
+	cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
+	igt_assert(cr);
+
+	igt_paint_color(cr, 0, 0, fb->width, fb->height,
+			color[0], color[1], color[2]);
+}
+
+static void get_and_wait_out_fence(igt_output_t *output)
+{
+	int ret;
+
+	igt_assert(output->writeback_out_fence_fd >=3D 0);
+
+	ret =3D sync_fence_wait(output->writeback_out_fence_fd, 1000);
+	igt_assert_f(ret =3D=3D 0, "sync_fence_wait failed: %s\n", strerror(-ret)=
);
+	close(output->writeback_out_fence_fd);
+	output->writeback_out_fence_fd =3D -1;
+}
+
+static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
+				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
+{
+	int i;
+	double in_fb_colors[2][3] =3D {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+	};
+	double clear_color[3] =3D { 1.0, 1.0, 1.0 };
+	igt_crc_t cleared_crc, out_expected;
+
+	for (i =3D 0; i < n_commits; i++) {
+		/* Change the input color each time */
+		fill_fb(in_fb, in_fb_colors[i % 2]);
+
+		if (out_fbs[i]) {
+			igt_crc_t out_before;
+
+			/* Get the expected CRC */
+			igt_fb_get_crc(in_fb, &out_expected);
+
+			fill_fb(out_fbs[i], clear_color);
+			if (i =3D=3D 0)
+				igt_fb_get_crc(out_fbs[i], &cleared_crc);
+			igt_fb_get_crc(out_fbs[i], &out_before);
+			igt_assert_crc_equal(&cleared_crc, &out_before);
+		}
+
+		/* Commit */
+		igt_plane_set_fb(plane, in_fb);
+		igt_output_set_writeback_fb(output, out_fbs[i]);
+
+		igt_display_commit_atomic(output->display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET,
+					  NULL);
+		if (out_fbs[i])
+			get_and_wait_out_fence(output);
+
+		/* Make sure the old output buffer is untouched */
+		if (i > 0 && out_fbs[i - 1] && out_fbs[i] !=3D out_fbs[i - 1]) {
+			igt_crc_t out_prev;
+			igt_fb_get_crc(out_fbs[i - 1], &out_prev);
+			igt_assert_crc_equal(&cleared_crc, &out_prev);
+		}
+
+		/* Make sure this output buffer is written */
+		if (out_fbs[i]) {
+			igt_crc_t out_after;
+			igt_fb_get_crc(out_fbs[i], &out_after);
+			igt_assert_crc_equal(&out_expected, &out_after);
+
+			/* And clear it, for the next time */
+			fill_fb(out_fbs[i], clear_color);
+		}
+	}
+}
+
+static void writeback_check_output(igt_output_t *output, igt_plane_t *plan=
e,
+				   igt_fb_t *input_fb, igt_fb_t *output_fb)
+{
+	igt_fb_t *out_fbs[2] =3D { 0 };
+	igt_fb_t second_out_fb;
+	unsigned int fb_id;
+
+	/* One commit, with a writeback. */
+	writeback_sequence(output, plane, input_fb, &output_fb, 1);
+
+	/* Two commits, the second with no writeback */
+	out_fbs[0] =3D output_fb;
+	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+
+	/* Two commits, both with writeback */
+	out_fbs[1] =3D output_fb;
+	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+
+	fb_id =3D igt_create_fb(output_fb->fd,
+			      output_fb->width, output_fb->height,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR, &second_out_fb);
+	igt_require(fb_id > 0);
+
+	/* Two commits, with different writeback buffers */
+	out_fbs[1] =3D &second_out_fb;
+	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+
+	igt_remove_fb(output_fb->fd, &second_out_fb);
+}
+
 igt_main
 {
 	igt_display_t display;
@@ -283,6 +393,19 @@ igt_main
 		igt_remove_fb(display.drm_fd, &invalid_fb);
 	}
=20
+	igt_describe("Check writeback output with CRC validation");
+	igt_subtest("writeback-check-output") {
+		igt_fb_t output_fb;
+		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
+				      mode.vdisplay, DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &output_fb);
+		igt_require(fb_id > 0);
+
+		writeback_check_output(output, plane, &input_fb, &output_fb);
+
+		igt_remove_fb(display.drm_fd, &output_fb);
+	}
+
 	igt_fixture {
 		igt_remove_fb(display.drm_fd, &input_fb);
 		igt_display_fini(&display);
--=20
2.23.0

--djxf3u7nx2yfw33z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2uVLAACgkQWJzP/com
vP+9IQ//adu1lutL5PTf3kcv3DQ4FmiXzSOd0AfghS0/P4aWebpd+bHFohw5U1JI
6KUP0pAEu1FmcqdiXgNAWWpNymoowfO8rKgpPzjHaNvcFnJ2YpgLUa8dtnx2Gyys
qvrX/3puV4Fpx0eqlad1kGuJRhyeiff4zCk9fb/6uPn4xBA98d+RIGwy+CBUpINJ
OX97fo91Bzx0BMELgjsyIMBMU5yxtkDcFyJLFjpVkAtC9mpmo0CX+cImClmG+rXC
EAQNo+rtei+JMip0Zz3LJupUrFcEeWlS/G1Pma2d0X6tSvc4sq12oq2mT6PXOU2J
53nyqoaJ34qK7Vsyhq8ZP+H02nPE+p+p/tLnANxcoDmhfX4/JaWLEOQJMF2kj3cx
zdWcn1JUD7Ggg9Go0GUdb0GamLmA83UVdZLyGefoU8jD31hl50A5wtxjfVANV5Ut
D0KjeC0RzlKtkFXXHbPDKx+zOkcYfMT9ctDTB5fAj+peVI0uvn1+whN9nqXOvfat
CmKWSG+QgVubcrCJEEtSbNEcWZOJhSDFl/Z/4dMw8o3dwiigngJZ6BFIL9lT8tc2
U+USaYiy7XxALVGI6z10+c51H6B/wrCcVFKgkHQauAZ/yKZJr6FkP3lbG7ynInVf
BL8Swtawhv0IaykP3To4lJk8iitbjmExU09UffGtvHpFsItRH3A=
=dQMi
-----END PGP SIGNATURE-----

--djxf3u7nx2yfw33z--

--===============1082459543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1082459543==--
