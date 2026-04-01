Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1D9D35144
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 07:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C668E10EC61;
	Wed,  1 Apr 2026 07:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIlxGlLD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B34310E2DA
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775028580; x=1806564580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JDxVXTae6DmHlA2at6WiZr8bxGQrNeUr0EmOtyXQekg=;
 b=fIlxGlLDsv9MobCfVrS3aUCDSKn/Y81W8bBjd8WM6vJ5XLLmz4KvZdW3
 EYzyJ60KR0Yw0k/I0jwV7LCnZ6si6KBW19awj85NPqe+G8o0wQ0d4WbLJ
 bdobWEuI20mTLvflpUBJtHY2ghrJmreIfzUv9n7SFZXNphUEm+7VEr2WL
 AwH22u5j6I2vgQZX5bR8eFvfFNa5RWEubuZGPFP8f9uR9JuMr8/D7s14I
 +Fm7wIcQxnmVSc9uJm+A2oK0wWPnzmoICmj3KxNQCctDJP/2e714igDCs
 rrPBRDWbhxpdIffNW3vmPIAOd87aLuApICGYsg0RBBZ4DbDcv9J4ZiAk7 A==;
X-CSE-ConnectionGUID: ICoAzUKuQbu6gIZfsJY3eA==
X-CSE-MsgGUID: WlG/Hpe5TgK0LqgEu2jVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75230259"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75230259"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:29:40 -0700
X-CSE-ConnectionGUID: eRFUrtQqR+Gh/L6i3Tp10Q==
X-CSE-MsgGUID: DFHBQiJaSIKJ2IK2BeFiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="225593270"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:29:39 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 1/2] tests/kms_hdmi_inject: Add
 inject-low-refresh-fixed-clock subtest
Date: Wed,  1 Apr 2026 12:56:14 +0530
Message-ID: <20260401072615.3456135-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260401072615.3456135-1-mohammed.bilal@intel.com>
References: <20260401072615.3456135-1-mohammed.bilal@intel.com>
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

Add a positive test for low refresh rate modes using EDID with valid
pixel clock at hardware minimum (34.38 MHz). The test adjusts vtotal
to achieve target refresh rates (11Hz, 10Hz, 5Hz, 4Hz) while keeping
the clock valid. All modes should succeed.

This validates that low refresh rates are achievable when the pixel
clock is maintained at or above the hardware minimum threshold.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/kms_hdmi_inject.c | 158 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 00eb5e4a4..e5230aa2b 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -49,11 +49,24 @@
  * SUBTEST: inject-audio
  * Description: Make sure that audio information exposed by ALSA match the forced
  *              EDID.
+ *
+ * SUBTEST: inject-low-refresh-fixed-clock
+ * Description: Positive test for low refresh rates (11Hz, 10Hz, 5Hz, 4Hz) using
+ *              EDID with valid pixel clock at hardware minimum. Adjusts vtotal
+ *              to achieve target refresh rates while keeping clock valid.
+ *              All modes should succeed.
  */
 
 #define HDISPLAY_4K	3840
 #define VDISPLAY_4K	2160
 
+/* Minimum pixel clock that works on the hardware (34.38 MHz) */
+#define MIN_WORKING_PIXEL_CLOCK_KHZ	34380
+
+/* Refresh rates to test */
+static const int low_refresh_rates[] = { 11, 10, 5, 4 };
+#define LOW_REFRESH_COUNT (sizeof(low_refresh_rates) / sizeof(low_refresh_rates[0]))
+
 IGT_TEST_DESCRIPTION("Test that in-kernel EDID parsing is producing "
 		     "expected results by forcing a HDMI connector "
 		     "with a known EDID and checking that the metadata "
@@ -211,6 +224,145 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 	kmstest_force_edid(drm_fd, connector, NULL);
 }
 
