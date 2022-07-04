Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C264110E0F1
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jul 2022 13:09:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  4 Jul 2022 18:37:30 +0530
Message-Id: <20220704130730.331322-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220627084630.120929-2-bhanuprakash.modem@intel.com>
References: <20220627084630.120929-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 2/2] tests/kms: Fix to use max_bpc constraint
 helper
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

Instead of writing our own wrapper, use the helper from lib.

V2:
* Rebase

Cc: Swati Sharma <swati2.sharma@intel.com>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c  | 24 +-----------------------
 tests/kms_dither.c | 25 +------------------------
 tests/kms_hdr.c    | 44 +++++++++++++++-----------------------------
 3 files changed, 17 insertions(+), 76 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 0b03fb9a..2d751027 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -651,28 +651,6 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif

-static bool i915_clock_constraint(data_t *data, enum pipe pipe, int bpc)
-{
-	igt_output_t *output = data->output;
-	drmModeConnector *connector = output->config.connector;
-
-	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-
-	for_each_connector_mode(output) {
-		igt_output_override_mode(output, &connector->modes[j__]);
-		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
-		if (!igt_check_output_bpc_equal(data->drm_fd, pipe,
-						data->output->name, bpc))
-			continue;
-
-		return true;
-	}
-
-	igt_output_override_mode(output, NULL);
-	return false;
-}
-
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
@@ -835,7 +813,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);

 		if (is_i915_device(data->drm_fd) &&
-		    !i915_clock_constraint(data, p, 10))
+		    !igt_max_bpc_constraint(&data->display, p, output, 10))
 			continue;

 		data->color_depth = 10;
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 02896b37..a7cff353 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -97,29 +97,6 @@ static dither_status_t get_dither_state(data_t *data, enum pipe pipe)
 	return status;
 }

-static bool i915_clock_constraint(data_t *data, enum pipe pipe,
-				  igt_output_t *output, int bpc)
-{
-	drmModeConnector *connector = output->config.connector;
-	igt_display_t *display = &data->display;
-
-	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-
-	for_each_connector_mode(output) {
-		igt_output_override_mode(output, &connector->modes[j__]);
-		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-
-		if (!igt_check_output_bpc_equal(data->drm_fd, pipe,
-						output->name, bpc))
-			continue;
-
-		return true;
-	}
-
-	igt_output_override_mode(output, NULL);
-	return false;
-}
-
 static void test_dithering(data_t *data, enum pipe pipe,
 			   igt_output_t *output,
 			   int fb_bpc, int fb_format,
@@ -151,7 +128,7 @@ static void test_dithering(data_t *data, enum pipe pipe,
 	igt_require_f(!ret, "%s don't support %d-bpc\n",
 				output->name, output_bpc);

-	igt_require_f(i915_clock_constraint(data, pipe, output, output_bpc),
+	igt_require_f(igt_max_bpc_constraint(display, pipe, output, output_bpc),
 			"No supported mode found to use %d-bpc on %s\n",
 			output_bpc, output->name);

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 6790f26f..e2650f51 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -130,6 +130,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 					  INTEL_PIPE_CRC_SOURCE_AUTO);

 	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);

 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
@@ -204,33 +205,6 @@ static bool has_max_bpc(igt_output_t *output)
 	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }

-static bool i915_clock_constraint(data_t *data, int bpc)
-{
-	igt_output_t *output = data->output;
-	drmModeConnector *connector = output->config.connector;
-
-	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, bpc);
-	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-
-	for_each_connector_mode(output) {
-		igt_output_override_mode(output, &connector->modes[j__]);
-		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
-		if (!igt_check_output_bpc_equal(data->fd, data->pipe_id,
-						data->output->name, bpc))
-			continue;
-
-		data->mode = igt_output_get_mode(output);
-		data->w = data->mode->hdisplay;
-		data->h = data->mode->vdisplay;
-
-		return true;
-	}
-
-	test_fini(data);
-	return false;
-}
-
 static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -250,8 +224,14 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 				prepare_test(data, output, pipe);

 				if (is_i915_device(data->fd) &&
-				    !i915_clock_constraint(data, 10))
+				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					test_fini(data);
 					break;
+				}
+
+				data->mode = igt_output_get_mode(output);
+				data->w = data->mode->hdisplay;
+				data->h = data->mode->vdisplay;

 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name)
@@ -570,8 +550,14 @@ static void test_hdr(data_t *data, uint32_t flags)
 				prepare_test(data, output, pipe);

 				if (is_i915_device(data->fd) &&
-				    !i915_clock_constraint(data, 10))
+				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					test_fini(data);
 					break;
+				}
+
+				data->mode = igt_output_get_mode(output);
+				data->w = data->mode->hdisplay;
+				data->h = data->mode->vdisplay;

 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name) {
--
2.35.1
