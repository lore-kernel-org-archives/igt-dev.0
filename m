Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64073C27C5F
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 12:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA4210E3B9;
	Fri,  7 Jun 2024 12:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlyhU7Ga";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C8C10E770
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717764979; x=1749300979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ks6sbT61za5pFyag548FXvPzZLQF/E6MeH0b4qChsvU=;
 b=RlyhU7GaXGXK7VsRUOEEjBHEtxDr/Zb6THJDSOuI2A0qKXH9BTk/Qznb
 4vMeuv0ICAW2rC+u7abLHB/twYs+hDENobgVXELoAHpNidF6aZ6Tafnj7
 3PiESEWiGEVns62u9Fp3XyZkd0j+axoEeJMTfrde5Z7JUCeS8/eBDsYb+
 qEPLoxbHtHYzJADpyhCaUmXAZ9rFh4wC3XLnvWbn0ZXHEQSH1jUz44cPv
 DcWiA1P/jDYOxCVqrjmi3qeHNfLaK5b5KW88qR8A2W2yVfpSED3RP9D5i
 4hqZ/XRbPiFirlyLHntNo8JxP4hidzYflZlS0boK8gwmvRSDpjn+nApE9 g==;
X-CSE-ConnectionGUID: BPKtZoicTbyUM3zZYDaBvg==
X-CSE-MsgGUID: r1qPM8T9Sp2xfAiwZaPDew==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="37011349"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="37011349"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:56:19 -0700
X-CSE-ConnectionGUID: IyYangs9TVSkSARs1Xj7Rw==
X-CSE-MsgGUID: rna9fjqsR/q6nfdk8WlwaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38768843"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:56:17 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_vrr: New subtest for CMRR
Date: Fri,  7 Jun 2024 18:18:39 +0530
Message-ID: <20240607124840.3405928-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

CMRR is an variation of VRR where it varies Vtotal slightly
(between additional 0 and 1 Vtotal scanlines) to match content
rate exactly without frame drops using the adaptive sync framework.

This patch creates a new subtest to validate the CMRR as below:
- Request flips with the refresh_rate * 1.001
- Flips should happen at the frequency of refresh_rate.

V2:
 - Tweak the clock if CMRR supported mode not found (Ankit)
 - Rebase
V3:
 - Read flip completion events instead of Vblank evants

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 130 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7f64d6806..f3daa55f5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -37,6 +37,11 @@
 #include <signal.h>
 
 /**
+ * SUBTEST: cmrr
+ * Description: Test to validate the content rate to exactly match with the
+ * 		requested rate without any frame drops.
+ * Functionality: CMRR
+ *
  * SUBTEST: flip-basic
  * Description: Tests that VRR is enabled and that the difference between flip
  *              timestamps converges to the requested rate
@@ -87,6 +92,9 @@
  */
 #define TEST_DURATION_NS (5000000000ull)
 
+#define CMRR_PRECISION_TOLERANCE	10
+#define CMRR_MULTIPLIER	1.001
+
 enum {
 	TEST_BASIC = 1 << 0,
 	TEST_DPMS = 1 << 1,
@@ -97,7 +105,8 @@ enum {
 	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
 	TEST_FASTSET = 1 << 7,
 	TEST_MAXMIN = 1 << 8,
-	TEST_NEGATIVE = 1 << 9,
+	TEST_CMRR = 1 << 9,
+	TEST_NEGATIVE = 1 << 10,
 };
 
 enum {
@@ -232,6 +241,21 @@ virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rat
 	return mode;
 }
 
+static bool
+is_cmrr_mode(drmModeModeInfoPtr mode)
+{
+	int calculated_refresh, actual_refresh, pixel_clock_per_line;
+
+	actual_refresh = mode->vrefresh * 100;
+	pixel_clock_per_line = mode->clock * 1000 / mode->htotal;
+	calculated_refresh = pixel_clock_per_line * 100 / mode->vtotal;
+
+	if ((actual_refresh - calculated_refresh) < CMRR_PRECISION_TOLERANCE)
+		return false;
+
+	return true;
+}
+
 /* Read min and max vrr range from the connector debugfs. */
 static range_t
 get_vrr_range(data_t *data, igt_output_t *output)
@@ -496,6 +520,57 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	return total_flip ? ((total_pass * 100) / total_flip) : 0;
 }
 