+/**
+ * get_low_refresh_edid_fixed_clock:
+ * @refresh: Target refresh rate in Hz
+ *
+ * Creates an EDID with a 1920x1080 mode at the specified low refresh rate,
+ * using the minimum working pixel clock. The vtotal is adjusted to achieve
+ * the target refresh rate.
+ *
+ * Returns: EDID with valid low refresh rate mode
+ */
+static const struct edid *get_low_refresh_edid_fixed_clock(int refresh)
+{
+	static struct edid edid;
+	drmModeModeInfo mode = {};
+	int vtotal;
+
+	/*
+	 * Use minimum working clock and calculate vtotal:
+	 * vtotal = clock * 1000 / (htotal * refresh)
+	 */
+	vtotal = (MIN_WORKING_PIXEL_CLOCK_KHZ * 1000) / (2200 * refresh);
+
+	/* 1920x1080 mode with fixed clock and calculated vtotal */
+	mode.clock = MIN_WORKING_PIXEL_CLOCK_KHZ;
+	mode.hdisplay = 1920;
+	mode.hsync_start = 2008;
+	mode.hsync_end = 2052;
+	mode.htotal = 2200;
+	mode.vdisplay = 1080;
+	mode.vsync_start = 1084;
+	mode.vsync_end = 1089;
+	mode.vtotal = vtotal;
+	mode.vrefresh = refresh;
+	mode.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
+
+	edid_init_with_mode(&edid, &mode);
+	edid_update_checksum(&edid);
+
+	return &edid;
+}
+
+/**
+ * hdmi_inject_low_refresh_fixed_clock:
+ *
+ * Positive test: Tests low refresh rates using EDID with valid pixel clock.
+ * Uses minimum working clock (34.38 MHz) with adjusted vtotal to achieve
+ * low refresh rates. All modes should succeed.
+ */
+static void
+hdmi_inject_low_refresh_fixed_clock(int drm_fd, drmModeConnector *connector)
+{
+	const struct edid *edid;
+	struct kmstest_connector_config config;
+	int ret, cid, i, crtc_mask = -1;
+	int fb_id;
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	int passed_count = 0;
+	int failed_count = 0;
+
+	igt_info("Positive Test: Low Refresh Rates with Valid Clock (EDID-based)\n");
+	igt_info("Minimum working pixel clock: %d kHz (%.2f MHz)\n",
+		 MIN_WORKING_PIXEL_CLOCK_KHZ,
+		 MIN_WORKING_PIXEL_CLOCK_KHZ / 1000.0);
+	igt_info("Testing refresh rates: ");
+	for (i = 0; i < LOW_REFRESH_COUNT; i++)
+		igt_info("%dHz%s", low_refresh_rates[i],
+			 i < LOW_REFRESH_COUNT - 1 ? ", " : "\n");
+	igt_info("All modes should PASS (clocks are at/above minimum).\n\n");
+
+	/* Test each low refresh rate */
+	for (i = 0; i < LOW_REFRESH_COUNT; i++) {
+		int target_refresh = low_refresh_rates[i];
+		bool modeset_success;
+
+		igt_info("Testing %dHz:\n", target_refresh);
+
+		/* Get EDID with this low refresh rate mode (valid clock) */
+		edid = get_low_refresh_edid_fixed_clock(target_refresh);
+		kmstest_force_edid(drm_fd, connector, edid);
+
+		igt_skip_on_f(!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON),
+			      "Could not force connector on\n");
+
+		cid = connector->connector_id;
+		connector = drmModeGetConnectorCurrent(drm_fd, cid);
+
+		igt_require_f(connector->count_modes > 0,
+			      "No modes available on connector\n");
+
+		/* Use the mode from EDID (our custom low refresh mode) */
+		mode = &connector->modes[0];
+		igt_info("EDID Mode: %dx%d@%dHz clock=%d htotal=%d vtotal=%d\n",
+			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
+			 mode->clock, mode->htotal, mode->vtotal);
+
+		/* Create a configuration */
+		ret = kmstest_get_connector_config(drm_fd, cid, crtc_mask, &config);
+		igt_assert(ret);
+
+		/* Create framebuffer for the mode */
+		fb_id = igt_create_fb(drm_fd, mode->hdisplay,
+				      mode->vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_assert(fb_id > 0);
+
+		/* Attempt the modeset using EDID mode */
+		ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
+				     &connector->connector_id, 1, mode);
+
+		modeset_success = (ret == 0);
+
+		if (modeset_success) {
+			igt_info("PASS: %dHz modeset succeeded\n\n", target_refresh);
+			passed_count++;
+		} else {
+			igt_info("FAIL: %dHz modeset failed (ret=%d)\n\n",
+				 target_refresh, ret);
+			failed_count++;
+		}
+
+		igt_remove_fb(drm_fd, &fb);
+
+		/* Cleanup for this iteration */
+		kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
+		kmstest_force_edid(drm_fd, connector, NULL);
+	}
+
+	/* Report summary */
+	igt_info("Fixed Clock Test Summary:\n");
+	igt_info("Passed: %d/%d\n", passed_count, (int)LOW_REFRESH_COUNT);
+	igt_info("Failed: %d/%d\n", failed_count, (int)LOW_REFRESH_COUNT);
+
+	/* All tests should pass */
+	igt_assert_f(failed_count == 0,
+		     "Some fixed clock low refresh rate tests failed.\n");
+}
+
 int igt_main()
 {
 	int drm_fd;
@@ -239,6 +391,12 @@ int igt_main()
 	igt_subtest("inject-audio")
 		hdmi_inject_audio(drm_fd, connector);
 
+	igt_describe("Positive test: Low refresh rates (11Hz, 10Hz, 5Hz, 4Hz) "
+		     "using EDID with valid pixel clock at hardware minimum. "
+		     "All modes should succeed.");
+	igt_subtest("inject-low-refresh-fixed-clock")
+		hdmi_inject_low_refresh_fixed_clock(drm_fd, connector);
+
 	igt_fixture() {
 		drmModeFreeConnector(connector);
 		drmModeFreeResources(res);
-- 
2.48.1

