Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD4EC982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 18:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166DF10E197;
	Mon, 21 Sep 2026 18:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+4mi9Af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0110E34F
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790013832; x=1821549832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hgLYFa+MIlyOcANOkCAcoBTvBpodhflnXA3Kx1rDHvg=;
 b=B+4mi9Afxs2Hs0gYwBgGDCLWM2jyIOg0bW0Y2RftB1BJ6oMHR1swIITr
 hXVLWtFWQmxy/obn9U0FEU/66TDmnH9sHUcWvTQMI7WqWLgAS3EdIaF4v
 8tNs9oSeRda5Fan/Wv5Ws6GoNmt82wv0oOuYquJUVWcDLWu7zL/NSnBF7
 JrJFaQXjL0uB2LU3/I3ZeAt3pYcm5AmpXLet8IPYMmLVjHBAyYA3Hz9pp
 ZJPT/1AbiVTG8TdcQ+sJw7d7sWF7Z+yDj8Ua9tUlVGhbFWAzWLHNwryVV
 fVRdYPVarexSMjOPxQHW3SB1jrbjjYEvFicqq9pZuxAdGlrr+jqAM+IbB A==;
X-CSE-ConnectionGUID: KUzIoc8SRCiTX5T+BMwQZA==
X-CSE-MsgGUID: 1iVh4RbxSICzsr8EqdLE5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89480363"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="89480363"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 11:03:52 -0700
X-CSE-ConnectionGUID: liKt8oddSzu58os/pLsWPg==
X-CSE-MsgGUID: LoNPNltrTPixeVMy51vtTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="3861673"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 11:03:50 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel: Add helper to dump GT debug state on C6 wait
 failures
Date: Mon, 21 Sep 2026 23:22:06 +0530
Message-ID: <20260921175206.1707165-2-sk.anirban@intel.com>
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

GT C6 assertions currently only print GT state on failure, giving
no insight into what kept the GT busy.
Add a helper that prints both hw_engines and powergate_info whenever
a GT C6 check fails or is skipped.

Assisted-by: Copilot:Claude-Sonnet-5
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 lib/xe/xe_gt.c                | 33 +++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h                |  1 +
 tests/intel/xe_gt_freq.c      | 21 ++++++++++++++-------
 tests/intel/xe_pm_residency.c | 13 +++++++++----
 tests/intel/xe_pmu.c          |  4 +++-
 5 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 3d8b4f68a..aa61e1ddc 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -8,6 +8,7 @@
 #include <sys/stat.h>
 
 #include "igt_core.h"
+#include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "lib/intel_chipset.h"
 #include "xe_gt.h"
@@ -229,6 +230,38 @@ bool xe_gt_is_in_c6(int fd, int gt)
 	return false;
 }
 
