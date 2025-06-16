Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54031C71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 08:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DD610E2E4;
	Mon, 16 Jun 2025 08:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BF/Gmxpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7280610E2E4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750063414; x=1781599414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lw1FATU9xIJDOiuHfxRzvc8TjrkLDxZ3FWXNUNph0k=;
 b=BF/GmxpdvFjl1z2182bWzf6ukLpwMhViJEgI3eaXvnc5gvGYYTdMO8cp
 SY8UX0BxED7cRVRH1OEn4TO5X1nV9f+3DKI/8kwpS7zX+HVqiKQXcj1Ds
 AT+0wkdGVgqgTTwY+qUxQPRHXSE/2SbotpfytQxBS3pr2AHEgxfJpUDrR
 S/BMO1tRBCRgrnk3/dz7sa22AjXIfZnJrwaumMBTuV7iTGEhB7MdlAcK1
 xx2+Y4SRJOLbBpT1sl8ycdAMd+4sSl3O6Zbkxh6gGwJPEBnJE7laznc2Z
 xNWoFitJpWP+tOpDv8cG5y+8Wiwx2yVxUTbcK0p6Dr6wY6W18zzmDbfmY w==;
X-CSE-ConnectionGUID: hWwqaXTORuGamGOc6uFg5g==
X-CSE-MsgGUID: uJhCaF1VTtCKqGACQCuvrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52343762"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52343762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:43:34 -0700
X-CSE-ConnectionGUID: 8izChn7sTvOtkVX2cIJYHw==
X-CSE-MsgGUID: N5GW6TKDRG+IsSvdmj/uCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153709215"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:43:32 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_content_protection: Add force HDCP 1.4 subtest
Date: Mon, 16 Jun 2025 14:11:44 +0530
Message-Id: <20250616084144.472146-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423102036.2944399-1-santhosh.reddy.guddati@intel.com>
References: <20250423102036.2944399-1-santhosh.reddy.guddati@intel.com>
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

If a Panel supports both HDCP1.4 and HDCP2.2 versions, the kernel will
always choose the HDCP2.2 protection path and if this fails, then
HDCP1.4 will be tried.

The subtest uses debugfs support to force hdcp1.4 on the connector and
verify content protection.

V2: Use hdcp14 debugfs for all the supported subtests (Suraj).

