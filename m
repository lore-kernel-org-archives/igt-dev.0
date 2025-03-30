Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3767C28B20
	for <igt-dev@archiver.kernel.org>; Sun, 30 Mar 2025 10:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAD610E105;
	Sun, 30 Mar 2025 10:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScZ++J0X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E8F10E105
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Mar 2025 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743331584; x=1774867584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jkk/kuoWQ7JhAqjv2KTa4Gqm/4PfdtOtzmjaWGMS1zE=;
 b=ScZ++J0X3xZI+LKRUU5Ki7tHrrYNGfKRKS1NWQy7GJ8ryOo7uWY70e+j
 o1YqKXVPXq3imfjuk7HZqsDxUOcMKNlsBH8FulCvqQhrZI+SmaJaR+TwA
 LUlHH/sysfi3BgEcU9VK1jWS27RgZjuUuVvXkRkqIG4FiIicmvSK8JekV
 Y8SZZJ8fvaDBGf0ZV23vlhQArkW+WZ4hkgaGwoHv6UYck+3mI8UXyzDyn
 jmf5HYSrF1LF5Mun+ibPONmTFX1EAG7+yLP/vMfTpkc2gMvP8s7FNgVFi
 fZWklnLB0mzaH8lAMy7p6QS6YX2ORLC6a8pnmy0coJ3myVeiiiHi5BpTE w==;
X-CSE-ConnectionGUID: jl7NnX0QRz6vFWXdyit8eQ==
X-CSE-MsgGUID: m7KABZzWRLiZZNtx5wD+vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="48300763"
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; d="scan'208";a="48300763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2025 03:46:22 -0700
X-CSE-ConnectionGUID: UVqolFECTsGc2e5iIuwozw==
X-CSE-MsgGUID: kkh9lIGwSyyVXeP80pkDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; d="scan'208";a="156774451"
Received: from linux-tiger-lake-client-platform.iind.intel.com ([10.227.88.36])
 by orviesa002.jf.intel.com with ESMTP; 30 Mar 2025 03:46:21 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_pm_dc: Remove PKGC10 dependency to
 validate DC6
Date: Sun, 30 Mar 2025 16:15:44 +0530
Message-Id: <20250330104544.41774-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217170809.175276-1-mohammed.thasleem@intel.com>
References: <20250217170809.175276-1-mohammed.thasleem@intel.com>
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
removeing the existing PKGC10 code.

v2: Update debugfs message.
v3: Remove display version check. (Imre)
    Update commit subject and description.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 76 +++++++++--------------------------------
 1 file changed, 17 insertions(+), 59 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 2491cd1f8..56488083d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -285,7 +285,13 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
 		igt_assert_f(str, "DC5 counter is not available\n");
 	} else if (dc_flag & CHECK_DC6) {
 		str = strstr(buf, "DC5 -> DC6 count");
-		igt_assert_f(str, "DC6 counter is not available\n");
+		if (!str) {
+			str = strstr(buf, "DC5 -> DC6 allowed count");
+			igt_assert_f(str, "DC5 -> DC6 allowed count "
+					  "is not available\n");
+		} else {
+			igt_assert_f(str, "DC6 counter is not available\n");
+		}
 	} else if (dc_flag & CHECK_DC3CO) {
 		str = strstr(buf, "DC3CO count");
 		igt_assert_f(str, "DC3CO counter is not available\n");
@@ -376,6 +382,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 
 static void require_dc_counter(int debugfs_fd, int dc_flag)
 {
+	char *str;
 	char buf[4096];
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
@@ -391,8 +398,13 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
 			      "DC5 counter is not available\n");
 		break;
 	case CHECK_DC6:
-		igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
-			      "DC6 counter is not available\n");
+		str = strstr(buf, "DC5 -> DC6 count");
+		if (!str) {
+			str = strstr(buf, "DC5 -> DC6 allowed count");
+			igt_assert_f(str, "DC5 -> DC6 allowed count is not available\n");
+		} else {
+			igt_assert_f(str, "DC6 counter is not available\n");
+		}
 		break;
 	default:
 		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
@@ -417,20 +429,6 @@ static void test_dc3co_vpb_simulation(data_t *data)
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
@@ -721,40 +719,6 @@ static void test_deep_pkgc_state(data_t *data)
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
@@ -818,10 +782,7 @@ igt_main
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
@@ -866,10 +827,7 @@ igt_main
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
2.34.1

