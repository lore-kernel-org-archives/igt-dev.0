Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B52C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7982F112DB9;
	Tue, 30 Jan 2024 05:49:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426A4112DB9
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706593766; x=1738129766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i5Whf8oA4NCBNQYqICihr7Sc8Qj4Te1EMRmNHWKPtms=;
 b=K+9lBZUBF859QomvqOI3j+RJcXWouEN5+MUJtdkfpXAduqGu+Fxdp66M
 deAFk7FVzsYXUD680VbP3YCwO+3oaqtNAtBKLPDTNoYMqc3cz6il4Ku0F
 QEFMpw5pcu/ZvXHh+MxX18lFzNJcbVK+gyYF83Z+fjfFczBnKpwyJLOwD
 pEMTsqWuh0cjuyONf0eYKGxD9YBvLtyP5K5uJOp4gDFdVu1jC/8Zu9Oqx
 gIvWI11bySQVfrLyUQ6EFMorDqTF/HAHGUo6hIN6G8yH+/DANaTnMZnZB
 F/3nKJVrGsUcst9gRmX4f6j0Nd21OO5PG7bYJDwvhtihFAYOS59LBuXbn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393609656"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="393609656"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3603174"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:23 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v5 7/9] tests/kms_vrr: Allow for multiple rates in a test
Date: Tue, 30 Jan 2024 11:12:33 +0530
Message-ID: <20240130054235.533132-8-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
References: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Instead of passing just one rate into flip_and_measure, pass in an array
to allow for tests which vary the refresh rate from one frame to the
next. Currently the test will just cycle through the rates in order per
frame.

Just framework, no changes to any tests.

v2:
- Added to the set
v3: (Bhanu)
- Rebase

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 93 ++++++++++++++++++++++++++++---------------------
 1 file changed, 53 insertions(+), 40 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 30a279c56..2d58f2179 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -384,34 +384,43 @@ do_flip(data_t *data, igt_fb_t *fb)
  */
 static uint32_t
 flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
