Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCC7C83F0A
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 15:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3502010E109;
	Wed,  9 Jul 2025 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYtXSkjL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCDF10E109
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752074578; x=1783610578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fbspjk80S3cJMMdWZTWU9sZ9WdBempC2YodOOIDrNzE=;
 b=OYtXSkjLgBJHoz0kenw9VQw+oKmw4IHi+R288AlJugRnvEGikkk2/D6r
 GMhkF/Cn0Fo4krqhJWcDabXjv6wgIBOjcRKiiaElaOaw1WFmaSVhRPckF
 fdHeMLnERiBbuW7UdCGNxT6TQJyS1iXZb2ma+sM2WWTt2YyKnPyTMlLwl
 7a8SytsrQKxKpdCixhFSWEzZSomfMBmpqSk8tdtoi7GK8sCWCTJrfyOiF
 1YAeysyZtNmrRrD98+QF0ZIFFHBlbJTAaBI1b2yKsTaN3Has7Bhf6wxmw
 v8rw8Q3iFLVdfI44wBH4wr8xZAV5T1bAprvr34rA0mWiBnbLdjX4yaB7x A==;
X-CSE-ConnectionGUID: Jr4LmFDERQG9xZQgKmO1Qw==
X-CSE-MsgGUID: 9wAip9BURqyvek4yOI3zEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54268096"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54268096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 08:22:58 -0700
X-CSE-ConnectionGUID: 2uva1dSUTYSIQrAYbLeXQg==
X-CSE-MsgGUID: 1U3l0C3oRiGl4TAdwGarmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155440962"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 08:22:56 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com, jeevan.b@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Date: Wed,  9 Jul 2025 20:49:30 +0530
Message-Id: <20250709151930.1034205-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 154 ++++++++++++++++++++++++++++++---
 1 file changed, 142 insertions(+), 12 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 51fc1d3be..4fa5d2c20 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -43,8 +43,8 @@
 #include "igt_panel.h"
 
 /**
- * SUBTEST: lic-type-0
- * Description: Test for the integrity of link for type-0 content.
+ * SUBTEST: lic-type-0-hdcp14
+ * Description: Test for the integrity of link for type-0 content with HDCP1.4.
  *
  * SUBTEST: lic-type-1
  * Description: Test for the integrity of link for type-1 content.
@@ -65,6 +65,11 @@
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
@@ -74,6 +79,10 @@
  * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
  * @legacy:         legacy style commit
  * @type1:          content type 1 that can be handled only through HDCP2.2.
+ * @legacy-hdcp14:  Test HDCP1.4 content protection with legacy style commit.
+ * @atomic-hdcp14:  Test HDCP1.4 content protection with atomic modesetting.
+ * @atomic-dpms-hdcp14: Test HDCP1.4 content protection with atomic modesetting and DPMS.
+ *
  */
 
 /**
@@ -83,8 +92,10 @@
  * arg[1]:
  *
  * @lic-type-0:   Type 0 with LIC
+ * @lic-type-0-hdcp14: Type 0 with LIC and HDCP1.4
  * @lic-type-1:   Type 1 with LIC.
  * @type-0:       Type 0
+ * @type-0-hdcp14: Type 0 with HDCP1.4
  * @type-1:       Type 1
  */
 
@@ -96,6 +107,7 @@ struct data {
 	struct igt_fb red, green;
 	unsigned int cp_tests;
 	struct udev_monitor *uevent_monitor;
+	bool is_force_hdcp14;
 } data;
 
 /* Test flags */
@@ -581,6 +593,51 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
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
@@ -654,10 +711,15 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 					  output->name);
 				continue;
 			}
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
@@ -719,6 +781,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
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
@@ -752,6 +819,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
 
+	if (data.is_force_hdcp14) {
+		for (count = 0; count < valid_outputs; count++)
+			reset_i915_force_hdcp14(hdcp_mst_output[count]);
+	}
+
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
 }
 
@@ -878,54 +950,84 @@ static void create_fbs(void)
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
 	},
-	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
+	{ .desc = "Test content protection with DPMS ON/OFF during "
+		  "atomic modesetting with HDCP1.4.",
+	  .name = "atomic-dpms-hdcp14",
+	  .cp_tests = CP_DPMS,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
+	},
+	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting",
 	  .name = "atomic-dpms",
 	  .cp_tests = CP_DPMS,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
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
 	  .cp_tests = CP_TYPE_CHANGE,
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	},
-	{ .desc = "Test to detect the HDCP status change when we are reading the uevent "
+	{.desc = "Test to detect the HDCP status change when we are reading the uevent "
 		  "sent with the corresponding connector id and property id.",
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
@@ -940,6 +1042,7 @@ static const struct {
 	  .name = "srm",
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 };
 
@@ -948,26 +1051,43 @@ static const struct {
 	const char *name;
 	unsigned int cp_tests;
 	bool content_type;
+	bool is_force_hdcp14;
 } mst_subtests[] = {
-	{ .desc = "Test Content protection(Type 0) over DP MST.",
+	{ .desc = "Test Content protection(Type 0) over DP MST",
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
 };
 
@@ -980,12 +1100,20 @@ igt_main
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
+	igt_subtest_with_dynamic("legacy") {
+		data.cp_tests = 0;
+		data.is_force_hdcp14 = false;
+		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_1);
+	}
+
 	igt_subtest_group {
 		igt_fixture
 			igt_require(data.display.is_atomic);
@@ -995,6 +1123,7 @@ igt_main
 
 			igt_subtest_with_dynamic(subtests[i].name) {
 				data.cp_tests = subtests[i].cp_tests;
+				data.is_force_hdcp14 = subtests[i].is_force_hdcp14;
 
 				if (!strcmp(subtests[i].name, "srm")) {
 					bool ret;
@@ -1018,6 +1147,7 @@ igt_main
 
 			igt_subtest(mst_subtests[i].name) {
 				data.cp_tests = mst_subtests[i].cp_tests;
+				data.is_force_hdcp14 = mst_subtests[i].is_force_hdcp14;
 				test_content_protection_mst(mst_subtests[i].content_type);
 			}
 		}
-- 
2.34.1

