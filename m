Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3251CD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 06:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCDD10ECAA;
	Wed, 13 May 2026 06:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ti1IoYXY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB3110EC91
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778653082; x=1810189082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1lghfuB8mGghEcPRt0aJtPt3MbcCIDeWfMKMHps3EP8=;
 b=Ti1IoYXYI6GMvJg9LBywELVEmuwibkTR+0s5e6jtKLcfXCrj8gxA++0y
 2FQrmo5WkZGBMhAr4LzmUCTeZtJHqxdnQl1BFLgc0R5fwsabYi5vlL6hD
 f3uxda8AOOVUZXn2BhN142cz+CZufEqv6TaPbEZBYWCUbQS0Ftqeq75Cv
 j8dVDChuabMNaQerIGJKtDYbWK0vuXdnc5aUL2mWSbyio1+XcFZf5njmk
 OkG/io9gK+HxRn0CUmX83RTUxUnH63ZJEH03cN+pKT1MudG/WvZ2dosMC
 kC9MpSXyv0Fdv68laJ/U6hmSi0JP+x9RstriscItu0BviOp2V089Mqe3F g==;
X-CSE-ConnectionGUID: PZ9GPLO9TYKr2mcWTaO9zA==
X-CSE-MsgGUID: Pqum0EenTl2j5+t8i5OY/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79685169"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79685169"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:18:02 -0700
X-CSE-ConnectionGUID: EU9lq9QgSQWP82hyT4ZMYA==
X-CSE-MsgGUID: I2qLF+tRTGeUyx7SiUDtyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="235320994"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:18:00 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v5 6/7] tests/intel/kms_pm_dc: Add new test for DC3CO
 recovery after DC6
Date: Wed, 13 May 2026 11:46:04 +0530
Message-ID: <20260513061605.645695-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513061605.645695-1-jeevan.b@intel.com>
References: <20260513061605.645695-1-jeevan.b@intel.com>
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

Adds a test to verify DC3CO continues to function properly
after a DC6 power cycle.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 61 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 4497cffb7..397f13d02 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -55,6 +55,11 @@
  * Description: Verify that DC3CO entry does not cause frame drops and successfully
  *              enters the power state
  *
+ * SUBTEST: dc3co-after-dc6
+ * Description: Verify DC3CO entry is still functional after a DC6 entry and
+ *              exit cycle, ensuring DC3CO is not broken by deeper power state
+ *              transitions.
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -628,6 +633,35 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
+static void test_dc3co_after_dc6(data_t *data)
+{
+	uint32_t dc6_prev_cnt;
+
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
+
+	setup_output(data);
+
+	/* Enable PSR2/PR */
+	setup_dc3co(data);
+
+	/* Trigger a DC6 cycle */
+	dc6_prev_cnt = igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
+	setup_dc_dpms(data);
+	dpms_off(data);
+	assert_dc_counter(data, IGT_INTEL_CHECK_DC6, dc6_prev_cnt);
+	dpms_on(data);
+	cleanup_dc_dpms(data);
+
+	/* Re-enable PSR2/PR after DC6 exit */
+	setup_dc3co(data);
+
+	/* Verify DC3CO still works after DC6 */
+	setup_videoplayback(data);
+	check_dc3co_with_videoplayback_like_load(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
@@ -801,6 +835,33 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
+		     "and exit cycle");
+	igt_subtest_with_dynamic("dc3co-after-dc6") {
+		igt_dynamic("psr2") {
+			data.op_psr_mode = PSR_MODE_2;
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     data.op_psr_mode, NULL));
+			igt_require_f(IS_TIGERLAKE(data.devid) ||
+				      intel_display_ver(data.devid) >= 35,
+				      "Platform does not support DC3CO with PSR2\n");
+			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				      "PC8+ residencies not supported\n");
+			test_dc3co_after_dc6(&data);
+		}
+
+		igt_dynamic("pr") {
+			data.op_psr_mode = PR_MODE;
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     data.op_psr_mode, NULL));
+			igt_require_f(intel_display_ver(data.devid) >= 35,
+				      "Platform does not support DC3CO with Panel Replay\n");
+			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				      "PC8+ residencies not supported\n");
+			test_dc3co_after_dc6(&data);
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

