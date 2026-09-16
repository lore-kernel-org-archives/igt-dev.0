Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294A5C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A2A10E0B0;
	Wed, 16 Sep 2026 04:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1H97ScC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4120E10E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532800; x=1821068800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1V8yFFmWpGGgSpowlpvFQp5Y8twqVRVFLKFpjmiEw5E=;
 b=C1H97ScCHUmvubaMonvC0WPBbSLTZC5/o0PQELjUkzrdVc2V9zihf5e9
 lzZr4+9ObFBuJlSQPrto7aZ9c5dHnKNO080QBmTZsslbiuM3MkmyOCYjf
 SgKdMLWSbgpn38uIJ4Bz3m9tH2gSYiAcQz3QJOi6z7gZycRm9VWTv3+IP
 NHvB9uRvZZnrpjnvBAvsf+pP5yGNs1uat3KUk+EODJt7/Cxwp+LG4UVaZ
 HijX/OcMnZeoQvGAKMmf2McdiDDLY4qSW02rcypGbf+Dsy7DnitDjozJ7
 3+YkCDdZWiQ4KQoAsKsFH9VGlDuuaF/h1BARuXPO0xUsQmWlBHthiTuzQ Q==;
X-CSE-ConnectionGUID: zJTeO+XGT1CI8IXzuUSyaA==
X-CSE-MsgGUID: V3CdQ+0eQ3mpDOt5im4C5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503244"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:40 -0700
X-CSE-ConnectionGUID: wVWR3xT1S+6MJb0HBzQtLg==
X-CSE-MsgGUID: 6xWgiND1R56PgHC9R8ANIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765045"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:39 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 06/13] tests/intel/kms_dp_link_training: Train every
 allowed link config
Date: Wed, 16 Sep 2026 10:17:54 +0530
Message-Id: <20260916044801.1279102-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

Currently test trains one configuration per output, the maximum. Everything
below it which is what a bandwidth constrained modeset and every
fallback actually use and currently is never trained.

Train every configuration in intel_dp_allowed_link_configs that belongs
to the subtest's encoding class, as one dynamic subtest each, named
<connector>-<lanes>x<rate>. Enumerate with the forced parameters reset,
or the set being read is the forced one rather than the one the driver
would pick from.

Bring the link up inside the dynamic subtest rather than once per
output. The reset, the modeset, the retrain poll and the link-status
check can all fail, and igt_subtest_with_dynamic() does not allow
explicit failure in the container: igt_fail() asserts on it and aborts
the whole test instead of yielding a dynamic subtest result.

A configuration too narrow to carry the modes is skipped, not failed. A
forced retrain goes through a modeset commit, so such a configuration
makes the retrain fail and the driver queue a modeset retry, which
shows up as a BAD link-status, a correct driver rejection that must
not be reported as a link training failure. Derive the floor from the
modes' own bandwidth requirement rather than from the configuration the
driver picks when nothing is forced: for MST, and for eDP after a
fallback, the driver configures the maximum link bandwidth regardless
of the mode i.e "For MST we always configure max link bw" in
intel_dp_compute_config_link_bpp_limits(), so using its unforced
choice as the floor would mark every other configuration unreachable
and quietly reduce MST back to training one configuration.

Sum the floor over every stream driven over the link. The modeset
drives all of an MST topology's streams, so the link carries all of
them; a single stream's requirement would let a configuration that
cannot carry the aggregate payload through and turn a correct driver
rejection into a link training failure.

The floor assumes uncompressed 8 bpc and so overestimates what the modes
need, which biases a borderline configuration towards skipping rather
than failing. Note also that 8b/10b MST runs at 78.75% efficiency
rather than 80%, because of the 1-in-64 MTPH overhead that
drm_dp_bw_channel_coding_efficiency() deliberately does not account
for; using 80% there overestimates the available bandwidth and turns a
correct rejection into a failure.

Clear link-status before every attempt. It latches BAD when the driver
falls back and only userspace can clear it, so without this a single
fallback anywhere in the run poisons every later assertion. Assert the
forced lane count took effect too, which only becomes meaningful now
that the configurations differ in lane count. Reset the forced
parameters after every configuration, since they otherwise survive a
sink disconnect.

Require the allowed link configs debugfs, so that a kernel too old to
have it skips rather than training nothing.

The subtest names and their scope are unchanged.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 193 +++++++++++++++++++++++++----
 1 file changed, 167 insertions(+), 26 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 6a174da88..71531e8dc 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -29,6 +29,9 @@
 
 #define RETRAIN_COUNT	1
 
