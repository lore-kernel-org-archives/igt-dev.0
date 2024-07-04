Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85494C31D97
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 11:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BDC10EAB1;
	Thu,  4 Jul 2024 11:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtuUBC/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62D110EAA8
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720092683; x=1751628683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2QitPptBdY0fVic7jS5ZeavxFV3yG4CnvMkBO94NPMw=;
 b=QtuUBC/uTe/AAQtSOfXTPYVKlD8ER/8VN8hGQcikvVjjGNgvQarip2K6
 vEsh5h8Ng/7sxQhZ/FDj3RUrZS/x6aRq42G9tZuO/svZMeAvblgsrcD56
 1SKviyfEE/KgEfwJ6DkD0wJXtPCtot0rX4YBILRvOI6vHV/Xh6NaW05E3
 aNt96xAvDWIZ+vUCWnzCtdpuLVM6OD04GusTuJJYzKCYGVDGM6+6nSQEH
 LLmxDUoqV5syCod+URzws4GLxyr2BithZOoduBd4nq5aa1u4sdGSXADWf
 Kz/2Bcdm9CqIITSOgkN/QPuGmhzTquGN+DW9msJZ5WSqp8Tvmz3t2TWdW Q==;
X-CSE-ConnectionGUID: ebeZWmPmRF6gZYQVZiKocQ==
X-CSE-MsgGUID: +0bL794CT02HIRLsppID4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27971247"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="27971247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 04:31:23 -0700
X-CSE-ConnectionGUID: LtXHHwE5ToCQL4TKuDnTKQ==
X-CSE-MsgGUID: Wm1nNwphQfGZ4aHqYURyhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="51746758"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by orviesa004.jf.intel.com with ESMTP; 04 Jul 2024 04:31:21 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_backlight: Brightness test during
 DPMS on and off
Date: Thu,  4 Jul 2024 17:01:02 +0530
Message-Id: <20240704113102.2762-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607103329.16841-1-mohammed.thasleem@intel.com>
References: <20240607103329.16841-1-mohammed.thasleem@intel.com>
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
v3: Check backlight for all internal panels. (Jani)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_backlight.c | 51 ++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 8672afa7a..bb85c6e29 100644
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
@@ -262,7 +292,7 @@ igt_main
 	igt_display_t display;
 	igt_output_t *output;
 	char file_path_n[PATH_MAX] = "";
-	bool dual_edp = false;
+	bool num_panel = false;
 	struct context contexts[NUM_EDP_OUTPUTS];
 	struct {
 		const char *name;
@@ -290,7 +320,7 @@ igt_main
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE));
 
 		for_each_connected_output(&display, output) {
-			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			if (!output_is_internal_panel(output))
 				continue;
 
 			if (found)
@@ -327,7 +357,7 @@ igt_main
 				contexts[i++].output = output;
 
 				if (found)
-					dual_edp = true;
+					num_panel = true;
 				else
 					found = true;
 			}
@@ -338,7 +368,7 @@ igt_main
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe(tests[i].desc);
 		igt_subtest_with_dynamic(tests[i].name) {
-			for (int j = 0; j < (dual_edp ? 2 : 1); j++) {
+			for (int j = 0; j < (num_panel ? 2 : 1); j++) {
 				test_setup(display, &contexts->output[j]);
 
 				if (tests[i].flags == TEST_DPMS)
@@ -355,9 +385,20 @@ igt_main
 		}
 	}
 
+	igt_describe("test brightness with dpms on and off cycle");
+	igt_subtest_with_dynamic("brightness-with-dpms") {
+		for (int j = 0; j < (num_panel ? 2 : 1); j++) {
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
-		for (i = 0; i < (dual_edp ? 2 : 1); i++)
+		for (i = 0; i < (num_panel ? 2 : 1); i++)
 			backlight_write(contexts[i].old, "brightness", &contexts[i]);
 
 		igt_display_fini(&display);
-- 
2.25.1

