Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC1BC021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 06:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F2510E374;
	Mon, 17 Feb 2025 06:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVrjvlJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1B810E371
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 06:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739773628; x=1771309628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+BFL6lF7ZjjaNEG2QMqUe0PbjxsHSXkSwNoJtCChLe0=;
 b=lVrjvlJ6Nr77ufpxQbMvx1z+HLWqJkIHveS8+JjgNu89MXS53VpF0s5x
 DdShcdQLfFFOpBdprWP2rxLzUGgj6jpGUyhedOTk+/x1On5BTUr7ZgPmK
 eNlydmvtqEo1DrgNavMdyW0OoZ8h3P10wRbjHSwFEkr1smFv1OyJ65nP2
 WExhPNPw5Ekh1GLYY6z9yxtssZ4Av+TQ/7WljMsqEh69dA6EMc9qkb4YZ
 W2rFan4Ne9S7aZ8UpdloLcnIjQ1Y6o2Kk9a2vrK681ja3aGE9ICTBgTfQ
 O+iwfy9+5HhHRJJ7LuENjWQRAB8ITr26PA1dLffS4RXbL8UXeVJykNMkn Q==;
X-CSE-ConnectionGUID: /Bmuj+rSSOC0P0MBbqgqEw==
X-CSE-MsgGUID: 7jMEytT9ShyprEtkUM0zfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40149659"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40149659"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 22:27:08 -0800
X-CSE-ConnectionGUID: K3vzEUTiQWqC4xEjbFLZwA==
X-CSE-MsgGUID: pJT9hCgsQEiTyo/fEp8UxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="114661973"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 22:27:06 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_dp_link_training: add tests for
 UHBR/NON-UHBR over SST/MST
Date: Mon, 17 Feb 2025 12:12:39 +0530
Message-Id: <20250217064239.2019316-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217064239.2019316-1-kunal1.joshi@intel.com>
References: <20250217064239.2019316-1-kunal1.joshi@intel.com>
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

Add new test kms_dp_linktraining
to validate both UHBR and non-UHBR link rates over SST
and MST configurations.
Add four new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst)
to check if the link rates match the expected UHBR or NON-UHBR capability
and whether the outputs are MST or SST.

