Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6923210ED8A
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 11:27:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 24 Jan 2022 16:53:51 +0530
Message-Id: <20220124112352.1970255-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
References: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_color: Add support for
 Deep-Color
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, uma.shankar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add new subtests to validate deep color.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c        | 54 +++++++++++++++++++++++++++++++++++-----
 tests/kms_color_helper.c |  2 +-
 tests/kms_color_helper.h |  1 +
 3 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 854b8f3c31..3980553e63 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -58,7 +58,7 @@ static void test_pipe_degamma(data_t *data,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay,
 			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data->drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
@@ -66,7 +66,7 @@ static void test_pipe_degamma(data_t *data,
 	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data->drm_format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
@@ -146,7 +146,7 @@ static void test_pipe_gamma(data_t *data,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay,
 			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data->drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
@@ -154,7 +154,7 @@ static void test_pipe_gamma(data_t *data,
 	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data->drm_format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
@@ -462,7 +462,7 @@ static bool test_pipe_ctm(data_t *data,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay,
 			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data->drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
@@ -470,7 +470,7 @@ static bool test_pipe_ctm(data_t *data,
 	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data->drm_format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
@@ -692,6 +692,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	 * for CRC checks with framebuffer references. */
 	data->color_depth = 8;
 	delta = 1.0 / (1 << data->color_depth);
+	data->drm_format = DRM_FORMAT_XRGB8888;
 
 	igt_describe("Check the color transformation from red to blue");
 	igt_subtest_f("pipe-%s-ctm-red-to-blue", kmstest_pipe_name(p)) {
@@ -866,6 +867,47 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
 		test_pipe_legacy_gamma_reset(data, primary);
 
+	igt_describe("Verify that deep color works correctly");
+	igt_subtest_with_dynamic_f("pipe-%s-deep-color", kmstest_pipe_name(p)) {
+		igt_output_t *output;
+		color_t blue_green_blue[] = {
+			{ 0.0, 0.0, 1.0 },
+			{ 0.0, 1.0, 0.0 },
+			{ 0.0, 0.0, 1.0 }
+		};
+		double ctm[] = { 0.0, 0.0, 0.0,
+				0.0, 1.0, 0.0,
+				1.0, 0.0, 1.0 };
+
+		for_each_valid_output_on_pipe(&data->display, p, output) {
+			drmModeConnector *connector = output->config.connector;
+
+			if (!is_max_bpc_supported(output))
+				continue;
+
+			if (!is_panel_supports_deep_color(data->drm_fd, connector))
+				continue;
+
+			data->color_depth = 10;
+			data->drm_format = DRM_FORMAT_XRGB2101010;
+			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
+
+			igt_dynamic_f("gamma")
+				test_pipe_gamma(data, primary);
+
+			igt_dynamic_f("degamma")
+				test_pipe_degamma(data, primary);
+
+			igt_dynamic_f("ctm")
+				igt_assert(test_pipe_ctm(data, primary,
+							 red_green_blue,
+							 blue_green_blue, ctm));
+
+			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 12);
+			break;
+		}
+	}
+
 	igt_fixture {
 		disable_degamma(primary->pipe);
 		disable_gamma(primary->pipe);
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 1adb4644c5..0550834648 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -184,7 +184,7 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	uint32_t mask;
 
 	if (is_i915_device(data->drm_fd))
-		mask = ((1 << color_depth) - 1) << 8;
+		mask = ((1 << color_depth) - 1) << (16 - color_depth);
 	else
 		mask = max_value;
 
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 992087ac9c..7017d83bd5 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -50,6 +50,7 @@ typedef struct {
 	igt_display_t display;
 	igt_pipe_crc_t *pipe_crc;
 
+	uint32_t drm_format;
 	uint32_t color_depth;
 	uint64_t degamma_lut_size;
 	uint64_t gamma_lut_size;
-- 
2.32.0
