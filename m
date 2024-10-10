Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AFFCF07B6
	for <igt-dev@archiver.kernel.org>; Thu, 10 Oct 2024 06:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0CB10E87B;
	Thu, 10 Oct 2024 06:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLM2Dps7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF8910E87B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2024 06:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728543522; x=1760079522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E0a4S6RhkxRdKuJ+fkHyUJHidEQ81YYAa4Ai9SIRJrk=;
 b=GLM2Dps7sNCBWGkUsapggqPwJpfvuo0tP+XE0LLaD6DJlwdYznykJsxk
 k1EnaE3F6rYG08oOdrGNwjAEFHcUe4pmoR1wJNrmj2Wny2x7Yfhu7UZm0
 pIQ9ZPh8ulxVnQQgjPBY5wR0orNvMB+fgTRhi9XYsIXRrJ574d0q5mo5/
 RhLA2n+qUKpBNR9zciiIyGXllGqyTO2OVfrfvbcBxeACErOUmv36TWNA6
 XrIVIA5YPTx+2nDi9HvEzg5cZ/GkrmCqqAnR5Jw2N1w3GfvX+EU1nLyW5
 D8KzTPMqx5LqSW15n1Jnfim8YF0/AS/SEWCUcKgcP+knIitZo2x0lpEQE w==;
X-CSE-ConnectionGUID: VEKBVvZzR+Wf2kHR3+D+eQ==
X-CSE-MsgGUID: IwIOoW/eS4SL0lCTDGc4GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31779338"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="31779338"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 23:58:42 -0700
X-CSE-ConnectionGUID: ttn99kkTTBWbK1Y6Siz5xg==
X-CSE-MsgGUID: GTmwdoicRq+JiaPMUHUyEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76104079"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 23:58:39 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com,
	vinay.belgaumkar@intel.com
Subject: [i-g-t, v2,
 1/2] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Thu, 10 Oct 2024 12:23:11 +0530
Message-Id: <20241010065312.1988533-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010065312.1988533-1-sk.anirban@intel.com>
References: <20241010065312.1988533-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Implement test test-cpg-basic to validate coarse power gating status
using a suspend cycle.
Add test toggle-gt-cpg to check if GT coarse power gating is up when
forcewake is acquired and down when released.

v2: Address cosmetic review comments (Riana)
    Fix suspend state (Riana)
    Add exit handler for this test toggle_gt_cpg (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm_residency.c | 98 +++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 772fe9b57..54a8c62f7 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -63,6 +63,12 @@ enum test_type {
  * SUBTEST: toggle-gt-c6
  * Description: toggles GT C states by acquiring/releasing forcewake,
  *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
+ *
+ * SUBTEST: cpg-basic
+ * Description: Validate GT coarse power gating status with a suspend cycle.
+ *
+ * SUBTEST: toggle-gt-cpg
+ * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
@@ -317,6 +323,87 @@ static void toggle_gt_c6(int fd, int n)
 			     "Power consumed in GT C6 should be lower than GT C0\n");
 }
 
+#define RENDER_POWER_GATING "Render Power Gating Enabled: "
+#define MEDIA_POWER_GATING "Media Power Gating Enabled: "
+#define POWER_GATE_STATUS "Power Gate Status: "
+
+static void powergate_info(int fd, int gt)
+{
+	int dir;
+	char *str;
+	char *render_substr;
+	char *media_substr;
+
+	dir = igt_debugfs_gt_dir(fd, gt);
+	igt_assert(dir >= 0);
+
+	str = igt_sysfs_get(dir, "powergate_info");
+	igt_assert_f(str, "Failed to read sysfs attribute\n");
+	render_substr = strstr(str, RENDER_POWER_GATING);
+	if (render_substr) {
+		igt_assert_f(strncmp(render_substr + strlen(RENDER_POWER_GATING), "yes", 3) == 0,
+			     "Render Power Gating should be enabled");
+	}
+
+	media_substr = strstr(str, MEDIA_POWER_GATING);
+	if (media_substr) {
+		igt_assert_f(strncmp(media_substr + strlen(MEDIA_POWER_GATING), "yes", 3) == 0,
+			     "Media Power Gating should be enabled");
+	}
+
+	free(str);
+	close(dir);
+}
+
+
+static void powergate_status(int fd, int gt, const char *expected_status)
+{
+	int dir;
+	char *str;
+	char *status_substr;
+
+	dir = igt_debugfs_gt_dir(fd, gt);
+	igt_assert(dir >= 0);
+
+	str = igt_sysfs_get(dir, "powergate_info");
+	igt_assert_f(str, "Failed to read sysfs attribute\n");
+	status_substr = strstr(str, POWER_GATE_STATUS);
+	while (status_substr) {
+		igt_assert_f((strncmp(status_substr + strlen(POWER_GATE_STATUS), expected_status,
+		strlen(expected_status)) == 0), "Power Gate Status Should be %s\n %s\n",
+		expected_status, str);
+
+		status_substr = strstr(status_substr + strlen(POWER_GATE_STATUS),
+		POWER_GATE_STATUS);
+	}
+	close(dir);
+}
+
+static void cpg_basic(int fd, int gt)
+{
+	powergate_info(fd, gt);
+	igt_system_suspend_autoresume(SUSPEND_STATE_S3, SUSPEND_TEST_NONE);
+	powergate_info(fd, gt);
+}
+
+static void toggle_gt_cpg(int fd)
+{
+	int gt;
+
+	xe_for_each_gt(fd, gt)
+		powergate_info(fd, gt);
+
+	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+	igt_assert_lte(0, fw_handle);
+	xe_for_each_gt(fd, gt)
+		powergate_status(fd, gt, "up");
+
+	close(fw_handle);
+	sleep(1);
+	xe_for_each_gt(fd, gt)
+		powergate_status(fd, gt, "down");
+}
+
 igt_main
 {
 	uint32_t d3cold_allowed;
@@ -380,6 +467,17 @@ igt_main
 		toggle_gt_c6(fd, NUM_REPS);
 	}
 
+	igt_describe("Validate Coarse power gating status during suspend cycle");
+	igt_subtest("cpg-basic")
+		xe_for_each_gt(fd, gt)
+			cpg_basic(fd, gt);
+
+	igt_describe("Toggle GT coarse power gating states by managing forcewake");
+	igt_subtest("toggle-gt-cpg") {
+		igt_install_exit_handler(close_fw_handle);
+		toggle_gt_cpg(fd);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.34.1

