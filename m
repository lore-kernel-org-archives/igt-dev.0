Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE05606A31F
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kHKM+f84
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687C4112BC2;
	Fri, 23 Oct 2026 12:25:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7C112BB2
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792758281; x=1824294281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qd41axdvahvFHBWhgBKeJe6lxcec/3N9x38t8Pa8MMg=;
 b=kHKM+f84vPiyGiLE0AUtffom612+iby3iG3ri8jq3NvfQOdcaz4FSZqQ
 blLjcTVPiZeF0YbOTQ6lL/9gwstGva/m219Fjgxxy3ducL9Ii9tEBasIR
 Wlg4Wl8T39ZmjLdOZPib3vPfDVYdjCy+lY57QE6k/bybDouqBKr8ny2ZN
 DHH0S6s7/QRXnqLcUy8dbFYyMHiJjTGTaBDk9bFktCb8f6yrc3ufEoIUl
 EvzByLsw2OocoDeU/xdalNSt94gCpxeCMFNKhnTKVSC3/uSFf+oV0D26o
 yq7bjQDq213c42x8Ez06dhOEz5S9pcH7HvzU+m2IgX8VxdalDXa3cdGky w==;
X-CSE-ConnectionGUID: 5U5RVJGBQPuvwa+0XjQZTA==
X-CSE-MsgGUID: Q1hzLfq/T86LDezkeB3T6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1554039"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1554039"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:24:40 -0700
X-CSE-ConnectionGUID: PmKdO9g0Q06YBDL1reEkYA==
X-CSE-MsgGUID: E8Fpif35TVewA+fC8ItaWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="5447489"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:24:37 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3] tests/intel: Add helper to dump GT debug state on C6 wait
 failures
Date: Fri, 23 Oct 2026 17:40:35 +0530
Message-ID: <20261023121034.1139234-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GT C6 assertions currently only print GT state on failure, giving
no insight into what kept the GT busy.
Add a helper that prints both hw_engines and powergate_info whenever
a GT C6 check fails or is skipped.

v2: Include NULL check & cosmetic changes (Soham)
v3: Cosmetic changes (Soham)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 lib/xe/xe_gt.c                | 39 +++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h                |  1 +
 tests/intel/xe_gt_freq.c      | 21 ++++++++++++-------
 tests/intel/xe_pm_residency.c | 13 ++++++++----
 tests/intel/xe_pmu.c          |  4 +++-
 5 files changed, 66 insertions(+), 12 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 3d8b4f68a..1f0b77986 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -8,6 +8,7 @@
 #include <sys/stat.h>
 
 #include "igt_core.h"
+#include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "lib/intel_chipset.h"
 #include "xe_gt.h"
@@ -229,6 +230,44 @@ bool xe_gt_is_in_c6(int fd, int gt)
 	return false;
 }
 
