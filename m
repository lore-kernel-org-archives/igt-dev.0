Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D6D3E1AE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 07:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E0010E425;
	Mon, 21 Oct 2024 07:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FinVzuEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6B210E424
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729495535; x=1761031535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ie1dySZdvUDpZFc05kAwpVbTNLqZPSNdDNU5CMTBaA=;
 b=FinVzuEZWgeTVzFqzqFXP7Olvo+HSA7Iszguofxv1B7nh3jsV/gmxcsl
 Fjl8wOKc4gcrrJySIJnfUhsj6kod/Dobr96wgbJlL/SeZvCE06Fr/hThE
 4TXgdDnkUpYXiGR/AXrI06jXRQNDIKNN55Mjl7K6UJLEE+VYaOibeRVN+
 muTM3FAlXt5RR6Y166Mf0gqCa9eiDFIRQLDzPjZ2532yWUvADDPXzohCw
 ArfR3eOF8Z340qZ8DeK82y99tBCev79TuHAI6Xaaitl1tlDQnvW9MyMfJ
 ee2LVaQ236QPilRA0lNjXIpyn32A70MM4u+tFRrcsdDR1dfxBTwkXfQmj A==;
X-CSE-ConnectionGUID: 46usFiRTQrWx3Gqw2TA/Dg==
X-CSE-MsgGUID: mpXFjJW2TWa4eEtLgE3BsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40355118"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40355118"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 00:25:35 -0700
X-CSE-ConnectionGUID: GJuKwfX1Sea0SL4M0O1JZQ==
X-CSE-MsgGUID: j9yaWEe8TfuhBqmTNtWNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79787335"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 00:25:32 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: sk.anirban@intel.com,
	riana.tauro@intel.com
Subject: [i-g-t, v3,
 1/2] tests/intel/xe_pm_residency: Add GT coarse power gating
 validation
Date: Mon, 21 Oct 2024 12:49:01 +0530
Message-Id: <20241021071902.2086909-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021071902.2086909-1-sk.anirban@intel.com>
References: <20241021071902.2086909-1-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm_residency.c | 92 +++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 772fe9b57..29316514a 100644
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
 
@@ -317,6 +323,81 @@ static void toggle_gt_c6(int fd, int n)
 			     "Power consumed in GT C6 should be lower than GT C0\n");
 }
 
+
+static void cpg_enabled(int fd, int gt)
+{
+	int dir;
+	char str[512], path[64], *render_substr, *media_substr;
+	const char *render_power_gating = "Render Power Gating Enabled: ";
+	const char *media_power_gating = "Media Power Gating Enabled: ";
+
+	dir = igt_debugfs_gt_dir(fd, gt);
+	igt_assert(dir >= 0);
+
+	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
+	igt_debugfs_read(fd, path, str);
+	close(dir);
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
+
+static void powergate_status(int fd, int gt, const char *expected_status)
+{
+	int dir;
+	char str[512], path[64], *status_substr;
+	const char *power_gate_status = "Power Gate Status: ";
+
+	dir = igt_debugfs_gt_dir(fd, gt);
+	igt_assert(dir >= 0);
+
+	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
+	igt_debugfs_read(fd, path, str);
+	close(dir);
+
+	status_substr = strstr(str, power_gate_status);
+	while (status_substr) {
+		igt_assert_f((strncmp(status_substr + strlen(power_gate_status), expected_status,
+				      strlen(expected_status)) == 0),
+			      "Power Gate Status Should be %s\n %s\n", expected_status, str);
+	status_substr = strstr(status_substr + strlen(power_gate_status), power_gate_status);
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
+	xe_for_each_gt(fd, gt)
+		cpg_enabled(fd, gt);
+
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
@@ -380,6 +461,17 @@ igt_main
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

