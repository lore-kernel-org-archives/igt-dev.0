Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA962CD343F
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 14:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D4510F15A;
	Thu,  7 May 2026 14:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2k/PZLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A767310F15A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778162550; x=1809698550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AhreGQUwcEvh5JHhhOSn7bg+gd6PIOCG2IfTiZ6HnT0=;
 b=W2k/PZLscxpJuHMF7U/xL5gd+41wTrhRduZPEaDgcx+U4Micntwpw+hw
 jZomY6oE8UvVdfy62NmNglifzSbosmLsr7EWY9f3+zGZKF3z5p1E7bOkN
 +FhgtTAp+n1x36l+dqgS+xHLmhEOpL1gDKH9bgPHSfDjL7WLqpfrH5xys
 X6tv29I0q0i3yM6VwB9IG8IFqWIOVEnSZsCBsjgNZdVVL3gIwVX1c0SEf
 i3yL8eOOeWstQh+dsraGjbap7H2IsJupahZXnYtqL0EXjC6nC5k/NE4QY
 lauG3KvwDlzq8lxaQP4nGQP+lCdtthlX2g4/8LUO2e+sHMQ2g4auFaSGN g==;
X-CSE-ConnectionGUID: Bj8KY6A5Qke35x0DKbDT5A==
X-CSE-MsgGUID: xQFE228kRyqiTjqKuWmw7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82982348"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="82982348"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 07:02:30 -0700
X-CSE-ConnectionGUID: QKZlo/TvQyWHhrzHk1vL3w==
X-CSE-MsgGUID: 4jyR1ttySDO9V+14DXgd5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236579576"
Received: from shawnle1-i9-build-machine.itwn.intel.com ([10.225.64.200])
 by orviesa009.jf.intel.com with ESMTP; 07 May 2026 07:02:28 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [v4] tests/kms_vrr: add support for full range refresh rate testing
Date: Thu,  7 May 2026 13:53:40 +0000
Message-Id: <20260507135340.685188-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427120955.3537070-1-shawn.c.lee@intel.com>
References: <20260427120955.3537070-1-shawn.c.lee@intel.com>
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

Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 tests/kms_vrr.c | 118 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 100 insertions(+), 18 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1d74..7cb37e14ab02 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -65,6 +65,11 @@
  * SUBTEST: seamless-rr-switch-virtual
  * Description: Test to create a Virtual Mode in VRR range and switch to it
  * 		without a full modeset.
+ * SUBTEST: seamless-rr-switch-virtual-full-top-down
+ * Description: Vrr seamless refresh rate switch for virtual modes using full range
+ *
+ * SUBTEST: seamless-rr-switch-virtual-full-bottom-up
+ * Description: Vrr seamless refresh rate switch for virtual modes using full range
  *
  * SUBTEST: lobf
  * Description: Test to validate link-off between active frames in non-psr
@@ -94,11 +99,13 @@ enum {
 	TEST_SEAMLESS_VRR = 1 << 4,
 	TEST_SEAMLESS_DRRS = 1 << 5,
 	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
-	TEST_FASTSET = 1 << 7,
-	TEST_MAXMIN = 1 << 8,
-	TEST_LINK_OFF = 1 << 10,
-	TEST_NEGATIVE = 1 << 11,
-	TEST_FORCE_RR = 1 << 12,
+	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 << 7,
+	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 << 8,
+	TEST_FASTSET = 1 << 9,
+	TEST_MAXMIN = 1 << 10,
+	TEST_LINK_OFF = 1 << 11,
+	TEST_NEGATIVE = 1 << 12,
+	TEST_FORCE_RR = 1 << 13,
 };
 
 enum {
@@ -235,13 +242,58 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
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
+		igt_info("VTotal (%d) already exceed 8192 at %fHz\n", virtual_vtotal, virtual_refresh_rate);
+		return false;
+	}
 
-	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
+	mode->vsync_start = virtual_vtotal - (mode->vtotal - mode->vsync_start);
+	mode->vsync_end   = virtual_vtotal - (mode->vtotal - mode->vsync_end);
+	mode->vtotal = virtual_vtotal;
 	mode->vrefresh = virtual_refresh_rate;
+
+	return true;
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
@@ -757,19 +809,25 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	unsigned int vrefresh;
 	uint64_t rate[] = {0};
 	uint32_t step_size;
-	drmModeModeInfo virtual_mode;
+	drmModeModeInfo *virtual_mode = NULL;
+	int start, end, step;
+	bool need_low_rr = flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
 
-	igt_info("Use HIGH_RR Mode as default\n");
-	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
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
 	 * switch to highest refresh rate mode.
 	 */
-	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+	igt_output_override_mode(output, virtual_mode);
 	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
 
 	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
@@ -784,7 +842,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	step_size = (data->range.max - data->range.min) / 5;
 
 	/* Switch to Virtual RR */
-	virtual_mode = *igt_output_get_mode(output);
+	virtual_mode = igt_output_get_mode(output);
 
 	/*
 	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
@@ -795,13 +853,29 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 		   (((data->range.max + data->range.min) / 2) + step_size) :
 		   data->range.min + step_size;
 
-	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
-		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
+	if (flags & TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
+		start = data->range.max;
+		end = data->range.min;
+		step = -1;
+	} else if (flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP) {
+		start = data->range.min;
+		end = data->range.max;
+		step = 1;
+	} else {
+		start = data->range.min;
+		end = data->range.max;
+		step = step_size;
+	}
+
+	for (vrefresh = start; (step > 0) ? (vrefresh <= end) : (vrefresh >= end); vrefresh += step) {
+		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
+			continue;
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
-		kmstest_dump_mode(&virtual_mode);
+		kmstest_dump_mode(virtual_mode);
 
-		igt_output_override_mode(output, &virtual_mode);
+		igt_output_override_mode(output, virtual_mode);
+		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
 		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
@@ -1105,6 +1179,14 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
+		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
+		igt_subtest_with_dynamic("seamless-rr-switch-virtual-top-down")
+			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
+
+		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
+		igt_subtest_with_dynamic("seamless-rr-switch-virtual-bottom-up")
+			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
+
 		igt_describe("Test to validate the link-off between active frames in "
 			     "non-PSR operation.");
 		igt_subtest_with_dynamic("lobf") {
-- 
2.34.1

