Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1824DC369D3
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 10:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E5810E683;
	Wed, 23 Apr 2025 10:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OArFvxru";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1B210E683
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745404094; x=1776940094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FOIRhTcSBMgy1BV8LGmZSn7X17FHdqSRlzV0xM/U3MY=;
 b=OArFvxru7eEMPFub/rc7xvFi+E4kU8rTvEq284u1qz0ZPXr2p1/iX0Bz
 dqmNZrpRRCO/pd8POdyhj41W2T8TpRWcLuYHY1n9/+JLHCsqfnfG8KjOR
 UYlLYIfWbowCt89E1u/0xKBnMHxJS6UYVIcTTmuxDKg8V0SOH8Bqk0AmL
 5YI5oTvNn/zps1Kq4fe6YVx7cPAjDmLk+8OnA5EIQp9/5W+8uUVacca9d
 ybSzLywOF73fi9J/RSmaBrgsmK+akjDRlP6bg4famEk8tYm0bFvHImWJg
 uCMAHahAANhFpjereJIKPyzSIgca7BVpHPP8MHP1gMPSI6/7GyONH3GDU g==;
X-CSE-ConnectionGUID: G1aBjyQIS4WMWk/4zy09vA==
X-CSE-MsgGUID: UK/qLD2LT8OASkDhUbeFpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57979792"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="57979792"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 03:28:13 -0700
X-CSE-ConnectionGUID: ti5CzhL3R1W+1rWxOM9igA==
X-CSE-MsgGUID: 38JqrcAaT0SVU8OkOV4BNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137353052"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 03:28:11 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_content_protection: Add force HDCP 1.4
 subtest
Date: Wed, 23 Apr 2025 15:50:36 +0530
Message-Id: <20250423102036.2944399-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 62 ++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6fe1edbc4..aea842bdf 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -63,6 +63,9 @@
  * Description: Test to detect the HDCP status change when we are reading the
  *              uevent sent with the corresponding connector id and property id.
  *
+ * SUBTEST: force-hdcp14
+ * Description: Test to force hdcp1.4 on the connector and verify content protection.
+ *
  * SUBTEST: %s
  * Description: Test content protection with %arg[1]
  *
@@ -102,6 +105,7 @@ struct data {
 #define CP_MEI_RELOAD				(1 << 2)
 #define CP_TYPE_CHANGE				(1 << 3)
 #define CP_UEVENT				(1 << 4)
+#define CP_FORCE14				(1 << 5)
 
 #define CP_UNDESIRED				0
 #define CP_DESIRED				1
@@ -565,6 +569,51 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
 		return true;
 }
 
+static void enable_force_hdcp14(igt_output_t *output)
+{
+	int fd, ret;
+	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
+
+	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
+	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
+
+	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
+	if (ret <= 0) {
+		igt_info("force_hdcp14 not supported\n");
+		close(fd);
+		return;
+	}
+
+	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
+	igt_require_f(ret > 0, "force hdcp is not enabled\n");
+
+	ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf, sizeof(buf));
+	igt_assert_f(ret > 0 && strstr(buf, "yes"),
+			 "force_hdcp14 is not set to 'yes' on %s debugfs\n",
+			 output->name);
+
+	close(fd);
+}
+
+static void disable_force_hdcp14(igt_output_t *output)
+{
+	int fd, ret;
+	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
+
+	fd = igt_debugfs_connector_dir(data.drm_fd, output->name, O_RDONLY);
+	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
+
+	ret = igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
+	igt_require_f(ret > 0, "force hdcp is not disabled\n");
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
@@ -607,9 +656,15 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 
+			if (data.cp_tests & CP_FORCE14)
+				enable_force_hdcp14(output);
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_content_protection_on_output(output, pipe, commit_style, content_type);
 
+			if (data.cp_tests & CP_FORCE14)
+				disable_force_hdcp14(output);
+
 			test_fini(output, commit_style);
 			/*
 			 * Testing a output with a pipe is enough for HDCP
@@ -830,6 +885,8 @@ static void create_fbs(void)
 			    0.f, 1.f, 0.f, &data.green);
 }
 
+
+
 static const struct {
 	const char *desc;
 	const char *name;
@@ -893,6 +950,11 @@ static const struct {
 	  .cp_tests = 0,
 	  .content_type = HDCP_CONTENT_TYPE_0,
 	},
+	{ .desc = "This test forces hdcp1.4 and tests the content protection.",
+	  .name = "force-hdcp14",
+	  .cp_tests = CP_FORCE14,
+	  .content_type = HDCP_CONTENT_TYPE_0,
+	},
 };
 
 static const struct {
-- 
2.34.1

