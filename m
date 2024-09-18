Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991F6CCD184
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1CC10E553;
	Wed, 18 Sep 2024 07:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuOsFqtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7A910E553
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726644987; x=1758180987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UygUNUChgy8v6dK15D3xz+GyjVwVvMh9f4Aj39dxHa4=;
 b=CuOsFqtZaf5mhk7VBKyKk137KFPfp4mu1Pic5yT9oKCma//sQ4zedOAR
 VixQc6nQ8CODCag06P/gO9h0+CRFNvIJ4eg/Qcg6Rp0WM8cTf46kLxEOB
 Pgrovc92dvY6w6ccDbqAsONC2U5X5hRQTtFcDQG57GGIasTCO2VYUYm/F
 0miqfrb1hvB3Zj8EYE/TXpQsOMVzm5tSU8wM5D8Nztd/2Fcb9azXqOTn+
 RKdQPSKq71peelIoUzdPf6za693X1E/JlYcWaSChR0UTTjrfvMNAqbXjg
 fDJps22+ZWKwBUZ8fgy8FeN/U91CE/+9cr49eVzepzfeEHGt8JIDE5xnZ g==;
X-CSE-ConnectionGUID: 6P1wpAzUSD+A2djP+KoUzA==
X-CSE-MsgGUID: sHTUHb/DTXO6nYl4CBEB+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25359020"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25359020"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:27 -0700
X-CSE-ConnectionGUID: WYaQSV0gSM+sSDhBSeVP+A==
X-CSE-MsgGUID: 2dqWo6vkQUGxUJRORll0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="73806722"
Received: from srr4-3-linux-124-kbs1.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:36:25 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 kunal1.joshi@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 1/3] tests/kms_joiner: Add tests for ultrajoiner
 validation
Date: Wed, 18 Sep 2024 13:04:11 +0530
Message-Id: <20240918073413.28598-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240918073413.28598-1-karthik.b.s@intel.com>
References: <20240918073413.28598-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add a subtest to validate basic ultrajoiner modeset and a negative test
to validate invalid pipe configs during an ultrajoiner modeset.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c                                 |  44 +++++
 lib/igt_kms.h                                 |   3 +
 .../intel/{kms_big_joiner.c => kms_joiner.c}  | 150 ++++++++++++++++--
 tests/meson.build                             |   2 +-
 4 files changed, 183 insertions(+), 16 deletions(-)
 rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (74%)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dd530dbab..cf453dcfc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6347,6 +6347,50 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * igt_ultrajoiner_possible:
+ * @mode: libdrm mode
+ * @max_dotclock: Max pixel clock frequency
+ *
+ * Ultrajoiner will come into the picture, when the requested
+ * mode resolution > 10K or mode clock > 2 * max_dotclock.
+ *
+ * Returns: True if mode requires Ultrajoiner, else False.
+ */
+bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
+{
+	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
+		mode->clock > 2 * max_dotclock);
+}
+
+/**
+ * Ultrajoiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Ultrajoiner will come in to the picture when the
+ * resolution > 10K or clock > 2 * max-dot-clock.
+ *
+ * Returns: True if ultra joiner found in connector modes
+ */
+bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock, drmModeModeInfo *mode)
+{
+	bool found = false;
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+	found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
+	if (!found) {
+		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+		found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
+	}
+	if (found)
+		*mode = connector->modes[0];
+	return found;
+}
+
 /**
  * igt_has_force_joiner_debugfs
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 25ba50916..4455632f4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1216,6 +1216,9 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
+bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
+bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_joiner.c
similarity index 74%
rename from tests/intel/kms_big_joiner.c
rename to tests/intel/kms_joiner.c
index 7c370bc60..633bf51c7 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -37,13 +37,20 @@
 #include "igt.h"
 
 /**
- * SUBTEST: invalid-modeset
+ * SUBTEST: invalid-modeset-big-joiner
  * Description: Verify if the modeset on the adjoining pipe is rejected when
  *              the pipe is active with a big joiner modeset
  *
- * SUBTEST: basic
+ * SUBTEST: invalid-modeset-ultra-joiner
+ * Description: Verify if the modeset on the other pipes are rejected when
+ *              the pipe A is active with ultra joiner modeset
+ *
+ * SUBTEST: basic-big-joiner
  * Description: Verify the basic modeset on big joiner mode on all pipes
  *
+ * SUBTEST: basic-ultra-joiner
+ * Description: Verify the basic modeset on ultra joiner mode on all pipes
+ *
  * SUBTEST: invalid-modeset-force-joiner
  * Description: Verify if modeset on adjacent pipe is declined when force joiner modeset is active.
  *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs,
@@ -54,20 +61,24 @@
  *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
  *		the test exclusively targets non-bigjoiner outputs.
  */
-IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
+IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
 #define INVALID_TEST_OUTPUT 2
 
 typedef struct {
 	int drm_fd;
 	int big_joiner_output_count;
+	int ultra_joiner_output_count;
 	int non_big_joiner_output_count;
+	int non_ultra_joiner_output_count;
 	int mixed_output_count;
 	int output_count;
 	int n_pipes;
 	uint32_t master_pipes;
 	igt_output_t *big_joiner_output[IGT_MAX_PIPES];
+	igt_output_t *ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
+	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *mixed_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
@@ -286,6 +297,81 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 	}
 }
 
+static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
+{
+	int i, j, k, ret;
+	igt_output_t *output, *non_ultra_joiner_output;
+	igt_plane_t *primary;
+	igt_output_t **outputs;
+	igt_fb_t fb;
+	drmModeModeInfo mode;
+
+	outputs = data->ultra_joiner_output;
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	for (i = 0; i < data->ultra_joiner_output_count; i++) {
+		output = outputs[i];
+		igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
+		igt_output_override_mode(output, &mode);
+		for (j = 0; j < data->n_pipes; j++) {
+			/* Ultra joiner is only valid on PIPE_A */
+			if (invalid_pipe && j == PIPE_A)
+				continue;
+			if (!invalid_pipe && j != PIPE_A)
+				continue;
+			if (two_display && j != PIPE_A)
+				continue;
+
+			igt_output_set_pipe(output, data->pipe_seq[j]);
+
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
+					      DRM_FORMAT_MOD_LINEAR, &fb);
+			igt_plane_set_fb(primary, &fb);
+
+			if (invalid_pipe)
+				ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+			else
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+			if (two_display) {
+				for_each_connected_output(&data->display, non_ultra_joiner_output) {
+					if (output->id != non_ultra_joiner_output->id) {
+						for (k = 1; k < data->n_pipes; k++) {
+							igt_plane_t *plane;
+							drmModeModeInfo *mode1;
+
+							mode1 = igt_output_get_mode(non_ultra_joiner_output);
+
+							igt_output_set_pipe(non_ultra_joiner_output, data->pipe_seq[k]);
+							plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+							igt_plane_set_fb(plane, &fb);
+							igt_fb_set_size(&fb, plane, mode1->hdisplay, mode1->vdisplay);
+							igt_plane_set_size(plane, mode1->hdisplay, mode1->vdisplay);
+
+							ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+
+							igt_plane_set_fb(plane, NULL);
+							igt_assert_f(ret != 0, "Commit expected to fail on second display\n");
+						}
+						/* Validation with one output is sufficient */
+						break;
+					}
+				}
+			}
+
+			igt_display_reset(&data->display);
+			igt_plane_set_fb(primary, NULL);
+			igt_remove_fb(data->drm_fd, &fb);
+
+			if (invalid_pipe)
+				igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
+		}
+	}
+}
+
 igt_main
 {
 	bool force_joiner_supported;
@@ -297,7 +383,9 @@ igt_main
 	igt_fixture {
 		force_joiner_supported = false;
 		data.big_joiner_output_count = 0;
+		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
+		data.non_ultra_joiner_output_count = 0;
 		data.mixed_output_count = 0;
 		data.output_count = 0;
 		j = 0;
@@ -310,24 +398,31 @@ igt_main
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
 		for_each_connected_output(&data.display, output) {
-			bool found = false;
+			bool ultrajoiner_found = false, bigjoiner_found = false;
 			drmModeConnector *connector = output->config.connector;
 
 			/*
 			 * Bigjoiner will come in to the picture when the
 			 * resolution > 5K or clock > max-dot-clock.
+			 * Ultrajoiner will come in to the picture when the
+			 * resolution > 10K or clock > 2 * max-dot-clock.
 			 */
-			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
+			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
+			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 
-			if (found) {
+			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
+				force_joiner_supported = true;
+
+			if (ultrajoiner_found)
+				data.ultra_joiner_output[data.ultra_joiner_output_count++] = output;
+			else if (force_joiner_supported)
+				data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] = output;
+
+			if (bigjoiner_found)
 				data.big_joiner_output[data.big_joiner_output_count++] = output;
-				igt_output_override_mode(output, &mode);
-			} else {
-				if (igt_has_force_joiner_debugfs(data.drm_fd, output->name)) {
-					force_joiner_supported = true;
-					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
-				}
-			}
+			else if (force_joiner_supported)
+				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
+
 			data.output_count++;
 		}
 		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
@@ -337,6 +432,7 @@ igt_main
 			data.mixed_output[data.mixed_output_count++] = data.big_joiner_output[0];
 			data.mixed_output[data.mixed_output_count++] = data.non_big_joiner_output[0];
 		}
