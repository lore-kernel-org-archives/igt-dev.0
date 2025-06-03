Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9DDC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 18:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B33410E5DB;
	Tue,  3 Jun 2025 18:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgeymrbJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A05F10E5DB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 18:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748974021; x=1780510021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=92aBwXCf6snymx9YBp0bg8Vw/VImeHZaBucefmG3HTo=;
 b=jgeymrbJA5L+IYv/ZxxTjRb5VGcSqx59o4ROlT3p3+4WI3gB53HPq9A0
 16YPh0pLsd3tLj0Ud63wlpOE9cKFudeizk0NBcXnYZbPrIgPazYyS0MOa
 k1heWu2AV+HDaYZPne+uiIB47Sd1y2/XUrwk2WkAVH9LPNLENn/492NUN
 oynDSz6KzONaJDHaYZkeV4/6deTuZbVkoco8DynP1ffv3aupxOZ/6GtxC
 9MVMZFHRPxoGhaLcXYiaowlrYzoCjYb3z3XNPg/9psm9yFBd2KeEgVHm4
 nt7ZPfqM6hMPdAuPCIvUfBS7EQZbzvR632bPyDBpPqvVHth7VL2TO+f5P Q==;
X-CSE-ConnectionGUID: 3B8tHL33Q62nV7ogPL6jVA==
X-CSE-MsgGUID: f7rQN/X7TFG8nFHoBPrVeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68463761"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68463761"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:07:01 -0700
X-CSE-ConnectionGUID: e61oIzRsRhKvDI1h9aH10A==
X-CSE-MsgGUID: brEcg+H8Rj2Pk7j6FILiTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145260963"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:06:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Date: Tue,  3 Jun 2025 23:36:03 +0530
Message-Id: <20250603180603.384599-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 97 ++++++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6fe1edbc4..3542b7c64 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -94,6 +94,7 @@ struct data {
 	struct igt_fb red, green;
 	unsigned int cp_tests;
 	struct udev_monitor *uevent_monitor;
+	bool is_force_hdcp14;
 } data;
 
 /* Test flags */
@@ -565,6 +566,51 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
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
@@ -607,8 +653,21 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+			// Run once with force-hdcp14 if requested
+			if (data.is_force_hdcp14) {
+				set_i915_force_hdcp14(output);
+
+				igt_dynamic_f("pipe-%s-%s-force-hdcp14", kmstest_pipe_name(pipe), output->name) {
+					test_content_protection_on_output(output, pipe, commit_style, content_type);
+				}
+
+				reset_i915_force_hdcp14(output);
+				data.is_force_hdcp14 = false;
+			}
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 				test_content_protection_on_output(output, pipe, commit_style, content_type);
+			}
 
 			test_fini(output, commit_style);
 			/*
@@ -671,6 +730,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
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
@@ -704,6 +768,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
 
+	if (data.is_force_hdcp14) {
+		for (count = 0; count < valid_outputs; count++)
+			reset_i915_force_hdcp14(hdcp_mst_output[count]);
+	}
+
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
 }
 
@@ -830,43 +899,52 @@ static void create_fbs(void)
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
 	{ .desc = "Test content protection with atomic modesetting",
 	  .name = "atomic",
 	  .cp_tests = 0,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test content protection with DPMS ON/OFF during atomic modesetting.",
 	  .name = "atomic-dpms",
 	  .cp_tests = CP_DPMS,
-	  .content_type = HDCP_CONTENT_TYPE_0
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test for the integrity of link with type 0 content.",
 	  .name = "lic-type-0",
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
@@ -878,6 +956,7 @@ static const struct {
 	  .name = "uevent",
 	  .cp_tests = CP_UEVENT,
 	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 	/*
 	 *  Testing the revocation check through SRM needs a HDCP sink with
@@ -892,6 +971,7 @@ static const struct {
 	  .name = "srm",
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_0,
+	  .is_force_hdcp14 = true,
 	},
 };
 
@@ -900,26 +980,31 @@ static const struct {
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
+	  .is_force_hdcp14 = true,
 	},
 	{ .desc = "Test Content protection(Type 0) over DP MST with LIC.",
 	  .name = "dp-mst-lic-type-0",
 	  .cp_tests = CP_LIC,
-	  .content_type = HDCP_CONTENT_TYPE_0
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
 
@@ -947,6 +1032,7 @@ igt_main
 
 			igt_subtest_with_dynamic(subtests[i].name) {
 				data.cp_tests = subtests[i].cp_tests;
+				data.is_force_hdcp14 = subtests[i].is_force_hdcp14;
 
 				if (!strcmp(subtests[i].name, "srm")) {
 					bool ret;
@@ -970,6 +1056,7 @@ igt_main
 
 			igt_subtest(mst_subtests[i].name) {
 				data.cp_tests = mst_subtests[i].cp_tests;
+				data.is_force_hdcp14 = mst_subtests[i].is_force_hdcp14;
 				test_content_protection_mst(mst_subtests[i].content_type);
 			}
 		}
-- 
2.34.1

