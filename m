Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D43DC55175
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 08:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D491410E0B6;
	Mon,  3 Aug 2026 08:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwthwWsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCED10E0B6
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785744327; x=1817280327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K+0sGrB/1A4yhNQvgzhIHCEMWwTTnllU0sQl0Dqh92g=;
 b=YwthwWsJkeUT8U9n3TxuzsOmzk5Uztk1BIG/lHVmHH5aX+0Cx7n59VYg
 9rTHzi3Js8BwyGob3weeAdoNfaoJ4xdD4BJaX7Gm3H8kqvyhZb1oH6t9C
 70odyo6kD5rDbEzBqv8FManPZwDM49QZgXD5t9D78P8N/znoeKdFB1lhR
 +0ykha1t6j38KgU3oKzOUN4SZd2WCISJg3m2WVCU/4E7tyUNRhi65AygR
 CaEXzfv7Na+Vu5MvR01YBWbuVMO7NqVm/u7pm2fEVNz39iKzSxJTHbAP/
 EeFRJAVglRSiMhHqRa84Ai5z9ilpaHGH+FlvJeo+dx457DiVKrj5s/uyW Q==;
X-CSE-ConnectionGUID: Tc1f8O9HTM2bduU5udX0rg==
X-CSE-MsgGUID: GeTN17fVRHiqSWwpKAoyfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="109069051"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="109069051"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:05:26 -0700
X-CSE-ConnectionGUID: dK905JPuSlWg7+XqNJ58nw==
X-CSE-MsgGUID: qKRefVcuRYS3FOqB6BeXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="256829441"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:05:24 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_dp_linktrain_fallback: Add
 UHBR-to-HBR fallback subtest
Date: Mon,  3 Aug 2026 13:35:06 +0530
Message-ID: <20260803080514.687715-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Cover the UHBR (128b/132b) to HBR3 (8b/10b) encoding boundary missed
by dp-fallback. Add uhbr-to-hbr-fallback to pin the link at the
highest sustainable UHBR rate, force repeated link training failures,
and verify the rate drops below UHBR10 (1,000,000 kbps). Stop at
that threshold and leave the HBR step-down to dp-fallback. Exercise
both SST and MST outputs since MST siblings share the physical link.

v2: Improve UHBR fallback subtest

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 205 ++++++++++++++++++++++--
 1 file changed, 191 insertions(+), 14 deletions(-)
 mode change 100644 => 100755 tests/intel/kms_dp_linktrain_fallback.c

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
old mode 100644
new mode 100755
index 115183d2dc..c691443aa8
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -24,6 +24,14 @@
  *
  * SUBTEST: dsc-fallback
  * Description: Test fallback to DSC when BW isn't sufficient
+ *
+ * SUBTEST: uhbr-to-hbr-fallback
+ * Description: Verify fallback from UHBR (>= 10 Gbps, 128b/132b) to HBR3 or
+ *              lower (8b/10b) on a UHBR-capable DP connector by forcing
+ *              repeated link training failures, exercising the port slice
+ *              reset path on the transition. Supports both SST and MST
+ *              (topology-wide) outputs; MST siblings share the physical
+ *              link so fallback applies to the whole topology.
  */
 
 #define RETRAIN_COUNT 1
@@ -33,6 +41,12 @@
  */
 #define LT_FAILURE_REDUCED_CAPS 2
 #define SPURIOUS_HPD_RETRY 3
+/*
+ * UHBR10 link rate threshold in Kbps.
+ * Rates at or above this value use 128b/132b encoding (UHBR10/13.5/20).
+ * Rates below this value use 8b/10b encoding (HBR3 and lower).
+ */
+#define UHBR10_LINK_RATE 1000000
 
 static int traversed_mst_outputs[IGT_MAX_PIPES];
 static int traversed_mst_output_count;