+
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i) {
 			data.n_pipes++;
@@ -346,7 +442,7 @@ igt_main
 	}
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
-	igt_subtest_with_dynamic("basic") {
+	igt_subtest_with_dynamic("basic-big-joiner") {
 			igt_require_f(data.big_joiner_output_count > 0,
 				      "No bigjoiner output found\n");
 			igt_require_f(data.n_pipes > 1,
@@ -358,9 +454,19 @@ igt_main
 					test_multi_joiner(&data, data.big_joiner_output_count, false);
 	}
 
+	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-ultra-joiner") {
+			igt_require_f(data.ultra_joiner_output_count > 0,
+				      "No ultrajoiner output found\n");
+			igt_require_f(data.n_pipes > 3,
+				      "Minimum 4 pipes required\n");
+			igt_dynamic_f("single-joiner")
+				test_ultra_joiner(&data, false, false);
+	}
+
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
-	igt_subtest_with_dynamic("invalid-modeset") {
+	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
 		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
 		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
 		if (data.big_joiner_output_count >= 1)
@@ -374,6 +480,20 @@ igt_main
 				test_invalid_modeset_two_joiner(&data, true, false);
 	}
 
+	igt_describe("Verify if the modeset on the other pipes are rejected "
+		     "when the pipe A is active with a ultra joiner modeset");
+	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
+		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
+		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
+
+		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
+			test_ultra_joiner(&data, true, false);
+		if (data.non_ultra_joiner_output_count > 0) {
+			igt_dynamic_f("2x")
+				test_ultra_joiner(&data, false, true);
+		}
+	}
+
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic-force-joiner") {
 		igt_require_f(force_joiner_supported,
diff --git a/tests/meson.build b/tests/meson.build
index 00556c9d6..c8cba1b9a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -242,7 +242,6 @@ intel_i915_progs = [
 
 intel_kms_progs = [
 	'kms_big_fb',
-	'kms_big_joiner' ,
 	'kms_busy',
 	'kms_ccs',
 	'kms_cdclk',
@@ -255,6 +254,7 @@ intel_kms_progs = [
 	'kms_flip_scaled_crc',
 	'kms_flip_tiling',
 	'kms_frontbuffer_tracking',
+	'kms_joiner',
 	'kms_legacy_colorkey',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
-- 
2.39.1

