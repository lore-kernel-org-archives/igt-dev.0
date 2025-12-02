Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC46CFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 05:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D309B10E51E;
	Tue,  2 Dec 2025 05:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLpW1m48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5D610E51E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 05:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764651680; x=1796187680;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=24sC6zUZPxI83AeLo4PX/uxdRYut2NAuSyLRooxlE9U=;
 b=NLpW1m484vAPLUaftjtkZrv+k8sM7Jqvkk4bK4T5jwHwvgeEhb6iWFTu
 vvu6Pm7yw4gamwr7w1krAXok6RPXMGQi/ZZWIhVvRs5YRvMNGXM06W9S0
 KcqZcBw30ImINXoYvgNnS0SZ5cBYPDV2NGcqKJnYlE8R/2R+2WracPdgV
 xMh0FPahp3J9TeFG8hNBRf3fIVmqcZElvN5ESpmGWT7BgmSLjpH5MntPN
 237MZPt1Y2CAuPUnaRCcQSlUcei9bpwiB3JaQukf5KTuHd9Txy0SNJMfH
 ZM7Eb7BVn5oRy4OLkD0SGYfuSnhYY/r6SDN3WqeXy40OSslQ1MTCS1XJi Q==;
X-CSE-ConnectionGUID: d81knPobRBiUKfAZ4TdVng==
X-CSE-MsgGUID: NsutHm/zT6SH8+nmxrT9ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76928333"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="76928333"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 21:01:19 -0800
X-CSE-ConnectionGUID: ztlColUjTyqArlJ0YtFvCg==
X-CSE-MsgGUID: 4W4EPvdbQRas5zAmbRp3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="198734025"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 21:01:17 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Date: Tue,  2 Dec 2025 10:23:53 +0530
Message-Id: <20251202045353.1026778-1-santhosh.reddy.guddati@intel.com>
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

If a Panel supports both HDCP1.4 and HDCP2.2 versions, the kernel will
always choose the HDCP2.2 protection path and if this fails, then
HDCP1.4 will be tried.

The subtest uses debugfs support to force hdcp1.4 on the connector and
verify content protection.

V2: Use hdcp14 debugfs for all the supported subtests (Suraj).

v3: Create new separate subtests for hdcp1.4 and hdcp2.2 for all the
supported tests. (Suraj)

v4: Add -hdcp14 suffix for subtests only for cases explicitly
forcing hdcp1.4, retain original subtest names (eg atomic, type1)
for default behaviour. (Suraj)

v5: Add missing lic-type-0 subtest (Suraj)

v6: Rebase

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 144 ++++++++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 4 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 575426e88..caf79e2ac 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -46,6 +46,9 @@
  * SUBTEST: lic-type-0
  * Description: Test for the integrity of link for type-0 content.
  *
+ * SUBTEST: lic-type-0-hdcp14
+ * Description: Test for the integrity of link for type-0 content with HDCP1.4.
+ *
  * SUBTEST: lic-type-1
  * Description: Test for the integrity of link for type-1 content.
  *
@@ -65,6 +68,11 @@
  * Description: Test to detect the HDCP status change when we are reading the
  *              uevent sent with the corresponding connector id and property id.
  *
+ * SUBTEST: uevent-hdcp14
+ * Description: Test to detect the status change when we are reading the
+ *              uevent sent with the corresponding connector id and property id
+ *              with HDCP1.4 content protection.
+ *
  * SUBTEST: %s
  * Description: Test content protection with %arg[1]
  *
@@ -75,6 +83,10 @@
  * @legacy:         legacy style commit
  * @type1:          content type 1 that can be handled only through HDCP2.2.
  * @suspend-resume: Suspend and resume the system
+ * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style commit.
+ * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic modesetting.
+ * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic modesetting and DPMS.
+ *
  */
 
 /**
@@ -84,8 +96,10 @@
  * arg[1]:
  *
  * @lic-type-0:   Type 0 with LIC
+ * @lic-type-0-hdcp14: Type 0 with LIC and HDCP1.4
  * @lic-type-1:   Type 1 with LIC.
  * @type-0:       Type 0
+ * @type-0-hdcp14: Type 0 with HDCP1.4
  * @type-1:       Type 1
  * @suspend-resume: Suspend and resume the system
  */
@@ -98,6 +112,7 @@ struct data {
 	struct igt_fb red, green;
 	unsigned int cp_tests;
 	struct udev_monitor *uevent_monitor;
+	bool is_force_hdcp14;
 } data;
 
 /* Test flags */
@@ -600,6 +615,51 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
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
@@ -677,10 +737,15 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 				continue;
 
 			modeset_with_fb(pipe, output, commit_style);
+			if (data.is_force_hdcp14)
+				set_i915_force_hdcp14(output);
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_content_protection_on_output(output, pipe, commit_style, content_type);
 
