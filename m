Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338F9C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 07:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE97F10E77D;
	Thu, 23 Jan 2025 07:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGDY6m4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84CB10E77D
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737616888; x=1769152888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=em3rYy8IyUxs7+59X/fsgczUyTIzjqp+kADgs2l1LbU=;
 b=kGDY6m4wW8yTloJXRq4N524g2lrFFvs2zL5WzetCFJlU87wYKVJFz1cx
 ThqEoZQrkoPJyHt/KjTYdouixUiQ/ao9qo82tnNKFu9RV8V6mlKzrsus5
 E3vG9yYMpiq+hHr3dft7lfwJu9mKtN0bLt4gkrUfgublFtuXtGSA1Gqss
 W4+fqg82C3hl1oPjzvU7SlySoSYKDcU8hS+e5s6HPqDcTvJcPCpgChg+V
 Sn2iE1dGNRCn+pibcKdi1CRXpIpGYx1nSKbUe/vCJp6V5zcpr2LGducES
 RF7xoH4jLJXKw5j4dFHHrnvlOsyK31dcT8oaY+bTaQmoCINLIQjXYgsPz g==;
X-CSE-ConnectionGUID: VkIL+2ALQiGIPlL/+H0IMg==
X-CSE-MsgGUID: U0nua5pVR5arbUy8QF69dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37984912"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37984912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 23:21:28 -0800
X-CSE-ConnectionGUID: CG6yyv60TlS+uARkVMVA5Q==
X-CSE-MsgGUID: dIpy+RqIQvynPUItrOQ8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111392570"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:21:27 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/kms_dp_linktrain_fallback: add
 dsc-fallback test
Date: Thu, 23 Jan 2025 13:07:00 +0530
Message-Id: <20250123073701.3113428-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123073701.3113428-1-kunal1.joshi@intel.com>
References: <20250123073701.3113428-1-kunal1.joshi@intel.com>
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

add new dsc-fallback test which finds a mode
which can be driven without DSC at current link
params and reduces link param till we have
combination (link_rate, lane_count) which requires
DSC to be enabled.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 352 +++++++++++++++++++++---
 tests/meson.build                       |   4 +-
 2 files changed, 311 insertions(+), 45 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index b10946781..471381f1d 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -17,10 +17,14 @@
 
 #include "igt.h"
 #include "kms_mst_helper.h"
+#include "kms_dsc_helper.h"
 
 /**
  * SUBTEST: dp-fallback
  * Description: Test fallback on DP connectors
+ *
+ * SUBTEST: dsc-fallback
+ * Description: Test we fallback to DSC when BW isn't sufficient
  */
 
 #define RETRAIN_COUNT 1
@@ -238,16 +242,124 @@ static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
 	}
 }
 
