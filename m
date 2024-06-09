Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FAEC27C5E
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218210E2C7;
	Sun,  9 Jun 2024 21:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkenSGKH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD1810E2C3
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967631; x=1749503631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uDO71bbJiSMcrknnu4VyYf5dvCtPPqf+9v4sJ3dnWYg=;
 b=AkenSGKHrZ3jnb7eNwkzywflQsSsILOom29nYy4By1V9q++i/lxlOuH7
 CaPDIKzj0pFZj5t6+VQKumxnrqc2UPtbLNbCFf57xwKwiuWRGsPTDD3TN
 57U5P1P72EEYhLDOIElCdvrDiRFYV+UtddKnGqZal6kGXDvoNrS4bcz2y
 87fkVY4hnSRnFEpG9dflvYpbvV/+zvvUkTWY/YVlMZLAym9wC2OXPVQn8
 jmlFeR1GfPhuM3Ig1s0Ndv68dqPDCYGg1rFCJLYAhDAHTTyGtUhIt/By6
 VYV9ZvfcCbahOMX99kDqHruRIstsgN6SSkfkt/HkhHjL28MWknxW8ldu/ Q==;
X-CSE-ConnectionGUID: By62zJ3fRBaRjNb7nSBBFg==
X-CSE-MsgGUID: xb+9iu74RsmI6b5+zj/o1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037490"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:51 -0700
X-CSE-ConnectionGUID: DBCPQvMtThaYLQhvLR7fFA==
X-CSE-MsgGUID: iEcxtIQGRGm1CN3WMGT93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991044"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:50 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 8/9] tests/intel/kms_dp_fallback: add test for
 validating fallback
Date: Mon, 10 Jun 2024 02:55:34 +0530
Message-Id: <20240609212535.868832-9-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240609212535.868832-1-kunal1.joshi@intel.com>
References: <20240609212535.868832-1-kunal1.joshi@intel.com>
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

add fallback test which tries to validate fallback by
reducing link rate / lane count, until retrain is disabled
or the lowest mode bw requirements are met.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_fallback.c | 207 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 tests/intel/kms_dp_fallback.c

diff --git a/tests/intel/kms_dp_fallback.c b/tests/intel/kms_dp_fallback.c
new file mode 100644
index 000000000..935a77cc6
--- /dev/null
+++ b/tests/intel/kms_dp_fallback.c
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 20234 Intel Corporation
+ */
+
+/**
+ * TEST: kms dp fallback
+ * Category: Display
+ * Description: Test link training fallback for DP connectors
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
+ * SUBTEST: fallback
+ * Description: Test fallback
+ */
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	enum pipe pipe;
+	struct igt_fb fb;
+	struct igt_plane *primary;
+} data_t;
+
+IGT_TEST_DESCRIPTION("Test link training fallback for DP connectors");
+
+#define BITS_PER_PIXEL 24
+#define ENCODING_OVERHEAD_8b_10b 0.8
+#define ENCODING_OVERHEAD_128b_132b 0.9723
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
+static void find_min_dp_config(int drm_fd, drmModeModeInfo mode, igt_output_t *output, uint64_t *min_link_rate, int *min_lane_count)
+{
+	int i, lanes;
+	int num_rates = 0;
+	float overhead;
+	uint64_t link_rates[DP_MAX_LINK_RATE_COUNT];
+	uint64_t required_bandwidth, available_bandwidth;
+
+	igt_require_f(mode.vdisplay > 0, "No modes found\n");
+	igt_require_f(output, "Output cannot be null\n");
+
+	required_bandwidth = (uint64_t)(mode.clock * BITS_PER_PIXEL);
+	read_link_rates(drm_fd, link_rates, &num_rates, output);
+
+	for (lanes = 4; lanes > 0 ; lanes = lanes/2) {
+		for (i = num_rates-1; i > 0; i--) {
+			overhead = link_rates[i] >= DP_LINK_RATE_1000000 ?
+						    ENCODING_OVERHEAD_128b_132b :
+						    ENCODING_OVERHEAD_8b_10b;
+			available_bandwidth = link_rates[i] * lanes * overhead * 10;
+			if (available_bandwidth < required_bandwidth) {
+				igt_info("Lowest link configuration for %s: Link Rate = %"PRIu64" Kbps, Lanes = %d\n", output->name, link_rates[i], lanes);
+				*min_link_rate = link_rates[i];
+				*min_lane_count = lanes;
+				return;
+			}
+		}
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
+static bool is_retrain_disabled(data_t *data)
+{
+	struct dp_link_training_info info;
+
+	igt_read_link_training_info(data->drm_fd, data->output, &info);
+	return info.retrain_disabled;
+}
+
+static void test_fallback(data_t *data)
+{
+	bool first = true;
+	uint64_t min_link_rate;
+	int min_lane_count;
+
+	igt_sort_connector_modes(data->output->config.connector, sort_drm_modes_by_res_asc);
+	find_min_dp_config(data->drm_fd, data->output->config.connector->modes[0], data->output,
+			   &min_link_rate, &min_lane_count);
+
+	while (!is_retrain_disabled(data)) {
+		data->mode = &data->output->config.connector->modes[0];
+		igt_info("mode: %dx%d@%d\n", data->mode->hdisplay, data->mode->vdisplay, data->mode->vrefresh);
+		igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
+		igt_output_set_pipe(data->output, data->pipe);
+		data->primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(data->primary, &data->fb);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		igt_info("Current link rate : %s, lane count : %s\n",
+		       str_link_rate(igt_get_dp_link_rate_set_for_output(data->drm_fd, data->output)),
+		       str_lane_count(igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output)));
+		if ((igt_get_dp_link_rate_set_for_output(data->drm_fd, data->output) == min_link_rate) &&
+		   (igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output) == min_lane_count))
+			break;
+		kmstest_force_connector_link_training_failure(data->drm_fd, data->output->config.connector, 2);
+		kmstest_force_connector_retrain(data->drm_fd, data->output->config.connector, 1);
+
+		if (!first) {
+			igt_display_reset(&data->display);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		}
+		first = false;
+	}
+}
+
+igt_main
+{
+	data_t data = {};
+	igt_output_t *output;
+	enum pipe pipe;
+	enum dp_link_rate link_rate;
+	enum dp_lane_count lane_count;
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+	}
+
+	igt_describe_f("Test fallback");
+	igt_subtest_with_dynamic_f("fallback")
+	{
+		for_each_connected_output(&data.display, output) {
+			if (!igt_has_force_link_training_failure_debugfs(data.drm_fd, output)) {
+				igt_info("Skipping output %s as doesn't support fallback\n",
+					 output->name);
+				continue;
+			}
+
+			data.output = output;
+			link_rate = igt_get_dp_max_link_rate(data.drm_fd, data.output);
+			lane_count = igt_get_dp_max_lane_count(data.drm_fd, data.output);
+
+			for_each_pipe(&data.display, pipe) {
+				igt_display_reset(&data.display);
+				data.pipe = pipe;
+				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
+					test_fallback(&data);
+				kmstest_force_connector_link_rate(data.drm_fd, data.output->config.connector, link_rate);
+				kmstest_force_connector_lane_count(data.drm_fd, data.output->config.connector, lane_count);
+				igt_reset_connectors();
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_reset_connectors();
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 758ae090c..1a4e6c18b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -251,6 +251,7 @@ intel_kms_progs = [
 	'kms_ccs',
 	'kms_cdclk',
 	'kms_dirtyfb',
+	'kms_dp_fallback',
 	'kms_draw_crc',
 	'kms_dsc',
 	'kms_fb_coherency',
-- 
2.43.0

