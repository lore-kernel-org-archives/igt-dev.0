Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F1ED3514A
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 07:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62A910E077;
	Wed,  1 Apr 2026 07:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OX1Ch7GD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A18F10E2DA
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 07:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775028582; x=1806564582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9nLOb9IHzkpcLx/3tsnVYNrfqjlNqw5WpBcVXJeHb14=;
 b=OX1Ch7GDwuGlAhaXxz4zrHzt5Lr5PmkN8bjD1VRAV4pc/jCdTFPSnZmZ
 WWhYelsDc7VfW4mt2UowBXxVzAO6UIY9/wTw1saM+ir0bl8msRN2s0qAR
 F5ewS71/V+Wi84it+gEmZ+GvAIvvJz6tyGXe5UN58mbvq+ovihTP0VX1i
 cDQ9A/kNYKjXSO7JX3v4k1oeK99crB6E+SwPLrE8bduNawK0m+BXVnRFu
 eKJI5dZaSoddSntFMF6BDFAx1uGJdwMQKPnKfFySddIWp1gtBMi12G5Bu
 oCyjSQgtU/f5xmaLI+rMFD5Hx4Ui2oVm1HnBxKZoiLm2MeHIC1xr1abAy Q==;
X-CSE-ConnectionGUID: mOigqW0fS8S1yF+dhrZHPg==
X-CSE-MsgGUID: 1YdCmOYvSKS7vn91ZCTh/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75230267"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75230267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:29:42 -0700
X-CSE-ConnectionGUID: v+7YCJIzRnmOkw5Rozoe2g==
X-CSE-MsgGUID: 2z+gA37fQSyBLukSzeIANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="225593275"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:29:40 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 2/2] tests/kms_hdmi_inject: Add
 inject-low-refresh-default-clock subtest
Date: Wed,  1 Apr 2026 12:56:15 +0530
Message-ID: <20260401072615.3456135-3-mohammed.bilal@intel.com>
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

Add a negative test for low refresh rate modes using default calculated
pixel clock. The clock is calculated using standard formula:
clock = htotal * vtotal * refresh / 1000

For low refresh rates (11Hz, 10Hz, 5Hz, 4Hz), this results in a pixel
clock below the hardware minimum (34.38 MHz), so all modes should be
rejected by the driver.

Note: This test creates modes directly rather than via EDID because
      the kernel validates modes during EDID parsing and filters out
      invalid modes with low clock.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/kms_hdmi_inject.c | 137 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index e5230aa2b..178f91592 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -55,6 +55,11 @@
  *              EDID with valid pixel clock at hardware minimum. Adjusts vtotal
  *              to achieve target refresh rates while keeping clock valid.
  *              All modes should succeed.
+ *
+ * SUBTEST: inject-low-refresh-default-clock
+ * Description: Negative test for low refresh rates (11Hz, 10Hz, 5Hz, 4Hz) using
+ *              default calculated pixel clock. The clock drops below hardware
+ *              minimum, so all modes should be rejected by the driver.
  */
 
 #define HDISPLAY_4K	3840
@@ -363,6 +368,132 @@ hdmi_inject_low_refresh_fixed_clock(int drm_fd, drmModeConnector *connector)
 		     "Some fixed clock low refresh rate tests failed.\n");
 }
 
