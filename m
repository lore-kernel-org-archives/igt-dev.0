Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E4FDEE31
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 17:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2028A10E36B;
	Thu, 23 Apr 2026 17:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMsC/IC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9531910E387
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 17:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776965773; x=1808501773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OLuTkAdPILxp1hoEZkJqAkXVXolxqWETeOj07cM95g=;
 b=AMsC/IC+gmGMAWZ0uaOwttP7VLJQW/sQQqJFFRsvj/OHY0QCKPGak1mm
 DuBd3bV0jJfubWfE1/HrPe6u7aTufF3fGDcEeXirs4352K7+YXBEkHdgH
 u6Z1j/+v+jcqzCmPm8KTIOS4eGyfyyHkliAga3isekwylh2spMYrUt3v2
 6KBl8w4zuWxNmpRAD/uhQ0DNqQBJqM9MVQxe+2rD7M7PTtU/3xUUZyNXi
 lRmQnVNeNr3hCz4ElPpPWwwXhUArtRqLGkMBi0V1fB3Y03jhndOSpK9z3
 qknvrGZ5NZd3gxiVK+XGK6H+748yUUJ8FiOAlygWKpJRyCJKsVvGBwgIu Q==;
X-CSE-ConnectionGUID: kjuXH8x1Thafv0wNj2jWkw==
X-CSE-MsgGUID: PWFyuXUoSx+h9h+SRqPfZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78134718"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="78134718"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:36:12 -0700
X-CSE-ConnectionGUID: IyINZpwXQ4aDhX9EwwFSfQ==
X-CSE-MsgGUID: ux8ZZ9m9QzmiDkDOsdEEjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="229527382"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 10:36:10 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3 6/6] RFC: tests/intel/kms_pm_dc: Add new test for
 DC3CO recovery after DC6
Date: Thu, 23 Apr 2026 23:04:03 +0530
Message-ID: <20260423173403.123706-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423173403.123706-1-jeevan.b@intel.com>
References: <20260423173403.123706-1-jeevan.b@intel.com>
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
 tests/intel/kms_pm_dc.c | 65 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 22ae51b51..6d2bd0ee1 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -55,6 +55,11 @@
  * Description: Verify that DC3CO entry does not cause frame drops and successfully
  * 		enters the power state
  *
+ * SUBTEST: dc3co-after-dc6
+ * Description: Verify DC3CO entry is still functional after a DC6 entry and
+ *              exit cycle, ensuring DC3CO is not broken by deeper power state
+ *              transitions.
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -629,6 +634,42 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
+static void test_dc3co_after_dc6(data_t *data, enum psr_mode mode)
+{
+	uint32_t dc6_prev_cnt;
+
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
+
+	setup_output(data);
+
+	/* Enable PSR2/PR */
+	data->op_psr_mode = mode;
+	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
+	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
+		      "%s is not enabled\n",
+		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
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
+	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, NULL);
+	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
+		      "%s not re-enabled after DC6 exit\n",
+		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
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
@@ -799,6 +840,30 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
+		     "and exit cycle");
+	igt_subtest_with_dynamic("dc3co-after-dc6") {
+		igt_dynamic("psr2") {
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+						     PSR_MODE_2, NULL));
+			igt_require_f(IS_TIGERLAKE(data.devid) ||
+				      intel_display_ver(data.devid) >= 35,
+				      "Platform does not support DC3CO with PSR2\n");
+			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				      "PC8+ residencies not supported\n");
+			test_dc3co_after_dc6(&data, PSR_MODE_2);
+		}
+		igt_dynamic("pr") {
+			igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+						     PR_MODE, NULL));
+			igt_require_f(intel_display_ver(data.devid) >= 35,
+				      "Platform does not support DC3CO with Panel Replay\n");
+			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+				      "PC8+ residencies not supported\n");
+			test_dc3co_after_dc6(&data, PR_MODE);
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

