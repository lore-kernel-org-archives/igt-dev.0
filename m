Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2BF606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 07:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QEoC9RBq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661FB10E645;
	Mon, 23 Nov 2026 07:29:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D72210E621
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 07:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795418766; x=1826954766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WgwTk+YwnD4DZ8g9PYrZeSp4eX0G818PSKeVF3+3qNI=;
 b=QEoC9RBqxMt47tVlSr3loUZAKGy1Wtrh3+Lq7Zhn6DIAhUJQSomNx8pi
 Ln5YCci4Mk1IQx1OcFr/m5COHPGNXc7l9D7NWqcyLSPAniOCxY9xVtEP8
 XMYE0/qw8CHvMa9uSq0wjbumfqEcPR9lpTGyVutAokLVt25lpL6lk4mqt
 TA99UxlXeuIaGO4XM/mSLDjNnuX6vNKvF+qhCTIfibpeKoP3CBeZzxtdW
 cvnEGvUP8SjmsZtGaLMeQasLWHxpR2p+/XvP34JIkEQZFvhndJSNF9qYo
 +KYr5oL3v2Q8LAid/TEmvrpmpcjQ3mabXrUGuhAZ1kXhXyJMtDVVrTJpy w==;
X-CSE-ConnectionGUID: nSuMlPAMQouDc+Xz3zmyjw==
X-CSE-MsgGUID: YJrRIwgiTiGWE2GZYaNDkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4225362"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4225362"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:26:02 -0800
X-CSE-ConnectionGUID: rzrC2/CWRg+GiyUaS6vFCw==
X-CSE-MsgGUID: itkkR8YqT4m2Mtn7UYpMaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11241561"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa002.jf.intel.com with ESMTP; 22 Nov 2026 23:26:02 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v11 2/2] tests/kms_vrr: add support for full range refresh
 rate testing
Date: Mon, 23 Nov 2026 07:24:09 +0000
Message-ID: <20261123072409.294287-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123072409.294287-1-shawn.c.lee@intel.com>
References: <20261123072409.294287-1-shawn.c.lee@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, kms_vrr tests fixed step increments within the VRR range.
To better validate hardware stability and potential issues across the
entire spectrum, this patch adds a 'full-range' testing mode.

When the full-range flag is enabled, the test will:
1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
2. For standard testing, maintain the existing behavior of incrementing
   from minimum to maximum using the defined step size.

v2: Fix build failure by adding documentation for the new subtest.
v3: Remove unnecessary '!!' operator when assigning to bool.
v4: Add full-range (top-down/bottom-up) subtests to verify all supported
    RR within VRR range.
