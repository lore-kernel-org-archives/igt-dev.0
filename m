Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D77F8A15F
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 11:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A07110E88B;
	Thu, 16 Apr 2026 11:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIcscG2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCBC10E88B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776339635; x=1807875635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nWJ3XjJ768qXw42kUAqlwXhIQP0DJcKlTC4vA1He1zU=;
 b=XIcscG2eskPluzeLMB39fvWbkNv4klu4OtTbQadEjD444HXbDGzIbldN
 7ozTr5WM9CxtyTXWZmR0+n04xljAbdk2H2rMK6hlyfWm862O4yak7PtjL
 3PvhhwIxdm6wKxxKvF3RYFWTqDxRErqGIHaVZwMlGW6CSW5IbD9kOp22z
 ATu34Dd2DFHCCOejLurnk9POPUDa3mEBMiapDxgwBzdf8uRO+PX836rM9
 0C0lZEAtPAunZZ2/HIGtS9BTO3/VAvR24WP/1TQ1aso0kRfabmtF3VOaK
 Fvjp9z1CdpR9geurSII2W7qJhJnQlOPz+Yf5/dJL/OJJKy0emutYYPtgJ A==;
X-CSE-ConnectionGUID: ewRfXqFdQJuGJyKXqz1E+A==
X-CSE-MsgGUID: 7Lm+x7+VR9WBdUkP/o6bMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94903229"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="94903229"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 04:40:34 -0700
X-CSE-ConnectionGUID: DS06WIcLRrOvGDUUUzr1+Q==
X-CSE-MsgGUID: 2C+zwHUiRgS33R2BXJ/fDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235084089"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 16 Apr 2026 04:40:33 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Remove deep-pkgc subtest
Date: Thu, 16 Apr 2026 17:01:51 +0530
Message-ID: <20260416113151.14778-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
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

Remove the deep-pkgc subtest as it depends on other display IPs which makes
testing unreliable. Current validation uses Package C-state counters that
are affected by unrelated system components and requires platform-specific
checks that vary across different platforms.
A redesigned test with proper display IP isolation will be implemented
in a future patch.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 96 -----------------------------------------
 1 file changed, 96 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8138933d4..44394305d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -72,9 +72,6 @@
  * SUBTEST: dc9-dpms
  * Description: This test validates display engine entry to DC9 state
  *
- * SUBTEST: deep-pkgc
- * Description: This test validates display engine entry to PKGC10 state for extended vblank
- *
  * SUBTEST: dc5-retention-flops
  * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
  */
@@ -535,90 +532,6 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
-static void test_deep_pkgc_state(data_t *data)
-{
-	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL);
-	time_t duration = (4 * SEC);
-	time_t delay;
-	igt_crtc_t *crtc;
-	bool pkgc_flag = false;
-	bool flip = true, edp_found = false;
-
-	igt_display_t *display = &data->display;
-	igt_plane_t *primary;
-	igt_output_t *output = NULL;
-	drmModeModeInfo *mode;
-
-	for_each_crtc_with_valid_output(display, crtc, output) {
-		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
-
-			edp_found = true;
-			/* Check VRR capabilities before setting up */
-			if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
-			    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-				/*
-				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
-				 * when KMD allows for such capability.
-				 */
-				igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, false);
-				igt_assert(igt_display_try_commit_atomic(display,
-									 DRM_MODE_ATOMIC_ALLOW_MODESET,
-									 NULL) == 0);
-			}
-			break;
-		}
-	}
-
-	if (!edp_found) {
-		igt_skip("No eDP output found, skipping the test.\n");
-		return;
-	}
-
-	igt_display_reset(display);
-
-	igt_output_set_crtc(output, crtc);
-	for_each_connector_mode(output, mode) {
-		data->mode = mode;
-		delay = (MSEC / (data->mode->vrefresh));
-		/*
-		 * Should be 5ms vblank time required to program higher
-		 * watermark levels
-		 */
-		if (delay >= (5 * MSEC))
-			break;
-	}
-
-	data->output = output;
-	setup_videoplayback(data);
-
-	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, &data->fb_rgb);
-	igt_display_commit(&data->display);
-	/* Wait for the vblank to sync the frame time */
-	igt_wait_for_vblank_count(crtc, 1);
-	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
-	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
-	usleep(delay * 0.5);
-
-	while (time(NULL) - start < duration) {
-		flip = !flip;
-		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
-		igt_display_commit(&data->display);
-
-		igt_wait((cur_val = igt_read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
-			 (delay * 2), (5 * MSEC));
-
-		if (cur_val > pre_val) {
-			pkgc_flag = true;
-			break;
-		}
-	}
-
-	cleanup_dc3co_fbs(data);
-	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
-}
-
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -685,15 +598,6 @@ int igt_main()
 		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC6);
 	}
 
-	igt_describe("This test validates display engine entry to PKGC10 state "
-		     "during extended vblank");
-	igt_subtest("deep-pkgc") {
-		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
-			      "PC8+ residencies not supported\n");
-		igt_require(intel_display_ver(data.devid) >= 20);
-		test_deep_pkgc_state(&data);
-	}
-
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while all connectors's DPMS property set to OFF");
 	igt_subtest("dc5-dpms") {
-- 
2.43.0