+/*
+ * Force a link training failure followed by link retrain, then
+ * block until the driver has no further pending retrain/failure.
+ * Returns false if we time out waiting.
+ */
+static bool force_failure_and_wait(data_t *data,
+				   igt_output_t *output,
+				   int failure_type,
+				   int retrain_count,
+				   double interval,
+				   double timeout)
+{
+	igt_force_lt_failure(data->drm_fd, output, failure_type);
+	igt_force_link_retrain(data->drm_fd, output, retrain_count);
+
+	/* Wait until there's no pending retrain */
+	if (check_condition_with_timeout(data->drm_fd, output,
+					 igt_get_dp_pending_retrain,
+					 interval, timeout)) {
+		igt_info("Timed out waiting for pending retrain.\n");
+		return false;
+	}
+
+	/* Wait until there's no pending LT failures */
+	if (check_condition_with_timeout(data->drm_fd, output,
+					 igt_get_dp_pending_lt_failures,
+					 interval, timeout)) {
+		igt_info("Timed out waiting for pending LT failures.\n");
+		return false;
+	}
+
+	return true;
+}
+
+/*
+ * Waits for a hotplug event, then checks that the link-status is BAD.
+ * Returns false if the link-status isn't BAD or no hotplug arrives in time.
+ */
+static bool wait_for_hotplug_and_check_bad(int drm_fd,
+					   data_t *data,
+					   igt_output_t *output,
+					   struct udev_monitor *mon,
+					   double hotplug_timeout)
+{
+	uint32_t link_status_prop_id;
+	uint64_t link_status_value;
+	drmModePropertyPtr link_status_prop;
+
+	if (!igt_hotplug_detected(mon, hotplug_timeout)) {
+		igt_info("No hotplug event within %.2f seconds.\n", hotplug_timeout);
+		return false;
+	}
+
+	kmstest_get_property(drm_fd,
+			     output->config.connector->connector_id,
+			     DRM_MODE_OBJECT_CONNECTOR,
+			     "link-status",
+			     &link_status_prop_id, &link_status_value,
+			     &link_status_prop);
+
+	if (link_status_value != DRM_MODE_LINK_STATUS_BAD) {
+		igt_info("Expected link-status=BAD but got %" PRIu64 "\n",
+			 link_status_value);
+		return false;
+	}
+
+	return true;
+}
+
+/*
+ * Sets link status=GOOD for the specified outputs, then calls
+ * validate_modeset_for_outputs() to re-commit. Returns false
+ * if the re-commit fails.
+ */
+static bool fix_link_status_and_recommit(data_t *data,
+					 igt_output_t *outputs[],
+					 int *output_count,
+					 drmModeModeInfo * modes[],
+					 struct igt_fb fbs[],
+					 struct igt_plane *primarys[])
+{
+	int i;
+	igt_output_t *out;
+
+	/* Set link-status=GOOD on each tested output */
+	for_each_connected_output(&data->display, out) {
+		for (i = 0; i < *output_count; i++) {
+			if (out->id == outputs[i]->id) {
+				igt_output_set_prop_value(
+					out, IGT_CONNECTOR_LINK_STATUS,
+					DRM_MODE_LINK_STATUS_GOOD);
+			}
+		}
+	}
+
+	if (!validate_modeset_for_outputs(data, outputs, output_count,
+					  modes, fbs, primarys)) {
+		igt_info("Modeset validation failed after forcing link-status=GOOD.\n");
+		return false;
+	}
+
+	if (igt_display_try_commit_atomic(&data->display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET,
+					  NULL) != 0) {
+		igt_info("Commit failed after restoring link-status=GOOD.\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void test_fallback(data_t *data, bool is_mst)
 {
 	int output_count, retries;
 	int max_link_rate, curr_link_rate, prev_link_rate;
 	int max_lane_count, curr_lane_count, prev_lane_count;
 	igt_output_t *outputs[IGT_MAX_PIPES];
-	uint32_t link_status_prop_id;
-	uint64_t link_status_value;
-	drmModeModeInfo *modes[IGT_MAX_PIPES];
-	drmModePropertyPtr link_status_prop;
+	drmModeModeInfo * modes[IGT_MAX_PIPES];
 	struct igt_fb fbs[IGT_MAX_PIPES];
 	struct igt_plane *primarys[IGT_MAX_PIPES];
 	struct udev_monitor *mon;
@@ -256,71 +368,71 @@ static void test_fallback(data_t *data, bool is_mst)
 
 	igt_display_reset(&data->display);
 	igt_reset_link_params(data->drm_fd, data->output);
-	if (!setup_outputs(data, is_mst, outputs,
-			   &output_count, modes, fbs,
-			   primarys))
+	igt_force_link_retrain(data->drm_fd, data->output, 1);
+
+	if (!setup_outputs(data, is_mst, outputs, &output_count,
+			   modes, fbs, primarys))
 		return;
 
 	igt_info("Testing link training fallback on %s\n",
 		 igt_output_name(data->output));
 	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
 	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
+
 	prev_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
 	prev_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
 
-	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
-						 data->output)) {
+	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
 		igt_info("Current link rate: %d, Current lane count: %d\n",
-			 prev_link_rate,
-			 prev_lane_count);
+			 prev_link_rate, prev_lane_count);
+
 		mon = igt_watch_uevents();
-		igt_force_lt_failure(data->drm_fd, data->output,
-				     LT_FAILURE_REDUCED_CAPS);
-		igt_force_link_retrain(data->drm_fd, data->output,
-				       RETRAIN_COUNT);
-
-		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
-							   data->output,
-							   igt_get_dp_pending_retrain,
-							   1.0, 20.0), 0);
-		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
-							   data->output,
-							   igt_get_dp_pending_lt_failures,
-							   1.0, 20.0), 0);
+
+		/* Force link failure, wait for retrain to clear */
+		igt_assert_f(force_failure_and_wait(data, data->output,
+						    LT_FAILURE_REDUCED_CAPS,
+						    RETRAIN_COUNT,
+						    1.0, 20.0),
+			     "Link training failure steps timed out\n");
 
 		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
 						     data->output)) {
 			igt_reset_connectors();
+			igt_flush_uevents(mon);
 			return;
 		}
 
