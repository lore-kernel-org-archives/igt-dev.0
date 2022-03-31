Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0224310E36D
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 15:16:59 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Mar 2022 13:53:44 -0100
Message-Id: <20220331145344.2503592-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: refactor
 alpha-7efc for clearer validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The alpha-7efc test takes into account that fg.alpha (pixel alpha
component) and plane_alpha (alpha property) are swappable in the
pre-multiplied blend formula:
 plane_alpha * fg.rgb + (1 - (plane_alpha * fg.alpha)) * bg.rgb

Also, 0xfcfc is double 0x7e7e, so the composition of a given plane_alpha
and 0x7e7e argb_fb would result in the same CRC of plane_alpha/2 and
0xfcfc argb_fb.

However, precision and rounding issues may affect calculation and
results are not consistent between different hw. For example, the test
case fails on i915 gen8 and also for some alpha values on amdgpu (after
applying[1]), but passes on i915 gen11.

Therefore, refactor the test for a more assertive verification that
facilitates debugging when it fails, but keep validating pre-multiplied
alpha property in a alpha-7efc context. For this, remove the loop in a
range of alpha values and just check the swappable property of fg.alpha
and plane_alpha on a pre-multiplied blend mode (default for DRM).

[1] https://lore.kernel.org/dri-devel/20220329201835.2393141-1-mwen@igalia.com/

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_plane_alpha_blend.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index d061262d..8e54dfd6 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -386,7 +386,6 @@ static void alpha_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
-	int i;
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
 		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
@@ -394,21 +393,18 @@ static void alpha_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_start(data->pipe_crc);
 
-	/* for coverage, plane alpha and fb alpha should be swappable, so swap fb and alpha */
-	for (i = 0; i < 256; i += 8) {
-		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, ((i/2) << 8) | (i/2));
-		igt_plane_set_fb(plane, &data->argb_fb_fc);
-		igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e);
+	igt_plane_set_fb(plane, &data->argb_fb_fc);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
-		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &ref_crc);
+	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &ref_crc);
 
-		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, (i << 8) | i);
-		igt_plane_set_fb(plane, &data->argb_fb_7e);
-		igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xfcfc);
+	igt_plane_set_fb(plane, &data->argb_fb_7e);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
-		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-		igt_assert_crc_equal(&ref_crc, &crc);
-	}
+	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
+	igt_assert_crc_equal(&ref_crc, &crc);
 
 	igt_pipe_crc_stop(data->pipe_crc);
 }
@@ -536,7 +532,8 @@ static void run_subtests(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-alpha-basic", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, false, true, basic_alpha);
 
-	igt_describe("Tests plane alpha-7efc properties.");
+	igt_describe("Uses alpha values 0x7e and 0xfc to validate fg.alpha and "
+		     "plane_alpha are swappable on pre-multiplied blend mode.");
 	igt_subtest_f("pipe-%s-alpha-7efc", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, false, true, alpha_7efc);
 
-- 
2.35.1
