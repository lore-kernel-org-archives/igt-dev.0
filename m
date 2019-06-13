Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 23:16:02 -0300
Message-ID: <28eefeec574b63511909dace7df3b7e6f13c3ed1.1560374714.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
Subject: [Intel-gfx] [PATCH V6 i-g-t 1/6] lib/igt_kms: Add writeback support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0391752504=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0391752504==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ono3qqyeow4w6kkl"
Content-Disposition: inline


--ono3qqyeow4w6kkl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add support in igt_kms for writeback connectors, with the ability
to attach framebuffers.

v5: Rebase and add DRM_CLIENT_CAP_WRITEBACK_CONNECTORS before
drmModeGetResources()

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
[rebased and updated to the latest igt style]
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
---
 lib/igt_kms.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  6 ++++++
 2 files changed, 63 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index da188a39..140db346 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -325,6 +325,9 @@ const char * const igt_connector_prop_names[IGT_NUM_CON=
NECTOR_PROPS] =3D {
 	[IGT_CONNECTOR_BROADCAST_RGB] =3D "Broadcast RGB",
 	[IGT_CONNECTOR_CONTENT_PROTECTION] =3D "Content Protection",
 	[IGT_CONNECTOR_VRR_CAPABLE] =3D "vrr_capable",
+	[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS] =3D "WRITEBACK_PIXEL_FORMATS",
+	[IGT_CONNECTOR_WRITEBACK_FB_ID] =3D "WRITEBACK_FB_ID",
+	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] =3D "WRITEBACK_OUT_FENCE_PTR",
 };
=20
 /*
@@ -557,6 +560,7 @@ static const struct type_name connector_type_names[] =
=3D {
 	{ DRM_MODE_CONNECTOR_VIRTUAL, "Virtual" },
 	{ DRM_MODE_CONNECTOR_DSI, "DSI" },
 	{ DRM_MODE_CONNECTOR_DPI, "DPI" },
+	{ DRM_MODE_CONNECTOR_WRITEBACK, "Writeback" },
 	{}
 };
=20
@@ -1889,6 +1893,12 @@ static void igt_output_reset(igt_output_t *output)
 	if (igt_output_has_prop(output, IGT_CONNECTOR_BROADCAST_RGB))
 		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB,
 					  BROADCAST_RGB_FULL);
+	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID))
+		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, 0);
+	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR)) {
+		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_=
PTR);
+		output->writeback_out_fence_fd =3D -1;
+	}
 }
=20
 /**
@@ -1901,6 +1911,8 @@ static void igt_output_reset(igt_output_t *output)
  * For outputs:
  * - %IGT_CONNECTOR_CRTC_ID
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
+ * - %IGT_CONNECTOR_WRITEBACK_FB_ID
+ * - %IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR
  * - igt_output_override_mode() to default.
  *
  * For pipes:
@@ -1970,6 +1982,8 @@ void igt_display_require(igt_display_t *display, int =
drm_fd)
=20
 	display->drm_fd =3D drm_fd;
=20
+	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+
 	resources =3D drmModeGetResources(display->drm_fd);
 	if (!resources)
 		goto out;
@@ -2263,6 +2277,11 @@ static void igt_output_fini(igt_output_t *output)
 	kmstest_free_connector_config(&output->config);
 	free(output->name);
 	output->name =3D NULL;
+
+	if (output->writeback_out_fence_fd !=3D -1) {
+		close(output->writeback_out_fence_fd);
+		output->writeback_out_fence_fd =3D -1;
+	}
 }
=20
 /**
@@ -3325,6 +3344,11 @@ static void igt_atomic_prepare_connector_commit(igt_=
output_t *output, drmModeAto
 					  output->props[i],
 					  output->values[i]));
 	}
+
+	if (output->writeback_out_fence_fd !=3D -1) {
+		close(output->writeback_out_fence_fd);
+		output->writeback_out_fence_fd =3D -1;
+	}
 }
=20
 /*
@@ -3447,6 +3471,16 @@ display_commit_changed(igt_display_t *display, enum =
igt_commit_style s)
 		else
 			/* no modeset in universal commit, no change to crtc. */
 			output->changed &=3D 1 << IGT_CONNECTOR_CRTC_ID;
