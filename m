Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 23:18:34 -0300
Message-ID: <9f4a3f1d1c9df084ec2bf8e9b7475bbeda5f0985.1560374714.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH V6 i-g-t 5/6] lib/igt_kms: Add
 igt_output_clone_pipe for cloning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1180689591=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1180689591==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7byqtfc4uttemljc"
Content-Disposition: inline


--7byqtfc4uttemljc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

An output can be added as a clone of any other output(s) attached to a
pipe using igt_output_clone_pipe()

v5: Drop field out_fence_requested from struct igt_pipe (Brian Starkey)

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
---
 lib/igt_kms.c | 100 +++++++++++++++++++++++++++++++-------------------
 lib/igt_kms.h |   4 ++
 2 files changed, 66 insertions(+), 38 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 140db346..b85a0404 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1765,6 +1765,17 @@ static void igt_display_log_shift(igt_display_t *dis=
play, int shift)
 	igt_assert(display->log_shift >=3D 0);
 }
=20
+static int igt_output_idx(igt_output_t *output)
+{
+	int i;
+
+	for (i =3D 0; i < output->display->n_outputs; i++)
+		if (&output->display->outputs[i] =3D=3D output)
+			return i;
+
+	return -1;
+}
+
 static void igt_output_refresh(igt_output_t *output)
 {
 	igt_display_t *display =3D output->display;
@@ -2317,42 +2328,6 @@ void igt_display_fini(igt_display_t *display)
 	display->planes =3D NULL;
 }
=20
-static void igt_display_refresh(igt_display_t *display)
-{
-	igt_output_t *output;
-	int i;
-
-	unsigned long pipes_in_use =3D 0;
-
-       /* Check that two outputs aren't trying to use the same pipe */
-	for (i =3D 0; i < display->n_outputs; i++) {
-		output =3D &display->outputs[i];
-
-		if (output->pending_pipe !=3D PIPE_NONE) {
-			if (pipes_in_use & (1 << output->pending_pipe))
-				goto report_dup;
-
-			pipes_in_use |=3D 1 << output->pending_pipe;
-		}
-
-		if (output->force_reprobe)
-			igt_output_refresh(output);
-	}
-
-	return;
-
-report_dup:
-	for (; i > 0; i--) {
-		igt_output_t *b =3D &display->outputs[i - 1];
-
-		igt_assert_f(output->pending_pipe !=3D
-			     b->pending_pipe,
-			     "%s and %s are both trying to use pipe %s\n",
-			     igt_output_name(output), igt_output_name(b),
-			     kmstest_pipe_name(output->pending_pipe));
-	}
-}
-
 static igt_pipe_t *igt_output_get_driving_pipe(igt_output_t *output)
 {
 	igt_display_t *display =3D output->display;
@@ -2376,6 +2351,40 @@ static igt_pipe_t *igt_output_get_driving_pipe(igt_o=
utput_t *output)
 	return &display->pipes[pipe];
 }
=20
+static void igt_display_refresh(igt_display_t *display)
+{
+	igt_output_t *output;
+	igt_pipe_t *pipe;
+	int i;
+
+	unsigned long pipes_in_use =3D 0;
+	unsigned long pending_crtc_idx_mask;
+
+	/* Check that outputs and pipes agree wrt. cloning */
+	for (i =3D 0; i < display->n_outputs; i++) {
+		output =3D &display->outputs[i];
+		pending_crtc_idx_mask =3D 1 << output->pending_pipe;
+
+		pipe =3D igt_output_get_driving_pipe(output);
+		if (pipe) {
+			igt_assert_f(pipe->outputs & (1 << igt_output_idx(output)),
+				     "Output %s not expected to be using pipe %s\n",
+				     igt_output_name(output),
+				     kmstest_pipe_name(pipe->pipe));
+
+			if (pipes_in_use & pending_crtc_idx_mask)
+				LOG(display, "Output %s clones pipe %s\n",
+				    igt_output_name(output),
+				    kmstest_pipe_name(pipe->pipe));
+		}
+
+		pipes_in_use |=3D pending_crtc_idx_mask;
+
+		if (output->force_reprobe)
+			igt_output_refresh(output);
+	}
+}
+
 static igt_plane_t *igt_pipe_get_plane(igt_pipe_t *pipe, int plane_idx)
 {
 	igt_require_f(plane_idx >=3D 0 && plane_idx < pipe->n_planes,
@@ -3766,6 +3775,7 @@ void igt_output_override_mode(igt_output_t *output, c=
onst drmModeModeInfo *mode)
 	output->use_override_mode =3D !!mode;
=20
 	if (pipe) {
+		igt_debug("overriding pipe mode in %s way\n", output->display->is_atomic=
 ? "atomic" : "legacy");
 		if (output->display->is_atomic)
 			igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, igt_output_get_m=
ode(output), sizeof(*mode));
 		else
@@ -3773,6 +3783,16 @@ void igt_output_override_mode(igt_output_t *output, =
const drmModeModeInfo *mode)
 	}
 }
