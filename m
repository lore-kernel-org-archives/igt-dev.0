Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06575D116F7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 05:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87BE10E1DF;
	Fri, 25 Oct 2024 05:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtDCda4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BC310E1DF
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 05:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729835136; x=1761371136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gzpzEGn99ZrUxiiEOeF/y7cL85XopNvau6tZIS1a/l0=;
 b=AtDCda4TfTyJFyv0BdD084vhjnt0m7AvOX4MOzAF3dyxcdpGSfch3AWz
 bV7aYcNfMfG+JVQHE16sj9viDORDe3QGzspAWx1zQ+m02uLrmPuGQMeQY
 J129PYTRRGyvQXHZvtX/LJ0OuwkaVojE0ZrwLyloTkBSmzVx90TMi95Ha
 KyYNoPRPQt36YhZ9oJYdXdZEkiCMzqgEMjq3bhEZVg2iZo3/usjVmrOsw
 N6XdmaNlEFmqVTPeW0NTVIgGunus+Fn0jrp5W1GkaqYAO4JWuv2eJphIr
 WK0ygSXTtz3f8o0hx126Go821a4HuN6MS4QCunDfUlTqgxKv5id55KI9B Q==;
X-CSE-ConnectionGUID: zHZRNAuVRnOLDmowPo6+LQ==
X-CSE-MsgGUID: eYHCySswTtKrq0pmMv5LJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40080773"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="40080773"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 22:45:36 -0700
X-CSE-ConnectionGUID: B3PELZcIQP6P7n7saMb83Q==
X-CSE-MsgGUID: 9cpKA2KgR8GNjsnHpwGtVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="111656977"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 22:45:35 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v5,
 1/2] tests/intel/xe_pm_residency: Add GT coarse power gating
 validation
Date: Fri, 25 Oct 2024 11:09:03 +0530
Message-Id: <20241025053903.2152292-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025053903.2152292-1-sk.anirban@intel.com>
References: <20241025053903.2152292-1-sk.anirban@intel.com>
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

Implement test cpg-basic to validate coarse power gating status
after S3 cycle.
Add test cpg-gt-toggle to check if GT coarse power gating is up when
forcewake is acquired and down when released.

v2: Address cosmetic review comments (Riana)
    Fix suspend state (Riana)
    Add exit handler for test cpg-gt-toggle (Riana)

v3: Address cosmetic review comments (Riana)
    Fix commit message & test name (Konieczny)

v4: Address cosmetic review comments (Riana)

v5: Remove unnecessary openings and assertions of gt directories (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm_residency.c | 80 +++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 772fe9b57..d4b26b231 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -63,6 +63,12 @@ enum test_type {
  * SUBTEST: toggle-gt-c6
  * Description: toggles GT C states by acquiring/releasing forcewake,
  *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
+ *
+ * SUBTEST: cpg-basic
+ * Description: Validate GT coarse power gating status with S3 cycle.
+ *
+ * SUBTEST: cpg-gt-toggle
+ * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
@@ -317,6 +323,69 @@ static void toggle_gt_c6(int fd, int n)
 			     "Power consumed in GT C6 should be lower than GT C0\n");
 }
 
+static void cpg_enabled(int fd, int gt)
+{
+	const char *render_power_gating = "Render Power Gating Enabled: ";
+	const char *media_power_gating = "Media Power Gating Enabled: ";
+	char str[512], path[PATH_MAX], *render_substr, *media_substr;
+
+	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
+	igt_debugfs_read(fd, path, str);
+
+	render_substr = strstr(str, render_power_gating);
+	if (render_substr)
+		igt_assert_f(strncmp(render_substr + strlen(render_power_gating), "yes", 3) == 0,
+			     "Render Power Gating should be enabled");
+
+	media_substr = strstr(str, media_power_gating);
+	if (media_substr)
+		igt_assert_f(strncmp(media_substr + strlen(media_power_gating), "yes", 3) == 0,
+			     "Media Power Gating should be enabled");
+}
+
+static void powergate_status(int fd, int gt, const char *expected_status)
+{
+	const char *power_gate_status = "Power Gate Status: ";
+	char str[512], path[PATH_MAX], *status_substr;
+
+	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
+	igt_debugfs_read(fd, path, str);
+
+	status_substr = strstr(str, power_gate_status);
+	while (status_substr) {
+		igt_assert_f((strncmp(status_substr + strlen(power_gate_status), expected_status,
+				      strlen(expected_status)) == 0),
+			      "Power Gate Status Should be %s\n %s\n", expected_status, str);
+		status_substr = strstr(status_substr + strlen(power_gate_status),
+				       power_gate_status);
+	}
+}
+
+static void cpg_basic(int fd, int gt)
+{
+	cpg_enabled(fd, gt);
+	igt_system_suspend_autoresume(SUSPEND_STATE_S3, SUSPEND_TEST_NONE);
+	cpg_enabled(fd, gt);
+}
+
+static void cpg_gt_toggle(int fd)
+{
+	int gt;
+
+	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+	igt_assert_lte(0, fw_handle);
+
+	xe_for_each_gt(fd, gt) {
+		cpg_enabled(fd, gt);
+		powergate_status(fd, gt, "up");
+	}
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
@@ -380,6 +449,17 @@ igt_main
 		toggle_gt_c6(fd, NUM_REPS);
 	}
 
+	igt_describe("Validate Coarse power gating status with S3 cycle");
+	igt_subtest("cpg-basic")
+		xe_for_each_gt(fd, gt)
+			cpg_basic(fd, gt);
+
+	igt_describe("Toggle GT coarse power gating states by managing forcewake");
+	igt_subtest("cpg-gt-toggle") {
+		igt_install_exit_handler(close_fw_handle);
+		cpg_gt_toggle(fd);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.34.1