+			if (data.is_force_hdcp14)
+				reset_i915_force_hdcp14(output);
+
 			test_fini(output, commit_style);
 			/*
 			 * Testing a output with a pipe is enough for HDCP
@@ -742,6 +807,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
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
@@ -775,6 +845,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
 
+	if (data.is_force_hdcp14) {
+		for (count = 0; count < valid_outputs; count++)
+			reset_i915_force_hdcp14(hdcp_mst_output[count]);
+	}
+
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
 }
 
@@ -918,38 +993,63 @@ static const struct {
 	const char *name;
 	unsigned int cp_tests;
 	bool content_type;
+	bool is_force_hdcp14;
 } subtests[] = {
+	{ .desc = "Test content protection with atomic modesetting with HDCP1.4.",
+	  .name = "atomic-hdcp14",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
 	{ .desc = "Test content protection with atomic modesetting",
 	  .name = "atomic",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = false,
+	},
+	{ .desc = "Test content protection with DPMS ON/OFF during "
+		  "atomic modesetting with HDCP1.4.",
+	  .name = "atomic-dpms-hdcp14",
+	  .cp_tests = CP_DPMS,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
 	  .name = "atomic-dpms",
 	  .cp_tests = CP_DPMS,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test for the integrity of link with type 0 content.",
 	  .name = "lic-type-0",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	},
+	{ .desc = "Test for the integrity of link with type 0 content.",
+	  .name = "lic-type-0-hdcp14",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
 	{ .desc = "Test for the integrity of link with type 1 content",
 	  .name = "lic-type-1",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test content protection with content type 1 "
 		  "that can be handled only through HDCP2.2.",
 	  .name = "type1",
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
@@ -961,6 +1061,14 @@ static const struct {
 	  .name = "uevent",
 	  .cp_tests = CP_UEVENT,
 	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = false,
+	},
+	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
+		  "sent with the corresponding connector id and property id.",
+	  .name = "uevent-hdcp14",
+	  .cp_tests = CP_UEVENT,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	/*
 	 *  Testing the revocation check through SRM needs a HDCP sink with
@@ -975,6 +1083,7 @@ static const struct {
 	  .name = "srm",
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = false,
 	},
 	{.desc = "Test to verify the behaviour of HDCP after suspend resume cycles.",
 	 .name = "suspend-resume",
@@ -988,26 +1097,43 @@ static const struct {
 	const char *name;
 	unsigned int cp_tests;
 	bool content_type;
+	bool is_force_hdcp14;
 } mst_subtests[] = {
 	{ .desc = "Test Content protection(Type 0) over DP MST.",
 	  .name = "dp-mst-type-0",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = false,
+	},
+	{ .desc = "Test Content protection(Type 0) over DP MST with HDCP1.4.",
+	  .name = "dp-mst-type-0-hdcp14",
+	  .cp_tests = 0,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
 	  .name = "dp-mst-lic-type-0",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = false,
+	},
+	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
+	  .name = "dp-mst-lic-type-0-hdcp14",
+	  .cp_tests = CP_LIC,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST.",
 	  .name = "dp-mst-type-1",
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST with LIC.",
 	  .name = "dp-mst-lic-type-1",
 	  .cp_tests = CP_LIC,
 	  .content_type = HDCP_CONTENT_TYPE_1,
+	  .is_force_hdcp14 = false,
 	},
 	{ .desc = "Test Content protection(Type 1) over DP MST with suspend resume.",
 	  .name = "dp-mst-suspend-resume",
@@ -1028,6 +1154,14 @@ igt_main
 	igt_describe("Test content protection with legacy style commit.");
 	igt_subtest_with_dynamic("legacy") {
 		data.cp_tests = 0;
+		data.is_force_hdcp14 = false;
+		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
+	}
+
+	igt_describe("Test content protection with legacy style commit with HDCP1.4");
+	igt_subtest_with_dynamic("legacy-hdcp14") {
+		data.cp_tests = 0;
+		data.is_force_hdcp14 = true;
 		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
 	}
 
@@ -1040,6 +1174,7 @@ igt_main
 
 			igt_subtest_with_dynamic(subtests[i].name) {
 				data.cp_tests = subtests[i].cp_tests;
+				data.is_force_hdcp14 = subtests[i].is_force_hdcp14;
 
 				if (!strcmp(subtests[i].name, "srm")) {
 					bool ret;
@@ -1063,6 +1198,7 @@ igt_main
 
 			igt_subtest(mst_subtests[i].name) {
 				data.cp_tests = mst_subtests[i].cp_tests;
+				data.is_force_hdcp14 = mst_subtests[i].is_force_hdcp14;
 				test_content_protection_mst(mst_subtests[i].content_type);
 			}
 		}
-- 
2.34.1

