Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B1CF433C7
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 03:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1523F10E72B;
	Thu, 16 Apr 2026 03:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsCCd/RI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503F410E172
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 03:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776311739; x=1807847739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DnWaKYjHneIOCbvUIRqpujbHbGbMRMPKYVUTJewNmdU=;
 b=NsCCd/RINZw5EF3rV7iyCxcwgZS2jjyMSrf+HPZ5QcI2DCOxkJQpGPmL
 qCxzga7WztyzhjZ2Gqq+vBVvGZYYkD101RmaOgM1CCCOWEBNjiXrfRgBr
 hob2sW0eEcO9BLx3PA2xreqs8w2cXvDP3lFg2eT077GBBbc5FfpkiqAS5
 9n53Gdb5zuizbTA3ZSUBsZtKF4plRwGaIKQFY+T2cvs5zngB0u9U+8ckQ
 ebw8aJXBhjLW3LuURoCcWSXROsENvX6PAlvUEt1VRM56kOjatVa1riYm9
 i4xdhQH4eBWP/TM65yXUeABKExJZi47lm/zdmUjHd6CEwIaHc2hq8yP7f g==;
X-CSE-ConnectionGUID: 9WKm8N47R5KpVQ2ecCwFrQ==
X-CSE-MsgGUID: xyUSYyu1Qve5kdAI7gFEng==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77002050"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77002050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 20:55:39 -0700
X-CSE-ConnectionGUID: 1CufXcNEQDqLZTl6C48DHw==
X-CSE-MsgGUID: 5Pgu5rq6S0OiIOj7mAWhgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253867775"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 20:55:37 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3 4/4] tests/intel/kms_pm_dc: Scope PSR handling to
 output
Date: Thu, 16 Apr 2026 09:23:33 +0530
Message-ID: <20260416035333.69004-5-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416035333.69004-1-jeevan.b@intel.com>
References: <20260416035333.69004-1-jeevan.b@intel.com>
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

v2: Keep op_psr_mode assignment explicit per subtest.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 8138933d4..423a5c4a4 100644
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
@@ -658,17 +661,18 @@ int igt_main()
 	igt_describe("In this test we make sure that system enters DC3CO "
 		     "when PSR2 is active and system is in SLEEP state");
 	igt_subtest("dc3co-vpb-simulation") {
+		data.op_psr_mode = PSR_MODE_2;
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_2, NULL));
+					     data.op_psr_mode, NULL));
 		test_dc3co_vpb_simulation(&data);
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_1, NULL));
 		data.op_psr_mode = PSR_MODE_1;
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     data.op_psr_mode, NULL));
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC5);
 	}
@@ -676,9 +680,9 @@ int igt_main()
 	igt_describe("This test validates display engine entry to DC6 state "
 		     "while PSR is active");
 	igt_subtest("dc6-psr") {
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     PSR_MODE_1, NULL));
 		data.op_psr_mode = PSR_MODE_1;
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     data.op_psr_mode, NULL));
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
@@ -703,11 +707,11 @@ int igt_main()
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active on Pipe B");
 	igt_subtest("dc5-retention-flops") {
+		data.op_psr_mode = PSR_MODE_1;
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