v5: Fix build failure for the new subtest.
v6: Revert commit 862eb176244f ("tests/kms_vrr: Start virtual RR test
    above midpoint to avoid mode fallback").
v7: Not allow to run full range test if eDP display did not support
    multiple refresh rate.
v8: Add is_pixel_clock_identical() helper.
v9: Add ALLOW_MODESET flag to the initial commit request.
v10: Rebase on top of latest upstream master (commit 05c13a14f7f8).
v11: Differentiate top-down/bottom-up subtest descriptions, and use
     igt_skip() instead of a silent return for panels without multiple
     refresh rate support.

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 tests/kms_vrr.c | 115 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 92 insertions(+), 23 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 0102afe203dc..3294db8ff4e3 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -64,9 +64,13 @@
  * Description: Test to switch RR seamlessly without modeset.
  * Mega feature: General Display Features
  *
- * SUBTEST: seamless-rr-switch-virtual
- * Description: Test to create a Virtual Mode in VRR range and switch to it
- * 		without a full modeset.
+ * SUBTEST: seamless-rr-switch-virtual-top-down
+ * Description: Vrr seamless refresh rate switch for virtual modes, traversing
+ *              the full range from the highest to the lowest refresh rate.
+ *
+ * SUBTEST: seamless-rr-switch-virtual-bottom-up
+ * Description: Vrr seamless refresh rate switch for virtual modes, traversing
+ *              the full range from the lowest to the highest refresh rate.
  *
  * SUBTEST: lobf
  * Description: Test to validate link-off between active frames in non-psr
@@ -115,9 +119,10 @@ enum {
 	TEST_FLIPLINE = 1 << 3,
 	TEST_SEAMLESS_VRR = 1 << 4,
 	TEST_SEAMLESS_DRRS = 1 << 5,
-	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
-	TEST_FASTSET = 1 << 7,
-	TEST_MAXMIN = 1 << 8,
+	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 << 6,
+	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 << 7,
+	TEST_FASTSET = 1 << 8,
+	TEST_MAXMIN = 1 << 9,
 	TEST_LINK_OFF = 1 << 10,
 	TEST_NEGATIVE = 1 << 11,
 	TEST_FORCE_RR = 1 << 12,
@@ -296,13 +301,56 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
-static void
-virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
+static bool
+virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
 {
 	uint64_t clock_hz = mode->clock * 1000;
+	uint16_t virtual_vtotal;
+
+	virtual_vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
+	if (is_intel_device(data->drm_fd) && virtual_vtotal > 8192) {
+		igt_info("VTotal (%d) already exceed 8192 at %fHz\n",
+			 virtual_vtotal, virtual_refresh_rate);
+		return false;
+	}
 
-	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
+	mode->vsync_start = virtual_vtotal - (mode->vtotal - mode->vsync_start);
+	mode->vsync_end   = virtual_vtotal - (mode->vtotal - mode->vsync_end);
+	mode->vtotal = virtual_vtotal;
 	mode->vrefresh = virtual_refresh_rate;
+	return true;
+}
+
+static bool
+is_edp_multiple_rr_panel(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *first;
+
+	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
+		igt_debug("Connector %s is not eDP\n", output->name);
+		return false;
+	}
+
+	if (!connector->count_modes)
+		return false;
+
+	first = &connector->modes[0];
+
+	for (int i = 1; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+
+		if (mode->vrefresh == first->vrefresh)
+			continue;
+
+		igt_debug("Multiple RR panel: %u kHz/%u Hz vs %u kHz/%u Hz (%s clock)\n",
+			  first->clock, first->vrefresh,
+			  mode->clock, mode->vrefresh,
+			  mode->clock == first->clock ? "same" : "different");
+		return true;
+	}
+
+	return false;
 }
 
 /* Read min and max vrr range from the connector debugfs. */
@@ -991,11 +1039,16 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 			       igt_output_t *output, uint32_t flags)
 {
 	uint32_t result;
-	unsigned int vrefresh;
+	int vrefresh;
 	uint64_t rate[] = {0};
-	uint32_t step_size;
+	int start, end, step;
 	drmModeModeInfo virtual_mode;
 
+	if (!is_edp_multiple_rr_panel(output)) {
+		igt_skip("%s: This panel does not support seamless virtual RR switching.\n",
+			 igt_output_name(output));
+	}
+
 	igt_info("Use HIGH_RR Mode as default\n");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
@@ -1007,29 +1060,39 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	 * switch to highest refresh rate mode.
 	 */
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
-	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+	igt_assert(igt_display_try_commit_atomic(&data->display,
+						 DRM_MODE_PAGE_FLIP_EVENT |
+						 DRM_MODE_ATOMIC_ALLOW_MODESET,
+						 NULL) == 0);
 
 	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
 		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
 
-	/*
-	 * Calculate step size by considering the no. of steps required to
-	 * reach Vmin to Vmax as 5.
-	 */
-	step_size = (data->range.max - data->range.min) / 5;
-
 	/* Switch to Virtual RR */
 	virtual_mode = *igt_output_get_mode(output);
 
-	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
-		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
+	if (flags & TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
+		start = data->range.max;
+		end = data->range.min;
+		step = -1;
+	} else {
+		start = data->range.min;
+		end = data->range.max;
+		step = 1;
+	}
+
+	for (vrefresh = start; step > 0 ? vrefresh <= end : vrefresh >= end; vrefresh += step) {
+		if (!virtual_rr_vrr_range_mode(data, &virtual_mode, vrefresh))
+			continue;
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
 		kmstest_dump_mode(&virtual_mode);
 
 		igt_output_override_mode(output, &virtual_mode);
+
+		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
 		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
@@ -1390,9 +1453,15 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("flip-basic-fastset")
 			run_vrr_test(&data, test_basic, TEST_FASTSET);
 
-		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
-		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
-			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
+		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
+		igt_subtest_with_dynamic("seamless-rr-switch-virtual-top-down")
+			run_vrr_test(&data, test_seamless_virtual_rr_basic,
+				     TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
+
+		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
+		igt_subtest_with_dynamic("seamless-rr-switch-virtual-bottom-up")
+			run_vrr_test(&data, test_seamless_virtual_rr_basic,
+				     TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
 
 		igt_describe("Test to validate the link-off between active frames in "
 			     "non-PSR operation.");
-- 
2.53.0

