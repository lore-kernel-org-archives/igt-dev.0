Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5252F5581D
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D89E10E50E;
	Mon, 20 Apr 2026 11:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzOCYs1D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B5510E50E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776685032; x=1808221032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8ErVsUJy/4rFi09jmLOH+XCruifQtZpb9Xu+lSoTE8=;
 b=YzOCYs1DUd0l+zC3pd+KVR85OPlASaIRfCTLIYk4Bsegk+IPFKTMFiNA
 OtZnVk+u2dmRcuvAgpNtLR305rY8vAQSd12YQm1P7fK8K0Fy11BqBC88F
 gwPwmV9nsyYkg9eTvMq6cKLJHLZg5uqGeYMmu7FNSoVB131KH+V/aMxw7
 wf9lVqQfUo8hTbHuAZl7MxXfuAFFTUl+HnJ9gw9EkYBusMblr2WimYzp+
 T111rPFBVlt6jFDK7X5y1BssCHhorea0LUZVCVnxdY4TpR8MgBkBiHVoP
 2EehluH4P8tIyUJsTHA9I12BnbX8e3P5Z+sAPTh6CAnGUi6KTNsrom+O+ Q==;
X-CSE-ConnectionGUID: 2SySziriSl6zB1m7+82m8A==
X-CSE-MsgGUID: X+MJcV7YTKmadF6Yu8BAvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89064544"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89064544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:37:12 -0700
X-CSE-ConnectionGUID: pkuPza21SpSUs+aBQ/m+FQ==
X-CSE-MsgGUID: ml1c3Cj8RP+qkCdk8wQu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228551052"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 04:37:09 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, jani.nikula@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 6/6] Revert "tests/intel/kms_pm_dc: Add a new test to
 validate the deep sleep state during extended vblank"
Date: Mon, 20 Apr 2026 16:58:26 +0530
Message-ID: <20260420112826.35220-7-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420112826.35220-1-mohammed.thasleem@intel.com>
References: <20260420112826.35220-1-mohammed.thasleem@intel.com>
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

This reverts commit 4d9b4ee12b5f0852c02818ca9a886355b43fbbff.

v3: Fix compilation issue. (Jani)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 72 -----------------------------------------
 1 file changed, 72 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 5fce41874..bf2d22ddc 100644
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
@@ -84,7 +81,6 @@
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))
-#define MSECS (1000000ul)
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -534,65 +530,6 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
-static void test_deep_pkgc_state(data_t *data)
-{
-	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, delay;
-	bool pkgc_flag = false;
-	igt_crtc_t *crtc;
-	bool vrr_supported = false, flip = true;
-
-	igt_display_t *display = &data->display;
-	igt_plane_t *primary;
-	igt_output_t *output = NULL;
-
-	for_each_crtc_with_valid_output(display, crtc, output) {
-		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-			igt_skip("No eDP output found, skipping the test.\n");
-		/* Check VRR capabilities before setting up */
-		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
-		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			vrr_supported = true;
-			break;
-		}
-	}
-
-	/* Skip the test if no VRR capable output is found */
-	igt_skip_on_f(!vrr_supported,
-		      "No VRR capable output found, skipping the test.\n");
-
-	igt_display_reset(display);
-
-	igt_output_set_crtc(output, crtc);
-
-	data->output = output;
-	data->mode = igt_output_get_mode(output);
-	setup_videoplayback(data);
-
-	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = igt_read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
-
-	igt_plane_set_fb(primary, &data->fb_rgb);
-	igt_display_commit(&data->display);
-
-	while (time(NULL) - start < duration) {
-		flip = !flip;
-		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
-		igt_display_commit(&data->display);
-
-		cur_val = igt_read_pkgc_counter(data->debugfs_root_fd);
-		if (cur_val > pre_val) {
-			pkgc_flag = true;
-			break;
-		}
-		usleep(delay);
-	}
-
-	cleanup_dc3co_fbs(data);
-	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
-}
-
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -659,15 +596,6 @@ int igt_main()
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