+/**
+ * xe_gt_dump_debug_info:
+ * @fd: open xe drm file descriptor
+ * @gt: gt number
+ *
+ * Dumps the hw_engines and powergate_info debugfs entries for @gt via
+ * igt_info, so they are printed unconditionally on both FAIL and SKIP paths.
+ * Always returns false, so it can be OR'd with the result of an igt_wait()
+ * condition to dump state only when the wait fails.
+ *
+ * Return: always false
+ */
+bool xe_gt_dump_debug_info(int fd, int gt)
+{
+	char *info;
+	int dir;
+
+	dir = igt_debugfs_gt_dir(fd, gt);
+	if (dir < 0)
+		return false;
+
+	info = igt_sysfs_get(dir, "hw_engines");
+	if (info) {
+		igt_info("GT%d hw_engines:\n%s\n", gt, info);
+		free(info);
+	}
+
+	info = igt_sysfs_get(dir, "powergate_info");
+	if (info) {
+		igt_info("powergate_info:\n%s\n", info);
+		free(info);
+	}
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
index 93525ea35..9ef15d7dd 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -21,6 +21,7 @@ void xe_post_hang_ring(int fd, igt_hang_t arg);
 int xe_gt_stats_get_count(int fd, int gt, const char *stat);
 
 bool xe_gt_is_in_c6(int fd, int gt);
+bool xe_gt_dump_debug_info(int fd, int gt);
 
 int xe_gt_fill_engines_by_class(int fd, int gt, int class,
 				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 886537862..ab1c30ea1 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -57,7 +57,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
 	char *throttle_reasons;
 	int gt_fd;
 
-	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+		     xe_gt_dump_debug_info(fd, gt_id),
 		     "GT %d should be in C6\n", gt_id);
 
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
@@ -145,7 +146,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	if (gt_idle) {
 		/* Wait for GT to go in C6 as previous xe_gt_get_freq wakes up GT*/
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+			     xe_gt_dump_debug_info(fd, gt_id),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -160,7 +162,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+			     xe_gt_dump_debug_info(fd, gt_id),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -179,7 +182,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	igt_assert_eq_u32(xe_gt_get_freq(fd, gt_id, "cur"), rp0);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+			     xe_gt_dump_debug_info(fd, gt_id),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	}
@@ -210,7 +214,8 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
 
 	if (gt_idle) {
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10) ||
+			     xe_gt_dump_debug_info(fd, gt_id),
 			     "GT %d should be in C6\n", gt_id);
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
@@ -412,7 +417,8 @@ int igt_main()
 
 	igt_subtest("freq_fixed_idle") {
 		xe_for_each_gt(fd, gt) {
-			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
+				      xe_gt_dump_debug_info(fd, gt),
 				      "GT %d should be in C6\n", gt);
 			test_freq_fixed(fd, gt, true);
 		}
@@ -430,7 +436,8 @@ int igt_main()
 
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
-			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
+				      xe_gt_dump_debug_info(fd, gt),
 				      "GT %d should be in C6\n", gt);
 			test_freq_range(fd, gt, true);
 		}
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index e976048a9..c5240378a 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -217,7 +217,9 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	unsigned long elapsed_ms, residency_start, residency_end;
 	struct timespec ts_start, ts_end;
 
-	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
+	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
+		     xe_gt_dump_debug_info(fd, gt),
+		     "GT %d not in C6\n", gt);
 
 	if (flag == TEST_S2IDLE) {
 		clock_gettime(CLOCK_BOOTTIME, &ts_start);
@@ -326,7 +328,8 @@ static void toggle_gt_c6(int fd, int n)
 		close(fw_handle);
 		/* check if all gts are in C6 after forcewake is released */
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
+			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
+				     xe_gt_dump_debug_info(fd, gt),
 				     "Forcewake released, GT %d should be in C6\n", gt);
 
 		if (n == NUM_REPS)
@@ -392,7 +395,8 @@ static void cpg_gt_toggle(int fd)
 	int gt;
 
 	xe_for_each_gt(fd, gt)
-		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+		igt_skip_on_f(!(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10) ||
+				xe_gt_dump_debug_info(fd, gt)),
 			      "GT %d is not in C6\n", gt);
 
 	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
@@ -581,7 +585,8 @@ int igt_main()
 	igt_subtest_with_dynamic("gt-c6-on-idle") {
 		xe_for_each_gt(fd, gt)
 			igt_dynamic_f("gt%u", gt)
-				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
+				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1) ||
+					     xe_gt_dump_debug_info(fd, gt),
 					     "GT %d not in C6\n", gt);
 	}
 
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 1dc102a7b..de07c2236 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -878,7 +878,9 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
-	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT %d should be in C6\n", gt);
+	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10) ||
+		      xe_gt_dump_debug_info(xe, gt),
+		      "GT %d should be in C6\n", gt);
 
 	/* While idle check full RC6. */
 	start = read_idle_residency(xe, gt);
-- 
2.43.0

