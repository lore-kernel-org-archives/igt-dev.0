Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E142810E201
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 18:14:48 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 6 May 2022 11:14:30 -0700
Message-ID: <20220506181432.165-2-quic_jesszhan@quicinc.com>
In-Reply-To: <20220506181432.165-1-quic_jesszhan@quicinc.com>
References: <20220506181432.165-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1 1/3] lib/igt_kms: Add helper method to
 get assigned primary plane from pipe
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
primary planes. In addition, since drmModePageFlip will use the primary
plane assigend by the driver to perform the page flip[1], there will be
a mismatch between the primary plane being used by IGT and the driver,
causing the page flip to fail.

To fix this, let's implement a helper method to get the primary plane
that's being assigned to the pipe by the driver.

NOTE: This helper method only needs to be called befor drmModePageFlip.
Atomic commit already handles this issue well.

[1]
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_plane.c#L1234

Suggested-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7838ff283b62..08d5ac9fdab9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2646,6 +2646,53 @@ static igt_plane_t *igt_pipe_get_plane(igt_pipe_t *pipe, int plane_idx)
 	return &pipe->planes[plane_idx];
 }
 
+igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *pipe)
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
+	crtc_id = output->config.crtc->crtc_id;
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
+
 /**
  * igt_pipe_get_plane_type:
  * @pipe: Target pipe
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9ecd21e9824..0a8a7c58c8de 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -475,6 +475,7 @@ drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
 void igt_modeset_disable_all_outputs(igt_display_t *display);
 
+igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *pipe);
 igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
 int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type);
 igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
-- 
2.31.0
