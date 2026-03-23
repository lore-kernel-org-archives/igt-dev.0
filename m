Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF410EC01A6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959B410E3D8;
	Mon, 23 Mar 2026 09:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEtS2+GP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725BE10E3D6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774257221; x=1805793221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Iylnboe0CjtqUXH2X7OhyT6Q+ygfONBUAELo0VS3sE=;
 b=NEtS2+GPEScfedMBmNPnfYF5WnsZ2rvtRdTT21TaaY3e/xWcrrnnRE/0
 406hhlYY4ias6zk39DE22vfSnWdswwe3a+ejk1yGfSIdHZweQAUmPxQzY
 3rHoGYdju6ugRO3ewzM3UT7suieKFHCSoqcIDii/PNn/Zvcy//1BU/4os
 4kb/uOA0IjUuplL5kpNj1FNnEL3QpoXf7xaEi0PmgSKdy5lFOAw3ply8B
 X4e1vTWAt5VDaMXDe1MXtQx1cPONZK+S6w7zpIiVQoLO8fKNM7y8t/5kN
 tr5iozBIBR/yn8iHVcBTz1IRjw6vKv6Uq8sltI4+YTrOsFKIcGmo7FUIg Q==;
X-CSE-ConnectionGUID: svSeqFNSSbGVL9+Rth92nQ==
X-CSE-MsgGUID: YejSoNFMSgKrpSIxQWMMbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75371583"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75371583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:13:41 -0700
X-CSE-ConnectionGUID: JWh3zRGcSESN5uLvo4hkXw==
X-CSE-MsgGUID: 4d31gWyxRceLubt5D++4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="219164585"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:13:40 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_pm_dc: Scope PSR handling to output
Date: Mon, 23 Mar 2026 14:42:05 +0530
Message-ID: <20260323091205.100585-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323091205.100585-1-jeevan.b@intel.com>
References: <20260323091205.100585-1-jeevan.b@intel.com>
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

Stop using global PSR checks by passing NULL to PSR helpers.
Select a PSR-capable eDP output and scope PSR enablement and
verification to that output.

This fixes incorrect behavior on multi-eDP systems where PSR
capability differs across panels.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 39e94f36b..1a88c54bd 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -162,6 +162,10 @@ static void setup_output(data_t *data)
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
+		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
+				      data->op_psr_mode, output))
+			continue;
+
 		igt_output_set_crtc(output, crtc);
 		data->output = output;
 		data->mode = igt_output_get_mode(output);
@@ -318,9 +322,8 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 
 static void setup_dc3co(data_t *data)
 {
-	data->op_psr_mode = PSR_MODE_2;
-	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
-	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
+	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
+	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output),
 		      "PSR2 is not enabled\n");
 }
 
@@ -342,7 +345,7 @@ static void test_dc5_retention_flops(data_t *data, int dc_flag)
 	dc_counter_before_psr = igt_read_dc_counter(data->debugfs_fd, dc_flag);
 	set_output_on_pipe_b(data);
 	setup_primary(data);
-	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output));
 	check_dc_counter(data, dc_flag, dc_counter_before_psr);
 	cleanup_dc_psr(data);
 }
@@ -356,7 +359,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 	setup_output(data);
 	setup_primary(data);
 	igt_require(!psr_disabled_check(data->debugfs_fd));
-	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output));
 	check_dc_counter(data, dc_flag, dc_counter_before_psr);
 	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
 	cleanup_dc_psr(data);
@@ -615,6 +618,7 @@ static void kms_poll_state_restore(int sig)
 int igt_main()
 {
 	data_t data = {};
+	data.op_psr_mode = PSR_MODE_1;
 
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -640,8 +644,9 @@ int igt_main()
 	igt_describe("In this test we make sure that system enters DC3CO "
 		     "when PSR2 is active and system is in SLEEP state");
 	igt_subtest("dc3co-vpb-simulation") {
+		data.op_psr_mode = PSR_MODE_2;
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_2, NULL));
+					     data.op_psr_mode, NULL));
 		test_dc3co_vpb_simulation(&data);
 	}
 
@@ -649,8 +654,7 @@ int igt_main()
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_1, NULL));
-		data.op_psr_mode = PSR_MODE_1;
+					     data.op_psr_mode, NULL));
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC5);
 	}
@@ -659,8 +663,7 @@ int igt_main()
 		     "while PSR is active");
 	igt_subtest("dc6-psr") {
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_1, NULL));
-		data.op_psr_mode = PSR_MODE_1;
+					     data.op_psr_mode, NULL));
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
@@ -688,8 +691,7 @@ int igt_main()
 		igt_require_f(intel_display_ver(data.devid) >= 30,
 			      "Test not supported on this platform.\n");
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_1, NULL));
-		data.op_psr_mode = PSR_MODE_1;
+					     data.op_psr_mode, NULL));
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require(!psr_disabled_check(data.debugfs_fd));
 		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
-- 
2.43.0

