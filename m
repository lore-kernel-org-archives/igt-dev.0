Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A2FC27C55
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 10:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB0110EBAE;
	Fri,  7 Jun 2024 10:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRU5EuXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3EA10EBAE
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 10:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717756445; x=1749292445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0R0pFBorHVp2VBG8cEQt/+JN5/i54S9dGaVv5PV7dS8=;
 b=WRU5EuXmJiCJpLD0z3iExTBYZLD2iU9olbq19BjmDZL3i0EFtle/d4/V
 NxO7my0KLGlADZIU+nv/Mkog0HCB9+XMtl8W/27kA6e5q9H5fF/vMh43j
 Fbek8wESmYBhq3FpQJ69Bvge879fjukWULQgxWiv/gAe3LG0SoUghEpzL
 cnaLM51ZwYNePCWtoagMZQdM3v3nJjZt9gF+U2IJKjZyu5s7PvX/yn7JE
 l7TUmUpAMRfOhPgY3IJs0KAbIewRFF4cDG8PPY76BdM40QVobcmvgMlc/
 HnB23DknW2OijixhOmBNArU/0sj2gjP+XH+S0ilN/PIOLwhWETG+Rbdzu g==;
X-CSE-ConnectionGUID: Nwyr3k4hRnidPdbC1P5T1A==
X-CSE-MsgGUID: Z91i5Gz2RMyxgeDmTaHgCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14587766"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14587766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:34:04 -0700
X-CSE-ConnectionGUID: V5fxoKDrQEmD54eYmDTSDw==
X-CSE-MsgGUID: q2q27ASyTZa/Cndp3XM8rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38362086"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by orviesa009.jf.intel.com with ESMTP; 07 Jun 2024 03:34:03 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_backlight: Brightness test during
 DPMS on and off
Date: Fri,  7 Jun 2024 16:03:29 +0530
Message-Id: <20240607103329.16841-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424005737.228759-1-mohammed.thasleem@intel.com>
References: <20220424005737.228759-1-mohammed.thasleem@intel.com>
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

Set brightness by deviding max brightness, store and read it back.
The actual brightness should be same during DPMS on and off cycle.

v2: Update test path and testplan documentation.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_backlight.c | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 2e691dab0..107b7d668 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -64,6 +64,10 @@
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
  * Functionality: backlight, suspend
+ *
+ * SUBTEST: brightness-with-dpms
+ * Description: test brightness with dpms on and off cycle.
+ * Functionality: backlight, backlight
  */
 
 struct context {
@@ -217,6 +221,32 @@ check_suspend(igt_output_t *output)
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 }
 
+static void check_dpms_cycle(igt_display_t *display, igt_output_t *output, struct context *context)
+{
+	int max, val_1, val_2;
+
+	backlight_read(&max, "max_brightness", context);
+	igt_assert(max);
+
+	backlight_write(max / 2, "brightness", context);
+	backlight_read(&val_1, "actual_brightness", context);
+
+	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
+
+	kmstest_set_connector_dpms(output->display->drm_fd,
+				   output->config.connector,
+				   DRM_MODE_DPMS_OFF);
+	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	kmstest_set_connector_dpms(output->display->drm_fd,
+				   output->config.connector,
+				   DRM_MODE_DPMS_ON);
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+
+	backlight_read(&val_2, "actual_brightness", context);
+	igt_assert_eq(val_1, val_2);
+}
+
 static void test_cleanup(igt_display_t *display, igt_output_t *output)
 {
 	igt_output_set_pipe(output, PIPE_NONE);
@@ -354,6 +384,17 @@ igt_main
 		}
 	}
 
+	igt_describe("test brightness with dpms on and off cycle");
+	igt_subtest_with_dynamic("brightness-with-dpms") {
+		for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			test_setup(display, &contexts->output[j]);
+			igt_dynamic_f("%s", igt_output_name(contexts[j].output)) {
+				check_dpms_cycle(&display, &contexts->output[j], &contexts[j]);
+				test_cleanup(&display, &contexts->output[j]);
+			}
+		}
+	}
+
 	igt_fixture {
 		/* Restore old brightness */
 		for (i = 0; i < (dual_edp ? 2 : 1); i++)
-- 
2.25.1

