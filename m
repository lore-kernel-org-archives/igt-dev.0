Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Date: Mon, 21 Oct 2019 21:58:27 -0300
Message-ID: <20191022005820.4vniwm6wqw3ofk2p@smtp.gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v7 i-g-t 1/4] lib/igt_kms: Add writeback support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1948900147=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Simon Ser <contact@emersion.fr>, Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1948900147==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffgqpq7g2vxy5vm5"
Content-Disposition: inline


--ffgqpq7g2vxy5vm5
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
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
 lib/igt_kms.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  6 ++++++
 2 files changed, 65 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e9b80b9b..2d7eabc6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -412,6 +412,9 @@ const char * const igt_connector_prop_names[IGT_NUM_CON=
NECTOR_PROPS] =3D {
 	[IGT_CONNECTOR_VRR_CAPABLE] =3D "vrr_capable",
 	[IGT_CONNECTOR_HDCP_CONTENT_TYPE] =3D "HDCP Content Type",
 	[IGT_CONNECTOR_LINK_STATUS] =3D "link-status",
+	[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS] =3D "WRITEBACK_PIXEL_FORMATS",
+	[IGT_CONNECTOR_WRITEBACK_FB_ID] =3D "WRITEBACK_FB_ID",
+	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] =3D "WRITEBACK_OUT_FENCE_PTR",
 };
=20
 /*
@@ -644,6 +647,7 @@ static const struct type_name connector_type_names[] =
=3D {
 	{ DRM_MODE_CONNECTOR_VIRTUAL, "Virtual" },
 	{ DRM_MODE_CONNECTOR_DSI, "DSI" },
 	{ DRM_MODE_CONNECTOR_DPI, "DPI" },
+	{ DRM_MODE_CONNECTOR_WRITEBACK, "Writeback" },
 	{}
 };
=20
@@ -1853,6 +1857,14 @@ static void igt_output_reset(igt_output_t *output)
 	if (igt_output_has_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION))
 		igt_output_set_prop_enum(output, IGT_CONNECTOR_CONTENT_PROTECTION,
 					 "Undesired");
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID))
+		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, 0);
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR)) {
+		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_=
PTR);
+		output->writeback_out_fence_fd =3D -1;
+	}
 }
=20
 /**
@@ -1866,6 +1878,8 @@ static void igt_output_reset(igt_output_t *output)
  * - %IGT_CONNECTOR_CRTC_ID
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
+ * - %IGT_CONNECTOR_WRITEBACK_FB_ID
+ * - %IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR
  * - igt_output_override_mode() to default.
  *
  * For pipes:
@@ -1935,6 +1949,8 @@ void igt_display_require(igt_display_t *display, int =
drm_fd)
=20
 	display->drm_fd =3D drm_fd;
=20
+	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_WRITEBACK_CONNECTORS, 1);
+
 	resources =3D drmModeGetResources(display->drm_fd);
 	if (!resources)
 		goto out;
@@ -2228,6 +2244,11 @@ static void igt_output_fini(igt_output_t *output)
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
@@ -3290,6 +3311,11 @@ static void igt_atomic_prepare_connector_commit(igt_=
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
@@ -3412,6 +3438,16 @@ display_commit_changed(igt_display_t *display, enum =
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
@@ -4084,6 +4120,29 @@ void igt_pipe_request_out_fence(igt_pipe_t *pipe)
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
index 7193f9a5..9bf70acf 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -125,6 +125,9 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_VRR_CAPABLE,
        IGT_CONNECTOR_HDCP_CONTENT_TYPE,
        IGT_CONNECTOR_LINK_STATUS,
+       IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS,
+       IGT_CONNECTOR_WRITEBACK_FB_ID,
+       IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
        IGT_NUM_CONNECTOR_PROPS
 };
=20
@@ -365,6 +368,8 @@ typedef struct {
 	bool use_override_mode;
 	drmModeModeInfo override_mode;
=20
+	int32_t writeback_out_fence_fd;
+
 	/* bitmask of changed properties */
 	uint64_t changed;
=20
@@ -423,6 +428,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output=
_t *output,
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
 const drmModeModeInfo *igt_std_1024_mode_get(void);
+void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
=20
 igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
 int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type);
--=20
2.23.0

--ffgqpq7g2vxy5vm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2uVCsACgkQWJzP/com
vP87vBAAsRXvHYnlYEu/RNpGURTYU2nRL051/b2YjDqLT14WmBTGkMl+uwm5JNyn
WE8dVE7eEq84LhO7ML33Hf4ZK0KZ8V+6r6veV3cvnxa1EU3I0WvR6IjT/sYHXH2n
+StOhnCJJwdOgOQu1aZD3bHha5WcAsE1rCYBwvopPvMLNW0kmas8H1YsMVwf0v8k
7V1RmNnMslCflOsukMEo/uiDOXv850Ylu+Rtqs/yBwfHSbMaiENhUzrvRMRUEW+H
GEfIGEfKSKIhMNb/2i61vDG141LIflYbWFMA+3WgZvGTlHxWOxnfHuV/fVhXdjaf
QxflF2fFlmXhaHmfAl0ByOk2R7D4MwRIC/kLk8GIEgyOxomJaf0sBbmz2ITe3iqf
hf0ZBzoJYSzS7zBd7FhdOjvLQ3/6gW8oRu+EF8ntb+zDeQ2EnthSyzPE+CL6LdEY
gUOhoHujGwS7PEnoYnhsQCZ2BzdCoDJghzIl90hZ+o5HlLH/CXUtwlq7hAsPiKMG
PomB805mlxZov7f1P6jJ5258DgW+LCUBiPDaaKk3s4arNT5s34p/BHEbHcwHDsDk
FBkoBZJFXE7ZF6LJMtxoOT65IPurJMY2D7XVXTm7qT+a8OyAx2Iq6uPeTMZPtBCO
kxZW6NMYk8OVrKgW3aPNkPfT4884DUr5nfCr0HAlLfqqyI0Hle8=
=KSBh
-----END PGP SIGNATURE-----

--ffgqpq7g2vxy5vm5--

--===============1948900147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1948900147==--
