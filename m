Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A06F8E4A5
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 05:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E516E10E191;
	Fri, 17 Apr 2026 05:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ShRYtigF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAFA10E191
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 05:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776404143; x=1807940143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=byg8Oaio+U/3gR5gGMF4rCAWVPLDc1SOvDQcRWguDOc=;
 b=ShRYtigF8pdHEd26yOzdQJcy0mSS6c7NHZicMh/3RucAoFng8MuLsggX
 tiZ53B+qWxwaFtryj/wAqwYy7zxRiV2xduHxEufExsfgkyYn8x/4i/+T0
 gpY65Xa2h0Chon53aGm3/oZQ2RW/q8UJ8OpZJ5m3KwGBvVb1O+1wMJ+E/
 W2vu3MY8rbqM1muAFidm7fa7wNRu9+8s7cSSwHPMMlme8+IurkAVbLR3w
 9Z/3tBUH7Ci/5uSQnp6HaFNiujXC9wpBeW/c05pEz7gDu0O9H2usfYCFd
 QL7+8YedJwNGGMjFB+SiAhaqevcCBujEXp2rbV2YLQHI9WI0RBYdHlsM9 g==;
X-CSE-ConnectionGUID: 31lhC2zxS8ylNDU13yyU1Q==
X-CSE-MsgGUID: SkrSCrZlS86G0xzUXMnL8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="64955732"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="64955732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 22:35:42 -0700
X-CSE-ConnectionGUID: qcE4RGROTjGYrBKhfUCrEQ==
X-CSE-MsgGUID: 4EDysTfAQtSnAbjvvcqurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235318095"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 22:35:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_vrr: Revert "tests/kms_vrr: New subtest
 for CMRR"
Date: Fri, 17 Apr 2026 11:06:20 +0530
Message-ID: <20260417053620.3685837-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411175919.1135989-1-ramanaidu.naladala@intel.com>
References: <20260411175919.1135989-1-ramanaidu.naladala@intel.com>
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

This reverts commit 7f0a262891b7888a09e4a1838eb688ad9c676324.

Remove the CMRR subtest due to a change in test approach requiring
a complete rewrite. The subtest will be reintroduced in a future
patch with a revised test methodology.