=20
+void igt_output_clone_pipe(igt_output_t *output, enum pipe pipe)
+{
+	igt_display_t *display =3D output->display;
+	uint32_t current_clones =3D display->pipes[pipe].outputs;
+
+	igt_output_set_pipe(output, pipe);
+
+	display->pipes[pipe].outputs |=3D current_clones;
+}
+
 /*
  * igt_output_set_pipe:
  * @output: Target output for which the pipe is being set to
@@ -3789,11 +3809,15 @@ void igt_output_set_pipe(igt_output_t *output, enum=
 pipe pipe)
=20
 	igt_assert(output->name);
=20
-	if (output->pending_pipe !=3D PIPE_NONE)
+	if (output->pending_pipe !=3D PIPE_NONE) {
 		old_pipe =3D igt_output_get_driving_pipe(output);
+		old_pipe->outputs &=3D ~(1 << igt_output_idx(output));
+	}
=20
-	if (pipe !=3D PIPE_NONE)
+	if (pipe !=3D PIPE_NONE) {
 		pipe_obj =3D &display->pipes[pipe];
+		pipe_obj->outputs =3D (1 << igt_output_idx(output));
+	}
=20
 	LOG(display, "%s: set_pipe(%s)\n", igt_output_name(output),
 	    kmstest_pipe_name(pipe));
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index cacc6b90..676839bb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -354,6 +354,8 @@ struct igt_pipe {
 	uint32_t crtc_id;
=20
 	int32_t out_fence_fd;
+
+	uint32_t outputs;
 };
=20
 typedef struct {
@@ -411,6 +413,8 @@ const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo =
*mode);
 void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
+void igt_output_clone_pipe(igt_output_t *output, enum pipe pipe);
+
 igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
 igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_typ=
e);
 int igt_output_count_plane_type(igt_output_t *output, int plane_type);
--=20
2.21.0

--7byqtfc4uttemljc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0BsnkACgkQWJzP/com
vP/JbxAAqEyGH2bXKe5R8MMDuiVaaDPO9WnbtSVgUnf7y2WMgnsJF77Rp3FfNz+D
An60aoQ+9AM04AYf19rCgrki644Iw3GcE1NsDPSCWLYSzeEQjX+yF/thY7GYQx/V
itchu+JkOM9ZXi2PrgmNg7k1EKQJjXU/F9K8H6r4iDx7YGAo/IGm85X5Ms5ChV1J
pOp8g7SoiQfGiGFQaRyBCC0lgCCS5ltq2FPqPArc5ODonUOgGzNpYBAN5orVp8Oa
YCC2DT9VAhbcZozowhI6Sg9psbvpjKKLq7u3bxwNTBqzX+tz692cl+Uz8LpfQk0P
9ZdyCO/tnnjBesKnEbKFXC3pM/PLQCW9U/F7kg8KgZXH45XbSUwbFwe9gOXICUj8
CW3LqQAXbQaO7EBPOmy2uBYMhsfm3EwgcZeA6mO6i1btvHNUZqyqbTVtEyM4aMmP
7YlxMe7uO8C+tPrOGNMuEcpHQFxNlXMOHWoZhnyEspBlDlAbnCzrAdPxPcrAZfZK
t9V2Mxvx6O1y4WueDuPB0ocp207IJsus5AxwwJp6EK5oe7mCr50EZk9t9CSBZBaO
o8BP6cqTfdkmhsNVE/UUVD4NiyH+JqPsxu3YBwTLSmZF+ZQ/c0ryTNd1o0FUvlPC
xnbNttzF6SL3XZj2jmwdSqOnpN5q8FrDzfLhZI39qrxGz0LSvyg=
=GTdj
-----END PGP SIGNATURE-----

--7byqtfc4uttemljc--

--===============1180689591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1180689591==--
