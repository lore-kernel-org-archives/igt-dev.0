Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D3FC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39C410E59A;
	Tue, 30 Jul 2024 21:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpsZV8jn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A11410E588
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375358; x=1753911358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zdhzrXjNvB95V4wdb2DHi2j2Zi/aWLVZRVYkwGyJI04=;
 b=SpsZV8jndNFtOEyNLfNoX3fIlkVY+aD0M4gluyqhBVakHmzfotyUobNa
 ctom+NxgctD17tWWMmO6AXadMzcyRgk/eD+QccqX1U/syNY/ymQunBDKn
 AHwQu87MP+IOQoyCDV2c+zonuCYN08zV4+5f8q92KCiGowLj83mcDxYfn
 EP1mPg4vq3r5aoV5LGdfrsVITYwhCyj7E6TDHkQuNL6x1nM5DwYEyKAr9
 p/97ercya9ZGrXrHWLqWKGIWK/qdNRrZN3UGXso9Tlnf3KLKh4d9P8gYy
 EMOqA1ksV6bAz2jAd8EJx2U7VLr43FL8dB2pWhgRIx4YKQPC0N4/x4/Xt Q==;
X-CSE-ConnectionGUID: CFk37uOUTWaaNVfq5sy4Mg==
X-CSE-MsgGUID: w3s2DUZNSQCE0zZhPIQXig==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694601"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694601"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:58 -0700
X-CSE-ConnectionGUID: r86ERU90QF2v4pBAefYptQ==
X-CSE-MsgGUID: qNboMeWXRO+qPQKZyQqJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321738"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:56 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 09/10] tests/intel/kms_dp_fallback: add test for
 validating fallback
Date: Wed, 31 Jul 2024 02:43:40 +0530
Message-ID: <20240730211343.58703-10-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730211343.58703-1-kunal1.joshi@intel.com>
References: <20240730211343.58703-1-kunal1.joshi@intel.com>
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

v2: add test for mst (imre)
    refresh mode list (imre)
    monitor got hotplugs (imre)
    check link parameter are reduced (imre)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_fallback.c | 361 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 362 insertions(+)
 create mode 100644 tests/intel/kms_dp_fallback.c

