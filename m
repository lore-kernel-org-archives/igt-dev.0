Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52532E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 21:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E700510E133;
	Fri, 10 Jan 2025 21:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiKHwnKg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32FA10E133
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 21:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736544167; x=1768080167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ea92bse/rZrHwF1Yae9yvM+ubi3GTUayAkj+tlmw+aw=;
 b=fiKHwnKgGAl01qy8aPekQyyd7xRad6ADTE3d8EiBrgu728PcY44LJKrc
 /+YvlyYtlPSzQk63/CY55wykv1dOkouV+W1onqqRpgPYXXP8tQkn0lYfa
 PqgJavU62NVlnpGnfRQTolw9I1N7IENE1Md6+hKo7Vc0WbhjTXhx/xeUm
 k/q+quSaBeOyUNeOkuSBc3CWAHMhBoIYP42wEoqtPSsERYquX4SWZ5SQ6
 h49sB7oK6c4Z5U790+CnbJx9S8vn/kgb8vNmZCVj2p0lRe0Z3MXkhLOMG
 iWCAOVJD8Hc7IiFdtTyp94ADp9Levkyo+4vIZtqmNBdf+Kj2JYznUhtV7 g==;
X-CSE-ConnectionGUID: ZLusXKmaQD6j1ZPip7fGAw==
X-CSE-MsgGUID: NVHntv1iSEiFsF8xbClkpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40790198"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="40790198"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 13:22:37 -0800
X-CSE-ConnectionGUID: e86QNtSXSe6OwjWH5XpDjw==
X-CSE-MsgGUID: 4DsIc0/5QLSbtPgUQe4fgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="103650756"
Received: from dut4066lnl.fm.intel.com ([10.105.10.33])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 13:22:37 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, riana.tauro@intel.com
Subject: [PATCH v4] tests/intel/xe_pm_residency: Skip on igt_power_open failure
Date: Fri, 10 Jan 2025 21:22:37 +0000
Message-ID: <20250110212237.4052-1-jonathan.cavitt@intel.com>
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

v4: Reprovision

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/958
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 06f4a0bc6b..f9e96d6087 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -289,10 +289,14 @@ static void measure_power(struct igt_power *gpu, double *power)
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
@@ -319,7 +323,7 @@ static void toggle_gt_c6(int fd, int n)
 	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
 
 	/* FIXME: Remove dgfx check after hwmon is added */
-	if (!xe_has_vram(fd))
+	if (!(xe_has_vram(fd) || ret))
 		igt_assert_f(gt_c6_power < gt_c0_power,
 			     "Power consumed in GT C6 should be lower than GT C0\n");
 }
-- 
2.43.0