v2: add definition for UHBR_LINK_RATE
v3: add failure criteria (Jani Nikula)
v4: fix indentation (Swati)
    fix typo in subject (Swati)
    fix docs (Swati)
    add display version check (Swati)
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/intel/kms_dp_link_training.c | 378 +++++++++++++++++++++++++++++
 tests/meson.build                  |   4 +
 2 files changed, 382 insertions(+)
 create mode 100644 tests/intel/kms_dp_link_training.c

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
new file mode 100644
index 000000000..7f3d3b332
--- /dev/null
+++ b/tests/intel/kms_dp_link_training.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: MIT
+/**
+ * TEST: kms dp link training
+ * Category: Display
+ * Description: Test to validate link training on SST/MST with UHBR/NON_UHBR rates
+ * Driver requirement: i915, xe
+ * Functionality: link_training
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: uhbr-sst
+ * Description: Test we can drive UHBR rates over SST.
+ * Functionality: link_training, uhbr, sst
+ * Test category: functionality test
+ *
+ * SUBTEST: uhbr-mst
+ * Description: Test we can drive UHBR rates over MST.
+ * Functionality: link_training, uhbr, mst
+ * Test category: functionality test
+ *
+ * SUBTEST: non-uhbr-sst
+ * Description: Test we can drive non-UHBR rates over SST.
+ * Functionality: link_training, sst
+ * Test category: functionality test
+ *
+ * SUBTEST: non-uhbr-mst
+ * Description: Test we can drive non-UHBR rates over MST.
+ * Functionality: feature_discovery, mst
+ * Test category: functionality test
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+#include "intel/kms_joiner_helper.h"
+#include "intel/kms_mst_helper.h"
+
+/*
+ * DP Spec defines 10, 13.5, and 20 Gbps as UHBR.
+ * Anything below that is considered NON-UHBR.
+ */
+#define UHBR_LINK_RATE	1000000
+#define RETRAIN_COUNT	1
+
+typedef struct {
+	int drm_fd;
+	uint32_t devid;
+	igt_display_t display;
+	igt_output_t *output;
+} data_t;
+
+/*
+ * check_condition_with_timeout - Polls check_fn until it returns 0
+ * or until 'timeout' seconds elapse.
+ */
+static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
+					int (*check_fn)(int, igt_output_t *),
+					double interval, double timeout)
+{
+	struct timespec start_time, current_time;
+	double elapsed_time;
+	int ret;
+
+	clock_gettime(CLOCK_MONOTONIC, &start_time);
+
+	while (true) {
+		ret = check_fn(drm_fd, output);
+		if (ret == 0)
+			return 0;
+
+		clock_gettime(CLOCK_MONOTONIC, &current_time);
+		elapsed_time = (current_time.tv_sec - start_time.tv_sec) +
+			(current_time.tv_nsec - start_time.tv_nsec) / 1e9;
+		if (elapsed_time >= timeout)
+			return -1;
+
+		usleep((useconds_t)(interval * 1e6));
+	}
+}
+
+/*
+ * assert_link_status_good - Verifies link-status == GOOD
+ * for either a single SST output or all MST outputs in the topology.
+ */
+static void assert_link_status_good(data_t *data, bool mst)
+{
+	igt_output_t *outputs[IGT_MAX_PIPES];
+	uint32_t link_status_prop_id;
+	uint64_t link_status_value;
+	drmModePropertyPtr link_status_prop;
+	int count = 0;
+	int i;
+
+	if (mst) {
+		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
+					&data->display, data->output,
+					outputs, &count),
+				"Unable to find MST outputs\n");
+
+		for (i = 0; i < count; i++) {
+			kmstest_get_property(data->drm_fd,
+					outputs[i]->config.connector->connector_id,
+					DRM_MODE_OBJECT_CONNECTOR,
+					"link-status",
+					&link_status_prop_id,
+					&link_status_value,
+					&link_status_prop);
+
+			igt_assert_eq(link_status_value,
+					DRM_MODE_LINK_STATUS_GOOD);
+		}
+	} else {
+		kmstest_get_property(data->drm_fd,
+				data->output->config.connector->connector_id,
+				DRM_MODE_OBJECT_CONNECTOR,
+				"link-status",
+				&link_status_prop_id,
+				&link_status_value,
+				&link_status_prop);
+
+		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_GOOD);
+	}
+}
+
+/*
+ * setup_planes_fbs - Create solid-color FBs and attach them to the primary plane.
+ */
+static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
+			     int count, drmModeModeInfo *modes[],
+			     struct igt_fb fbs[], struct igt_plane *planes[])
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		modes[i] = igt_output_get_mode(outs[i]);
+		igt_info("Mode %dx%d@%d on output %s\n",
+				modes[i]->hdisplay, modes[i]->vdisplay,
+				modes[i]->vrefresh, igt_output_name(outs[i]));
+
+		planes[i] = igt_output_get_plane_type(outs[i],
+				DRM_PLANE_TYPE_PRIMARY);
+
+		igt_create_color_fb(data->drm_fd, modes[i]->hdisplay,
+				modes[i]->vdisplay,
+				DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR,
+				0.0, 1.0, 0.0, &fbs[i]);
+
+		igt_plane_set_fb(planes[i], &fbs[i]);
+	}
+}
+
+/*
+ * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
+ * output modes to fit bandwidth.
+ */
+static bool fit_modes_in_bw(data_t *data)
+{
+	int ret;
+
+	ret = igt_display_try_commit_atomic(&data->display,
+			DRM_MODE_ATOMIC_TEST_ONLY |
+			DRM_MODE_ATOMIC_ALLOW_MODESET,
+			NULL);
+	if (ret != 0) {
+		bool found;
+
+		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
+		igt_require_f(found, "No valid mode combo found for modeset\n");
+	}
+
+	return true;
+}
+
+static void do_modeset(data_t *data, bool mst)
+{
+	uint32_t master_pipes_mask = 0;
+	uint32_t valid_pipes_mask = 0;
+	uint32_t used_pipes_mask = 0;
+	igt_output_t *outs[IGT_MAX_PIPES];
+	drmModeModeInfo *modes[IGT_MAX_PIPES];
+	struct igt_fb fbs[IGT_MAX_PIPES];
+	struct igt_plane *planes[IGT_MAX_PIPES];
+	int n_pipes = 0;
+	int out_count = 0;
+	int i;
+
+	for_each_pipe(&data->display, i) {
+		valid_pipes_mask |= BIT(i);
+		n_pipes++;
+	}
+
+	if (mst) {
+		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
+					&data->display,
+					data->output, outs,
+					&out_count),
+				"Unable to find MST outputs\n");
+	} else {
+		outs[0] = data->output;
+		out_count = 1;
+	}
+
+	igt_assert_f(out_count > 0, "Require at least one output\n");
+
+	igt_set_all_master_pipes_for_platform(&data->display, &master_pipes_mask);
+
+	igt_assert_f(igt_assign_pipes_for_outputs(data->drm_fd,
+				outs,
+				out_count,
+				n_pipes,
+				&used_pipes_mask,
+				master_pipes_mask,
+				valid_pipes_mask),
+			"Unable to assign pipes for outputs\n");
+
+	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
+	fit_modes_in_bw(data);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+/*
+ * run_link_rate_test - Main link training routine. Expects the MST vs. SST check
+ * to be done beforehand. Returns true if tested at the correct rate.
+ */
+static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
+{
+	int max_link_rate;
+	int max_lane_count;
+	int current_link_rate;
+	bool is_uhbr_output;
+	char rate_str[32];
+	char lane_str[32];
+
+	igt_display_reset(&data->display);
+	igt_reset_link_params(data->drm_fd, data->output);
+
+	/* Retrain at default/driver parameters */
+	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
+		      igt_get_dp_pending_retrain, 1.0, 20.0), 0);
+	assert_link_status_good(data, mst);
+	do_modeset(data, mst);
+
+	/* FIXME : Driver may lie max link rate or max lane count */
+	/* Read max_link_rate and max_lane_count */
+	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
+	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
+
+	/* Check sink supports uhbr or not */
+	is_uhbr_output = (max_link_rate >= UHBR_LINK_RATE);
+	if ((uhbr && !is_uhbr_output) || (!uhbr && is_uhbr_output)) {
+		igt_info("Test expects %s, but output %s is %s.\n",
+			 uhbr ? "UHBR" : "NON-UHBR",
+			 data->output->name,
+			 is_uhbr_output ? "UHBR" : "NON-UHBR");
+		igt_info("----------------------------------------------------\n");
+		return false;
+	}
+
+	snprintf(rate_str, sizeof(rate_str), "%d", max_link_rate);
+	snprintf(lane_str, sizeof(lane_str), "%d", max_lane_count);
+	igt_info("Max link rate for %s is %s, lane count = %d\n",
+		 data->output->name, rate_str, max_lane_count);
+
+	/* Force retrain at max link params */
+	igt_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
+	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
+	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
+		      igt_get_dp_pending_retrain, 1.0, 20.0), 0);
+	assert_link_status_good(data, mst);
+
+	current_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
+	igt_info("Current link rate is %d\n", current_link_rate);
+	igt_assert_f(current_link_rate == max_link_rate,
+		     "Link training did not succeed at max link rate.\n");
+	igt_assert_f(is_uhbr_output ?
+		     current_link_rate >= UHBR_LINK_RATE :
+		     current_link_rate < UHBR_LINK_RATE,
+		     is_uhbr_output ? "Link training didn't happen at uhbr rates" :
+		     "Link training didn't happen at non-uhbr rates");
+	igt_info("----------------------------------------------------\n");
+	return true;
+}
+
+/*
+ * test_link_rate - Iterates over connected DP outputs. Checks MST vs. SST
+ * early, then calls run_link_rate_test(). Returns true if it ran on at
+ * least one matching output.
+ */
+static bool test_link_rate(data_t *data, bool mst, bool uhbr)
+{
+	bool ran_any_output = false, is_mst = false;
+	igt_output_t *tmp_output;
+
+	igt_skip_on_f(!is_intel_device(data->drm_fd),
+			"Test supported only on Intel platforms.\n");
+
+	for_each_connected_output(&data->display, tmp_output) {
+		if (tmp_output->config.connector->connector_type !=
+		    DRM_MODE_CONNECTOR_DisplayPort) {
+			igt_info("Skipping non-DisplayPort output %s\n",
+					tmp_output->name);
+			igt_info("----------------------------------------------------\n");
+			continue;
+		}
+
+		/* Early skip if MST vs. SST does not match. */
+		is_mst = igt_check_output_is_dp_mst(tmp_output);
+		if (mst && !is_mst) {
+			igt_info("Skipping %s: MST requested but it's SST.\n",
+					tmp_output->name);
+			igt_info("----------------------------------------------------\n");
+			continue;
+		} else if (!mst && is_mst) {
+			igt_info("Skipping %s: SST requested but it's MST.\n",
+					tmp_output->name);
+			igt_info("----------------------------------------------------\n");
+			continue;
+		}
+		data->output = tmp_output;
+		igt_info("Running link training test for %s\n",
+			 data->output->name);
+		ran_any_output = ran_any_output | run_link_rate_test(data, mst, uhbr);
+	}
+	return ran_any_output;
+}
+
+IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
+		     "UHBR/NON_UHBR rates");
+
+igt_main
+{
+	data_t data = {};
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Test we can drive UHBR rates over SST");
+	igt_subtest("uhbr-sst") {
+		igt_require_f(intel_display_ver(data.devid) >= 13,
+			      "UHBR not supported on platform\n");
+		igt_require_f(test_link_rate(&data, false, true),
+			      "Didn't find any SST output with UHBR rates.\n");
+	}
+
+	igt_describe("Test we can drive UHBR rates over MST");
+	igt_subtest("uhbr-mst") {
+                igt_require_f(intel_display_ver(data.devid) >= 13,
+                              "UHBR not supported on platform\n");
+		igt_require_f(test_link_rate(&data, true, true),
+			      "Didn't find any MST output with UHBR rates.\n");
+	}
+
+	igt_describe("Test we can drive NON-UHBR rates over SST");
+	igt_subtest("non-uhbr-sst") {
+		igt_require_f(test_link_rate(&data, false, false),
+			      "Didn't find any SST output with NON-UHBR rates.\n");
+	}
+
+	igt_describe("Test we can drive NON-UHBR rates over MST");
+	igt_subtest("non-uhbr-mst") {
+		igt_require_f(test_link_rate(&data, true, false),
+			      "Didn't find any MST output with NON-UHBR rates.\n");
+	}
+
+	igt_fixture {
+		igt_reset_connectors();
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index dea2cb02b..896e8a832 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -245,6 +245,7 @@ intel_kms_progs = [
 	'kms_ccs',
 	'kms_cdclk',
 	'kms_dirtyfb',
+	'kms_dp_link_training',
         'kms_dp_linktrain_fallback',
 	'kms_draw_crc',
 	'kms_dsc',
@@ -369,6 +370,9 @@ extra_sources = {
 	'kms_dp_linktrain_fallback': [
            join_paths ('intel', 'kms_mst_helper.c'),
            join_paths ('intel', 'kms_dsc_helper.c') ],
+	'kms_dp_link_training': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
-- 
2.25.1

