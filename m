Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81D8C5472C
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996CC10E0CD;
	Sun, 25 Aug 2024 18:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0um2ZYI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB9E10E0CD
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608965; x=1756144965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UWWgT9jLjdcBQL5HHy6VL0SF6NxzvtsKTEx89M2NQRY=;
 b=m0um2ZYIJFtTwucJ9yP/2kq5new9pMQwjDXcKdqVmENtpZtbSIGGhKQZ
 FpqffaUrCyfRfMARYt8vLefHRysU2/Hi2hG2eJ0A7qPlyyP1lHOK7ygsP
 YXXoki/tF7iHMnUmLf76XNXjGC5h/aAlzswRqXYz5KhfDdqjCg9L6guyH
 P+HpXY61N/5pzgwnrRQah2T1oKnGkHnm/VYnVtMOWs4v+vuNF9tDIwT2B
 CO/qL2vGAzD2nQE48Up0RsoN9LUjPJYhWNiSFgHta5RYGTHOgNxcexw65
 LDyHehBfPIwXUmWZst/2fK8MBh5CjuJwPd6MFaopabhWqz+rmk3iSIp3l w==;
X-CSE-ConnectionGUID: ZT63g013SeOLQKooZFKnFA==
X-CSE-MsgGUID: fJYLgOJ4S1St+UDCyh6iQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917466"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917466"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:45 -0700
X-CSE-ConnectionGUID: M1SBkwhwQQG7nugJvUccxQ==
X-CSE-MsgGUID: 1kemUECSSy+6D9hD8niDRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488325"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:44 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 13/14] tests/intel/kms_dp_fallback: add test for
 validating fallback
Date: Sun, 25 Aug 2024 23:44:23 +0530
Message-Id: <20240825181424.4034541-14-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825181424.4034541-1-kunal1.joshi@intel.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

add test to valdiate fallback for DP connector,
eDP subtest will be added later.

How does test validates fallback?
- test start by doing initial modeset on default mode
   (if connector is DP then we enable just that connector,
    if its DP-MST we enable all on the same topology)
- force link training failures and retrain until we reach
  lowest param or retrain is disabled
- expect hotplug and link-status to turn bad
- expect link params reduce after fallback

v2: add test for mst (imre)
    refresh mode list (imre)
    monitor got hotplugs (imre)
    check link parameter are reduced (imre)

v3: call check_fn (Santosh)

v4: handle buggy lg monitor (Imre)
    remove reset in between (Imre)

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Suggested-by: Imre Deak <imre.deak@intel.com>
---
 tests/intel/kms_fallback.c | 506 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 2 files changed, 507 insertions(+)
 create mode 100644 tests/intel/kms_fallback.c

