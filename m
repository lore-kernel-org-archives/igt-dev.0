Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B8BC28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 21:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3DA10E0FE;
	Wed, 12 Mar 2025 21:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDms5QJO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EA710E0FE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813487; x=1773349487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7dTbsSbCb3hRsPe1TTxTpl37uACy+RVvSRi0WH53cbI=;
 b=UDms5QJON482rQvhQ8twDVNO/JVFwkf97kCpGEoaYG5DOEizUqMrrAZM
 5judCbOk74I3vQf76Lr97JvajophN9YL+pA1iSBLyzL5jv70V2OmNWEnt
 jycY31TNX71d3QlpBA1ecVFtnm0OkOucA922N+1ap5h4j2x9MF1xT5iak
 Sz/J4OEbHuqikdhbeeXLLUx0yGgGNOZBW/V0PGVn1QC5vbcm2BbijFLB8
 nh/nqd5uZLdOeylmnQRHMwPHRvN/YMM5LlMjK+BtKablzwov20Wnx/loO
 f6TdBaVufWqcp1YeXZxiWKnalEExmBROQkMT3sR8NxVRojhS/4ESKKgOQ g==;
X-CSE-ConnectionGUID: GGtqcSrQS/602Xl+v2+sLg==
X-CSE-MsgGUID: W+r1zZRtR8W7qCIUSZcsrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43017086"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="43017086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:04:41 -0700
X-CSE-ConnectionGUID: JVuJh+IVS2+ahPm+4p5Phw==
X-CSE-MsgGUID: OVZkIRfLQnSK/db00tjJKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="125634831"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa003.jf.intel.com with ESMTP; 12 Mar 2025 14:04:39 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Remove PKC10 dependecy to
 validate DC6
Date: Thu, 13 Mar 2025 02:34:36 +0530
Message-ID: <20250312210437.7304-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
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
removeing the existing pkc10 code.

v2: Update debugfs message.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 78 ++++++++++-------------------------------
 1 file changed, 18 insertions(+), 60 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 1b10c7959..658ba0564 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -274,6 +274,7 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
 {
 	char buf[4096];
 	char *str;
+	data_t data = {};
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
 
@@ -281,8 +282,14 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
 		str = strstr(buf, "DC3 -> DC5 count");
 		igt_assert_f(str, "DC5 counter is not available\n");
 	} else if (dc_flag & CHECK_DC6) {
-		str = strstr(buf, "DC5 -> DC6 count");
-		igt_assert_f(str, "DC6 counter is not available\n");
+		if (intel_display_ver(data.devid) >= 14) {
+			str = strstr(buf, "DC5 -> DC6 allowed count");
+			igt_assert_f(str, "DC5 -> DC6 allowed count "
+					   "is not available\n");
+		} else {
+			str = strstr(buf, "DC5 -> DC6 count");
+			igt_assert_f(str, "DC6 counter is not available\n");
+		}
 	} else if (dc_flag & CHECK_DC3CO) {
 		str = strstr(buf, "DC3CO count");
 		igt_assert_f(str, "DC3CO counter is not available\n");
@@ -374,6 +381,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 static void require_dc_counter(int debugfs_fd, int dc_flag)
 {
 	char buf[4096];
+	data_t data = {};
 
 	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
 				buf, sizeof(buf));
@@ -388,8 +396,12 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
 			      "DC5 counter is not available\n");
 		break;
 	case CHECK_DC6:
-		igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
-			      "DC6 counter is not available\n");
+		if (intel_display_ver(data.devid) >= 14)
+			igt_skip_on_f(!strstr(buf, "DC5 -> DC6 allowed count"),
+				      "DC5 -> DC6 allowed count is not available\n");
+		else
+			igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
+				      "DC6 counter is not available\n");
 		break;
 	default:
 		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
@@ -414,20 +426,6 @@ static void test_dc3co_vpb_simulation(data_t *data)
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
@@ -718,40 +716,6 @@ static void test_deep_pkgc_state(data_t *data)
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
@@ -815,10 +779,7 @@ igt_main
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
@@ -863,10 +824,7 @@ igt_main
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

