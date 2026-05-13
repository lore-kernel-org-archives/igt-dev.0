Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A66DCD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 06:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15E8953E;
	Wed, 13 May 2026 06:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5IV5Ob5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AFC8953E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 06:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778653685; x=1810189685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wbshGo7kt8JGOV3KYsXNgQUc64E3PRjuxqDBWL7YEwU=;
 b=D5IV5Ob5beUJtTxbBJUHRIAvIJmBBgiR2Cp09f5rH2AiOgGpjo1VY98U
 FmZ/8xJjXzBDVsSqJsYXBzheS45RKoK2A+sU3651PQhICRT7+1VJ1NLx/
 2qHwhQvhLaNHv5ufH7L0d14M70CZb3x+wPyqFuE01W8qRqPkZBI9Ped0o
 TK/ILdZbw6bqfB6W5c3Dz4rVeoEM68WnfbgCidwZpzQrR1HK1wysyXgOx
 bwEZ4hrGnn5lSK3o4dmMms5tk9q/xG7OZr5jzJQlF000LrlfwnCN8hvtt
 kfW+SwVvGO4n8wG46ZZmaqfoRAxPd+lybL4Gspov94oGqYe1a33lA2zXl A==;
X-CSE-ConnectionGUID: 6J3kYo4YRB6symKnCs0NVQ==
X-CSE-MsgGUID: QPPUydVJQA+B54Kh7XJVuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="105031349"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="105031349"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:28:05 -0700
X-CSE-ConnectionGUID: HnzoG2V8R1KkSh4StFikWA==
X-CSE-MsgGUID: ga7jamAkTGO8DM99zDX7Qg==
X-ExtLoop1: 1
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:28:03 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_pm_backlight: Add
 brightness-with-suspend subtest
Date: Wed, 13 May 2026 11:52:08 +0530
Message-Id: <20260513062208.683004-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Verify backlight brightness is preserved after suspend resume cycle,
The test sets backlight to  a value , suspend the system and checks the
brightness value is preserved after resume.

v2: Remove unused enum and use TEST_NONE, remove locally added prints
for debug (Karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_pm_backlight.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 58c0b4427..0e35aeed0 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -65,6 +65,9 @@
  *
  * SUBTEST: brightness-with-dpms
  * Description: test brightness with dpms on and off cycle.
+ *
+ * SUBTEST: brightness-with-suspend
+ * Description: Test that brightness set before suspend is preserved after resume.
  */
 
 enum {
@@ -206,6 +209,24 @@ check_suspend(igt_output_t *output)
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 }
 
+static void check_suspend_cycle(igt_backlight_context_t *context)
+{
+	int max, val1, val2;
+
+	igt_backlight_read(&max, "max_brightness", context);
+	igt_assert(max);
+
+	igt_backlight_write(max / 2, "brightness", context);
+	igt_backlight_read(&val1, "actual_brightness", context);
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_backlight_read(&val2, "actual_brightness", context);
+	igt_assert_f(val2 == val1,
+		     "actual_brightness after resume [%d] does not match value before suspend [%d]\n",
+		     val2, val1);
+}
+
 static void test_cleanup(igt_display_t *display, igt_backlight_context_t *context)
 {
 	igt_output_t *output = context->output;
@@ -273,6 +294,8 @@ int igt_main()
 		{ "brightness-with-dpms", "test brightness with dpms on and off cycle.",
 		   check_dpms_cycle, TEST_DPMS_CYCLE},
 		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
+		{ "brightness-with-suspend", "test brightness is preserved after suspend/resume.",
+		   check_suspend_cycle, TEST_NONE },
 	};
 
 	igt_fixture() {
-- 
2.34.1

