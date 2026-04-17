Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC27DF8DFDF
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5947810E992;
	Fri, 17 Apr 2026 08:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pl/c8voF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635810E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415435; x=1807951435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8H9VTLo2EfjbSD85BxT3T45qzdIa36Klk1c8TW25L2o=;
 b=Pl/c8voFpue2CFOUsTpIihUni4GUn34MlOXyVUobsJlzkuXWw4t3WPOo
 Kmdq4dnPiOfZemcdPYax9wtuNb3L/+ZhitUfAHkgVmmg3FFNDJSpNuIRj
 +CsAM/8cf4C6rhcMbgWa+lT89b7r6inC9XSCq6I3waD6IGhVQgPF3ed9e
 382hnFeXkFd5+iRcKAqDWQA1/aK5fF7wpqWAetBjDeUeJp8x7qdnG8WFe
 W0qaDxAxhF7HOW9Io5JWeQCPatCMfi1kZlz9/xE4poW5KFFDW9b2zrKSU
 2HS5WRkfgndteIh2HXueo8MkXp3Mk+PGd13AZJUUyCuSgNAO8OkpTrbqG Q==;
X-CSE-ConnectionGUID: UyyQbyN7QySkNAeNEy54IA==
X-CSE-MsgGUID: dCiyBUk5QOOuM0pW2Zws/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81308446"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81308446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:43:55 -0700
X-CSE-ConnectionGUID: xER96kgsQxCqGIC4U2qzDw==
X-CSE-MsgGUID: pc1JVrN7RpK+nCvYkOtpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235361747"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 01:43:54 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 6/7] Revert "tests/intel/kms_pm_dc: Add a new test to
 validate the deep sleep state during extended vblank"
Date: Fri, 17 Apr 2026 14:05:05 +0530
Message-ID: <20260417083506.33404-7-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 101 ++++++++++++++++------------------------
 1 file changed, 39 insertions(+), 62 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index d32e1cf1f..e268b0696 100644
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
 
@@ -534,62 +530,52 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
-static void test_deep_pkgc_state(data_t *data)
+static unsigned int read_pkgc_counter(int debugfs_root_fd)
 {
-	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, delay;
-	enum pipe pipe;
-	bool pkgc_flag = false;
-	bool vrr_supported = false, flip = true;
-
-	igt_display_t *display = &data->display;
-	igt_plane_t *primary;
-	igt_output_t *output = NULL;
-	drmModeModeInfo *mode;
-
-	for_each_pipe_with_valid_output(display, pipe, output) {
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
+	char buf[4096];
+	char *str;
+	int len;
 
-	igt_display_reset(display);
+	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
+	igt_skip_on_f(len < 0, "PKGC state file not found\n");
+	buf[len] = '\0';
+	str = strstr(buf, "Package C10");
+	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
 
-	igt_output_set_pipe(output, pipe);
-
-	data->output = output;
-	data->mode = igt_output_get_mode(output);
-	setup_videoplayback(data);
-
-	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-	pre_val = read_pkgc_counter(data->debugfs_root_fd);
-	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
+	return get_dc_counter(str);
+}
 
-	igt_plane_set_fb(primary, &data->fb_rgb);
-	igt_display_commit(&data->display);
+static void test_pkgc_state_dpms(data_t *data)
+{
+	unsigned int timeout_sec = 6;
+	unsigned int prev_value = 0, cur_value = 0;
 
-	while (time(NULL) - start < duration) {
-		flip = !flip;
-		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
-		igt_display_commit(&data->display);
+	prev_value = read_pkgc_counter(data->debugfs_root_fd);
+	setup_dc_dpms(data);
+	dpms_off(data);
+	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
+		  timeout_sec * 1000, 100);
+	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
+	dpms_on(data);
+	cleanup_dc_dpms(data);
+}
 
-		cur_val = read_pkgc_counter(data->debugfs_root_fd);
-		if (cur_val > pre_val) {
-			pkgc_flag = true;
-			break;
-		}
-		usleep(delay);
-	}
+static void test_pkgc_state_psr(data_t *data)
+{
+	unsigned int timeout_sec = 6;
+	unsigned int prev_value = 0, cur_value = 0;
 
-	cleanup_dc3co_fbs(data);
-	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
+	prev_value = read_pkgc_counter(data->debugfs_root_fd);
+	setup_output(data);
+	setup_primary(data);
+	igt_require(!psr_disabled_check(data->debugfs_fd));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
+	psr_dpms(data, DRM_MODE_DPMS_OFF);
+	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
+		  timeout_sec * 1000, 100);
+	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
+	psr_dpms(data, DRM_MODE_DPMS_ON);
+	cleanup_dc_psr(data);
 }
 
 static void kms_poll_state_restore(int sig)
@@ -658,15 +644,6 @@ int igt_main()
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