@@ -73,9 +87,10 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
 		output = mst_output[i];
 		if (traversed_mst_output_count < IGT_MAX_PIPES) {
 			traversed_mst_outputs[traversed_mst_output_count++] = output->config.connector->connector_id;
-			igt_info("Output %s is in same topology as %s\n",
-				 igt_output_name(output),
-				 igt_output_name(data->output));
+			if (output->id != data->output->id)
+				igt_info("Output %s is in same MST topology as %s\n",
+					 igt_output_name(output),
+					 igt_output_name(data->output));
 		} else {
 			igt_assert_f(false, "Unable to save traversed output\n");
 			return false;
@@ -347,7 +362,7 @@ static bool fix_link_status_and_recommit(data_t *data,
 	return true;
 }
 
-static void test_fallback(data_t *data, bool is_mst)
+static bool test_fallback(data_t *data, bool is_mst, bool force_uhbr)
 {
 	int output_count, retries;
 	int max_link_rate, curr_link_rate, prev_link_rate;
@@ -361,14 +376,94 @@ static void test_fallback(data_t *data, bool is_mst)
 	retries = SPURIOUS_HPD_RETRY;
 
 	igt_display_reset(&data->display);
-	i915_dp_reset_link_params(data->drm_fd, data->output);
-	if (!setup_outputs(data, is_mst, outputs,
-			   &output_count, modes, fbs,
-			   primaries))
-		return;
 
-	igt_info("Testing link training fallback on %s\n",
-		 igt_output_name(data->output));
+	/*
+	 * For the UHBR-to-HBR fallback case, pin the link to the sink's
+	 * negotiated max rate (i915_dp_get_max_link_rate() — the common
+	 * source/sink rate, not i915_dp_get_max_supported_rate() which lists
+	 * every rate the *source* can generate, including ones the sink
+	 * doesn't advertise in its DPCD). If the physical link still can't
+	 * sustain that rate (cable limit), fall back to the next-lower UHBR
+	 * rate advertised in the debugfs list and retry. Skip the test if no
+	 * UHBR rate is achievable.
+	 */
+	if (force_uhbr) {
+		char buf[512], rate_str[16], lane_auto[] = "auto";
+		int try_rate = i915_dp_get_max_link_rate(data->drm_fd,
+							 data->output);
+		/* Preserve MST state for fallback retries; keep final discovery cached.*/
+		int saved_mst_count = traversed_mst_output_count;
+
+		if (try_rate < UHBR10_LINK_RATE) {
+			igt_info("Output %s does not support UHBR (max=%d kbps), skipping\n",
+				 igt_output_name(data->output), try_rate);
+			return false;
+		}
+
+		curr_link_rate = 0;
+		while (try_rate >= UHBR10_LINK_RATE) {
+			char *token;
+			int next = 0;
+
+			/* Allow MST re-discovery on every UHBR-rate attempt. */
+			traversed_mst_output_count = saved_mst_count;
+
+			snprintf(rate_str, sizeof(rate_str), "%d", try_rate);
+			i915_dp_set_link_params(data->drm_fd, data->output,
+						rate_str, lane_auto);
+
+			if (!setup_outputs(data, is_mst, outputs,
+					   &output_count, modes, fbs, primaries)) {
+				i915_dp_reset_link_params(data->drm_fd,
+							  data->output);
+				return false;
+			}
+
+			curr_link_rate = i915_dp_get_current_link_rate(data->drm_fd,
+								       data->output);
+			if (curr_link_rate >= UHBR10_LINK_RATE) {
+				igt_info("Link trained at UHBR %d kbps on %s\n",
+					 curr_link_rate,
+					 igt_output_name(data->output));
+				break;
+			}
+
+			igt_info("Rate %d not sustained (got %d kbps) on %s, trying next-lower UHBR\n",
+				 try_rate, curr_link_rate,
+				 igt_output_name(data->output));
+			igt_display_reset(&data->display);
+
+			igt_debugfs_read_connector_file(data->drm_fd,
+							igt_output_name(data->output),
+							"i915_dp_force_link_rate",
+							buf, sizeof(buf));
+			for (token = strtok(buf, " \t\n"); token;
+			     token = strtok(NULL, " \t\n")) {
+				int r = (int)strtol(token, NULL, 0);
+
+				if (r >= UHBR10_LINK_RATE && r < try_rate && r > next)
+					next = r;
+			}
+			try_rate = next;
+		}
+
+		if (curr_link_rate < UHBR10_LINK_RATE) {
+			igt_info("Output %s cannot sustain any UHBR rate, skipping\n",
+				 igt_output_name(data->output));
+			i915_dp_reset_link_params(data->drm_fd, data->output);
+			return false;
+		}
+
+		/* Clear the pin so the fallback loop below can reduce rate. */
+		i915_dp_reset_link_params(data->drm_fd, data->output);
+	} else {
+		i915_dp_reset_link_params(data->drm_fd, data->output);
+
+		if (!setup_outputs(data, is_mst, outputs,
+				   &output_count, modes, fbs,
+				   primaries))
+			return false;
+	}
 	max_link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
 	max_lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
 	prev_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
@@ -390,7 +485,7 @@ static void test_fallback(data_t *data, bool is_mst)
 		if (i915_dp_get_link_retrain_disabled(data->drm_fd,
 						      data->output)) {
 			igt_reset_connectors();
-			return;
+			return false;
 		}
 
 		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
@@ -421,9 +516,32 @@ static void test_fallback(data_t *data, bool is_mst)
 			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
 			     "Fallback unsuccessful\n");
 
+		/*
+		 * This subtest only cares about the single UHBR -> HBR
+		 * transition (128b/132b to 8b/10b encoding). Stop as soon as
+		 * we've dropped below UHBR10, instead of cascading all the
+		 * way down through the legacy HBR/HBR2/HBR3 rates, which is
+		 * already covered by dp-fallback.
+		 */
+		if (force_uhbr && curr_link_rate < UHBR10_LINK_RATE) {
+			igt_info("UHBR to HBR fallback confirmed on %s: %d kbps -> %d kbps\n",
+				 igt_output_name(data->output),
+				 prev_link_rate, curr_link_rate);
+			return true;
+		}
+
 		prev_link_rate = curr_link_rate;
 		prev_lane_count = curr_lane_count;
 	}