diff --git a/tests/intel/kms_dp_fallback.c b/tests/intel/kms_dp_fallback.c
new file mode 100644
index 000000000..0a74bfc58
--- /dev/null
+++ b/tests/intel/kms_dp_fallback.c
@@ -0,0 +1,361 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
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
+ * SUBTEST: dp-fallback
+ * Description: Test fallback on DP connectors
+ *
+ * SUBTEST: mst-fallback
+ * Description: Test fallback on DP MST connectors
+ *
+ * SUBTEST: uhbr-fallback
+ * Description: Test fallback on DP connectors with uhbr link rate
+ */
+
+enum tests {
+	TEST_EDP_FALLBACK,
+	TEST_DP_FALLBACK,
+	TEST_MST_FALLBACK,
+	TEST_UHBR_FALLBACK,
+	MAX_TESTS,
+};
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	enum pipe pipe;
+	struct igt_fb fb;
+	struct igt_plane *primary;
+	enum tests test;
+	int n_pipes;
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
+static void find_mst_outputs(int drm_fd, data_t *data, igt_output_t *output,
+			     igt_output_t **mst_outputs, int *num_mst_outputs)
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
+					     output->config.connector->connector_id,
+					     DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
+					     &path_blob_id, &path_prop);
+
+	if (!is_output_mst)
+		return;
+
+	/*
+	 * If output is MST check all other connected output which shares same path
+	 * and fill mst_outputs and num_mst_outputs
+	 */
+	for_each_connected_output(&data->display, connector_output) {
+
+		if (connector_output->config.connector == output->config.connector)
+			continue;
+
+		connector_path_prop = NULL;
+
+		kmstest_get_property(drm_fd,
+				     connector_output->config.connector->connector_id,
+				     DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
+				     &path_blob_id, &connector_path_prop);
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
+static bool is_retrain_disabled(data_t *data)
+{
+	return igt_get_dp_link_retrain_disabled(data->drm_fd, data->output);
+}
+
+static void test_mst_fallback(data_t *data, igt_output_t **mst_outputs, int *no_of_mst_outputs)
+{
+	int i;
+	enum dp_link_rate link_rate, prev_link_rate, curr_link_rate;
+	enum dp_lane_count lane_count, prev_lane_count, curr_lane_count;
+	struct udev_monitor *mon;
+	igt_output_t *output[*no_of_mst_outputs];
+	drmModeModeInfo *mode[*no_of_mst_outputs];
+	igt_plane_t *primary[*no_of_mst_outputs];
+	struct igt_fb fb[*no_of_mst_outputs];
+
+	link_rate = igt_get_dp_max_link_rate(data->drm_fd, data->output);
+	lane_count = igt_get_dp_max_lane_count(data->drm_fd, data->output);
+	prev_link_rate = link_rate;
+	prev_lane_count = lane_count;
+
+
+	while (!is_retrain_disabled(data)) {
+
+		for (i = 0; i < *no_of_mst_outputs; i++) {
+			if (i > data->n_pipes)
+				break;
+
+			output[i] = mst_outputs[i];
+			output[i]->force_reprobe = true;
+			igt_output_refresh(output[i]);
+			mode[i] = &output[i]->config.connector->modes[0];
+			igt_debug("updated output %s mode: %dx%d@%d\n", output[i]->name, mode[i]->hdisplay, mode[i]->vdisplay, mode[i]->vrefresh);
+			igt_create_fb(data->drm_fd, mode[i]->hdisplay, mode[i]->vdisplay, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb[i]);
+			igt_output_set_pipe(output[i], i);
+			primary[i] = igt_output_get_plane_type(output[i], DRM_PLANE_TYPE_PRIMARY);
+			igt_plane_set_fb(primary[i], &fb[i]);
+		}
+
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		mon = igt_watch_uevents();
+
+		igt_debug("forcing link training failure and retraining\n");
+		kmstest_force_connector_link_training_failure(data->drm_fd, data->output->config.connector, 2);
+
+		while (igt_get_dp_pending_lt_failures(data->drm_fd, data->output) > 0)
+			kmstest_force_connector_retrain(data->drm_fd, data->output->config.connector, 1);
+
+		igt_assert_f(igt_hotplug_detected(mon, 20) || is_retrain_disabled(data),
+			     "Didn't get hotplug for force link training failure\n");
+		igt_flush_uevents(mon);
+
+		curr_link_rate = igt_get_dp_link_rate_set_for_output(data->drm_fd, data->output);
+		curr_lane_count = igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output);
+		igt_info("Current link rate : %s, lane count : %s\n",
+			 str_link_rate(curr_link_rate), str_lane_count(curr_lane_count));
+		igt_assert_f(curr_link_rate < prev_link_rate || curr_lane_count < prev_lane_count,
+			     "Fallback failed\n");
+	}
+
+	kmstest_force_connector_link_rate(data->drm_fd, data->output->config.connector, link_rate);
+	kmstest_force_connector_lane_count(data->drm_fd, data->output->config.connector, lane_count);
+	kmstest_force_connector_retrain(data->drm_fd, data->output->config.connector, 1);
+	igt_reset_connectors();
+}
+
+static void test_dp_fallback(data_t *data)
+{
+	struct udev_monitor *mon;
+	enum dp_link_rate link_rate, prev_link_rate, curr_link_rate;
+	enum dp_lane_count lane_count, prev_lane_count, curr_lane_count;
+
+	link_rate = igt_get_dp_max_link_rate(data->drm_fd, data->output);
+	lane_count = igt_get_dp_max_lane_count(data->drm_fd, data->output);
+	prev_link_rate = link_rate;
+	prev_lane_count = lane_count;
+
+	for_each_pipe(&data->display, data->pipe) {
+
+		igt_dynamic_f("%s-pipe-%s", igt_output_name(data->output),
+			      kmstest_pipe_name(data->pipe)) {
+
+			if (data->test == TEST_UHBR_FALLBACK)
+				igt_require_f(link_rate > DP_LINK_RATE_810000,
+					      "%s is doesn't have UHBR rate\n", data->output->name);
+
+			igt_display_reset(&data->display);
+
+			while (!is_retrain_disabled(data)) {
+
+				/*
+				 * Start with default mode and fallback till we reach minimum link rate and lane count
+				 */
+				data->output->force_reprobe = true;
+				igt_output_refresh(data->output);
+				data->mode = &data->output->config.connector->modes[0];
+				igt_debug("mode: %dx%d@%d\n",
+					 data->mode->hdisplay, data->mode->vdisplay,
+					 data->mode->vrefresh);
+				igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
+						      data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+						      DRM_FORMAT_MOD_LINEAR, &data->fb);
+				igt_output_set_pipe(data->output, data->pipe);
+				data->primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+				igt_plane_set_fb(data->primary, &data->fb);
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+				mon = igt_watch_uevents();
+
+				igt_debug("forcing link training failure and retraining\n");
+				kmstest_force_connector_link_training_failure(data->drm_fd, data->output->config.connector, 2);
+
+				while (igt_get_dp_pending_lt_failures(data->drm_fd, data->output) > 0)
+					kmstest_force_connector_retrain(data->drm_fd, data->output->config.connector, 1);
+
+				igt_assert_f(igt_hotplug_detected(mon, 20) || is_retrain_disabled(data),
+					     "Didn't get hotplug for force link training failure\n");
+				igt_flush_uevents(mon);
+
+				curr_link_rate = igt_get_dp_link_rate_set_for_output(data->drm_fd, data->output);
+				curr_lane_count = igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output);
+				igt_info("Current link rate : %s, lane count : %s\n",
+					 str_link_rate(curr_link_rate), str_lane_count(curr_lane_count));
+				igt_assert_f(curr_link_rate < prev_link_rate || curr_lane_count < prev_lane_count,
+					     "Fallback failed\n");
+			}
+			kmstest_force_connector_link_rate(data->drm_fd, data->output->config.connector, link_rate);
+			kmstest_force_connector_lane_count(data->drm_fd, data->output->config.connector, lane_count);
+			kmstest_force_connector_retrain(data->drm_fd, data->output->config.connector, 1);
+			igt_reset_connectors();
+		}
+	}
+}
+
+igt_main
+{
+	data_t data = {};
+	igt_output_t *output;
+	enum pipe pipe;
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.n_pipes = 0;
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+
+		for_each_pipe(&data.display, pipe)
+			data.n_pipes++;
+
+	}
+
+	igt_describe_f("Test DP fallback");
+	igt_subtest_with_dynamic("dp-fallback")
+	{
+		data.test = TEST_DP_FALLBACK;
+		for_each_connected_output(&data.display, output) {
+			/* Skip if output is not DP or if it's mst*/
+			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
+				igt_info("Skipping output %s as it's not DP\n", output->name);
+				continue;
+			}
+			data.output = output;
+			test_dp_fallback(&data);
+		}
+	}
+
+	igt_describe_f("Test UHBR fallback");
+	igt_subtest_with_dynamic_f("uhbr-fallback")
+	{
+		data.test = TEST_UHBR_FALLBACK;
+		for_each_connected_output(&data.display, output) {
+			/* Skip if output is not DP or if it's mst*/
+			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
+				igt_info("Skipping output %s as it's not DP\n", output->name);
+				continue;
+			}
+			data.output = output;
+			test_dp_fallback(&data);
+		}
+	}
+
+	igt_describe_f("MST Fallback");
+	igt_subtest_with_dynamic("mst-fallback")
+	{
+		int num_mst_outputs;
+		igt_output_t **mst_outputs;
+
+		for_each_connected_output(&data.display, output) {
+
+			if (!igt_check_output_is_dp_mst(output)) {
+				igt_info("Skipping output %s as its non mst\n", output->name);
+				continue;
+			}
+
+			num_mst_outputs = 0;
+			mst_outputs = malloc(sizeof(igt_output_t *) * data.n_pipes);
+			data.output = output;
+			mst_outputs[num_mst_outputs++] = output;
+			find_mst_outputs(data.drm_fd, &data, data.output, mst_outputs, &num_mst_outputs);
+			igt_dynamic_f("%s", igt_output_name(data.output))
+				test_mst_fallback(&data, mst_outputs, &num_mst_outputs);
+		}
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index e649466be..23c453170 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -247,6 +247,7 @@ intel_kms_progs = [
 	'kms_ccs',
 	'kms_cdclk',
 	'kms_dirtyfb',
+        'kms_dp_fallback',
 	'kms_draw_crc',
 	'kms_dsc',
 	'kms_fb_coherency',
-- 
2.43.0

