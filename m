Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 23:19:01 -0300
Message-ID: <454e4369191d599d038196429af4a242f4f0e5fb.1560374714.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH V6 i-g-t 6/6] kms_writeback: Add tests using a
 cloned output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0615998204=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0615998204==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bfu7rleetth4ub25"
Content-Disposition: inline


--bfu7rleetth4ub25
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Update the connector search to also optionally attempt to find a
non-writeback connector to clone to.

Add a subtest which is the same as writeback-check-output, but also
clones to the second connector.

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
[rebased and addressed comments by Maarten]
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
---
 tests/kms_writeback.c | 64 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 0f20dadd..ae536bbf 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -51,7 +51,8 @@ static drmModePropertyBlobRes *get_writeback_formats_blob=
(igt_output_t *output)
 	return blob;
 }
=20
-static bool check_writeback_config(igt_display_t *display, igt_output_t *o=
utput)
+static bool check_writeback_config(igt_display_t *display, igt_output_t *o=
utput,
+				   int pipe, igt_output_t **clone)
 {
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
@@ -91,6 +92,30 @@ static bool check_writeback_config(igt_display_t *displa=
y, igt_output_t *output)
=20
 	ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
 					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (!ret && clone) {
+		/* Try and find a clone */
+		int i, newret;
+		*clone =3D NULL;
+
+		for (i =3D 0; i < display->n_outputs; i++) {
+			igt_output_t *second_output =3D &display->outputs[i];
+			if (output !=3D second_output &&
+			    igt_pipe_connector_valid(pipe, second_output)) {
+
+				igt_output_clone_pipe(second_output, pipe);
+				igt_output_override_mode(output, &override_mode);
+				newret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST=
_ONLY |
+								       DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+				igt_output_set_pipe(second_output, PIPE_NONE);
+				igt_debug("try_commit_atomic clone returned %d\n", newret);
+				if (!newret) {
+					*clone =3D second_output;
+					igt_debug("Selected clone %s\n", (*clone)->name);
+					break;
+				}
+			}
+		}
+	}
 	igt_plane_set_fb(plane, NULL);
 	igt_remove_fb(display->drm_fd, &input_fb);
 	igt_remove_fb(display->drm_fd, &output_fb);
@@ -98,7 +123,8 @@ static bool check_writeback_config(igt_display_t *displa=
y, igt_output_t *output)
 	return !ret;
 }
=20
-static igt_output_t *kms_writeback_get_output(igt_display_t *display)
+static igt_output_t *kms_writeback_get_output(igt_display_t *display, enum=
 pipe *pipe,
+					      igt_output_t **clone)
 {
 	int i;
=20
@@ -114,10 +140,16 @@ static igt_output_t *kms_writeback_get_output(igt_dis=
play_t *display)
 		for (j =3D 0; j < igt_display_get_n_pipes(display); j++) {
 			igt_output_set_pipe(output, j);
=20
-			if (check_writeback_config(display, output)) {
+			if (check_writeback_config(display, output, j, clone)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
 					  output->name, j);
+				if (clone && *clone)
+					igt_debug("Cloning to connector %u:%s\n",
+						  (*clone)->config.connector->connector_id,
+						  (*clone)->name);
+				if (pipe)
+					*pipe =3D j;
 				return output;
 			}
 		}
@@ -335,10 +367,11 @@ static void writeback_check_output(igt_output_t *outp=
ut, igt_plane_t *plane,
 igt_main
 {
 	igt_display_t display;
-	igt_output_t *output;
+	igt_output_t *output, *clone;
 	igt_plane_t *plane;
 	igt_fb_t input_fb;
 	drmModeModeInfo mode;
+	enum pipe pipe;
 	int ret;
=20
 	memset(&display, 0, sizeof(display));
@@ -353,7 +386,7 @@ igt_main
=20
 		igt_require(display.is_atomic);
=20
-		output =3D kms_writeback_get_output(&display);
+		output =3D kms_writeback_get_output(&display, &pipe, &clone);
 		igt_require(output);
=20
 		if (output->use_override_mode)
@@ -431,6 +464,27 @@ igt_main
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
=20
+	igt_subtest("writeback-check-output-clone") {
+		igt_fb_t output_fb;
+
+		igt_require(clone);
+
+		ret =3D igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    igt_fb_mod_to_tiling(0),
+				    &output_fb);
+		igt_require(ret > 0);
+
+		igt_output_clone_pipe(clone, pipe);
+		igt_output_override_mode(clone, &mode);
+
+		writeback_check_output(output, plane, &input_fb, &output_fb);
+
+		igt_output_set_pipe(clone, PIPE_NONE);
+
+		igt_remove_fb(display.drm_fd, &output_fb);
+	}
+
 	igt_fixture {
 		igt_remove_fb(display.drm_fd, &input_fb);
 		igt_display_fini(&display);
--=20
2.21.0


--bfu7rleetth4ub25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0BspQACgkQWJzP/com
vP9T4g//Ro2NtAwqtfFghWibAdiM26gbDHRD3cYMuXm3M29Zh1VEjCZXNLrbygHL
RlB8kbUf1ZcaHr94+3rZgke53C0Aq8xMvm8mF3aqQk6b4oJmNHwVzY3RnB3iXpuQ
KCMl8z1tMJv3b8CAa9hvJfxCAcej23EDUYirw+AtvfZjwp3OO3vmi7E5CR2Mpe7g
VBnPqkWWC3HOzK0+HurUbfEzEqXKrUBHHquWYQU4ltrc0wWRq3If+ZIOM3JUfetJ
gjTOrX8OIFyjvyui4xe7qw8GC2G9HrgECLb5XxGZmJ+EJUlzIqZPdrLNqlVdNVpR
rimfaMnSLjKexyviiAwr2TuOsxWcLPWUzd55SD6xu6lw2XYE6oAGD/MXyA4HmDMk
mBmGnLin/UgKTm9vGWFtkshduoBJiOyFXK185x4nT6adFI8zb6LhAIuYDHA/EGZ9
HFCqTPOoF+MXoHf8sgdbTMFVwTDvxmcc50nKK/Y7nI2ml1waq8QspxHWHZN/p+nH
2uZAfRtlevM0L6fi89u38QkLQlM198Yr0fkVQ8L8HYaENG64KKQ8SbC5nNiUcpT7
DTXbJSrX9PZzCMSUdeJDPFdjabLYXKTtYU6MwqWMTt+tRtMKFgphha+XVDfR7xcC
f50GSJVvkcvQQJu8tbfBD67kXdUUS99ZRKEHMKy6+9Mc9O/l2z0=
=aU7V
-----END PGP SIGNATURE-----

--bfu7rleetth4ub25--

--===============0615998204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0615998204==--