+/**
+ * xe_gt_dump_c6_debug_info:
+ * @fd: pointer to xe drm fd
+ * @gt: gt number
+ *
+ * Dumps the hw_engines and powergate_info debugfs entries for @gt via
+ * igt_info, so they are printed unconditionally on both FAIL and SKIP paths.
+ * Always returns false, so it can be OR'd into an igt_wait() condition to
+ * dump state only when the wait fails.
+ */
+bool xe_gt_dump_c6_debug_info(int fd, int gt)
+{
+	char *info;
+	int dir;
+
+	dir = igt_debugfs_gt_dir(fd, gt);
+	if (dir < 0)
+		return false;
+
+	info = igt_sysfs_get(dir, "hw_engines");
+	igt_info("GT%d hw_engines:\n%s\n", gt, info);
+	free(info);
+
+	info = igt_sysfs_get(dir, "powergate_info");
+	igt_info("GT%d powergate_info:\n%s\n", gt, info);
+	free(info);
+
+	close(dir);
+
+	return false;
+}
+
 /**
  * xe_gt_fill_engines_by_class:
  * @fd: pointer to xe drm fd
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 93525ea35..3f5d4ee2f 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -21,6 +21,7 @@ void xe_post_hang_ring(int fd, igt_hang_t arg);
 int xe_gt_stats_get_count(int fd, int gt, const char *stat);
 
 bool xe_gt_is_in_c6(int fd, int gt);
+bool xe_gt_dump_c6_debug_info(int fd, int gt);
 
 int xe_gt_fill_engines_by_class(int fd, int gt, int class,
 				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 886537862..775e622d5 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -57,7 +57,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
 	char *throttle_reasons;
 	int gt_fd;
 
-	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+		     xe_gt_dump_c6_debug_info(fd, gt_id),
 		     "GT %d should be in C6\n", gt_id);
 
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
@@ -145,7 +146,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	if (gt_idle) {
 		/* Wait for GT to go in C6 as previous xe_gt_get_freq wakes up GT*/
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+			     xe_gt_dump_c6_debug_info(fd, gt_id),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -160,7 +162,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+			     xe_gt_dump_c6_debug_info(fd, gt_id),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -179,7 +182,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	igt_assert_eq_u32(xe_gt_get_freq(fd, gt_id, "cur"), rp0);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+			     xe_gt_dump_c6_debug_info(fd, gt_id),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	}
@@ -210,7 +214,8 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+			     xe_gt_dump_c6_debug_info(fd, gt_id),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -412,7 +417,8 @@ int igt_main()
 
 	igt_subtest("freq_fixed_idle") {
 		xe_for_each_gt(fd, gt) {
-			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
+				      xe_gt_dump_c6_debug_info(fd, gt),
 				      "GT %d should be in C6\n", gt);
 			test_freq_fixed(fd, gt, true);
 		}
@@ -430,7 +436,8 @@ int igt_main()
 
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
-			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
+				      xe_gt_dump_c6_debug_info(fd, gt),
 				      "GT %d should be in C6\n", gt);
 			test_freq_range(fd, gt, true);
 		}
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index e976048a9..65f35569a 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -217,7 +217,9 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	unsigned long elapsed_ms, residency_start, residency_end;
 	struct timespec ts_start, ts_end;
 
-	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
+	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
+		     xe_gt_dump_c6_debug_info(fd, gt),
+		     "GT %d not in C6\n", gt);
 
 	if (flag == TEST_S2IDLE) {
 		clock_gettime(CLOCK_BOOTTIME, &ts_start);
@@ -326,7 +328,8 @@ static void toggle_gt_c6(int fd, int n)
 		close(fw_handle);
 		/* check if all gts are in C6 after forcewake is released */
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
+			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
+				     xe_gt_dump_c6_debug_info(fd, gt),
 				     "Forcewake released, GT %d should be in C6\n", gt);
 
 		if (n == NUM_REPS)
@@ -392,7 +395,8 @@ static void cpg_gt_toggle(int fd)
 	int gt;
 
 	xe_for_each_gt(fd, gt)
-		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+		igt_skip_on_f(!(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
+				xe_gt_dump_c6_debug_info(fd, gt)),
 			      "GT %d is not in C6\n", gt);
 
 	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
@@ -581,7 +585,8 @@ int igt_main()
 	igt_subtest_with_dynamic("gt-c6-on-idle") {
 		xe_for_each_gt(fd, gt)
 			igt_dynamic_f("gt%u", gt)
-				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
+				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
+					     xe_gt_dump_c6_debug_info(fd, gt),
 					     "GT %d not in C6\n", gt);
 	}
 
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 364e643fe..a123d0d50 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -876,7 +876,9 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
-	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT %d should be in C6\n", gt);
+	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10) ||
+		      xe_gt_dump_c6_debug_info(xe, gt),
+		      "GT %d should be in C6\n", gt);
 
 	/* While idle check full RC6. */
 	start = read_idle_residency(xe, gt);
-- 
2.43.0