v3: Create new separate subtests for hdcp1.4 and hdcp2.2 for all the
supported tests. (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 247 ++++++++++++++++++++++++---------
 1 file changed, 182 insertions(+), 65 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index b0d0b0234..a1f07497c 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -28,6 +28,61 @@
  * Description: Test content protection (HDCP)
  * Driver requirement: i915, xe
  * Mega feature: HDCP
+ *
+ * SUBTEST: legacy-hdcp14
+ * Description: Test content protection with legacy style commit with HDCP1.4.
+ *
+ * SUBTEST: legacy-hdcp22
+ * Description: Test content protection with legacy style commit with HDCP2.2.
+ *
+ * SUBTEST: atomic-hdcp14
+ * Description: Test content protection with atomic modesetting with HDCP1.4.
+ *
+ * SUBTEST: atomic-hdcp22
+ * Description: Test content protection with atomic modesetting with HDCP2.2.
+ *
+ * SUBTEST: atomic-dpms-hdcp14
+ * Description: Test content protection with DPMS ON/OFF during atomic modesetting with HDCP1.4.
+ *
+ * SUBTEST: atomic-dpms-hdcp22
+ * Description: Test content protection with DPMS ON/OFF during atomic modesetting with HDCP2.2.
+ *
+ * SUBTEST: lic-type-0-hdcp14
+ * Description: Test for the integrity of link with type 0 content using HDCP1.4.
+ *
+ * SUBTEST: lic-type-1-hdcp22
+ * Description: Test for the integrity of link with type 1 content using HDCP2.2.
+ *
+ * SUBTEST: type1-hdcp22
+ * Description: Test content protection with content type 1 through HDCP2.2.
+ *
+ * SUBTEST: mei-interface
+ * Description: Test the teardown and rebuild of the interface between Intel and mei hdcp.
+ *
+ * SUBTEST: content-type-change
+ * Description: Test the content type change when the content protection already enabled.
+ *
+ * SUBTEST: uevent-hdcp-14
+ * Description: Test to detect the HDCP status change when reading the uevent for HDCP1.4.
+ *
+ * SUBTEST: uevent-hdcp-22
+ * Description: Test to detect the HDCP status change when reading the uevent for HDCP2.2.
+ *
+ * SUBTEST: srm
+ * Description: This test writes the facsimile SRM into the /lib/firmware/
+ * and checks kernel parsing by invoking hdcp authentication.
+ *
+ * SUBTEST: dp-mst-type-0-hdcp14
+ * Description: Test Content protection(Type 0) over DP MST with HDCP1.4.
+ *
+ * SUBTEST: dp-mst-type-1-hdcp22
+ * Description: Test Content protection(Type 1) over DP MST with HDCP2.2.
+ *
+ * SUBTEST: dp-mst-lic-type-0-hdcp14
+ * Description: Test Content protection(Type 0) over DP MST with LIC and HDCP1.4.
+ *
+ * SUBTEST: dp-mst-lic-type-1-hdcp22
+ * Description: Test Content protection(Type 1) over DP MST with LIC and HDCP2.2.
  */
 
 #include <poll.h>
@@ -42,52 +97,6 @@
 #include "igt_kmod.h"
 #include "igt_panel.h"
 
-/**
- * SUBTEST: lic-type-0
- * Description: Test for the integrity of link for type-0 content.
- *
- * SUBTEST: lic-type-1
- * Description: Test for the integrity of link for type-1 content.
- *
- * SUBTEST: content-type-change
- * Description: Test the content type change when the content protection already
- *              enabled
- *
- * SUBTEST: mei-interface
- * Description: Test the teardown and rebuild of the interface between Intel
- *              and mei hdcp.
- *
- * SUBTEST: srm
- * Description: This test writes the facsimile SRM into the /lib/firmware/ and
- *              check the kernel parsing of it by invoking the hdcp authentication.
- *
- * SUBTEST: uevent
- * Description: Test to detect the HDCP status change when we are reading the
- *              uevent sent with the corresponding connector id and property id.
- *
- * SUBTEST: %s
- * Description: Test content protection with %arg[1]
- *
- * arg[1]:
- *
- * @atomic:         atomic modesetting
- * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
- * @legacy:         legacy style commit
- * @type1:          content type 1 that can be handled only through HDCP2.2.
- */
-
-/**
- * SUBTEST: dp-mst-%s
- * Description: Test Content protection %arg[1] over DP MST.
- *
- * arg[1]:
- *
- * @lic-type-0:   Type 0 with LIC
- * @lic-type-1:   Type 1 with LIC.
- * @type-0:       Type 0
- * @type-1:       Type 1
- */
-
 IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
 
 struct data {
@@ -96,6 +105,7 @@ struct data {
 	struct igt_fb red, green;
 	unsigned int cp_tests;
 	struct udev_monitor *uevent_monitor;
+	bool is_force_hdcp14;
 } data;
 
 /* Test flags */
@@ -581,6 +591,51 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
 		return true;
 }
 
+static void set_i915_force_hdcp14(igt_output_t *output)
+{
+	int fd, ret;
+	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
+
+	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
+	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
+
+	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
+	if (ret <= 0) {
+		igt_info("i915_force_hdcp14 not supported\n");
+		close(fd);
+		return;
+	}
+
+	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
+	igt_require_f(ret > 0, "i915_force_hdcp14 is not enabled\n");
+
+	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
+	igt_assert_f(ret > 0 && strstr(buf, "yes"),
+			 "i915_force_hdcp14 is not set to 'yes' on %s debugfs\n",
+			 output->name);
+
+	close(fd);
+}
+
+static void reset_i915_force_hdcp14(igt_output_t *output)
+{
+	int fd, ret;
+	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
+
+	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
+	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
+
+	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
+	igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
+
+	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
+	igt_assert_f(ret > 0 && strstr(buf, "no"),
+			 "i915_force_hdcp14 is not set to 'no' on %s debugfs\n",
+			 "i915_force_hdcp14");
+
+	close(fd);
+}
+
 static void
 test_fini(igt_output_t *output, enum igt_commit_style commit_style)
 {
@@ -652,9 +707,15 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 
+			if (data.is_force_hdcp14)
+				set_i915_force_hdcp14(output);
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_content_protection_on_output(output, pipe, commit_style, content_type);
 
+			if (data.is_force_hdcp14)
+				reset_i915_force_hdcp14(output);
+
 			test_fini(output, commit_style);
 			/*
 			 * Testing a output with a pipe is enough for HDCP
@@ -716,6 +777,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 	int retry_orig = retries, count, i;
 	bool ret;
 
+	if (data.is_force_hdcp14) {
+		for (count = 0; count < valid_outputs; count++)
+			set_i915_force_hdcp14(hdcp_mst_output[count]);
+	}
+
 	do {
 		if (retry_orig != retries)
 			test_mst_cp_disable(hdcp_mst_output, COMMIT_ATOMIC, valid_outputs);
@@ -749,6 +815,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
 
+	if (data.is_force_hdcp14) {
+		for (count = 0; count < valid_outputs; count++)
+			reset_i915_force_hdcp14(hdcp_mst_output[count]);
+	}
+
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
 }
 
@@ -875,43 +946,65 @@ static void create_fbs(void)
 			    0.f, 1.f, 0.f, &data.green);
 }
 
+
+
 static const struct {
 	const char *desc;
 	const char *name;
 	unsigned int cp_tests;
 	bool content_type;
+	bool is_force_hdcp14;
 } subtests[] = {
-	{ .desc = "Test content protection with atomic modesetting",
-	  .name = "atomic",
+	{ .desc = "Test content protection with atomic modesetting with HDCP1.4.",
+	  .name = "atomic-hdcp14",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
+	{ .desc = "Test content protection with atomic modesetting HDCP2.2 with HDCP2.2.",
+	  .name = "atomic-hdcp22",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
+	},
+	{ .desc = "Test content protection with DPMS ON/OFF during "
+		  "atomic modesetting with HDCP1.4.",
+	  .name = "atomic-dpms-hdcp14",
+	  .cp_tests = CP_DPMS,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
-	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
-	  .name = "atomic-dpms",
+	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting and HDCP2.2.",
+	  .name = "atomic-dpms-hdcp22",
 	  .cp_tests = CP_DPMS,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test for the integrity of link with type 0 content.",
-	  .name = "lic-type-0",
+	  .name = "lic-type-0-hdcp14",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test for the integrity of link with type 1 content",
-	  .name = "lic-type-1",
+	  .name = "lic-type-1-hdcp22",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test content protection with content type 1 "
 		  "that can be handled only through HDCP2.2.",
-	  .name = "type1",
+	  .name = "type1-hdcp22",
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test the teardown and rebuild of the interface between "
 		  "Intel and mei hdcp.",
 	  .name = "mei-interface",
 	  .cp_tests = CP_MEI_RELOAD,
 	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test the content type change when the content protection already enabled",
 	  .name = "content-type-change",
@@ -920,9 +1013,17 @@ static const struct {
 	},
 	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
 		  "sent with the corresponding connector id and property id.",
-	  .name = "uevent",
+	  .name = "uevent-hdcp-14",
 	  .cp_tests = CP_UEVENT,
 	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
+	{.desc = "Test to detect the HDCP status change when we are reading the uevent "
+		  "sent with the corresponding connector id and property id.",
+	  .name = "uevent-hdcp-22",
+	  .cp_tests = CP_UEVENT,
+	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	/*
 	 *  Testing the revocation check through SRM needs a HDCP sink with
@@ -937,6 +1038,7 @@ static const struct {
 	  .name = "srm",
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 };
 
@@ -945,26 +1047,31 @@ static const struct {
 	const char *name;
 	unsigned int cp_tests;
 	bool content_type;
+	bool is_force_hdcp14;
 } mst_subtests[] = {
-	{ .desc = "Test Content protection(Type 0) over DP MST.",
-	  .name = "dp-mst-type-0",
+	{ .desc = "Test Content protection(Type 0) over DP MST with HDCP1.4.",
+	  .name = "dp-mst-type-0-hdcp14",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
-	  .name = "dp-mst-lic-type-0",
+	  .name = "dp-mst-lic-type-0-hdcp14",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST.",
-	  .name = "dp-mst-type-1",
+	  .name = "dp-mst-type-1-hdcp22",
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
-	  .name = "dp-mst-lic-type-1",
+	  .name = "dp-mst-lic-type-1-hdcp22",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 };
 
@@ -977,12 +1084,20 @@ igt_main
 		create_fbs();
 	}
 
-	igt_describe("Test content protection with legacy style commit.");
-	igt_subtest_with_dynamic("legacy") {
+	igt_describe("Test content protection with legacy style commit with HDCP1.4");
+	igt_subtest_with_dynamic("legacy-hdcp14") {
 		data.cp_tests = 0;
+		data.is_force_hdcp14 = true;
 		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test content protection with legacy style commit with HDCP2.2");
+	igt_subtest_with_dynamic("legacy-hdcp22") {
+		data.cp_tests = 0;
+		data.is_force_hdcp14 = false;
+		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_1);
+	}
+
 	igt_subtest_group {
 		igt_fixture
 			igt_require(data.display.is_atomic);
@@ -992,6 +1107,7 @@ igt_main
 
 			igt_subtest_with_dynamic(subtests[i].name) {
 				data.cp_tests = subtests[i].cp_tests;
+				data.is_force_hdcp14 = subtests[i].is_force_hdcp14;
 
 				if (!strcmp(subtests[i].name, "srm")) {
 					bool ret;
@@ -1015,6 +1131,7 @@ igt_main
 
 			igt_subtest(mst_subtests[i].name) {
 				data.cp_tests = mst_subtests[i].cp_tests;
+				data.is_force_hdcp14 = mst_subtests[i].is_force_hdcp14;
 				test_content_protection_mst(mst_subtests[i].content_type);
 			}
 		}
-- 
2.34.1