-		igt_assert_f(igt_hotplug_detected(mon, 20),
-			     "Didn't get hotplug for force link training failure\n");
-
-		kmstest_get_property(data->drm_fd,
-				data->output->config.connector->connector_id,
-				DRM_MODE_OBJECT_CONNECTOR, "link-status",
-				&link_status_prop_id, &link_status_value,
-				&link_status_prop);
-		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_BAD);
+		/* Wait for hotplug + check link-status=BAD */
+		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
+							    data,
+							    data->output,
+							    mon,
+							    20.0),
+			     "Didn't get hotplug or link-status=BAD\n");
 		igt_flush_uevents(mon);
-		set_connector_link_status_good(data, outputs, &output_count);
-		igt_assert_f(validate_modeset_for_outputs(data,
+
+		/* Set link-status=GOOD and re-commit */
+		igt_assert_f(fix_link_status_and_recommit(data,
 							  outputs,
 							  &output_count,
 							  modes,
 							  fbs,
 							  primarys),
 			     "modeset failed\n");
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
-		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
-		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
+		/* Ensure link-status is GOOD again */
+		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS],
+			      DRM_MODE_LINK_STATUS_GOOD);
+
+		curr_link_rate = igt_get_current_link_rate(data->drm_fd,
+							   data->output);
+		curr_lane_count = igt_get_current_lane_count(data->drm_fd,
+							     data->output);
 
 		igt_assert_f((curr_link_rate < prev_link_rate ||
-			     curr_lane_count < prev_lane_count) ||
-			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
+			      curr_lane_count < prev_lane_count) ||
+			     ((curr_link_rate == max_link_rate &&
+			       curr_lane_count == max_lane_count) && --retries),
 			     "Fallback unsuccessful\n");
 
 		prev_link_rate = curr_link_rate;
@@ -328,7 +440,117 @@ static void test_fallback(data_t *data, bool is_mst)
 	}
 }
 
