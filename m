Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CC5CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 10:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22E810E58B;
	Tue,  4 Nov 2025 10:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frjDbPMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F54D10E58B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251276; x=1793787276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R11ts1XXiOh+i3F3YqlC2if/3B9MTRw63+MnoSutoDA=;
 b=frjDbPMet+EOLd/T67iAquBxshIRz5EJO8oDDLuLuhAZJ8dxuvEKjV34
 cihNXRkrhMmTeBW7CMZsNu4dglhgqTHXVgwey5Qgv0PCtR8QvIa+2QX6a
 mWn6jVRsPew01Kw/UYPBSY39+2AIa2Vvbn6WPgud1BUf1EuWvxmC7bHsZ
 YWMvEcyZFpJbCa41ef8tNu7ugP/frRwCKQlLltx9tJVxkHOQ8ZIRu2L/D
 Upuyv6Mdd/t+UogS7GfrsV2g7+FNSfl9wwP5NTFUM/DxeB/EBZkB6/5eO
 AArMP3ecp+nDK4gp6zXl/9f4dOpi2gcisWb4opBr43YXXjtEeP9pQA/3V g==;
X-CSE-ConnectionGUID: 48b6f6c8TZS/pNoSQEzCkg==
X-CSE-MsgGUID: klDN037QSoyA1mTxGeFKzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64492333"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64492333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:14:36 -0800
X-CSE-ConnectionGUID: kR/x/Jr+Qd2d70DZpPg2IQ==
X-CSE-MsgGUID: nWsrUagSRUqdTv7kQ8qWcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="192287797"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 02:14:33 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_content_protection: Add a test for
 HDCP-MST with suspend resume
Date: Tue,  4 Nov 2025 15:39:08 +0530
Message-Id: <20251104100908.795507-1-santhosh.reddy.guddati@intel.com>
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

From: Jeevan B <jeevan.b@intel.com>

adding new test to validate HDCP-MST with suspend resume
test check for valid output which supports MST and HDCP
then commits and check if the content protection is enabled
before and after suspend-resume.

v2: Change type-0 to type-1, try to authenticate hdcp few more times
as suggested. (Suraj)

v3: Add a new test for suspend-resume non-mst.
    Added suspend-resume handling to existing mst and non-mst test paths
    Updated test description and documentation.

v4: Remove commit after suspend_resume() (Thasleem)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 2422793b1..575426e88 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -74,6 +74,7 @@
  * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
  * @legacy:         legacy style commit
  * @type1:          content type 1 that can be handled only through HDCP2.2.
+ * @suspend-resume: Suspend and resume the system
  */
 
 /**
@@ -86,6 +87,7 @@
  * @lic-type-1:   Type 1 with LIC.
  * @type-0:       Type 0
  * @type-1:       Type 1
+ * @suspend-resume: Suspend and resume the system
  */
 
 IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
@@ -104,6 +106,7 @@ struct data {
 #define CP_MEI_RELOAD				(1 << 2)
 #define CP_TYPE_CHANGE				(1 << 3)
 #define CP_UEVENT				(1 << 4)
+#define SUSPEND_RESUME				(1 << 5)
 
 #define CP_UNDESIRED				0
 #define CP_DESIRED				1
@@ -480,6 +483,17 @@ static void test_content_protection_on_output(igt_output_t *output,
 						  content_type, false,
 						  false);
 	}
+
+	if (data.cp_tests & SUSPEND_RESUME) {
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+		ret = wait_for_prop_value(output, CP_ENABLED,
+					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		if (!ret)
+			test_cp_enable_with_retry(output, commit_style, 2,
+						  content_type, false,
+						  false);
+	}
 }
 
 static void __debugfs_read(int fd, const char *param, char *buf, int len)
@@ -822,6 +836,17 @@ test_content_protection_mst(int content_type)
 
 	test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
 
+	if (data.cp_tests & SUSPEND_RESUME) {
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+		ret = wait_for_prop_value(hdcp_mst_output[0],
+						 CP_ENABLED,
+						 KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		if (!ret)
+			test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
+						      2, content_type);
+	}
+
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
 
@@ -842,6 +867,7 @@ test_content_protection_mst(int content_type)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
 }
 
+
 static void test_content_protection_cleanup(void)
 {
 	igt_display_t *display = &data.display;
@@ -950,6 +976,11 @@ static const struct {
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	},
+	{.desc = "Test to verify the behaviour of HDCP after suspend resume cycles.",
+	 .name = "suspend-resume",
+	 .cp_tests = SUSPEND_RESUME,
+	 .content_type = HDCP_CONTENT_TYPE_0,
+	}
 };
 
 static const struct {
@@ -978,6 +1009,11 @@ static const struct {
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	},
+	{ .desc = "Test Content protection(Type 1) over DP MST with suspend resume.",
+	  .name = "dp-mst-suspend-resume",
+	  .cp_tests = SUSPEND_RESUME,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	},
 };
 
 igt_main
-- 
2.34.1

