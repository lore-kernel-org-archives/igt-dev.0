Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE43CCDE032
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 19:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B23B10EBCF;
	Thu, 26 Sep 2024 19:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SW6BX521";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E83C10EBCF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727379559; x=1758915559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/HvEQH3BAC5eTI7eD+4sHnKUP0PGgR4Gv2ZYNukGHc8=;
 b=SW6BX5210OcOGWv7d7z7zQuZ4LbTFmbEmI4+haOfCTCy4WOyjIX4uMUb
 kldcdiZTjq1xWK8t9GL8oT5/1dysO3a4BoTJii/GcMDgJZ6lyKJ0RWN/Q
 h3L1m1hahGcufB5KMAoO82/Xbgfmym2jTql+EZBkAWxwXvoVo7yWLSO5m
 iwDw9vEl0j/TCnygsbcDFx29+NCsX3UuifY0J+eA9H2WD2zY9ysvqlQLf
 R2zlUg421rx9VHE4cXsG7VSW5Z2igjb3w6sPopxhrlUuUY6tWIaEG3c8j
 HR0LH1ivr7nHUAf/l7qlNaPNOnEU8FX/r9IFlk0jyijmYiVRD7XKdyn4n Q==;
X-CSE-ConnectionGUID: kFkHBgZ3QWOg0X6p1110DQ==
X-CSE-MsgGUID: OPDthzDsQc61v4hXEmErAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37072039"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="37072039"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 12:39:19 -0700
X-CSE-ConnectionGUID: /xlmHG2nQUyzlSJ8PUVRBg==
X-CSE-MsgGUID: VgHDm2SPQyqEcIyYACBjGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="76643600"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2024 12:39:16 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_backlight: Brightness test during
 DPMS on and off
Date: Fri, 27 Sep 2024 01:08:38 +0530
Message-Id: <20240926193838.698648-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704113102.2762-1-mohammed.thasleem@intel.com>
References: <20240704113102.2762-1-mohammed.thasleem@intel.com>
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
v4: Minor changes.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_backlight.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 140a95bcc..c93e5b357 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -66,6 +66,10 @@
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
  * Functionality: backlight, suspend
+ *
+ * SUBTEST: brightness-with-dpms
+ * Description: test brightness with dpms on and off cycle.
+ * Functionality: backlight, backlight
  */
 
 struct context {
@@ -78,6 +82,7 @@ struct context {
 enum {
 	TEST_NONE = 0,
 	TEST_DPMS,
+	TEST_DPMS_CYCLE,
 	TEST_SUSPEND,
 };
 
@@ -213,6 +218,22 @@ check_dpms(igt_output_t *output)
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
 
+static void check_dpms_cycle(struct context *context)
+{
+	int max, val_1, val_2;
+
+	backlight_read(&max, "max_brightness", context);
+	igt_assert(max);
+
+	backlight_write(max / 2, "brightness", context);
+	backlight_read(&val_1, "actual_brightness", context);
+
+	check_dpms(context->output);
+
+	backlight_read(&val_2, "actual_brightness", context);
+	igt_assert_eq(val_1, val_2);
+}
+
 static void
 check_suspend(igt_output_t *output)
 {
@@ -276,6 +297,8 @@ igt_main
 		{ "bad-brightness", "test the bad brightness.", test_bad_brightness, TEST_NONE },
 		{ "fade", "test basic fade.", test_fade, TEST_NONE },
 		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
+		{ "brightness-with-dpms", "test brightness with dpms on and off cycle.",
+		   check_dpms_cycle, TEST_DPMS_CYCLE},
 		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
 	};
 
-- 
2.25.1