diff --git a/tests/intel/kms_fallback.c b/tests/intel/kms_fallback.c
new file mode 100644
index 000000000..e5da3c579
--- /dev/null
+++ b/tests/intel/kms_fallback.c
@@ -0,0 +1,506 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: kms fallback
+ * Category: Display
+ * Description: Test link training fallback for eDP/DP connectors
+ * Driver requirement: i915, xe
+ * Functionality: link training
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+#include <sys/types.h>
+
+#include "igt.h"
+#include "igt_psr.h"
+
+/**
+ * SUBTEST: dp-fallback
+ * Description: Test fallback on DP connectors
+ */
+
+#define RETRAIN_COUNT 1
+#define LT_FAILURE_SAME_CAPS 1
+#define LT_FAILURE_REDUCED_CAPS 2
+#define SPURIOUS_HPD_RETRY 3
+
+static int traversed_mst_outputs[IGT_MAX_PIPES];
+static int traversed_mst_output_count;
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	enum pipe pipe;
+	struct igt_fb fb;
+	struct igt_plane *primary;
+	int n_pipes;
+} data_t;
+
+typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
+
+IGT_TEST_DESCRIPTION("Test link training fallback");
+
+static const char *str_link_rate(enum dp_link_rate link_rate)
+{
+	switch (link_rate) {
+	case DP_LINK_RATE_162000:
+		return "1.62 Gbps";
+	case DP_LINK_RATE_216000:
+		return "2.16 Gbps";
+	case DP_LINK_RATE_243000:
+		return "2.43 Gbps";
+	case DP_LINK_RATE_270000:
+		return "2.70 Gbps";
+	case DP_LINK_RATE_324000:
+		return "3.24 Gbps";
+	case DP_LINK_RATE_432000:
+		return "4.32 Gbps";
+	case DP_LINK_RATE_540000:
+		return "5.40 Gbps";
+	case DP_LINK_RATE_675000:
+		return "6.75 Gbps";
+	case DP_LINK_RATE_810000:
+		return "8.10 Gbps";
+	case DP_LINK_RATE_1000000:
+		return "10.00 Gbps";
+	case DP_LINK_RATE_1350000:
+		return "13.50 Gbps";
+	case DP_LINK_RATE_2000000:
+		return "20.00 Gbps";
+	default:
+		igt_assert_f(0, "Invalid link rate %d\n", link_rate);
+	}
+}
+
+static const char *str_lane_count(enum dp_lane_count lane_count)
+{
+	switch (lane_count) {
+	case DP_LANE_COUNT_1:
+		return "1";
+	case DP_LANE_COUNT_2:
+		return "2";
+	case DP_LANE_COUNT_4:
+		return "4";
+	default:
+		igt_assert_f(0, "Invalid lane count %d\n", lane_count);
+	}
+}
+
+static void find_mst_outputs(int drm_fd, data_t *data,
+			     igt_output_t *output,
+			     igt_output_t **mst_outputs,
+			     int *num_mst_outputs)
+{
+	bool is_output_mst;
+	uint64_t path_blob_id;
+	igt_output_t *connector_output;
+	drmModePropertyPtr path_prop = NULL;
+	drmModePropertyPtr connector_path_prop = NULL;
+
+	igt_assert_f(output, "Invalid output\n");
+
+	/*
+	 * Check if given output is MST by checking if it has PATH property
+	 */
+	is_output_mst = kmstest_get_property(drm_fd,
+			output->config.connector->connector_id,
+			DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
+			&path_blob_id, &path_prop);
+
+	if (!is_output_mst)
+		return;
+
+	/*
+	 * If output is MST check all other connected output which shares
+	 * same path and fill mst_outputs and num_mst_outputs
+	 */
+	for_each_connected_output(&data->display, connector_output) {
+
+		connector_path_prop = NULL;
+
+		kmstest_get_property(drm_fd,
+				     connector_output->config.connector->connector_id,
+				     DRM_MODE_OBJECT_CONNECTOR, "PATH",
+				     NULL, &path_blob_id,
+				     &connector_path_prop);
+
+		if (connector_path_prop && path_prop &&
+		    connector_path_prop->prop_id == path_prop->prop_id)
+			mst_outputs[(*num_mst_outputs)++] = connector_output;
+
+		if (connector_path_prop)
+			drmModeFreeProperty(connector_path_prop);
+	}
+	if (path_prop)
+		drmModeFreeProperty(path_prop);
+}
+
+static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
+			      int *dp_mst_outputs)
+{
+	int i;
+	igt_output_t *output;
+
+	igt_require_f(igt_check_output_is_dp_mst(data->output),
+		      "Not a valid MST connector\n");
+
+	/*
+	 * Check if this is already traversed
+	 */
+	for (i = 0; i < traversed_mst_output_count; i++)
+		if (traversed_mst_outputs[i] == data->output->config.connector->connector_id)
+			return false;
+
+	find_mst_outputs(data->drm_fd, data, data->output,
+			 mst_output, dp_mst_outputs);
+
+	for (i = 0; i < *dp_mst_outputs; i++) {
+		output = mst_output[i];
+		traversed_mst_outputs[traversed_mst_output_count++] = output->config.connector->connector_id;
+		igt_info("Output %s is in same topology as %s\n",
+			 igt_output_name(output),
+			 igt_output_name(data->output));
+	}
+
+	return true;
+}
+
+static void setup_pipe_on_mst_outputs(data_t *data,
+				      igt_output_t *mst_output[],
+				      int *dp_mst_outputs)
+{
+	int i = 0;
+
+	igt_require_f(data->n_pipes >= *dp_mst_outputs,
+		      "Need %d pipes to assign to %d MST outputs\n",
+		      data->n_pipes, *dp_mst_outputs);
+
+	for_each_pipe(&data->display, data->pipe) {
+		if (i >= *dp_mst_outputs)
+			break;
+		igt_info("Setting pipe %s on output %s\n",
+			 kmstest_pipe_name(data->pipe),
+			 igt_output_name(mst_output[i]));
+		igt_output_set_pipe(mst_output[i++], data->pipe);
+	}
+}
+
+static void setup_modeset_on_mst_outputs(data_t *data,
+					 igt_output_t *mst_output[],
+					 int *dp_mst_outputs,
+					 drmModeModeInfo *mode[],
+					 struct igt_fb fb[],
+					 struct igt_plane *primary[])
+{
+	int i;
+
+	for (i = 0; i < *dp_mst_outputs; i++) {
+		mst_output[i]->force_reprobe = true;
+		igt_output_refresh(mst_output[i]);
+		mode[i] = igt_output_get_mode(mst_output[i]);
+		igt_info("Mode %dx%d@%d on output %s\n",
+			 mode[i]->hdisplay, mode[i]->vdisplay,
+			 mode[i]->vrefresh,
+			 igt_output_name(mst_output[i]));
+		primary[i] = igt_output_get_plane_type(mst_output[i],
+							DRM_PLANE_TYPE_PRIMARY);
+		igt_create_color_fb(data->drm_fd,
+				    mode[i]->hdisplay,
+				    mode[i]->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+				    &fb[i]);
+		igt_plane_set_fb(primary[i], &fb[i]);
+	}
+}
+
+static bool validate_modeset_mst_output(data_t *data,
+					igt_output_t *mst_output[],
+					int *dp_mst_outputs,
+					drmModeModeInfo *mode[],
+					struct igt_fb fb[],
+					struct igt_plane *primary[])
+{
+	bool found;
+	int ret;
+
+	igt_require_f(*dp_mst_outputs > 0, "No MST outputs found\n");
+	setup_pipe_on_mst_outputs(data, mst_output, dp_mst_outputs);
+	setup_modeset_on_mst_outputs(data, mst_output,
+				     dp_mst_outputs,
+				     mode, fb, primary);
+	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
+		igt_info("Modes overridden\n");
+		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
+
+		igt_require_f(found,
+			      "No valid mode combo found for MST modeset\n");
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+		igt_require_f(ret == 0,
+			      "Commit failure during MST modeset\n");
+	}
+	return true;
+}
+
+static bool setup_mst(data_t *data, bool is_mst,
+		      igt_output_t *mst_output[],
+		      int *dp_mst_outputs, drmModeModeInfo *mode[],
+		      struct igt_fb fb[], struct igt_plane *primary[])
+{
+	bool ret;
+
+	*dp_mst_outputs = 0;
+	ret = setup_mst_outputs(data, mst_output, dp_mst_outputs);
+	if (!ret) {
+		igt_info("Skipping MST output %s as already tested\n",
+			 igt_output_name(data->output));
+		return false;
+	}
+
+	ret = validate_modeset_mst_output(data, mst_output,
+					  dp_mst_outputs, mode,
+					  fb, primary);
+	if (!ret) {
+		igt_info("Skipping MST output %s as validpipe/output combo not found\n",
+			 igt_output_name(data->output));
+		return false;
+	}
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	return true;
+}
+
+static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
+					condition_check_fn check_fn,
+					double interval, double timeout)
+{
+	struct timespec start_time, current_time;
+	double elapsed_time;
+
+	clock_gettime(CLOCK_MONOTONIC, &start_time);
+
+	while (1) {
+		if (check_fn(drm_fd, output) == 0) {
+			return 0;
+		}
+
+		clock_gettime(CLOCK_MONOTONIC, &current_time);
+		elapsed_time = (current_time.tv_sec - start_time.tv_sec) +
+			(current_time.tv_nsec - start_time.tv_nsec) / 1e9;
+
+		if (elapsed_time >= timeout) {
+			return -1;
+		}
+
+		usleep((useconds_t)(interval * 1000000));
+	}
+}
+
+static void test_fallback(data_t *data, bool is_mst)
+{
+	int dp_mst_outputs, retries;
+	igt_output_t *mst_outputs[IGT_MAX_PIPES];
+	enum dp_link_rate max_link_rate, curr_link_rate, prev_link_rate;
+	enum dp_lane_count max_lane_count, curr_lane_count, prev_lane_count;
+	uint32_t link_status_prop_id;
+	uint64_t link_status_value;
+	drmModeModeInfo *mst_modes[IGT_MAX_PIPES], *mode;
+	drmModePropertyPtr link_status_prop;
+	struct igt_fb mst_fbs[IGT_MAX_PIPES], fb;
+	struct igt_plane *mst_primarys[IGT_MAX_PIPES], *primary;
+	struct udev_monitor *mon;
+
+	igt_display_reset(&data->display);
+	retries = SPURIOUS_HPD_RETRY;
+
+	if (is_mst) {
+		if (!setup_mst(data, is_mst, mst_outputs,
+			       &dp_mst_outputs, mst_modes, mst_fbs,
+			       mst_primarys))
+			return;
+	} else {
+		data->pipe = PIPE_A;
+		igt_output_set_pipe(data->output, data->pipe);
+		mode = igt_output_get_mode(data->output);
+		primary = igt_output_get_plane_type(data->output,
+						    DRM_PLANE_TYPE_PRIMARY);
+		igt_create_color_fb(data->drm_fd,
+				    mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+				    &fb);
+		igt_plane_set_fb(primary, &fb);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	igt_info("Testing link training fallback on %s\n",
+		 igt_output_name(data->output));
+
+	igt_reset_link_params(data->drm_fd, data->output);
+	igt_assert_eq(check_condition_with_timeout(data->drm_fd,
+						   data->output,
+						   igt_get_dp_pending_retrain,
+						   1.0, 20.0), 0);
+
+	max_link_rate = igt_get_dp_max_link_rate(data->drm_fd, data->output);
+	max_lane_count = igt_get_dp_max_lane_count(data->drm_fd, data->output);
+
+	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
+						 data->output)) {
+
+		prev_link_rate = igt_get_dp_link_rate_set_for_output(data->drm_fd, data->output);
+		prev_lane_count = igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output);
+
+		igt_info("Current link rate: %s, Current lane count: %s\n",
+			 str_link_rate(prev_link_rate),
+			 str_lane_count(prev_lane_count));
+		mon = igt_watch_uevents();
+		igt_force_lt_failure(data->drm_fd, data->output,
+				     LT_FAILURE_REDUCED_CAPS);
+		igt_force_link_retrain(data->drm_fd, data->output,
+				       RETRAIN_COUNT);
+
+		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
+							   data->output,
+							   igt_get_dp_pending_retrain,
+							   1.0, 20.0), 0);
+		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
+							   data->output,
+							   igt_get_dp_pending_lt_failures,
+							   1.0, 20.0), 0);
+
+		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
+						     data->output)) {
+			igt_reset_connectors();
+			return;
+		}
+
+		igt_assert_f(igt_hotplug_detected(mon, 20),
+			     "Didn't get hotplug for force link training failure\n");
+
+		kmstest_get_property(data->drm_fd,
+				data->output->config.connector->connector_id,
+				DRM_MODE_OBJECT_CONNECTOR, "link-status",
+				&link_status_prop_id, &link_status_value,
+				&link_status_prop);
+
+		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_BAD);
+
+		igt_flush_uevents(mon);
+
+		if (is_mst) {
+			igt_assert_f(validate_modeset_mst_output(data,
+								 mst_outputs,
+								 &dp_mst_outputs,
+								 mst_modes,
+								 mst_fbs,
+								 mst_primarys),
+				     "MST modeset failed\n");
+		} else {
+			data->output->force_reprobe = true;
+			igt_output_refresh(data->output);
+			data->pipe = PIPE_A;
+			igt_output_set_pipe(data->output, data->pipe);
+			mode = igt_output_get_mode(data->output);
+			igt_info("Mode %dx%d@%d on output %s\n",
+				 mode->hdisplay, mode->vdisplay,
+				 mode->vrefresh,
+				 igt_output_name(data->output));
+			primary = igt_output_get_plane_type(data->output,
+							    DRM_PLANE_TYPE_PRIMARY);
+			igt_create_color_fb(data->drm_fd,
+					    mode->hdisplay,
+					    mode->vdisplay,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    0.0, 1.0, 0.0, &fb);
+			igt_plane_set_fb(primary, &fb);
+		}
+
+		kmstest_set_connector_link_status(data->drm_fd,
+						  data->output->config.connector,
+						  DRM_MODE_LINK_STATUS_GOOD);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		kmstest_get_property(data->drm_fd,
+				data->output->config.connector->connector_id,
+				DRM_MODE_OBJECT_CONNECTOR, "link-status",
+				&link_status_prop_id, &link_status_value,
+				&link_status_prop);
+		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_GOOD);
+
+		curr_link_rate = igt_get_dp_link_rate_set_for_output(data->drm_fd, data->output);
+		curr_lane_count = igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output);
+
+		igt_assert_f((curr_link_rate < prev_link_rate ||
+			     curr_lane_count < prev_lane_count) ||
+			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
+			     "Fallback unsuccessful\n");
+
+		prev_link_rate = curr_link_rate;
+		prev_lane_count = curr_lane_count;
+	}
+}
+
+igt_main
+{
+	data_t data = {};
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
+						     DRIVER_XE);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		for_each_pipe(&data.display, data.pipe) {
+			data.n_pipes++;
+		}
+	}
+
+	igt_subtest("dp-fallback") {
+		bool ran = false;
+		igt_output_t *output;
+
+		for_each_connected_output(&data.display, output) {
+
+			data.output = output;
+			if (!igt_has_force_link_training_failure_debugfs(data.drm_fd,
+								    data.output)) {
+				igt_info("Output %s unsupported\n", igt_output_name(data.output));
+				continue;
+			}
+
+			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
+				igt_info("Skipping output %s as it's not DP\n", output->name);
+				continue;
+			}
+
+			ran = true;
+
+			/*
+			 * Check output is MST
+			 */
+			if (igt_check_output_is_dp_mst(data.output)) {
+				igt_info("Testing MST output %s\n",
+					 igt_output_name(data.output));
+				test_fallback(&data, true);
+			} else {
+				igt_info("Testing DP output %s\n",
+					 igt_output_name(data.output));
+				test_fallback(&data, false);
+			}
+		}
+		igt_require_f(ran, "No output supports fallback\n");
+	}
+
+	igt_fixture {
+		igt_remove_fb(data.drm_fd, &data.fb);
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 00556c9d6..86fab423b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -249,6 +249,7 @@ intel_kms_progs = [
 	'kms_dirtyfb',
 	'kms_draw_crc',
 	'kms_dsc',
+        'kms_fallback',
 	'kms_fb_coherency',
 	'kms_fbcon_fbt',
 	'kms_fence_pin_leak',
-- 
2.43.0

