Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50196C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 17:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E6C10E54D;
	Mon, 17 Feb 2025 17:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wp7MyW+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B2310E54D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739812111; x=1771348111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Og/ZlFtUnVzOGVGgUK5wIU1EraORCF0KS9lo2Np1EY=;
 b=Wp7MyW+ylERQ+JluSY1NC7IhLeeTvurl5Vs10CTwJV2QKDcgTJrZ14ry
 vmWTl+DPeYbuvyIvHMSRnCe2tM1aqyzp+WIEEEGO+Kv+lPehJvtgvb12C
 zMnMmOfyvmAQ22bjd0D86KUpaUe6EP0W9ZcSWP7FYJs/wbHRw2NyA6BG5
 LUHBpMlLelPSbNQCz/uCjrRKKv46CXO7ki0ZfIqKRsWU3/vvJER1VnNr9
 i3JVd1dQEGuVeLvc/rwcbemeJwpUAEtErieca2f/li2mvEsumMicRpkGK
 lWoGdmoKJuVzdVrlDnlnkx4v1a9J4QvEZAjDM6sa2KwQ7lnErbY0E5Tic g==;
X-CSE-ConnectionGUID: TQ4FWolERtiPcytGROv3cw==
X-CSE-MsgGUID: ohsPsDd/R0+0gkqio8WZZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39694085"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39694085"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 09:08:26 -0800
X-CSE-ConnectionGUID: TbFlpz0QQvS+VBFdiFoYEA==
X-CSE-MsgGUID: k15Xb9BWQHyygXoM2WaYJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114103924"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa006.jf.intel.com with ESMTP; 17 Feb 2025 09:08:24 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Remove PKC10 dependecy to
 validate DC6
Date: Mon, 17 Feb 2025 22:38:09 +0530
Message-ID: <20250217170809.175276-1-mohammed.thasleem@intel.com>
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

DC6 counter was removed MTL onwards, so pkc10 counter is used
to validated DC6 tests but with the new approach of kmd changes
created DC6 debugfs entry counter to validated DC6 tests and
removeing the existing pkc10 code.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 77 +++++++++--------------------------------
 1 file changed, 17 insertions(+), 60 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 9551cc6b9..1e87a4b7a 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -271,6 +271,7 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
 {
 	char buf[4096];
 	char *str;
+	data_t data = {};
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
 
@@ -278,8 +279,13 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
 		str = strstr(buf, "DC3 -> DC5 count");
 		igt_assert_f(str, "DC5 counter is not available\n");
 	} else if (dc_flag & CHECK_DC6) {
-		str = strstr(buf, "DC5 -> DC6 count");
-		igt_assert_f(str, "DC6 counter is not available\n");
+		if (intel_display_ver(data.devid) >= 14) {
+			str = strstr(buf, "DC6 Residency Counter");
+			igt_assert_f(str, "DC6 Residency Counter is not available\n");
+		} else {
+			str = strstr(buf, "DC5 -> DC6 count");
+			igt_assert_f(str, "DC6 counter is not available\n");
+		}
 	} else if (dc_flag & CHECK_DC3CO) {
 		str = strstr(buf, "DC3CO count");
 		igt_assert_f(str, "DC3CO counter is not available\n");
@@ -371,6 +377,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 static void require_dc_counter(int debugfs_fd, int dc_flag)
 {
 	char buf[4096];
+	data_t data = {};
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
 				buf, sizeof(buf));
@@ -385,8 +392,12 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
 			      "DC5 counter is not available\n");
 		break;
 	case CHECK_DC6:
-		igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
-			      "DC6 counter is not available\n");
+		if (intel_display_ver(data.devid) >= 14)
+			igt_skip_on_f(!strstr(buf, "DC6 Residency Counter"),
+				      "DC6 Residency Counter is not available\n");
+		else
+			igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
+				      "DC6 counter is not available\n");
 		break;
 	default:
 		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
@@ -411,20 +422,6 @@ static void test_dc3co_vpb_simulation(data_t *data)
 	cleanup_dc3co_fbs(data);
 }
 
-static void psr_dpms(data_t *data, int mode)
-{
-	igt_output_t *output;
-
-	for_each_connected_output(&data->display, output) {
-		drmModeConnectorPtr connector = output->config.connector;
-
-		if (connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-			continue;
-
-		kmstest_set_connector_dpms(data->drm_fd, connector, mode);
-	}
-}
-
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -707,40 +704,6 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
 }
 
-static void test_pkgc_state_dpms(data_t *data)
-{
-	unsigned int timeout_sec = 6;
-	unsigned int prev_value = 0, cur_value = 0;
-
-	prev_value = read_pkgc_counter(data->debugfs_root_fd);
-	setup_dc_dpms(data);
-	dpms_off(data);
-	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
-		  timeout_sec * 1000, 100);
-	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
-	dpms_on(data);
-	cleanup_dc_dpms(data);
-}
-
-static void test_pkgc_state_psr(data_t *data)
-{
-	unsigned int timeout_sec = 6;
-	unsigned int prev_value = 0, cur_value = 0;
-
-	prev_value = read_pkgc_counter(data->debugfs_root_fd);
-	setup_output(data);
-	setup_primary(data);
-	igt_require(!psr_disabled_check(data->debugfs_fd));
-	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
-	psr_dpms(data, DRM_MODE_DPMS_OFF);
-	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
-		  timeout_sec * 1000, 100);
-	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
-	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
-	psr_dpms(data, DRM_MODE_DPMS_ON);
-	cleanup_dc_psr(data);
-}
-
 static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
@@ -804,10 +767,7 @@ igt_main
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		if (intel_display_ver(data.devid) >= 14)
-			test_pkgc_state_psr(&data);
-		else
-			test_dc_state_psr(&data, CHECK_DC6);
+		test_dc_state_psr(&data, CHECK_DC6);
 	}
 
 	igt_describe("This test validates display engine entry to PKGC10 state "
@@ -852,10 +812,7 @@ igt_main
 	igt_subtest("dc6-dpms") {
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
-		if (intel_display_ver(data.devid) >= 14)
-			test_pkgc_state_dpms(&data);
-		else
-			test_dc_state_dpms(&data, CHECK_DC6);
+		test_dc_state_dpms(&data, CHECK_DC6);
 
 	}
 
-- 
2.43.0

