Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E7C10EA84
 for <igt-dev@lists.freedesktop.org>; Mon,  2 May 2022 23:50:08 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 2 May 2022 16:49:19 -0700
Message-ID: <20220502234919.138-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_rotation_crc: do atomic commit
 if there are multiple primary planes
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

Currently, IGT uses possible_crtcs to initiate the pipe->planes array and
assumes that the first primary plane it encounters is the primary plane
being assigned to the current pipe within the driver [1]. However, this
is not always the case when there are multiple possible primary planes.

Because of this, it's possible for IGT to assigned an fb to an unused
primary plane, causing the page flip ioctl to throw an error. To avoid
this, let's have IGT do an atomic commit instead of a page flip when
testing on drivers where there are multiple possible primary planes.

[1]
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L2305

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_rotation_crc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 50869a08a275..aab75c5ccd80 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -362,8 +362,14 @@ static void test_single_case(data_t *data, enum pipe pipe,
 			     uint32_t format, bool test_bad_format)
 {
 	igt_display_t *display = &data->display;
+	igt_plane_t *current_plane;
 	igt_crc_t crc_output;
 	int ret;
+	int num_primary_planes = 0;
+
+	for_each_plane_on_pipe(&data->display, pipe, current_plane)
+		if (current_plane->type == DRM_PLANE_TYPE_PRIMARY)
+			num_primary_planes++;
 
 	igt_debug("Testing case %i on pipe %s, format %s\n", rect, kmstest_pipe_name(pipe), igt_format_str(format));
 	prepare_fbs(data, output, plane, rect, format);
@@ -409,7 +415,7 @@ static void test_single_case(data_t *data, enum pipe pipe,
 		if (igt_rotation_90_or_270(data->rotation))
 			igt_plane_set_size(plane, data->fb.height, data->fb.width);
 
-		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+		if (num_primary_planes > 1 || plane->type != DRM_PLANE_TYPE_PRIMARY) {
 			igt_display_commit_atomic(display, DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_NONBLOCK, NULL);
 		} else {
 			ret = drmModePageFlip(data->gfx_fd,
-- 
2.31.0