-		 uint64_t rate_ns, uint64_t duration_ns)
+		 uint64_t *rates_ns, int num_rates, uint64_t duration_ns)
 {
 	uint64_t start_ns, last_event_ns, target_ns, exp_rate_ns;
 	uint32_t total_flip = 0, total_pass = 0;
 	bool front = false;
 	vtest_ns_t vtest_ns = data->vtest_ns;
-	uint64_t threshold_hi, threshold_lo;
+	uint64_t *threshold_hi, *threshold_lo;
 
-	if ((rate_ns <= vtest_ns.min) && (rate_ns >= vtest_ns.max))
-		exp_rate_ns = rate_ns;
-	else
-		exp_rate_ns = vtest_ns.max;
+	threshold_hi = malloc(sizeof(uint64_t) * num_rates);
+	threshold_lo = malloc(sizeof(uint64_t) * num_rates);
+	igt_assert(threshold_hi && threshold_lo);
 
-	/* Allow ~1 Hz deviation for different reasons causing delay. */
-	threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
-	threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
+	for (int i = 0; i < num_rates; ++i) {
+		if ((rates_ns[i] <= vtest_ns.min) && (rates_ns[i] >= vtest_ns.max))
+			exp_rate_ns = rates_ns[i];
+		else
+			exp_rate_ns = vtest_ns.max;
 
-	igt_info("Requested rate: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
-			rate_ns, threshold_hi, threshold_lo);
+		/* Allow ~1 Hz deviation for different reasons causing delay. */
+		threshold_hi[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
+		threshold_lo[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
+
+		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
+				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
+	}
 
 	/* Align with the flip completion event to speed up convergence. */
 	do_flip(data, &data->fb[0]);
 	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
 							DRM_EVENT_FLIP_COMPLETE);
 
-	for (;;) {
+	for (int i = 0;;++i) {
 		uint64_t event_ns, wait_ns;
 		int64_t diff_ns;
+		uint64_t rate_ns = rates_ns[i % num_rates];
+		uint64_t th_lo_ns = threshold_lo[i % num_rates];
+		uint64_t th_hi_ns = threshold_hi[i % num_rates];
 
 		front = !front;
 		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
@@ -432,7 +441,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		 */
 		diff_ns = event_ns - last_event_ns;
 
-		if (llabs(diff_ns) < threshold_lo && llabs(diff_ns) > threshold_hi)
+		if (llabs(diff_ns) < th_lo_ns && llabs(diff_ns) > th_hi_ns)
 			total_pass += 1;
 
 		last_event_ns = event_ns;
@@ -454,8 +463,12 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		while (get_time_ns() < target_ns - 10);
 	}
 
-	igt_info("Completed %u flips, %u were in threshold for (%llu Hz) %"PRIu64"ns.\n",
-		 total_flip, total_pass, (NSECS_PER_SEC/rate_ns), rate_ns);
+	igt_info("Completed %u flips, %u were in threshold for [", total_flip, total_pass);
+	for (int i = 0; i < num_rates; ++i) {
+		igt_info("(%llu Hz) %"PRIu64"ns%s", (NSECS_PER_SEC/rates_ns[i]), rates_ns[i],
+			 i < num_rates - 1 ? "," : "");
+	}
+	igt_info("]\n");
 
 	return total_flip ? ((total_pass * 100) / total_flip) : 0;
 }
@@ -467,12 +480,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	uint32_t result;
 	vtest_ns_t vtest_ns;
 	range_t range;
-	uint64_t rate;
+	uint64_t rate[] = {0};
 
 	prepare_test(data, output, pipe);
 	range = data->range;
 	vtest_ns = data->vtest_ns;
-	rate = vtest_ns.rate_ns;
+	rate[0] = vtest_ns.rate_ns;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
@@ -486,7 +499,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * This is to make sure we were actually in the middle of
 	 * active flipping before doing the DPMS/suspend steps.
 	 */
-	flip_and_measure(data, output, pipe, rate, 250000000ull);
+	flip_and_measure(data, output, pipe, rate, 1, 250000000ull);
 
 	if (flags & TEST_DPMS) {
 		kmstest_set_connector_dpms(output->display->drm_fd,
@@ -517,27 +530,27 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 *      next Vmin.
 	 */
 	if (flags & TEST_FLIPLINE) {
-		rate = rate_from_refresh(range.max + 5);
-		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+		rate[0] = rate_from_refresh(range.max + 5);
+		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     (range.max + 5), rate, result);
+			     (range.max + 5), rate[0], result);
 	}
 
 	if (flags & ~TEST_NEGATIVE) {
-		rate = vtest_ns.rate_ns;
-		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+		rate[0] = vtest_ns.rate_ns;
+		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     ((range.max + range.min) / 2), rate, result);
+			     ((range.max + range.min) / 2), rate[0], result);
 	}
 
 	if (flags & TEST_FLIPLINE) {
-		rate = rate_from_refresh(range.min - 10);
-		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+		rate[0] = rate_from_refresh(range.min - 10);
+		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
-			     (range.min - 10), rate, result);
+			     (range.min - 10), rate[0], result);
 	}
 
 	/*
@@ -546,11 +559,11 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * a VRR capable panel.
 	 */
 	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
-	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+	rate[0] = vtest_ns.rate_ns;
+	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
-		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
+		     ((range.max + range.min) / 2), rate[0], (flags & TEST_NEGATIVE)? "on" : "off", result);
 }
 
 static void
@@ -558,7 +571,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 {
 	uint32_t result;
 	vtest_ns_t vtest_ns;
-	uint64_t rate;
+	uint64_t rate[] = {0};
 	bool vrr = !!(flags & TEST_SEAMLESS_VRR);
 
 	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" : "OFF");
@@ -578,11 +591,11 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
 	}
 
-	rate = vtest_ns.max;
-	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+	rate[0] = vtest_ns.max;
+	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
-		     data->range.max, rate, vrr ? "on" : "off", result);
+		     data->range.max, rate[0], vrr ? "on" : "off", result);
 
 	/* Switch to low rr mode without modeset. */
 	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
@@ -590,11 +603,11 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
-	rate = vtest_ns.min;
-	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+	rate[0] = vtest_ns.min;
+	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
-		     data->range.min, rate, vrr ? "on" : "off", result);
+		     data->range.min, rate[0], vrr ? "on" : "off", result);
 
 	/* Switch back to high rr mode without modeset. */
 	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
@@ -602,11 +615,11 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
-	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
+	rate[0] = vtest_ns.rate_ns;
+	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 	igt_assert_f(vrr ? (result > 75) : (result < 10),
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
-		     ((data->range.max + data->range.min) / 2), rate,
+		     ((data->range.max + data->range.min) / 2), rate[0],
 		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
 }
 
-- 
2.43.0