+/* The driver allows at most 10 link rates over 3 lane counts. */
+#define MAX_LINK_CONFIGS	32
+
 /*
  * How long the driver's link recovery is given to reach a verdict, in seconds.
  * The automatic retrain is queued without a delay, so this only has to cover
@@ -106,6 +109,103 @@ static void assert_link_status_good(data_t *data, bool mst)
 	}
 }
 
+/*
+ * set_link_status_good - Clear a latched BAD link-status.
+ *
+ * The property latches BAD when the driver falls back and only userspace can
+ * clear it, so without clearing it before every attempt a single fallback
+ * anywhere in the run poisons every later assertion.
+ */
+static void set_link_status_good(data_t *data, bool mst)
+{
+	igt_output_t *outputs[IGT_MAX_PIPES];
+	int count = 0;
+	int i;
+
+	if (mst) {
+		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
+								 &data->display, data->output,
+								 outputs, &count) == 0,
+								 "Unable to find MST outputs\n");
+	} else {
+		outputs[0] = data->output;
+		count = 1;
+	}
+
+	for (i = 0; i < count; i++)
+		igt_output_set_prop_value(outputs[i], IGT_CONNECTOR_LINK_STATUS,
+					  DRM_MODE_LINK_STATUS_GOOD);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+/*
+ * link_config_data_rate - Data rate a link configuration carries, in
+ * 10 kbit/s units.
+ *
+ * Channel coding efficiency is in 1ppm units, matching the kernel's
+ * drm_dp_bw_channel_coding_efficiency(): 96.71% for 128b/132b and 80% for
+ * 8b/10b. 8b/10b MST is 78.75% instead, because of the 1-in-64 MTPH overhead
+ * that helper deliberately does not account for. Using 80% there overestimates
+ * the available bandwidth and turns a correct driver rejection into a failure.
+ */
+static int link_config_data_rate(const struct i915_dp_link_config *config,
+				 bool mst)
+{
+	uint64_t symbol_rate = (uint64_t)config->link_rate * config->lane_count;
+	int efficiency;
+
+	if (i915_dp_is_uhbr_rate(config->link_rate))
+		efficiency = 967100;
+	else
+		efficiency = mst ? 787500 : 800000;
+
+	return symbol_rate * efficiency / 1000000;
+}
+
+/*
+ * mode_data_rate - Data rate a mode needs, in 10 kbit/s units.
+ *
+ * Uncompressed 8 bpc, which is what the smallest mode of a DP sink is driven
+ * at. Deliberately pessimistic: overestimating what the mode needs makes a
+ * borderline configuration skip rather than fail.
+ */
+static int mode_data_rate(const drmModeModeInfo *mode)
+{
+	return DIV_ROUND_UP(mode->clock * 24, 10);
+}
+
+/*
+ * link_min_data_rate - Data rate the link has to carry, in 10 kbit/s units.
+ *
+ * do_modeset() drives every stream of an MST topology, so the link carries all
+ * of them at once. Summing them is what tells a configuration that cannot
+ * carry the whole payload apart from one that can, which a single stream's
+ * requirement would let through and turn into a false link training failure.
+ */
+static int link_min_data_rate(data_t *data, bool mst)
+{
+	igt_output_t *outputs[IGT_MAX_PIPES];
+	int count = 0;
+	int rate = 0;
+	int i;
+
+	if (mst) {
+		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
+								 &data->display, data->output,
+								 outputs, &count) == 0,
+								 "Unable to find MST outputs\n");
+	} else {
+		outputs[0] = data->output;
+		count = 1;
+	}
+
+	for (i = 0; i < count; i++)
+		rate += mode_data_rate(igt_output_get_mode(outputs[i]));
+
+	return rate;
+}
+
 /*
  * assert_link_recovery_idle - Let the driver's link recovery reach a verdict
  * and check it had nothing to recover.
@@ -160,6 +260,8 @@ static void train_link_config(data_t *data, bool mst,
 		 igt_output_name(data->output), config->lane_count,
 		 config->link_rate);
 
+	set_link_status_good(data, mst);
+
 	i915_dp_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
 	i915_dp_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
 	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
@@ -171,6 +273,9 @@ static void train_link_config(data_t *data, bool mst,
 	igt_info("Current link rate is %d\n", current_link_rate);
 	igt_assert_f(current_link_rate == config->link_rate,
 		     "Link training did not succeed at the forced link rate.\n");
+	igt_assert_f(i915_dp_get_current_lane_count(data->drm_fd, data->output) ==
+		     config->lane_count,
+		     "Link training did not succeed at the forced lane count.\n");
 
 	/*
 	 * The link parameters read back above are the ones the driver asked
@@ -280,14 +385,14 @@ static void do_modeset(data_t *data, bool mst)
 }
 
 /*
- * run_link_rate_test - Main link training routine. Expects the MST vs. SST check
- * to be done beforehand. Returns true if tested at the correct rate.
+ * setup_link - Bring the link up at the parameters the driver picks itself.
+ *
+ * Runs per dynamic subtest rather than once per link: everything it does can
+ * fail, and a failure in a igt_subtest_with_dynamic() container aborts the
+ * whole test instead of yielding a dynamic subtest result.
  */
