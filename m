Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3129CCEE33F
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 18:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F9010E7C3;
	Wed,  9 Oct 2024 18:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWYRRMkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EE110E7C3
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728498998; x=1760034998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XqImmt3EelUjeON3F6jvbNk0RcGBQ5jrgPLZm4VtT8M=;
 b=lWYRRMkUuB9Ti1zHeTWKGA7azo/HSxVacgpghWfDWMUxkZ9ovponM35g
 eGCbdEuvlU09dLJDCQpu2ir+11UrNtFUrgTw8gYpWBxA9bceA20PFz6BI
 2AdcdoZ6WIiQ5Mtyds1hDt7F1/Bw0AxLoRQ7i+4KeSP3mft1nTNpTsU2t
 G2yeekWPk3BuWwMkitsc0aSFrLO5zAuIeQS722DyLMOPwviZL0EIQ/gZT
 9c3NjTEder3f9AL+EjsKVroLGoacWzMkmkROWOjGRr8ngiBRoRGpQRHuk
 bRuDUnPyWa/icfUdzHagsZrfgzAJRc48Ss3dwTluMdmTF72bL/lSEqIH4 Q==;
X-CSE-ConnectionGUID: ta/7qdQERO2KbiUpPmrv0g==
X-CSE-MsgGUID: 0aAN0tYeRNOWeWlhnQOTuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27939819"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27939819"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:36:37 -0700
X-CSE-ConnectionGUID: ucsdu8mPQR2SRtyr7VdtZA==
X-CSE-MsgGUID: AU0d4RCGRneQy6AbhDhrTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="80342382"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:36:34 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com,
	badal.nilawar@intel.com
Subject: [PATCH i-g-t] tests/xe: Add tests to validate GT coarse power gating
 status and toggle coarse power gating states
Date: Thu, 10 Oct 2024 00:01:15 +0530
Message-Id: <20241009183115.1981713-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Implement test test-cpg-basic to validate coarse power gating status
using a suspend cycle.
Add test toggle-gt-cpg to check if GT coarse power gating is up when
forcewake is acquired and down when released.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm_residency.c | 104 ++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 772fe9b57..4245ea877 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -40,6 +40,7 @@ int fw_handle = -1;
 		     (double)(ref))
 
 enum test_type {
+	TEST_S3IDLE,
 	TEST_S2IDLE,
 	TEST_IDLE,
 };
@@ -63,6 +64,12 @@ enum test_type {
  * SUBTEST: toggle-gt-c6
  * Description: toggles GT C states by acquiring/releasing forcewake,
  *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
+ *
+ * SUBTEST: test-cpg-basic
+ * Description: Validate GT coarse power gating status with a suspend cycle.
+ *
+ * SUBTEST: toggle-gt-cpg
+ * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
@@ -317,6 +324,94 @@ static void toggle_gt_c6(int fd, int n)
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
+	if (render_substr != NULL) {
+		igt_assert_f(strncmp(render_substr + strlen(RENDER_POWER_GATING), "yes", 3) == 0,
+		"Render Power Gating should be enabled");
+	}
+
+	media_substr = strstr(str, MEDIA_POWER_GATING);
+	if (media_substr != NULL) {
+		igt_assert_f(strncmp(media_substr + strlen(MEDIA_POWER_GATING), "yes", 3) == 0,
+		"Media Power Gating should be enabled");
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
+	while (status_substr != NULL) {
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
+static void test_cpg_basic(int fd, int gt, enum test_type flag)
+{
+	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
+	if (flag == TEST_S3IDLE) {
+		powergate_info(fd, gt);
+		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
+		powergate_info(fd, gt);
+	}
+}
+
+static void toggle_gt_cpg(int fd, int n)
+{
+	int gt;
+
+	xe_for_each_gt(fd, gt) {
+		powergate_info(fd, gt);
+	}
+
+	do {
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert_lte(0, fw_handle);
+		xe_for_each_gt(fd, gt)
+			powergate_status(fd, gt, "up");
+
+		close(fw_handle);
+		sleep(1);
+		xe_for_each_gt(fd, gt)
+			powergate_status(fd, gt, "down");
+		} while (--n);
+
+}
+
 igt_main
 {
 	uint32_t d3cold_allowed;
@@ -380,6 +475,15 @@ igt_main
 		toggle_gt_c6(fd, NUM_REPS);
 	}
 
+	igt_describe("Validate Coarse power gating status during suspend cycle");
+	igt_subtest("test-cpg-basic")
+		xe_for_each_gt(fd, gt)
+			test_cpg_basic(fd, gt, TEST_S3IDLE);
+
+	igt_describe("Toggle GT coarse power gating states by managing forcewake");
+	igt_subtest("toggle-gt-cpg")
+			toggle_gt_cpg(fd, NUM_REPS);
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.34.1

