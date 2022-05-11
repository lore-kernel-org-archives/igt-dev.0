Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BB610EFCC
 for <igt-dev@lists.freedesktop.org>; Wed, 11 May 2022 22:55:16 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 11 May 2022 15:54:59 -0700
Message-ID: <20220511225459.139-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] lib/igt_kms: Set pipe->plane_primary to
 driver-assigned primary plane when there are multiple possible primary
 planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, IGT populates pipe->planes using possible_crtcs and assumes
that the first primary plane it encounters is the one being actively
used by the pipe.

This is not always true in cases where there are multiple possible
primary planes. This will cause problems whenever IGT calls
drmModePageFlip since drmModePageFlip will use the primary plane
assigned to the pipe by the driver to perform the page flip [1]. So a
mismatch between the primary plane used by IGT and the driver can cause
the page flip to fail.

To fix this, let's implement a helper method to get the primary plane
that's being assigned to the pipe by the driver. We can then call it
during igt_display_require() and, if there's a mismatch between
pipe->plane_primary and the assigned primary plane's index, we can
set pipe->plane_primary to the correct driver-assigned primary plane.

[1]
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_plane.c#L1234

Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_kms.h |  1 +
 2 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7838ff283b62..9a4c20581977 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -751,6 +751,52 @@ igt_fill_pipe_props(igt_display_t *display, igt_pipe_t *pipe,
 	drmModeFreeObjectProperties(props);
 }
 
+static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *pipe)
+{
+	int drm_fd = output->display->drm_fd;
+	drmModeModeInfo *mode;
+	struct igt_fb fb;
+	igt_plane_t *plane = NULL;
+	uint32_t crtc_id;
+	int i;
+
+	mode = igt_output_get_mode(output);
+
+	igt_create_color_fb(drm_fd, mode->hdisplay, mode->vdisplay,
+						DRM_FORMAT_XRGB8888,
+						DRM_FORMAT_MOD_LINEAR,
+						1.0, 1.0, 1.0, &fb);
+
+	crtc_id = pipe->crtc_id;
+
+	/*
+	 * Do a legacy SETCRTC to start things off, so that we know that
+	 * the kernel will pick the correct primary plane and attach it
+	 * to the CRTC. This lets us handle the case that there are
+	 * multiple primary planes (one per CRTC), but which can *also*
+	 * be attached to other CRTCs
+	 */
+	igt_assert(drmModeSetCrtc(output->display->drm_fd, crtc_id, fb.fb_id,
+							  0, 0, &output->id, 1, mode) == 0);
+
+	for(i = 0; i < pipe->n_planes; i++) {
+		if (pipe->planes[i].type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
+
+		if (igt_plane_get_prop(&pipe->planes[i], IGT_PLANE_CRTC_ID) != crtc_id)
+			continue;
+
+		plane = &pipe->planes[i];
+		break;
+	}
+
+	/* Removing the FB will also shut down the display for us: */
+	igt_remove_fb(drm_fd, &fb);
+	igt_assert_f(plane, "Valid assigned primary plane for CRTC_ID %d not found.\n", crtc_id);
+
+	return plane;
+}
+
 /**
  * kmstest_pipe_name:
  * @pipe: display pipe
@@ -2302,10 +2348,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 			type = global_plane->type;
 
-			if (type == DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary == -1) {
-				plane = &pipe->planes[0];
-				plane->index = 0;
-				pipe->plane_primary = 0;
+			if (type == DRM_PLANE_TYPE_PRIMARY) {
+				if (pipe->plane_primary == -1) {
+					plane = &pipe->planes[0];
+					plane->index = 0;
+					pipe->plane_primary = 0;
+				}
+
+				pipe->num_primary_planes++;
 			} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
 				plane = &pipe->planes[last_plane];
 				plane->index = last_plane;
@@ -2392,6 +2442,21 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 out:
 	LOG_UNINDENT(display);
 
+	for_each_pipe(display, i) {
+		igt_pipe_t *pipe = &display->pipes[i];
+		igt_output_t *output = igt_get_single_output_for_pipe(display, i);
+
+		if (pipe->num_primary_planes > 1) {
+			igt_plane_t *assigned_primary = igt_get_assigned_primary(output, pipe);
+			int assigned_primary_index = assigned_primary->index;
+
+			if (assigned_primary_index != pipe->plane_primary) {
+				igt_swap(pipe->planes[assigned_primary_index],
+						pipe->planes[pipe->plane_primary]);
+			}
+		}
+	}
+
 	if (display->n_pipes && display->n_outputs)
 		igt_enable_connectors(drm_fd);
 	else
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9ecd21e9824..4949b7b39e18 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -383,6 +383,7 @@ struct igt_pipe {
 	bool enabled;
 
 	int n_planes;
+	int num_primary_planes;
 	int plane_cursor;
 	int plane_primary;
 	igt_plane_t *planes;
-- 
2.31.0
