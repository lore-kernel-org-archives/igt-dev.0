Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C50DCD8C85
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 03:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF50C10E079;
	Tue,  9 Jun 2026 03:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhdjgis2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5484110E075
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 03:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780976832; x=1812512832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CizHbZ8n7RiPCIS02ZL7RbPAj3fpCQ+o/n+Bzrwuocw=;
 b=jhdjgis2LbLafdyqjcNIKW3psUWeaq+rOIJyMjzqITipuvVtRhB22Ds5
 YkTO20T5wmr0dlJ10Cr01YjXPsAKveyJb9yfiZGud6BD1Gh5QIZO21WRC
 lJ9UHl0GXDQlqVeBnHM0psvgsJ0bqHA9BABveg1u7V0s6DyrA7hOIPnty
 hsm12My5CXlnzA0WMObrZF0vu2OonDFL7d4E8bKvRPNUdUXR32xFV2u/s
 DeQ/+Ycj1dQ36sxYm+fFNxedSWcP9e7hItbhcV05G47f9Wth/xL4525So
 K/gvUV9SWHnKxelmTCoJeLzldh+fd41zUaG7cjb6t2xUHj+Ub9NNkysu0 w==;
X-CSE-ConnectionGUID: Rhc9p2AVRGmKfUO1tnpMMg==
X-CSE-MsgGUID: lRj/37fkQfS6JOAke2yH9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92050900"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92050900"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:47:11 -0700
X-CSE-ConnectionGUID: H7ffR/vvQSSE/CVTJeZf0A==
X-CSE-MsgGUID: QVUliF50TFyHKO3zm2RDgQ==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 20:47:09 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v9 6/7] tests/intel/kms_pm_dc: Add new test for DC3CO
 recovery after DC6
Date: Tue,  9 Jun 2026 09:16:49 +0530
Message-ID: <20260609034650.2281712-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609034650.2281712-1-jeevan.b@intel.com>
References: <20260609034650.2281712-1-jeevan.b@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 48b2e87a3..697dd3047 100644
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
@@ -631,6 +636,19 @@ static int has_panels_without_dc_support(igt_display_t *display)
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
@@ -811,6 +829,39 @@ int igt_main()
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
+				if (data.op_psr_mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with PSR2\n");
+				else
+					igt_require_f(intel_display_ver(data.devid) >= 35,
+						      "Platform does not support DC3CO with Panel Replay\n");
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

