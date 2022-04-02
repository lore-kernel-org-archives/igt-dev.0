Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CDF10E039
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Apr 2022 01:01:39 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 1 Apr 2022 18:01:05 -0700
Message-ID: <20220402010105.150-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] test/kms_atomic_transition: Separate
 commits for pipes with shared planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently the helper method set_combinations() will set the properties
for each pipe/plane then push everything within a single commit. This
will cause issues for drivers where planes are being shared between
pipes, as it causes the new pipe to overwrite the plane properties that
have been set by the old pipe. In addition, some drivers forbid directly
switching the assigned pipe for a plane within the same commit [1].

To avoid these issues, we can use a bitmask to track pipes that share
planes, then do a separate commit and disable the old pipe before
setting the plane properties for the new pipe for any pipe that share
planes.

[1]
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic.c#L695

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_atomic_transition.c | 37 +++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 4be24f9e3091..5d756e17be76 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -711,26 +711,45 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 	igt_output_t *output;
 	enum pipe pipe;
 	unsigned event_mask = 0;
+	unsigned shared_mask = 0;
 	int i;
 
 	for (i = 0; i < data->display.n_outputs; i++)
 		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
 
+	for_each_pipe(&data->display, pipe) {
+		igt_plane_t *plane = igt_pipe_get_plane_type(&data->display.pipes[pipe],
+			DRM_PLANE_TYPE_PRIMARY);
+
+		if (plane->ref->pipe->pipe != pipe)
+			shared_mask |= 1 << pipe;
+	}
+
 	for_each_pipe(&data->display, pipe) {
 		igt_plane_t *plane = igt_pipe_get_plane_type(&data->display.pipes[pipe],
 			DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
+		bool is_shared = !(shared_mask & (1 << pipe));
 
 		if (!(mask & (1 << pipe))) {
 			if (igt_pipe_is_prop_changed(&data->display, pipe, IGT_CRTC_ACTIVE)) {
-				event_mask |= 1 << pipe;
 				igt_plane_set_fb(plane, NULL);
+
+				/*
+				 * If plane is being shared between pipes, do NULL commit
+				 * immediately.
+				 */
+				if (is_shared){
+					igt_display_commit2(&data->display, COMMIT_ATOMIC);
+					event_mask = 0;
+				} else {
+					event_mask |= 1 << pipe;
+				}
 			}
 
 			continue;
 		}
 
-		event_mask |= 1 << pipe;
 
 		for_each_valid_output_on_pipe(&data->display, pipe, output) {
 			if (output->pending_pipe != PIPE_NONE)
@@ -747,6 +766,20 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 		igt_plane_set_fb(plane, fb);
 		igt_fb_set_size(fb, plane, mode->hdisplay, mode->vdisplay);
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+
+		/*
+		 * In cases where a plane is shared between pipes, commit the framebuffer immediately
+		 * then disable the pipe
+		 */
+		if (is_shared) {
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+			igt_plane_set_fb(plane, NULL);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			event_mask = 0;
+		} else {
+			event_mask |= 1 << pipe;
+		}
 	}
 
 	return event_mask;
-- 
2.35.1
