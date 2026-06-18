Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4D5CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C341C10EC4A;
	Thu, 18 Jun 2026 06:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9ZzaIwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FBB10EC4A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764166; x=1813300166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XxIeuJBiQHGLaYxAjZygQo1I0bHc+f2Qs2ZCpZgTkiI=;
 b=m9ZzaIwEauZNI2uvklz2l+hwupYTsSUgzZeB7UoTwFESw/v3KEBZmaD4
 cJn5Ln97meVk6t7DfAaVRXq3oTmMObCjyyksIldihUs9x/+TGxsGT3NsU
 R/UhzFE+xPeMBFi+fmgOd8PiRtsz9VRhxg4cmLSxslrjs/kvYg4F/l+Wq
 N18ETktlEKnw4o6ZSkGcAzZHwLmpUfuMbn1YNwKXbRpcVbmXb2Jmoo5GQ
 xfHiE0L8UEZap9pp6MHolGPeckrU5aA0ckGromlU1+is8kA5gavtfOxpC
 Qd5lqYdLg5Gx4u7+FX3jzp09mH4W2C53UVWaFaJ5pa/6GbH0PM1EdiWM4 A==;
X-CSE-ConnectionGUID: E0KV5wUbSlCySgKl4qHt3g==
X-CSE-MsgGUID: do6YI1D8Sq+b/M/nc1JUTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82485885"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82485885"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:29:26 -0700
X-CSE-ConnectionGUID: ju2DuIbxSsOiIKNL28GPzQ==
X-CSE-MsgGUID: Sgar96uhRWm2xPTrJg/39g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="245343031"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:29:25 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v10 6/7] tests/intel/kms_pm_dc: Add new test for DC3CO
 recovery after DC6
Date: Thu, 18 Jun 2026 11:59:03 +0530
Message-ID: <20260618062904.2789476-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618062904.2789476-1-jeevan.b@intel.com>
References: <20260618062904.2789476-1-jeevan.b@intel.com>
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
v3: Refactor dynamic block to avoid duplicates.
v3: Remove TGL check for PSR2.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 3602ef92f..d054d3b5c 100644
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
@@ -634,6 +639,19 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
+static void test_dc3co_after_dc6(data_t *data)
+{
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
+
+	setup_output(data);
+	setup_dc3co(data);
+	test_dc_state_dpms(data, IGT_INTEL_CHECK_DC6);
+	setup_videoplayback(data);
+	check_dc3co_with_videoplayback_like_load(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
@@ -849,6 +867,35 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
+		     "and exit cycle");
+	igt_subtest_with_dynamic("dc3co-after-dc6") {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, "psr2" },
+			{ PR_MODE,    "pr"   },
+		};
+
+		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+			      "PC8+ residencies not supported\n");
+
+		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
+			const char *name = dc3co_modes[i].name;
+			data.op_psr_mode = dc3co_modes[i].mode;
+
+			igt_dynamic_f("%s", name) {
+				igt_require(psr_sink_support(data.drm_fd,
+						     data.debugfs_fd,
+						     data.op_psr_mode, NULL));
+
+				igt_require_f(intel_display_ver(data.devid) >= 35,
+					      "Platform does not support DC3CO with %s\n",
+					      data.op_psr_mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
+
+				test_dc3co_after_dc6(&data);
+			}
+		}
+	}
+
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-- 
2.43.0