+
+	/* force_uhbr: fallback not confirmed, don't count this run. */
+	if (force_uhbr) {
+		igt_info("UHBR to HBR fallback not reached on %s(last link rate %d kbps)\n",
+			 igt_output_name(data->output),prev_link_rate);
+		return false;
+	}
+
+	return true;
 }
 
 static bool run_lt_fallback_test(data_t *data)
@@ -431,6 +549,8 @@ static bool run_lt_fallback_test(data_t *data)
 	bool ran = false;
 	igt_output_t *output;
 
+	traversed_mst_output_count = 0;
+
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
 
@@ -454,11 +574,11 @@ static bool run_lt_fallback_test(data_t *data)
 		if (igt_check_output_is_dp_mst(data->output)) {
 			igt_info("Testing MST output %s\n",
 				 igt_output_name(data->output));
-			test_fallback(data, true);
+			test_fallback(data, true, false);
 		} else {
 			igt_info("Testing DP output %s\n",
 				 igt_output_name(data->output));
-			test_fallback(data, false);
+			test_fallback(data, false, false);
 		}
 	}
 	return ran;
@@ -574,11 +694,63 @@ static void test_dsc_sst_fallback(data_t *data)
 	igt_assert_f(dsc_fallback_successful, "DSC fallback unsuccessful\n");
 }
 
+static bool run_uhbr_to_hbr_fallback_test(data_t *data)
+{
+	bool ran = false;
+	igt_output_t *output;
+
+	traversed_mst_output_count = 0;
+
+	for_each_connected_output(&data->display, output) {
+		data->output = output;
+
+		if (!i915_dp_has_force_link_training_failure_debugfs(data->drm_fd,
+								     data->output)) {
+			igt_info("Output %s doesn't support forcing link training failure\n",
+				 igt_output_name(data->output));
+			continue;
+		}
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
+			igt_info("Skipping output %s as it's not DP\n", output->name);
+			continue;
+		}
+
+		if (i915_dp_get_max_supported_rate(data->drm_fd, data->output) < UHBR10_LINK_RATE) {
+			igt_info("Skipping output %s: does not support UHBR\n",
+				 igt_output_name(data->output));
+			continue;
+		}
+
+		/*
+		 * MST siblings share the same physical DP link, so UHBR->HBR
+		 * fallback applies to MST too. Reuse the same is_mst branching
+		 * as dp-fallback so the whole topology is driven while the
+		 * shared link is retrained.
+		 */
+		if (igt_check_output_is_dp_mst(data->output)) {
+			igt_info("Testing UHBR-to-HBR fallback on MST output %s\n",
+				 igt_output_name(data->output));
+			if (test_fallback(data, true, true))
+				ran = true;
+		} else {
+			igt_info("Testing UHBR-to-HBR fallback on DP output %s\n",
+				 igt_output_name(data->output));
+			if (test_fallback(data, false, true))
+				ran = true;
+		}
+	}
+
+	return ran;
+}
+
 static bool run_dsc_sst_fallaback_test(data_t *data)
 {
 	bool ran = false;
 	igt_output_t *output;
 
+	traversed_mst_output_count = 0;
+
 	if (!is_dsc_supported_by_source(data->drm_fd)) {
 		igt_info("DSC not supported by source.\n");
 		return ran;
@@ -646,6 +818,11 @@ int igt_main()
 			      "Skipping test as DSC fallback conditions not met.\n");
 	}
 
+	igt_subtest("uhbr-to-hbr-fallback") {
+		igt_require_f(run_uhbr_to_hbr_fallback_test(&data),
+			      "Skipping test: no UHBR-capable DP output found or fallback not reached\n");
+	}
+
 	igt_fixture() {
 		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
-- 
2.43.0

