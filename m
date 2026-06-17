Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96A7CD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 06:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148EC10E94E;
	Wed, 17 Jun 2026 06:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Up3iS5Mo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23A010E0A5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781678979; x=1813214979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CY1Nsvc/A8Lu3G6lnyJGougxit3Lhur/YUQZOH8Ud14=;
 b=Up3iS5Mo2iHFclSPfQRRjVdMQJSpWNth5LRKXKf93lyXb45FFGbiTjlz
 dq8V5ed9w2sM8gWS95S3pJx76W/KwyBDXHgfePKiIWuzd1vVo/2uZOwJO
 TZA6qRTcPddCK5XBke2hmSQ13mTmXp0k0TsT2WhqF1nroN/z9/Lh2CUUP
 t8iviG8d8nPoPbr+ckb7YySKHzhqaX9CQM7WDGm0uDsL5MKGGerzCHMMk
 qEpAa2PnB4zymYGrWBbG7KIqaTULc3Ei+oOmHZB4zbfehekQbjqwiX9Eo
 V3wH3mDGzJB/D3PCBxXghwu/TWPV74D1JnQYlE4eqREOWTgNSUf3c7u4j A==;
X-CSE-ConnectionGUID: ypbKh3R4RF2jZSbTirM3cg==
X-CSE-MsgGUID: J4STpg5ZSNOan0yFxiVk5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86305079"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="86305079"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 23:49:39 -0700
X-CSE-ConnectionGUID: GEtMMPTiTmOolN+GTEWmTQ==
X-CSE-MsgGUID: 97ohLj5URwKY48k+KqKYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="248046607"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa007.jf.intel.com with ESMTP; 16 Jun 2026 23:49:37 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v9 2/2] tests/kms_vrr: add support for full range refresh rate
 testing
Date: Wed, 17 Jun 2026 07:48:47 +0100
Message-ID: <20260617064847.860438-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617064847.860438-1-shawn.c.lee@intel.com>
References: <20260617064847.860438-1-shawn.c.lee@intel.com>
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

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 tests/kms_vrr.c | 175 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 142 insertions(+), 33 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 8f5c4a7c1501..ad9e4e4757f7 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -62,9 +62,11 @@
  * Description: Test to switch RR seamlessly without modeset.
  * Mega feature: General Display Features
  *
- * SUBTEST: seamless-rr-switch-virtual
- * Description: Test to create a Virtual Mode in VRR range and switch to it
- * 		without a full modeset.
+ * SUBTEST: seamless-rr-switch-virtual-top-down
+ * Description: Vrr seamless refresh rate switch for virtual modes using full range
+ *
+ * SUBTEST: seamless-rr-switch-virtual-bottom-up
+ * Description: Vrr seamless refresh rate switch for virtual modes using full range
  *
  * SUBTEST: lobf
  * Description: Test to validate link-off between active frames in non-psr