rev2: Update the git subject and commit message. (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 132 +-----------------------------------------------
 1 file changed, 1 insertion(+), 131 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index ec0692b2f..01f078d2c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -36,10 +36,6 @@
 #include <signal.h>
 
 /**
- * SUBTEST: cmrr
- * Description: Test to validate the content rate to exactly match with the
- * 		requested rate without any frame drops.
- *
  * SUBTEST: flip-basic
  * Description: Tests that VRR is enabled and that the difference between flip
  *              timestamps converges to the requested rate
@@ -90,9 +86,6 @@
  */
 #define TEST_DURATION_NS (5000000000ull)
 
-#define CMRR_PRECISION_TOLERANCE	10
-#define VREFRESH_MODIFIER	0.1
-
 enum {
 	TEST_BASIC = 1 << 0,
 	TEST_DPMS = 1 << 1,
@@ -103,7 +96,6 @@ enum {
 	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
 	TEST_FASTSET = 1 << 7,
 	TEST_MAXMIN = 1 << 8,
-	TEST_CMRR = 1 << 9,
 	TEST_LINK_OFF = 1 << 10,
 	TEST_NEGATIVE = 1 << 11,
 	TEST_FORCE_RR = 1 << 12,
@@ -252,21 +244,6 @@ virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
 	mode->vrefresh = virtual_refresh_rate;
 }
 
-static bool
-is_cmrr_mode(drmModeModeInfoPtr mode)
-{
-	int calculated_refresh, actual_refresh, pixel_clock_per_line;
-
-	actual_refresh = mode->vrefresh * 100;
-	pixel_clock_per_line = mode->clock * 1000 / mode->htotal;
-	calculated_refresh = pixel_clock_per_line * 100 / mode->vtotal;
-
-	if ((actual_refresh - calculated_refresh) < CMRR_PRECISION_TOLERANCE)
-		return false;
-
-	return true;
-}
-
 /* Read min and max vrr range from the connector debugfs. */
 static range_t
 get_vrr_range(data_t *data, igt_output_t *output)
@@ -600,57 +577,6 @@ flip_and_measure(data_t *data, igt_output_t *output,
 	return 0;
 }
 
-static uint32_t
-flip_and_measure_cmrr(data_t *data, igt_output_t *output,
-		      uint64_t duration_ns)
-{
-	uint64_t start_ns, last_event_ns, event_ns;
-	uint32_t total_flip = 0, total_pass = 0;
-	bool front = false;
-	drmModeModeInfoPtr mode = igt_output_get_mode(output);
-	uint64_t req_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh + VREFRESH_MODIFIER);
-	uint64_t exp_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh);
-	uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 scan line. */
-
-	igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
-		 "expected rate: %"PRIu64" ns - %"PRIu64" ns (%.2f-%.2f Hz)\n",
-		 req_rate_ns, (mode->vrefresh + VREFRESH_MODIFIER),
-		 (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
-		 (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
-		 (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
-
-	do_flip(data, &data->fb[0]);
-	start_ns = last_event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
-	do {
-		int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
-
-		front = !front;
-		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
-
-		event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
-		igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%.2f Hz)\n",
-			  event_ns - last_event_ns, (float)NSECS_PER_SEC / (event_ns - last_event_ns));
-
-		diff_ns -= event_ns - last_event_ns;
-		if (llabs(diff_ns) <= threshold_ns)
-			total_pass += 1;
-
-		last_event_ns = event_ns;
-		total_flip += 1;
-
-		diff_ns = event_ns - start_ns;
-		wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) * req_rate_ns;
-		wait_ns -= diff_ns;
-		target_ns = event_ns + wait_ns;
-		while (get_time_ns() < target_ns - 10);
-	} while (event_ns - start_ns <= duration_ns);
-
-	igt_info("Completed %u flips, %u vblanks were in threshold for (%.2f Hz) %"PRIu64"ns.\n",
-		 total_flip, total_pass, (mode->vrefresh + VREFRESH_MODIFIER), req_rate_ns);
-
-	return total_flip ? ((total_pass * 100) / total_flip) : 0;
-}
-
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
 static void
 test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
@@ -946,54 +872,6 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
 }
 
-static void
-test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
-	  uint32_t flags)
-{
-	uint32_t result;
-	int i;
-	bool found = false;
-	drmModeConnectorPtr connector = output->config.connector;
-	drmModeModeInfo mode = *igt_output_get_mode(output);
-
-	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
-		 output->name, igt_crtc_name(crtc), data->range.min,
-		 data->range.max);
-
-	for (i = 0; i < connector->count_modes; i++) {
-		if (is_cmrr_mode(&connector->modes[i])) {
-			mode = connector->modes[i];
-
-			found = true;
-			break;
-		}
-	}
-
-	igt_info("Selected mode: ");
-	kmstest_dump_mode(&mode);
-
-	if (!found) {
-		igt_info("No CMRR mode found on %s, try to tweak the clock.\n", output->name);
-
-		mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh + VREFRESH_MODIFIER)) / 1000;
-
-		igt_info("Tweaked mode: ");
-		kmstest_dump_mode(&mode);
-	}
-
-	igt_output_override_mode(output, &mode);
-
-	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
-		prepare_test(data, output,
-			     crtc);
-		result = flip_and_measure_cmrr(data, output, TEST_DURATION_NS * 2);
-		igt_assert_f(result > 75,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
-			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
-			     result);
-	}
-}
-
 static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_crtc_set_prop_value(crtc,
@@ -1013,7 +891,7 @@ static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
 
-	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
+	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
 	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
 		igt_info("%s: Connected panel is not eDP.\n", igt_output_name(output));
 		return false;
@@ -1226,14 +1104,6 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
-		igt_describe("Test to validate the content rate exactly matches with the "
-			     "requested rate without any frame drops.");
-		igt_subtest_with_dynamic("cmrr") {
-			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
-
-			run_vrr_test(&data, test_cmrr, TEST_CMRR);
-		}
-
 		igt_describe("Test to validate the link-off between active frames in "
 			     "non-PSR operation.");
 		igt_subtest_with_dynamic("lobf") {
-- 
2.43.0

