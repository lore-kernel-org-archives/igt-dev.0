Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4782D10E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 11:34:12 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a4so2783763ljr.9
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 03:34:12 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Feb 2023 13:34:07 +0200
Message-Id: <20230227113407.20192-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: add invalid pixel format
 tests
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

Test settings for pixel formats which are not supposing to be accepted.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 164dacf40..631531284 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1125,6 +1125,54 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
 
+static void test_invalid_settings(data_t *data)
+{
+	enum pipe pipe = PIPE_A;
+	igt_output_t *output;
+	igt_fb_t fb;
+	igt_plane_t *primary;
+	int rval;
+
+	/*
+	 * If here is added non-intel tests below require will need to be
+	 * changed to if(..)
+	 */
+	igt_require_intel(data->drm_fd);
+	igt_require(intel_display_ver(intel_get_drm_devid(data->drm_fd)) >= 9);
+
+	output = igt_get_single_output_for_pipe(&data->display, pipe);
+	igt_require(output);
+
+	igt_output_set_pipe(output, pipe);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	/* test against intel_plane_check_src_coordinates() in i915 */
+	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				     DRM_FORMAT_MOD_LINEAR)) {
+		igt_create_fb(data->drm_fd, 257, 256,
+			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_plane_set_fb(primary, &fb);
+		rval = igt_display_try_commit_atomic(&data->display, 0, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_assert_f(rval == -EINVAL, "Odd width NV12 framebuffer\n");
+	} else
+		igt_debug("Odd width NV12 framebuffer test skipped\n");
+
+	/* test against intel_plane_check_src_coordinates() in i915 */
+	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				     DRM_FORMAT_MOD_LINEAR)) {
+		igt_create_fb(data->drm_fd, 256, 257,
+			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_plane_set_fb(primary, &fb);
+		rval = igt_display_try_commit_atomic(&data->display, 0, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_assert_f(rval == -EINVAL, "Odd height NV12 framebuffer\n");
+	} else
+		igt_debug("Odd height NV12 framebuffer test skipped\n");
+}
+
 static bool is_pipe_limit_reached(int count) {
 	return count >= CRTC_RESTRICT_CNT && !all_pipes;
 }
@@ -1194,6 +1242,10 @@ run_tests_for_pipe_plane(data_t *data)
 		data->flags = TEST_PANNING_BOTTOM_RIGHT | TEST_SUSPEND_RESUME;
 		run_test(data, test_plane_panning);
 	}
+
+	igt_describe("verify invalid settings for pixel format are not accepted");
+	igt_subtest_f("invalid-pixel-format-settings")
+		test_invalid_settings(data);
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)
-- 
2.39.0
