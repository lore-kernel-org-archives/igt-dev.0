Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D773BCD4F25
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BFF10F56A;
	Fri, 15 May 2026 15:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N29WzaEx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9885710F56A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778859631; x=1810395631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5BJ30U0B47Zj1PCxa64+TTv+UHeB8vHEENbz8UUYZfY=;
 b=N29WzaExpt2kwt9iGW0Vug6luSS+rG1G0hNq37faruKJKuiIqyNV42uX
 gEjsWk3FiwQH1IkmU8MMTjZyy7Ha8NQHlGCNnCNzbDEgxyhz69fptmwT5
 s8BttRbANkhGQEIbvhfn5ToCh+IEg8t1Y8Dxdjalq4bnTFNxTsOB+I3k7
 sOLKHvIxddSploF5+pQUo+7+5f5dKbNYw+wHXbdHTNZyJeagEFUCol3Pa
 X3ftVOshIZ61oACBN4tAfBVq33Ko1yawRUKY7P21tbifCsKN6BV/QqIlF
 wUjJR7tTkjr7juULZ+v32pOtx7g4MrfO8AA05FZzHQmrTrjOe0I99N+zw A==;
X-CSE-ConnectionGUID: MAOFUv7GSuKAjBg4ob/gWw==
X-CSE-MsgGUID: 8G6EhRJgRdmQgjE/a1fYhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79936317"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79936317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:40:30 -0700
X-CSE-ConnectionGUID: ZCmofal5QHyl2D5tBJtBIA==
X-CSE-MsgGUID: 9wqmY0PfS8e3ic4ozXgxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="242720024"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:40:29 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v6 6/7] tests/intel/kms_pm_dc: Add new test for DC3CO
 recovery after DC6
Date: Fri, 15 May 2026 21:08:36 +0530
Message-ID: <20260515153838.841048-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515153838.841048-1-jeevan.b@intel.com>
References: <20260515153838.841048-1-jeevan.b@intel.com>
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

v2: Use test_dc_state_dpms for the DPMS/DC6 cycle.
    Drop redundant PSR re-enable after DPMS/DC6.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 4497cffb7..0f216d9eb 100644
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
@@ -628,6 +633,25 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
+static void test_dc3co_after_dc6(data_t *data)
+{
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
+
+	setup_output(data);
+
+	/* Enable PSR2/PR */
+	setup_dc3co(data);
+
+	/* Trigger a DC6 cycle through DPMS */
+	test_dc_state_dpms(data, IGT_INTEL_CHECK_DC6);
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
@@ -801,6 +825,33 @@ int igt_main()
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

