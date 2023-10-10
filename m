Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A06D10E1E4
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 11:47:37 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5043a01ee20so6748549e87.0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 04:47:37 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 Oct 2023 14:47:26 +0300
Message-Id: <20231010114726.393671-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: test odd size planar yuv
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test odd size planar yuv formats are allowed on graphics ver >= 20

Rename invalid pixel format settings test to planar pixel format settings
test to refect the changes.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 43 +++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 9a515559c..a13fcc36e 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1229,27 +1229,30 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 }
 
 /**
- * SUBTEST: invalid-pixel-format-settings
- * Description: verify invalid settings for pixel format are not accepted
+ * SUBTEST: planar-pixel-format-settings
+ * Description: verify planar settings for pixel format are handled correctly
  * Driver requirement: i915, xe
  * Functionality: pixel_format, plane
  * Mega feature: General Display Features
  * Test category: functionality test
  */
-static void test_invalid_settings(data_t *data)
+static void test_planar_settings(data_t *data)
 {
 	enum pipe pipe = PIPE_A;
 	igt_output_t *output;
 	igt_fb_t fb;
 	igt_plane_t *primary;
+	int devid;
 	int rval;
 
 	/*
 	 * If here is added non-intel tests below require will need to be
 	 * changed to if(..)
 	 */
+	igt_require(data->display.is_atomic);
 	igt_require_intel(data->drm_fd);
-	igt_require(intel_display_ver(intel_get_drm_devid(data->drm_fd)) >= 9);
+	devid = intel_get_drm_devid(data->drm_fd);
+	igt_require(intel_display_ver(devid) >= 9);
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
@@ -1257,17 +1260,26 @@ static void test_invalid_settings(data_t *data)
 	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET,
+				  NULL);
 
 	/* test against intel_plane_check_src_coordinates() in i915 */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
+		int expected_rval = -EINVAL;
+
+		if (intel_display_ver(devid) >= 20)
+			expected_rval = 0;
+
 		igt_create_fb(data->drm_fd, 257, 256,
 			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
-		rval = igt_display_try_commit_atomic(&data->display, 0, NULL);
+		rval = igt_display_try_commit_atomic(&data->display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
 		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == -EINVAL, "Odd width NV12 framebuffer\n");
+		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
 	} else {
 		igt_debug("Odd width NV12 framebuffer test skipped\n");
 	}
@@ -1275,12 +1287,19 @@ static void test_invalid_settings(data_t *data)
 	/* test against intel_plane_check_src_coordinates() in i915 */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
+		int expected_rval = -EINVAL;
+
+		if (intel_display_ver(devid) >= 20)
+			expected_rval = 0;
+
 		igt_create_fb(data->drm_fd, 256, 257,
 			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
-		rval = igt_display_try_commit_atomic(&data->display, 0, NULL);
+		rval = igt_display_try_commit_atomic(&data->display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
 		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == -EINVAL, "Odd height NV12 framebuffer\n");
+		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
 	} else {
 		igt_debug("Odd height NV12 framebuffer test skipped\n");
 	}
@@ -1367,9 +1386,9 @@ run_tests_for_pipe_plane(data_t *data)
 		run_test(data, test_plane_panning);
 	}
 
-	igt_describe("verify invalid settings for pixel format are not accepted");
-	igt_subtest_f("invalid-pixel-format-settings")
-		test_invalid_settings(data);
+	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
+	igt_subtest_f("planar-pixel-format-settings")
+		test_planar_settings(data);
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)
-- 
2.34.1