+
+		if (s =3D=3D COMMIT_ATOMIC) {
+			if (igt_output_is_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENC=
E_PTR))
+				igt_assert(output->writeback_out_fence_fd >=3D 0);
+
+			output->values[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] =3D 0;
+			output->values[IGT_CONNECTOR_WRITEBACK_FB_ID] =3D 0;
+			igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
+			igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE=
_PTR);
+		}
 	}
=20
 	if (display->first_commit) {
@@ -4119,6 +4153,29 @@ void igt_pipe_request_out_fence(igt_pipe_t *pipe)
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)&pip=
e->out_fence_fd);
 }
=20
+/**
+ * igt_output_set_writeback_fb:
+ * @output: Target output
+ * @fb: Target framebuffer
+ *
+ * This function sets the given @fb to be used as the target framebuffer f=
or the
+ * writeback engine at the next atomic commit. It will also request a writ=
eback
+ * out fence that will contain the fd number of the out fence created by K=
MS if
+ * the given @fb is valid.
+ */
+void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb)
+{
+	igt_display_t *display =3D output->display;
+
+	LOG(display, "%s: output_set_writeback_fb(%d)\n", output->name, fb ? fb->=
fb_id : 0);
+
+	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, fb ? fb-=
>fb_id : 0);
+	/* only request a writeback out fence if the framebuffer is valid */
+	if (fb)
+		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
+					  (ptrdiff_t)&output->writeback_out_fence_fd);
+}
+
 /**
  * igt_wait_for_vblank_count:
  * @drm_fd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a448a003..cacc6b90 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -123,6 +123,9 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_BROADCAST_RGB,
        IGT_CONNECTOR_CONTENT_PROTECTION,
        IGT_CONNECTOR_VRR_CAPABLE,
+       IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS,
+       IGT_CONNECTOR_WRITEBACK_FB_ID,
+       IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
        IGT_NUM_CONNECTOR_PROPS
 };
=20
@@ -364,6 +367,8 @@ typedef struct {
 	bool use_override_mode;
 	drmModeModeInfo override_mode;
=20
+	int32_t writeback_out_fence_fd;
+
 	/* bitmask of changed properties */
 	uint64_t changed;
=20
@@ -414,6 +419,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output=
_t *output,
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
 const drmModeModeInfo *igt_std_1024_mode_get(void);
+void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
=20
 igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
 int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type);
--=20
2.21.0


--=20
Rodrigo Siqueira
https://siqueira.tech

--ono3qqyeow4w6kkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0BseIACgkQWJzP/com
vP+prQ//TPsg5+p9bZ4ujIHLt9SdoXXGC/nKSBCfcdF2qT8PbXe9F5R0RSJuIueR
InV3Td/v3et99jQem5cRSCGDAd+Hnt0o/ntkZBoYN0gG1g35/OELgp0Rm+2OC18a
kbszKjgW3ym5rXnV4bA2pu2vwI5AuQ2C8uooKODeKS/eqwWTGAkMgAcrdA9blpBS
wYbTak2ausbDocdEHeGIDw4f+0HnRlqNYyHgQ9FK5vUz8G1lWvnWrbItXnkseqZj
UafcTU8zcR59AieSau81BnKxXcmcTP1zxmYMq8bEFfXrvvK9YQzc8Vfw8565P/wV
7HAktaR8o7TztQxqiaf42rSG3prUV3uGQ+5OEYQyqVXvKLBW4Xwwg11y2BmvUKkS
NYYREbCcwIgJyPl75ZSqOmraG35aen+WIGi0bi/WDZY/64eLDfZEEj9F0fUk1AtF
AXRmuCq4FT9wLAaBdpZOZBcIEaFiTzJ35jQHqKLOZGKA9zs24iw+kITWN00wb989
LeJJP1xNOo8klZDBA8H/wa8ViO/CrYtSLn/gYxS62LcatJESXX0sdItq+qsyT2nt
96+nv8/76JFte60jcFPvTReAK3KEPcN+Hl2/iPCSdyqHEu52q8+R75wl9Bd7TNPy
j1mOULs1tfKW6Em415J9OGxmHMjHOI1lHaeqJkkq+0vfia3ekLQ=
=pfKH
-----END PGP SIGNATURE-----

--ono3qqyeow4w6kkl--

--===============0391752504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============0391752504==--
