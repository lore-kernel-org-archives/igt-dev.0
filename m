Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCB4CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 11:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5AE10EA42;
	Tue, 12 May 2026 11:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSD/DH6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406CE10EA40
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 11:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778585173; x=1810121173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AfX/x8hUF+caEJuO21BiReyORumXFX4x8xP3Ouz7btE=;
 b=mSD/DH6XGKO2kbKDggOD4BXMPJ44M3dCAxgGTpHjeSgWlNHL/PAcaMGO
 +gIb0ZOFe4gAFA4S9yGorkCHNXVhmIATAxLZFjXOhI0GoOFud9pecYZ6v
 cLcipURpbEqqd2MSIZ3j29EQRUPxL/IOlHg5WoQLapYVohZtv04hCSSFF
 qlcfiIsJumy4QPAXFMX0LpzjkSprqawk2orKJ6DLBiDJEbkIU2u+/Gdmg
 MMf/bRQcwnUr8CQM1PJg7+A01srAGaKXn+OncM2+XpWqaf73aUnQ6SwKJ
 C9fmqr3Qpw12QwKEtoK1HzCsT/AEyfG2F3/cQYdjpG/Q8t9fR7I/TA7pl Q==;
X-CSE-ConnectionGUID: aOecI9OGSXeRJpYSHMT/9A==
X-CSE-MsgGUID: hEHLiLnqTjCrWoQwemEsXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="97057263"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="97057263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 04:26:13 -0700
X-CSE-ConnectionGUID: gJsqDgtYSSap2a8DWmhIiw==
X-CSE-MsgGUID: U9CkDEX/Tbqx0Xsrr2xZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="239570818"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 04:26:11 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/intel/kms_pm_backlight: Add
 brightness-with-suspend subtest
Date: Tue, 12 May 2026 16:50:19 +0530
Message-Id: <20260512112019.676242-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_pm_backlight.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 58c0b4427..c2228986e 100644
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
@@ -72,6 +75,7 @@ enum {
 	TEST_DPMS,
 	TEST_DPMS_CYCLE,
 	TEST_SUSPEND,
+	TEST_SUSPEND_CYCLE,
 };
 
 #define TOLERANCE 5 /* percent */
@@ -188,6 +192,8 @@ static void check_dpms_cycle(igt_backlight_context_t *context)
 {
 	int max, val_1, val_2;
 
+	printf("Toggling DPMS...\n");
+
 	igt_backlight_read(&max, "max_brightness", context);
 	igt_assert(max);
 
@@ -206,6 +212,24 @@ check_suspend(igt_output_t *output)
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
@@ -273,6 +297,8 @@ int igt_main()
 		{ "brightness-with-dpms", "test brightness with dpms on and off cycle.",
 		   check_dpms_cycle, TEST_DPMS_CYCLE},
 		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SUSPEND },
+		{ "brightness-with-suspend", "test brightness is preserved after suspend/resume.",
+		   check_suspend_cycle, TEST_SUSPEND_CYCLE },
 	};
 
 	igt_fixture() {
-- 
2.34.1

