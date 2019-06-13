Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 23:17:50 -0300
Message-ID: <dd44be927bff3b0b38aa4e7c31b639a5d28a5213.1560374714.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH V6 i-g-t 4/6] kms_writeback: Add
 writeback-check-output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0128023793=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0128023793==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ffjduoveexmepwm"
Content-Disposition: inline


--7ffjduoveexmepwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add a test which makes commits using the writeback connector, and
checks the output buffer hash to make sure it is/isn't written as
appropriate.

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
---
 tests/kms_writeback.c | 124 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 66ef48a6..0f20dadd 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -30,6 +30,7 @@
 #include "igt.h"
 #include "igt_core.h"
 #include "igt_fb.h"
+#include "sw_sync.h"
=20
 static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *ou=
tput)
 {
@@ -221,6 +222,116 @@ static void writeback_fb_id(igt_output_t *output, igt=
_fb_t *valid_fb, igt_fb_t *
 	igt_assert(ret =3D=3D 0);
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
+	igt_assert(ret =3D=3D 0);
+	close(output->writeback_out_fence_fd);
+	output->writeback_out_fence_fd =3D -1;
+}
+
+static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
+				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
+{
+	int i, color_idx =3D 0;
+	double in_fb_colors[2][3] =3D {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+	};
+	double clear_color[3] =3D { 1.0, 1.0, 1.0 };
+	igt_crc_t cleared_crc, out_expected;
+
+	for (i =3D 0; i < n_commits; i++, color_idx++) {
+		/* Change the input color each time */
+		fill_fb(in_fb, in_fb_colors[color_idx % 2]);
+
+		if (out_fbs[i]) {
+			igt_crc_t out_before;
+
+			/* Get the expected CRC */
+			fill_fb(out_fbs[i], in_fb_colors[color_idx % 2]);
+			igt_fb_get_crc(out_fbs[i], &out_expected);
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
+		if (i > 0 && out_fbs[i - 1] && (out_fbs[i] !=3D out_fbs[i - 1])) {
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
+	int ret;
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
+	ret =3D igt_create_fb(output_fb->fd, output_fb->width, output_fb->height,
+			    DRM_FORMAT_XRGB8888,
+			    igt_fb_mod_to_tiling(0),
+			    &second_out_fb);
+	igt_require(ret > 0);
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
@@ -307,6 +418,19 @@ igt_main
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
=20
+	igt_subtest("writeback-check-output") {
+		igt_fb_t output_fb;
+		ret =3D igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    igt_fb_mod_to_tiling(0),
+				    &output_fb);
+		igt_require(ret > 0);
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
2.21.0

--7ffjduoveexmepwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0Bsk4ACgkQWJzP/com
vP9YbQ/8CkadxKCRGthoySFWX5n5IFGacC3RWLce3LY6dkGpQFaBcI72sdUbHilE
wtCJYQ+Ymp9dvV8a5qqKFDCCgG/DSOJhBx68d2eOS7D+9Uiroih/ok7SRWHlJ8AM
ttvnZQlCzxGZrNZ/vpvWzfo8oLLANjuVuytQnVzgwRJe7W0RQmx43aICG+OCOPoh
H4Wkt3IXUYDc1+x22f5X91vZbvgO4u54Y09QE2nbrPkZchePrMQXxAHgceSwaHAq
fQkby74yTWJ/y+2wKHJbbS2CfBpENageFuympdNhdxjmZ7p2YP8IHj/xjhu+5edo
OKKUaJBUuuvqrucJc/mHWFK3yg8DHpCEbiyw//pgEvQKi33cBdcGRi+oEuF5NDHa
4Rks3pZsRWOEuxJDhNxRhU8PZiRT7isCKgmkEXtBA3ZSls0eUFveeT7FlADASTkE
RbJU6YFWxQNxj4/k7U7iQf9cumKVbdB591YYnnjruFk1gnQKCbUJINFv1VdGnwg4
bKYLHlRXm69TOHyz0dWn2qpBrH4luhwQqFuD4grpGtsYyPe2SXZtd5VxvEwO/4Xg
4zLElj4fGwmo6lBpV8vstSMtF6hPSoNMj3t5iyNln7IzRJ5ZNFvdvzx2MtGPDCPO
nEEgqmR0FNPv447AQnfHb0A4urpUhVMqNnKt22zOYiMuW9G3WEk=
=K9hN
-----END PGP SIGNATURE-----

--7ffjduoveexmepwm--

--===============0128023793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0128023793==--
