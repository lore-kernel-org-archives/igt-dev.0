Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA095CCD193
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 10:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB2810E771;
	Wed, 15 Oct 2025 10:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4QCWo0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A8010E771
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760522540; x=1792058540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cvhgNyN5zt+PmWInxJjjhdHjDQp6UlrfD2lPP0zgYk8=;
 b=k4QCWo0GZ4PvKyNcVakfygApIUjWxh2uH0NAdAqLlzaLhCeH/QXYRZeQ
 EcGa8YxOuPMSGkRqF3pqgFAzhMAQLzogFHSNgSlo+CqTg0VbpBDv1vLEX
 Psl83BJ7RtlafHb1GdT0v7YZFtR/o1bIgUaiE72Dafyd7URBoM9WAfSfb
 zemTo+UmT7uTcz8oQQYujLhnailw1BDZV4HfqiMvzFowtNz22gyvb24fZ
 5XXhp7dDQdWejqJDVY2qKSFm0udSOKDf0he9gtQ9xm8R51E/5dcrKT5Fj
 siVRBBMPqn8cc7wr2PBZAIuZKywV/1OVTGSMBeecZNog3MeqRUOlSBXUm w==;
X-CSE-ConnectionGUID: HYimBh4MTiypTHwE6yzUZA==
X-CSE-MsgGUID: jIpGRRPdTCqPux+y9Bwz1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62590185"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62590185"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:02:20 -0700
X-CSE-ConnectionGUID: oSDykIilTbaeQauJ5pGfCQ==
X-CSE-MsgGUID: JuSiR8MqT+KQWCVAW4MxVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="205835589"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:02:18 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/kms_linktrain_fallback: extend test for
 eDP connector
Date: Wed, 15 Oct 2025 15:47:58 +0530
Message-Id: <20251015101759.3982477-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015101759.3982477-1-kunal1.joshi@intel.com>
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
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

Rename dp-fallback subtest name to lt-fallback and
add additional logic in test_fallback to handle eDP fallback.

In eDP fallback on the initial link training failure expectation is to retry
with max link rate and max lane count that is supported,
Further failures leads to reduction in either link rate or lane count.

v2: use helper for eDP/DP check (Jeevan)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_linktrain_fallback.c | 43 ++++++++++++++++++----------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/tests/intel/kms_linktrain_fallback.c b/tests/intel/kms_linktrain_fallback.c
index fa58999e8..b74c5a059 100644
--- a/tests/intel/kms_linktrain_fallback.c
+++ b/tests/intel/kms_linktrain_fallback.c
@@ -18,8 +18,8 @@
 #include "kms_dsc_helper.h"
 
 /**
- * SUBTEST: dp-fallback
- * Description: Test fallback on DP connectors
+ * SUBTEST: lt-fallback
+ * Description: Test Link Training fallback on DP/eDP connectors
  *
  * SUBTEST: dsc-fallback
  * Description: Test fallback to DSC when BW isn't sufficient
@@ -336,11 +336,12 @@ static bool fix_link_status_and_recommit(data_t *data,
 	return true;
 }
 
-static void test_fallback(data_t *data, bool is_mst)
+static void test_fallback(data_t *data, bool is_mst, bool is_edp)
 {
 	int output_count, retries;
 	int max_link_rate, curr_link_rate, prev_link_rate;
 	int max_lane_count, curr_lane_count, prev_lane_count;
+	int iter = 0;
 	igt_output_t *outputs[IGT_MAX_PIPES];
 	drmModeModeInfo * modes[IGT_MAX_PIPES];
 	struct igt_fb fbs[IGT_MAX_PIPES];
@@ -365,6 +366,7 @@ static void test_fallback(data_t *data, bool is_mst)
 
 	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
 						 data->output)) {
+		iter++;
 		igt_info("Current link rate: %d, Current lane count: %d\n",
 			 prev_link_rate,
 			 prev_lane_count);
@@ -400,10 +402,19 @@ static void test_fallback(data_t *data, bool is_mst)
 		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
 		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
 
-		igt_assert_f((curr_link_rate < prev_link_rate ||
-			     curr_lane_count < prev_lane_count) ||
-			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
-			     "Fallback unsuccessful\n");
+		if (is_edp && iter == 1) {
+			/* eDP first retry must stay at max, no reduction */
+			igt_assert_eq(curr_link_rate,  prev_link_rate);
+			igt_assert_eq(curr_lane_count, prev_lane_count);
+		} else {
+			/* Otherwise DP‐style fallback: either shrink or allow spurious retry */
+			igt_assert_f((curr_link_rate  < prev_link_rate ||
+				     curr_lane_count < prev_lane_count) ||
+				     ((curr_link_rate  == max_link_rate &&
+				     curr_lane_count == max_lane_count) &&
+				     --retries),
+				    "Fallback unsuccessful\n");
+		}
 
 		prev_link_rate = curr_link_rate;
 		prev_lane_count = curr_lane_count;
@@ -413,10 +424,12 @@ static void test_fallback(data_t *data, bool is_mst)
 static bool run_lt_fallback_test(data_t *data)
 {
 	bool ran = false;
+	bool is_edp = false;
 	igt_output_t *output;
 
 	for_each_connected_output(&data->display, output) {
 		data->output = output;
+		is_edp = output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP;
 
 		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
 								 data->output)) {
@@ -425,9 +438,9 @@ static bool run_lt_fallback_test(data_t *data)
 			continue;
 		}
 
-		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
-			igt_info("Skipping output %s as it's not DP\n", output->name);
-				continue;
+		if (!igt_output_is_dp_family(data->output)) {
+			igt_info("Skipping output %s as it's not DP/eDP\n", output->name);
+			continue;
 		}
 
 		ran = true;
@@ -438,11 +451,12 @@ static bool run_lt_fallback_test(data_t *data)
 		if (igt_check_output_is_dp_mst(data->output)) {
 			igt_info("Testing MST output %s\n",
 				 igt_output_name(data->output));
-			test_fallback(data, true);
+			test_fallback(data, true, false);
 		} else {
-			igt_info("Testing DP output %s\n",
+			igt_info("Testing %s output %s\n",
+				 is_edp ? "eDP" : "DP",
 				 igt_output_name(data->output));
-			test_fallback(data, false);
+			test_fallback(data, false, is_edp);
 		}
 	}
 	return ran;
@@ -511,7 +525,6 @@ static void test_dsc_sst_fallback(data_t *data)
 	/* Repeatedly force link failure until DSC is required (or link is disabled) */
 	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
 		mon = igt_watch_uevents();
-
 		igt_assert_f(force_failure_and_wait(data, data->output,
 						    LT_FAILURE_REDUCED_CAPS,
 						    RETRAIN_COUNT, 1.0, 20.0),
@@ -616,7 +629,7 @@ igt_main
 			     "Unable to disable ignore long hpd\n");
 	}
 
-	igt_subtest("dp-fallback") {
+	igt_subtest("lt-fallback") {
 		igt_require_f(run_lt_fallback_test(&data),
 			      "Skipping test as no output found or none supports fallback\n");
 	}
-- 
2.25.1

