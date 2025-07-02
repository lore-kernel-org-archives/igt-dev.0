Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6BEC83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 03:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4733910E5F6;
	Wed,  2 Jul 2025 03:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5OelGO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CA710E282
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 03:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751427647; x=1782963647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gWx6I2+6dN/f5fxkHygoFgvGa5W5EyQMoNrai7cRiFk=;
 b=d5OelGO555TNj9mHli9QomLPynamX0hC3BJ0j3Ke074/4xnVr+ztqLcE
 SSpR2w5so7qWCSD3Mv+qG+d4GcluYgpalMWzBzy2OC2BXbyW7bYp0cFUK
 O3ACB+l530zXfiBAo3uUu4K+FPGFF+UBz0q5r7PjBlgY0s29CdBbpDP1y
 8zM5JALPCbLvq5xeTxxGZACR81ZgAMUcFx58dv76DXZ5P7VMuprCYD+cp
 XDPxNdMachiPkv6bczStL/JppvKGiZGTLkMhY2CzJQRpZy4F02OoQPsr7
 P+jOgIWkTkXekAZmm48eoagCsJ/VSfouc8zFLwQctSko4uEU/V1q/Izzx w==;
X-CSE-ConnectionGUID: r851+RjzT1aVDbiF+PlkXg==
X-CSE-MsgGUID: n3k7KEPoTyirSM61jP0YCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65165311"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="65165311"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 20:40:46 -0700
X-CSE-ConnectionGUID: siJlpJyUQAKYipV9Iw66sg==
X-CSE-MsgGUID: 6oU04OxOTQyVObDQSVbSiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="154044609"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 20:40:44 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com, jeevan.b@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_content_protection: Add a test for
 HDCP-MST with suspend resume
Date: Wed,  2 Jul 2025 09:07:50 +0530
Message-Id: <20250702033750.711418-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 51fc1d3be..d17d1702b 100644
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
@@ -479,6 +482,18 @@ static void test_content_protection_on_output(igt_output_t *output,
 						  content_type, false,
 						  false);
 	}
+
+	if (data.cp_tests & SUSPEND_RESUME) {
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+		igt_display_commit2(display, COMMIT_ATOMIC);
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
@@ -813,6 +828,18 @@ test_content_protection_mst(int content_type)
 
 	test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
 
+	if (data.cp_tests & SUSPEND_RESUME) {
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+		igt_display_commit2(display, COMMIT_ATOMIC);
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
 
@@ -833,6 +860,7 @@ test_content_protection_mst(int content_type)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
 }
 
+
 static void test_content_protection_cleanup(void)
 {
 	igt_display_t *display = &data.display;
@@ -941,6 +969,11 @@ static const struct {
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
@@ -969,6 +1002,11 @@ static const struct {
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

