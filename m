Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69A810E8B4
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 14:27:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 19:47:00 +0530
Message-Id: <20231201141703.3013801-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
References: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 4/7] tests/kms_vrr: Fix bigjoiner constraint
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

Before starting the subtest, we are checking the selected pipe/output
combo validity with default mode, but inside the subtest we are using
the mode with highest resolution.

Few panels exposing 4K as a default mode even though it supports 8K,
in this scenario test may misbehave due to the bigjoiner involvement.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 62 +++++++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 4cad663e4..2918f7860 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -163,9 +163,6 @@ output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
 		    connector->modes[i].vrefresh <= vrr_max)
 			mode = connector->modes[i];
 
-	igt_info("Override Mode: ");
-	kmstest_dump_mode(&mode);
-
 	return mode;
 }
 
@@ -233,21 +230,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	drmModeModeInfo mode;
 	cairo_t *cr;
 
-	/* Reset output */
-	igt_display_reset(&data->display);
-	igt_output_set_pipe(output, pipe);
-
-	/* Capture VRR range */
-	data->range = get_vrr_range(data, output);
-
-	/* Override mode with max vrefresh.
-	 *   - vrr_min range should be less than the override mode vrefresh.
-	 *   - Limit the vrr_max range with the override mode vrefresh.
-	 */
-	mode = output_mode_with_maxrate(output, data->range.max);
-	igt_require(mode.vrefresh > data->range.min);
-	data->range.max = mode.vrefresh;
-	igt_output_override_mode(output, &mode);
+	mode = *igt_output_get_mode(output);
 
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
@@ -483,7 +466,36 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_remove_fb(data->drm_fd, &data->fb0);
 }
 
-static bool config_constraint(igt_output_t *output, uint32_t flags)
+static bool output_constraint(data_t *data, igt_output_t *output)
+{
+	drmModeModeInfo mode;
+
+	/* Reset output */
+	igt_display_reset(&data->display);
+
+	/* Capture VRR range */
+	data->range = get_vrr_range(data, output);
+
+	/*
+	 * Override mode with max vrefresh.
+	 *   - vrr_min range should be less than the override mode vrefresh.
+	 *   - Limit the vrr_max range with the override mode vrefresh.
+	 */
+	mode = output_mode_with_maxrate(output, data->range.max);
+	if (mode.vrefresh < data->range.min)
+		return false;
+
+	data->range.max = mode.vrefresh;
+
+	igt_info("Override Mode: ");
+	kmstest_dump_mode(&mode);
+
+	igt_output_override_mode(output, &mode);
+
+	return true;
+}
+
+static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
 	if (!has_vrr(output))
 		return false;
@@ -495,6 +507,9 @@ static bool config_constraint(igt_output_t *output, uint32_t flags)
 	if ((flags & ~TEST_NEGATIVE) && !vrr_capable(output))
 		return false;
 
+	if (!output_constraint(data, output))
+		return false;
+
 	return true;
 }
 
@@ -507,16 +522,17 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 	for_each_connected_output(&data->display, output) {
 		enum pipe pipe;
 
-		if (!config_constraint(output, flags))
+		if (!config_constraint(data, output, flags))
 			continue;
 
 		for_each_pipe(&data->display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
-				igt_display_reset(&data->display);
-
 				igt_output_set_pipe(output, pipe);
-				if (!intel_pipe_output_combo_valid(&data->display))
+
+				if (!intel_pipe_output_combo_valid(&data->display)) {
+					igt_output_set_pipe(output, PIPE_NONE);
 					continue;
+				}
 
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name)
-- 
2.40.0
