Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434F410E05C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 00:22:56 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 12 Apr 2022 17:22:24 -0700
Message-ID: <20220413002224.192-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_atomic_transition: Separate
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
for each pipe/plane then push everything as a single commit. This will
cause issues for drivers which do not dedicate planes to pipes and allow
planes to be shared, as it causes the new pipe to overwrite the plane
properties that have been set by the old pipe. In addition, the DRM
framework forbids directly switching the assigned pipe for a plane within
the same commit [1].

To avoid this, we can first disable any pipes that currently are
handling a shared plane before setting the fb to be committed.

Note: This patch only fixes the issue for single display cases. Fixes
for multi-display cases will be addressed in a separate patch

Changes since V1:
- Removed shared plane bitmask
- Instead of immediately doing a NULL commit to disable the current pipe
  when primary plane is shared, disable the previous pipe using the
  primary plane before preparing the framebuffers for commit
- Removed commit for non-NULL framebuffers

[1]
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_atomic.c#L695

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_atomic_transition.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 4be24f9e3091..d8462bfcd71a 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -716,6 +716,25 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 	for (i = 0; i < data->display.n_outputs; i++)
 		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
 
+	for_each_pipe(&data->display, pipe) {
+		igt_plane_t *plane = igt_pipe_get_plane_type(&data->display.pipes[pipe],
+			DRM_PLANE_TYPE_PRIMARY);
+
+		enum pipe old_pipe = plane->ref->pipe->pipe;
+
+		/*
+		 * If a plane is being shared by multiple pipes, we must disable the pipe that
+		 * currently is holding the plane
+		 */
+		if (old_pipe != pipe) {
+			igt_plane_t *old_plane = igt_pipe_get_plane_type(&data->display.pipes[old_pipe],
+				DRM_PLANE_TYPE_PRIMARY);
+
+			igt_plane_set_fb(old_plane, NULL);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		}
+	}
+
 	for_each_pipe(&data->display, pipe) {
 		igt_plane_t *plane = igt_pipe_get_plane_type(&data->display.pipes[pipe],
 			DRM_PLANE_TYPE_PRIMARY);
-- 
2.31.0
