Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542EBC44512
	for <igt-dev@archiver.kernel.org>; Sun, 19 Jul 2026 06:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CE410E004;
	Sun, 19 Jul 2026 06:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvXw8186";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D474910E004
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Jul 2026 06:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784444162; x=1815980162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=twZbWUKE+Cqwu0JuQ1HMxRPYrlWmYnonE2zx0UzzAi8=;
 b=MvXw8186f7tKLC9COPsRqj6NGfdZ5AIlpcVQjwt+LrRHGpZvJx9sdJwT
 J73d27cZxvWowMRhCZZFE3qMnPpF47lCX1Nppj9Gb35cj2iSK4upNBjJQ
 JfvX2gsEcT7G6FUbC+dD/vLfu/pBeIg0AZcT9j6iE/XNiZdKxmHX5eq74
 fNG4Juwxf9B7S0jYpoWz1i8vwlv+q49Lpgc7gNq0fgO4nYxWeBjvaHK7x
 xeTe+A0wpMt60s31MZ9+AXVRnRHGsx5SsN9GOnkM3kWlmguCfh4+/nwiF
 yAhanMHYz8NlKH5THE+BAKHHqryrSPdvLLTIwfRjj9E7AgzJRYQxUHGDQ w==;
X-CSE-ConnectionGUID: Dq3lVIowSWGVB6SDKSN0RA==
X-CSE-MsgGUID: +QGd0unoSt+D7+dI0RXyaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="102481619"
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; d="scan'208";a="102481619"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2026 23:56:02 -0700
X-CSE-ConnectionGUID: qq79jRAdTyO1Amej8G3CXg==
X-CSE-MsgGUID: mLc7H7Z9TF+j3TdMcte4mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; d="scan'208";a="257797355"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2026 23:56:00 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR
 fallback subtest
Date: Sun, 19 Jul 2026 12:25:39 +0530
Message-ID: <20260719065542.2919930-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Cover the UHBR (128b/132b) to HBR3 (8b/10b) encoding boundary missed
by dp-fallback. Add uhbr-to-hbr-fallback to pin the link at the
highest sustainable UHBR rate, force repeated link training failures,
and verify the rate drops below UHBR10 (1,000,000 kbps). Stop at
that threshold and leave the HBR step-down to dp-fallback. Exercise
both SST and MST outputs since MST siblings share the physical link.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 168 ++++++++++++++++++++++--
 1 file changed, 158 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 115183d2d..afc57787b 100644
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
@@ -347,7 +361,7 @@ static bool fix_link_status_and_recommit(data_t *data,
 	return true;
 }
 
-static void test_fallback(data_t *data, bool is_mst)
+static void test_fallback(data_t *data, bool is_mst, bool force_uhbr)
 {
 	int output_count, retries;
 	int max_link_rate, curr_link_rate, prev_link_rate;
@@ -361,14 +375,81 @@ static void test_fallback(data_t *data, bool is_mst)
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
+
+		igt_require_f(try_rate >= UHBR10_LINK_RATE,
+			      "Output %s does not support UHBR (max=%d kbps)\n",
+			      igt_output_name(data->output), try_rate);
+
+		curr_link_rate = 0;
+		while (try_rate >= UHBR10_LINK_RATE) {
+			char *token;
+			int next = 0;
+
+			snprintf(rate_str, sizeof(rate_str), "%d", try_rate);
+			i915_dp_set_link_params(data->drm_fd, data->output,
+						rate_str, lane_auto);
+
+			if (!setup_outputs(data, is_mst, outputs,
+					   &output_count, modes, fbs, primaries))
+				return;
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
+			/* Find highest UHBR rate strictly below try_rate */
+			igt_debugfs_read_connector_file(data->drm_fd,
+							igt_output_name(data->output),
+							"i915_dp_force_link_rate",
+							buf, sizeof(buf));
+			for (token = strtok(buf, "\n"); token; token = strtok(NULL, "\n")) {
+				int r = (int)strtol(token, NULL, 0);
+
+				if (r >= UHBR10_LINK_RATE && r < try_rate && r > next)
+					next = r;
+			}
+			try_rate = next;
+		}
+
+		igt_require_f(curr_link_rate >= UHBR10_LINK_RATE,
+			      "Output %s cannot sustain any UHBR rate, skipping\n",
+			      igt_output_name(data->output));
+
+		/* Clear the pin so the fallback loop below can reduce rate. */
+		i915_dp_reset_link_params(data->drm_fd, data->output);
+	} else {
+		i915_dp_reset_link_params(data->drm_fd, data->output);
+
+		if (!setup_outputs(data, is_mst, outputs,
+				   &output_count, modes, fbs,
+				   primaries))
+			return;
+	}
 	max_link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
 	max_lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
 	prev_link_rate = i915_dp_get_current_link_rate(data->drm_fd, data->output);
@@ -421,6 +502,20 @@ static void test_fallback(data_t *data, bool is_mst)
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
+			return;
+		}
+
 		prev_link_rate = curr_link_rate;
 		prev_lane_count = curr_lane_count;
 	}
@@ -454,11 +549,11 @@ static bool run_lt_fallback_test(data_t *data)
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
@@ -574,6 +669,54 @@ static void test_dsc_sst_fallback(data_t *data)
 	igt_assert_f(dsc_fallback_successful, "DSC fallback unsuccessful\n");
 }
 
+static bool run_uhbr_to_hbr_fallback_test(data_t *data)
+{
+	bool ran = false;
+	igt_output_t *output;
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
+		ran = true;
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
+			test_fallback(data, true, true);
+		} else {
+			igt_info("Testing UHBR-to-HBR fallback on DP output %s\n",
+				 igt_output_name(data->output));
+			test_fallback(data, false, true);
+		}
+	}
+
+	return ran;
+}
+
 static bool run_dsc_sst_fallaback_test(data_t *data)
 {
 	bool ran = false;
@@ -646,6 +789,11 @@ int igt_main()
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