+static uint32_t
+flip_and_measure_cmrr(data_t *data, igt_output_t *output, enum pipe pipe,
+		      uint64_t duration_ns)
+{
+	uint64_t start_ns, last_event_ns, event_ns;
+	uint32_t total_flip = 0, total_pass = 0;
+	bool front = false;
+	drmModeModeInfoPtr mode = igt_output_get_mode(output);
+	uint64_t req_rate_ns = rate_from_refresh(mode->vrefresh * CMRR_MULTIPLIER);
+	uint64_t exp_rate_ns = rate_from_refresh(mode->vrefresh);
+	uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 scan line. */
+
+	igt_info("CMRR on: requested rate: %"PRIu64" ns (%f Hz) "
+		 "expected rate: %"PRIu64" ns - %"PRIu64" ns (%f-%f Hz)\n",
+		 req_rate_ns, mode->vrefresh * CMRR_MULTIPLIER,
+		 (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
+		 (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
+		 (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
+
+	do_flip(data, &data->fb[0]);
+	start_ns = last_event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+	do {
+		int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
+
+		front = !front;
+		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
+
+		event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+		igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%f Hz)\n",
+			  event_ns - last_event_ns, (float)NSECS_PER_SEC / (event_ns - last_event_ns));
+
+		diff_ns -= event_ns - last_event_ns;
+		if (llabs(diff_ns) <= threshold_ns)
+			total_pass += 1;
+
+		last_event_ns = event_ns;
+		total_flip += 1;
+
+		diff_ns = event_ns - start_ns;
+		wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) * req_rate_ns;
+		wait_ns -= diff_ns;
+		target_ns = event_ns + wait_ns;
+		while (get_time_ns() < target_ns - 10);
+	} while (event_ns - start_ns <= duration_ns);
+
+	igt_info("Completed %u flips, %u vblanks were in threshold for (%u Hz) %"PRIu64"ns.\n",
+		 total_flip, total_pass, mode->vrefresh, req_rate_ns);
+
+	return total_flip ? ((total_pass * 100) / total_flip) : 0;
+}
+
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
 static void
 test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
@@ -702,6 +777,49 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
+static void
+test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	uint32_t result;
+	int i;
+	bool found = false;
+	drmModeConnectorPtr connector = output->config.connector;
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+
+	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
+		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
+
+	for (i = 0; i < connector->count_modes; i++) {
+		if (is_cmrr_mode(&connector->modes[i])) {
+			mode = connector->modes[i];
+
+			found = true;
+			break;
+		}
+	}
+
+	igt_info("Selected mode: ");
+	kmstest_dump_mode(&mode);
+
+	if (!found) {
+		igt_info("No CMRR mode found on %s, try to tweak the clock.\n", output->name);
+
+		mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh * CMRR_MULTIPLIER)) / 1000;
+
+		igt_info("Tweaked mode: ");
+		kmstest_dump_mode(&mode);
+	}
+
+	igt_output_override_mode(output, &mode);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	prepare_test(data, output, pipe);
+	result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
+		     mode.vrefresh, rate_from_refresh(mode.vrefresh), result);
+}
+
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	if (vrr_capable(output))
@@ -718,7 +836,7 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
-	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
+	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
 	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 		return false;
 
@@ -906,6 +1024,14 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
+
+		igt_describe("Test to validate the the content rate exactly match with the "
+			     "requested rate without any frame drops.");
+		igt_subtest_with_dynamic("cmrr") {
+			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
+
+			run_vrr_test(&data, test_cmrr, TEST_CMRR);
+		}
 	}
 
 	igt_fixture {
-- 
2.43.2