+/**
+ * hdmi_inject_low_refresh_default_clock:
+ *
+ * Negative test: Tests low refresh rates using directly created modes with
+ * default calculated pixel clock. The clock is calculated as:
+ * htotal * vtotal * refresh / 1000
+ *
+ * Note: We cannot use EDID for this test because the kernel validates modes
+ * during EDID parsing and filters out invalid modes (low clock). Therefore,
+ * we must create the mode directly and attempt modeset.
+ *
+ * For low refresh rates, this results in a clock below the hardware minimum,
+ * so all modes should be rejected by the driver.
+ */
+static void
+hdmi_inject_low_refresh_default_clock(int drm_fd, drmModeConnector *connector)
+{
+	const struct edid *edid;
+	struct kmstest_connector_config config;
+	int ret, cid, i, crtc_mask = -1;
+	int fb_id;
+	struct igt_fb fb;
+	drmModeModeInfo test_mode;
+	int passed_count = 0;
+	int failed_count = 0;
+
+	igt_info("Negative Test: Low Refresh Rates with Default Clock\n");
+	igt_info("Creating modes directly (not via EDID) with low pixel clock.\n");
+	igt_info("Testing refresh rates: ");
+	for (i = 0; i < LOW_REFRESH_COUNT; i++)
+		igt_info("%dHz%s", low_refresh_rates[i],
+			 i < LOW_REFRESH_COUNT - 1 ? ", " : "\n");
+	igt_info("All modes should FAIL (clock drops below hardware minimum).\n\n");
+
+	/* Use base EDID to initialize connector */
+	edid = igt_kms_get_base_edid();
+	kmstest_force_edid(drm_fd, connector, edid);
+
+	igt_skip_on_f(!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON),
+		      "Could not force connector on\n");
+
+	cid = connector->connector_id;
+	connector = drmModeGetConnectorCurrent(drm_fd, cid);
+
+	igt_require_f(connector->count_modes > 0,
+		      "No modes available on connector\n");
+
+	/* Create a configuration */
+	ret = kmstest_get_connector_config(drm_fd, cid, crtc_mask, &config);
+	igt_assert(ret);
+
+	/* Test each low refresh rate */
+	for (i = 0; i < LOW_REFRESH_COUNT; i++) {
+		int target_refresh = low_refresh_rates[i];
+		bool modeset_success;
+		int clock;
+
+		/* Calculate clock using standard formula (will be below minimum) */
+		clock = (2200 * 1125 * target_refresh) / 1000;
+
+		igt_info("Testing %dHz (calculated clock=%d kHz):\n",
+			 target_refresh, clock);
+
+		/* Create mode directly with calculated (low) clock */
+		memset(&test_mode, 0, sizeof(test_mode));
+		test_mode.clock = clock;
+		test_mode.hdisplay = 1920;
+		test_mode.hsync_start = 2008;
+		test_mode.hsync_end = 2052;
+		test_mode.htotal = 2200;
+		test_mode.vdisplay = 1080;
+		test_mode.vsync_start = 1084;
+		test_mode.vsync_end = 1089;
+		test_mode.vtotal = 1125;
+		test_mode.vrefresh = target_refresh;
+		test_mode.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
+		snprintf(test_mode.name, sizeof(test_mode.name),
+			 "1920x1080@%dHz", target_refresh);
+
+		igt_info("Mode: %s clock=%d htotal=%d vtotal=%d\n",
+			 test_mode.name, test_mode.clock,
+			 test_mode.htotal, test_mode.vtotal);
+		igt_info("Clock %d kHz is below minimum %d kHz - should be rejected\n",
+			 test_mode.clock, MIN_WORKING_PIXEL_CLOCK_KHZ);
+
+		/* Create framebuffer for the mode */
+		fb_id = igt_create_fb(drm_fd, test_mode.hdisplay,
+				      test_mode.vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_assert(fb_id > 0);
+
+		/* Attempt the modeset with our directly created mode */
+		ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
+				     &connector->connector_id, 1, &test_mode);
+
+		modeset_success = (ret == 0);
+
+		if (!modeset_success) {
+			igt_info("PASS: %dHz modeset correctly rejected (ret=%d)\n\n",
+				 target_refresh, ret);
+			passed_count++;
+		} else {
+			igt_info("FAIL: %dHz modeset succeeded but should have been rejected\n\n",
+				 target_refresh);
+			failed_count++;
+		}
+
+		igt_remove_fb(drm_fd, &fb);
+	}
+
+	/* Report summary */
+	igt_info("Default Clock (Negative) Test Summary:\n");
+	igt_info("Passed: %d/%d (correctly rejected)\n", passed_count, (int)LOW_REFRESH_COUNT);
+	igt_info("Failed: %d/%d (unexpectedly succeeded)\n", failed_count, (int)LOW_REFRESH_COUNT);
+
+	/* All tests should pass (i.e., all modesets should be rejected) */
+	igt_assert_f(failed_count == 0,
+		     "Some modes succeeded when they should have been rejected. "
+		     "The pixel clock was below hardware minimum.\n");
+
+	/* Cleanup */
+	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
+	kmstest_force_edid(drm_fd, connector, NULL);
+}
+
 int igt_main()
 {
 	int drm_fd;
@@ -397,6 +528,12 @@ int igt_main()
 	igt_subtest("inject-low-refresh-fixed-clock")
 		hdmi_inject_low_refresh_fixed_clock(drm_fd, connector);
 
+	igt_describe("Negative test: Low refresh rates (11Hz, 10Hz, 5Hz, 4Hz) "
+		     "using default calculated pixel clock. All modes should fail "
+		     "because clock drops below hardware minimum.");
+	igt_subtest("inject-low-refresh-default-clock")
+		hdmi_inject_low_refresh_default_clock(drm_fd, connector);
+
 	igt_fixture() {
 		drmModeFreeConnector(connector);
 		drmModeFreeResources(res);
-- 
2.48.1