-static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
+static void setup_link(data_t *data, bool mst)
 {
-	struct i915_dp_link_config config;
-	bool is_uhbr_output;
-
 	igt_display_reset(&data->display);
 	i915_dp_reset_link_params(data->drm_fd, data->output);
 	do_modeset(data, mst);
@@ -298,27 +403,63 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 						   i915_dp_get_pending_retrain,
 						   1.0, 20.0), 0);
 	assert_link_status_good(data, mst);
+}
+
+/*
+ * run_link_rate_test - Main link training routine. Expects the MST vs. SST check
+ * to be done beforehand. Returns true if tested at the correct rate.
+ */
+static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
+{
+	struct i915_dp_link_config configs[MAX_LINK_CONFIGS];
+	int num_configs, num_dynamics = 0;
+	int i;
+
+	igt_require_f(i915_dp_has_allowed_link_configs_debugfs(data->drm_fd,
+							       data->output),
+		      "Kernel has no intel_dp_allowed_link_configs debugfs\n");
+
+	/*
+	 * Enumerate with the forced parameters reset, or the set being read is
+	 * the forced one rather than the one the driver would pick from.
+	 */
+	i915_dp_reset_link_params(data->drm_fd, data->output);
+	num_configs = i915_dp_get_allowed_link_configs(data->drm_fd, data->output,
+						       configs, ARRAY_SIZE(configs));
+
+	for (i = 0; i < num_configs; i++) {
+		char name[64];
+
+		if (i915_dp_is_uhbr_rate(configs[i].link_rate) != uhbr)
+			continue;
+
+		snprintf(name, sizeof(name), "%s-%dx%d",
+			 igt_output_name(data->output),
+			 configs[i].lane_count, configs[i].link_rate);
+
+		num_dynamics++;
+
+		igt_dynamic(name) {
+			setup_link(data, mst);
+
+			igt_require_f(link_config_data_rate(&configs[i], mst) >=
+				      link_min_data_rate(data, mst),
+				      "%d lanes, rate %d is too narrow for the mode\n",
+				      configs[i].lane_count,
+				      configs[i].link_rate);
+
+			train_link_config(data, mst, &configs[i]);
+		}
 
-	/* Read max_link_rate and max_lane_count */
-	config.link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
-	config.lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
-
-	/* Check sink supports uhbr or not */
-	is_uhbr_output = i915_dp_is_uhbr_rate(config.link_rate);
-	if (uhbr != is_uhbr_output) {
-		igt_info("Test expects %s, but output %s is %s.\n",
-			 uhbr ? "UHBR" : "NON-UHBR",
-			 data->output->name,
-			 is_uhbr_output ? "UHBR" : "NON-UHBR");
-		igt_info("----------------------------------------------------\n");
-		return false;
+		i915_dp_reset_link_params(data->drm_fd, data->output);
 	}
 
-	/* Force retrain at max link params */
-	train_link_config(data, mst, &config);
+	if (!num_dynamics)
+		igt_info("Output %s allows no %sUHBR link config\n",
+			 igt_output_name(data->output), uhbr ? "" : "non-");
 
 	igt_info("----------------------------------------------------\n");
-	return true;
+	return num_dynamics > 0;
 }
 
 /*
@@ -386,7 +527,7 @@ int igt_main()
 	}
 
 	igt_describe("Test we can drive UHBR rates over SST");
-	igt_subtest("uhbr-sst") {
+	igt_subtest_with_dynamic("uhbr-sst") {
 		igt_require_f(intel_display_ver(data.devid) > 13,
 			      "UHBR not supported on platform\n");
 		igt_require_f(test_link_rate(&data, false, true),
@@ -394,7 +535,7 @@ int igt_main()
 	}
 
 	igt_describe("Test we can drive UHBR rates over MST");
-	igt_subtest("uhbr-mst") {
+	igt_subtest_with_dynamic("uhbr-mst") {
                 igt_require_f(intel_display_ver(data.devid) > 13,
                               "UHBR not supported on platform\n");
 		igt_require_f(test_link_rate(&data, true, true),
@@ -402,13 +543,13 @@ int igt_main()
 	}
 
 	igt_describe("Test we can drive NON-UHBR rates over SST");
-	igt_subtest("non-uhbr-sst") {
+	igt_subtest_with_dynamic("non-uhbr-sst") {
 		igt_require_f(test_link_rate(&data, false, false),
 			      "Didn't find any SST output with NON-UHBR rates.\n");
 	}
 
 	igt_describe("Test we can drive NON-UHBR rates over MST");
-	igt_subtest("non-uhbr-mst") {
+	igt_subtest_with_dynamic("non-uhbr-mst") {
 		igt_require_f(test_link_rate(&data, true, false),
 			      "Didn't find any MST output with NON-UHBR rates.\n");
 	}
-- 
2.25.1