@@ -93,9 +95,10 @@ enum {
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
@@ -227,7 +230,7 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	for (i = 0; i < connector->count_modes; i++)
 		if (connector->modes[i].hdisplay == mode.hdisplay &&
 		    connector->modes[i].vdisplay == mode.vdisplay &&
-		    connector->modes[i].clock < mode.clock &&
+		    connector->modes[i].clock <= mode.clock &&
 		    connector->modes[i].vrefresh < mode.vrefresh &&
 		    connector->modes[i].vrefresh >= vrr_min)
 			mode = connector->modes[i];
@@ -235,13 +238,93 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
-static void
-virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
+static bool
+virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
 {
 	uint64_t clock_hz = mode->clock * 1000;
+	uint16_t virtual_vtotal;
 
-	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
+	virtual_vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
+	if (is_intel_device(data->drm_fd) && virtual_vtotal > 8192) {
+		igt_info("VTotal (%d) already exceed 8192 at %fHz\n",
+			 virtual_vtotal, virtual_refresh_rate);
+		return false;
+	}
+
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
+	uint32_t first_clock = 0, first_rr = 0;
+	bool found_first = false;
+
+	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
+		igt_info("Connector %s is not eDP, skipping DRRS check\n",
+			 output->name);
+		return false;
+	}
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+
+		if (!found_first) {
+			first_clock = mode->clock;
+			first_rr    = mode->vrefresh;
+			found_first = true;
+			continue;
+		}
+
+		if (mode->vrefresh != first_rr &&
+		    mode->clock == first_clock) {
+			igt_info("Multiple RR panel detected (not DRRS): "
+				 "same clock %d kHz, vrefresh %d vs %d Hz\n",
+				 first_clock, first_rr, mode->vrefresh);
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static drmModeModeInfo*
+get_selected_fixed_mode(igt_output_t *output, bool lowest)
+{
+	drmModeConnectorPtr connector = output->config.connector;
+	drmModeModeInfo *selected_mode = NULL;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *m = &connector->modes[i];
+
+		if (m->type & (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
+			if (!selected_mode) {
+				selected_mode = m;
+				continue;
+			}
+
+			if (lowest) {
+				if (m->vrefresh < selected_mode->vrefresh)
+					selected_mode = m;
+			} else {
+				if (m->vrefresh > selected_mode->vrefresh)
+					selected_mode = m;
+			}
+		}
+	}
+
+	if (selected_mode) {
+		igt_info("Found Target Fixed Mode: \"%s\" %dHz (vtotal: %d)\n",
+			 selected_mode->name, selected_mode->vrefresh, selected_mode->vtotal);
+		return selected_mode;
+	}
+
+	return NULL;
 }
 
 /* Read min and max vrr range from the connector debugfs. */
@@ -754,45 +837,65 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 			       igt_output_t *output, uint32_t flags)
 {
 	uint32_t result;
-	unsigned int vrefresh;
+	int vrefresh;
 	uint64_t rate[] = {0};
-	uint32_t step_size;
-	drmModeModeInfo virtual_mode;
+	int start, end, step;
+	drmModeModeInfo *virtual_mode = NULL;
+	bool need_low_rr = flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
 
-	igt_info("Use HIGH_RR Mode as default\n");
-	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+	if (!is_edp_multiple_rr_panel(output)) {
+		igt_info("This panel does not support this testing.\n");
+		return;
+	}
+
+	virtual_mode = get_selected_fixed_mode(output, need_low_rr);
+	if (!virtual_mode)
+		return;
+
+	igt_info("Use %s_RR Mode as default\n", need_low_rr ? "LOW" : "HIGH");
+	kmstest_dump_mode(virtual_mode);
 
 	prepare_test(data, output, crtc);
-	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
+	rate[0] = igt_kms_frame_time_from_vrefresh(virtual_mode->vrefresh);
 
 	/*
 	 * Sink with DRR and VRR can be in downclock mode so
-	 * switch to highest refresh rate mode.
+	 * switch to desired requested rate mode.
 	 */
-	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
-	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+	igt_output_override_mode(output, virtual_mode);
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
-	virtual_mode = *igt_output_get_mode(output);
+	virtual_mode = igt_output_get_mode(output);
+
+	if (flags & TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
+		start = data->range.max;
+		end = data->range.min;
+		step = -1;
+	} else {
+		start = data->range.min;
+		end = data->range.max;
+		step = 1;
+	}
 
-	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
-		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
+	for (vrefresh = start; step > 0 ? vrefresh <= end : vrefresh >= end; vrefresh += step) {
+		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
+			continue;
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-		kmstest_dump_mode(&virtual_mode);
+		kmstest_dump_mode(virtual_mode);
+
+		igt_output_override_mode(output, virtual_mode);
 
-		igt_output_override_mode(output, &virtual_mode);
+		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
 		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
@@ -1092,9 +1195,15 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
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