-static bool run_test(data_t *data)
+static void test_dsc_sst_fallback(data_t *data)
+{
+	bool non_dsc_mode_found = false;
+	bool dsc_fallback_successful = false;
+	int ret;
+	struct udev_monitor *mon;
+	drmModeModeInfo *mode_to_check;
+	igt_output_t *outputs[IGT_MAX_PIPES];
+	int output_count = 0;
+
+	igt_info("Checking DSC fallback on %s\n", igt_output_name(data->output));
+	data->pipe = PIPE_A;
+
+        igt_display_reset(&data->display);
+        igt_reset_link_params(data->drm_fd, data->output);
+	igt_force_link_retrain(data->drm_fd, data->output, 1);
+
+	/* Find a mode that doesn't require DSC initially */
+	for_each_connector_mode(data->output) {
+		data->mode = &data->output->config.connector->modes[j__];
+		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
+				    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+				    &data->fb);
+		igt_output_override_mode(data->output, data->mode);
+		igt_output_set_pipe(data->output, data->pipe);
+		data->primary = igt_output_get_plane_type(data->output,
+						DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(data->primary, &data->fb);
+
+		ret = igt_display_try_commit_atomic(&data->display,
+						    DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
+		if (ret != 0) {
+			igt_info("Skipping mode %dx%d@%d on %s\n",
+				 data->mode->hdisplay, data->mode->vdisplay,
+				 data->mode->vrefresh,
+				 igt_output_name(data->output));
+			continue;
+		}
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		if (!igt_is_dsc_enabled(data->drm_fd,
+					data->output->name)) {
+			drmModeModeInfo *non_dsc_mode
+				= igt_output_get_mode(data->output);
+			igt_info("Found mode %dx%d@%d %s that doesn't need DSC with link rate %d and lane count %d\n",
+				 non_dsc_mode->hdisplay, non_dsc_mode->vdisplay,
+				 non_dsc_mode->vrefresh, non_dsc_mode->name,
+				 igt_get_current_link_rate(data->drm_fd, data->output),
+				 igt_get_current_lane_count(data->drm_fd, data->output));
+			non_dsc_mode_found = true;
+			break;
+		}
+	}
+	igt_require_f(non_dsc_mode_found,
+		      "No non-DSC mode found on %s\n",
+		      igt_output_name(data->output));
+
+
+	/* Repeatedly force link failure until DSC is required (or link is disabled) */
+	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
+		mon = igt_watch_uevents();
+
+		igt_assert_f(force_failure_and_wait(data, data->output,
+						    LT_FAILURE_REDUCED_CAPS,
+						    RETRAIN_COUNT, 1.0, 20.0),
+			     "Forcing DSC fallback timed out\n");
+
+		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
+						     data->output)) {
+			igt_reset_connectors();
+			igt_flush_uevents(mon);
+			return;
+		}
+
+		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
+							    data,
+							    data->output,
+							    mon,
+							    20.0),
+			     "Didn't get hotplug or link-status=BAD for DSC\n");
+		igt_flush_uevents(mon);
+
+		outputs[output_count++] = data->output;
+		set_connector_link_status_good(data, outputs, &output_count);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		mode_to_check = igt_output_get_mode(data->output);
+
+		if (igt_is_dsc_enabled(data->drm_fd, data->output->name)) {
+			igt_info("mode %dx%d@%d now requires DSC with link rate %d and lane count %d\n",
+				 mode_to_check->hdisplay, mode_to_check->vdisplay,
+				 mode_to_check->vrefresh,
+				 igt_get_current_link_rate(data->drm_fd, data->output),
+				 igt_get_current_lane_count(data->drm_fd, data->output));
+			igt_info("DSC fallback successful on %s\n",
+				 igt_output_name(data->output));
+			dsc_fallback_successful = true;
+			break;
+		} else {
+			igt_info("mode %dx%d@%d still doesn't require DSC\n",
+				 mode_to_check->hdisplay, mode_to_check->vdisplay,
+				 mode_to_check->vrefresh);
+		}
+	}
+	igt_assert_f(dsc_fallback_successful, "DSC fallback unsuccessful\n");
+}
+
+static bool run_lt_fallback_test(data_t *data)
 {
 	bool ran = false;
 	igt_output_t *output;
@@ -366,6 +588,43 @@ static bool run_test(data_t *data)
 	return ran;
 }
 
+static bool run_dsc_sst_fallaback_test(data_t *data)
+{
+	bool ran = false;
+	igt_output_t *output;
+
+	if (!is_dsc_supported_by_source(data->drm_fd)) {
+		igt_info("DSC not supported by source.\n");
+		return ran;
+	}
+
+	for_each_connected_output(&data->display, output) {
+		data->output = output;
+
+		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
+								 data->output)) {
+			igt_info("Output %s doesn't support forcing link training.\n",
+				 igt_output_name(data->output));
+			continue;
+		}
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
+			igt_info("Skipping output %s as it's not DP\n", output->name);
+			continue;
+		}
+
+		if (!is_dsc_supported_by_sink(data->drm_fd, data->output)) {
+			igt_info("Skipping output %s as DSC not supported by sink\n",
+				 igt_output_name(data->output));
+			continue;
+		}
+
+		ran = true;
+		test_dsc_sst_fallback(data);
+	}
+	return ran;
+}
+
 igt_main
 {
 	data_t data = {};
@@ -381,8 +640,13 @@ igt_main
 	}
 
 	igt_subtest("dp-fallback") {
-		igt_require_f(run_test(&data),
-			      "Skipping test as no output found or none supports fallback\n");
+		igt_require_f(run_lt_fallback_test(&data),
+			      "Skipping test as no DP output found or none supports forcing link fail\n");
+	}
+
+	igt_subtest("dsc-fallback") {
+		igt_require_f(run_dsc_sst_fallaback_test(&data),
+			      "Skipping test: DSC fallback conditions not met.\n");
 	}
 
 	igt_fixture {
diff --git a/tests/meson.build b/tests/meson.build
index 2cbd21c2a..dd75976dd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -367,7 +367,9 @@ extra_sources = {
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
-	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
+	'kms_dp_linktrain_fallback': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_dsc_helper.c')],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.25.1

