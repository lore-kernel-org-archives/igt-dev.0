Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6CFD0BB41
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 21:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEE510E869;
	Wed, 23 Oct 2024 21:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnEcwCwt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5911D10E869
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 21:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729720732; x=1761256732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R2nqWozyH9LlLUagJDBzeKJ/o6kMVUaOefH7Fvbvvvw=;
 b=bnEcwCwtoV4s9xv8Zsk2ntqMDLF81+JLfO6em/X8rMSR9HaZg2yGtOXE
 e/Tl/BciPT01tsHmpymyO1oMQTFNv8PgHapuKsSO3M6BPmOLv1zzP4Aus
 KjV1APQCrbxa6B0EKeD1gqbpwC9RXDsQ/mG7EFDIvPs0dDQAgT+3Wgig4
 wU50YTOgPeQg3A9xSYZz8MKY+nAAfKl9d3YxO79mZUWiSmRfiPnT+7tYg
 0h+b4ZtUnCfTs1jVnmPqXf3MXgODbWSw4UURtu1PozFYW6sAOQ05yKSzP
 G2+nhYesE4TeIrTDCuhvsN5GanZFW7UWVlDO5xgZXyi+IZ6a72IWgAvXd g==;
X-CSE-ConnectionGUID: /GJmLMV8SBiiTEjfGwfgVg==
X-CSE-MsgGUID: TlQHKQ5hQgKriQf9QEWPsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39878330"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39878330"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 14:58:52 -0700
X-CSE-ConnectionGUID: kcXRxxixQr6wGtb42aorrg==
X-CSE-MsgGUID: YAc1wXYwS0qK1++fvymAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80574041"
Received: from dut4413lnl.fm.intel.com ([10.105.8.97])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 14:58:52 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, riana.tauro@intel.com
Subject: [PATCH v3] tests/intel/xe_pm_residency: Skip on igt_power_open failure
Date: Wed, 23 Oct 2024 21:58:51 +0000
Message-ID: <20241023215851.98090-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

The xe_pm_residency@toggle-gt-c6 test fails when
gt_c6_power >= gt_c0_power.  These values are reported by
igt_power_get_mW, which will always report 0 in the case that
igt_power_open fails to open either the hwmon_fd or rapl.fd.  Since the
expected result will always be a failure in this case, skip the
assertion that gt_c6_power < gt_c0_power.

v2: Do not skip the full test, and instead only ignore the part that is
guaranteed to fail.

v3: Use || instead of && (Riana)

Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 772fe9b574..7bd6bcc267 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -282,10 +282,14 @@ static void measure_power(struct igt_power *gpu, double *power)
 static void toggle_gt_c6(int fd, int n)
 {
 	double gt_c0_power, gt_c6_power;
-	int gt;
+	int gt, ret;
 	struct igt_power gpu;
 
-	igt_power_open(fd, &gpu, "gpu");
+	/*
+	 * igt_power_get_mW will always return 0 if igt_power_open fails,
+	 * so skip the power check in this case.
+	 */
+	ret = igt_power_open(fd, &gpu, "gpu");
 
 	do {
 		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
@@ -312,7 +316,7 @@ static void toggle_gt_c6(int fd, int n)
 	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
 
 	/* FIXME: Remove dgfx check after hwmon is added */
-	if (!xe_has_vram(fd))
+	if (!(xe_has_vram(fd) || ret))
 		igt_assert_f(gt_c6_power < gt_c0_power,
 			     "Power consumed in GT C6 should be lower than GT C0\n");
 }
-- 
2.43.0

