Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6563ACD4F5B
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 07:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2133910EAF0;
	Tue, 19 May 2026 07:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcQ9IRFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0860610EAF7
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 07:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779177364; x=1810713364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i44zNqa3JU0L8W7cGQGQes4B8ZbgvyIa9R0sUHr3BpQ=;
 b=RcQ9IRFfeJkVHQlWkd+uFJXI6TD3+FQM9IwEnHqY7mwAuzrBl9JjJgoP
 2+St4ofWU04698NTePzpcpO7fx1JuJb56UbpZJZjVRd8Lwc8hdw5JKzTP
 0OI+2OddRmP2vP/VoMwzNnrqZI8K9HQhEbd3jI+52UB/gaMWmN1HcZ1zr
 xyCqzqCZ2RnLw2RwRZulaMThz4XE4VjpTenrbBPMWqwjznHOPLVgl5kwt
 49PmxdJZPoaF/aj8ylZvEo8kzZmry0fUJzd6GtFrXtTXm5DJk2VTVmgLd
 cXPrsCqAZrMb3LHoi3R88WxTMGhFik5UA6Avr/uW14Rul9zHLgS2cA1eF w==;
X-CSE-ConnectionGUID: IbnPB5E5QjyTxWmf2oUlVQ==
X-CSE-MsgGUID: RUW3VFRuQXGA0BMwdYZ6uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80077537"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80077537"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 00:56:04 -0700
X-CSE-ConnectionGUID: j+998deYQGagPxIBos/+BQ==
X-CSE-MsgGUID: q2ZvQL29TRSRl5cx2qSFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="241524145"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 00:56:00 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel: Add powergate info to GT C6 failures
Date: Tue, 19 May 2026 13:22:01 +0530
Message-ID: <20260519075200.817868-2-sk.anirban@intel.com>
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

Add xe_gt_dump_powergate_info() calls to xe_gt_is_in_c6() assertions
to provide detailed power state information when GT C6 checks fail.
This improves debugging by showing exact powergate status instead of
just reporting that GT is not in C6.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 lib/xe/xe_gt.c                | 30 ++++++++++++++++++++++++++++--
 lib/xe/xe_gt.h                |  1 +
 tests/intel/xe_gt_freq.c      | 21 ++++++++++++++-------
 tests/intel/xe_pm_residency.c | 16 +++++++++++-----
 tests/intel/xe_pmu.c          |  4 +++-
 5 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 8f54b6e25..24fbab13d 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -223,11 +223,37 @@ bool xe_gt_is_in_c6(int fd, int gt)
 	if (!strcmp(gt_c_state, "gt-c6"))
 		return true;
 
-	igt_debug("GT%d C-state is %s\n", gt, gt_c_state);
-
 	return false;
 }
 
+/**
+ * xe_gt_dump_powergate_info:
+ * @fd: pointer to xe drm fd
+ * @gt: gt number
+ *
+ * Print gt powergate_info debugfs details.
+ */
+const char *xe_gt_dump_powergate_info(int fd, int gt)
+{
+	static char str[1024];
+	char gt_c_state[16];
+	char path[64];
+	int gt_fd;
+
+	str[0] = '\0';
+	gt_fd = xe_sysfs_gt_open(fd, gt);
+	igt_assert(gt_fd >= 0);
+
+	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
+	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
+	igt_debugfs_read(fd, path, str);
+	close(gt_fd);
+
+	igt_debug("GT%d C-state: %s\n", gt, gt_c_state);
+
+	return str;
+}
+
 /**
  * xe_gt_fill_engines_by_class:
  * @fd: pointer to xe drm fd
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 93525ea35..e2177eb20 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -21,6 +21,7 @@ void xe_post_hang_ring(int fd, igt_hang_t arg);
 int xe_gt_stats_get_count(int fd, int gt, const char *stat);
 
 bool xe_gt_is_in_c6(int fd, int gt);
+const char *xe_gt_dump_powergate_info(int fd, int gt);
 
 int xe_gt_fill_engines_by_class(int fd, int gt, int class,
 				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 19306dc41..75d77e96f 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -58,7 +58,8 @@ static void test_throttle_basic_api(int fd, int gt_id)
 	int gt_fd;
 
 	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
-		     "GT %d should be in C6\n", gt_id);
+		     "GT %d should be in C6\nPower Gate info:\n%s\n",
+		     gt_id, xe_gt_dump_powergate_info(fd, gt_id));
 
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert_lte(0, gt_fd);
@@ -146,7 +147,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	if (gt_idle) {
 		/* Wait for GT to go in C6 as previous xe_gt_get_freq wakes up GT*/
 		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
-			     "GT %d should be in C6\n", gt_id);
+			     "GT %d should be in C6\nPower Gate info:\n%s\n",
+			     gt_id, xe_gt_dump_powergate_info(fd, gt_id));
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
 		igt_assert_eq_u32(xe_gt_get_freq(fd, gt_id, "act"), rpn);
@@ -161,7 +163,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	if (gt_idle) {
 		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
-			     "GT %d should be in C6\n", gt_id);
+			     "GT %d should be in C6\nPower Gate info:\n%s\n",
+			     gt_id, xe_gt_dump_powergate_info(fd, gt_id));
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
 		act_freq = xe_gt_get_freq(fd, gt_id, "act");
@@ -180,7 +183,8 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	if (gt_idle) {
 		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
-			     "GT %d should be in C6\n", gt_id);
+			     "GT %d should be in C6\nPower Gate info:\n%s\n",
+			     gt_id, xe_gt_dump_powergate_info(fd, gt_id));
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	}
 
@@ -211,7 +215,8 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 
 	if (gt_idle) {
 		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
-			     "GT %d should be in C6\n", gt_id);
+			     "GT %d should be in C6\nPower Gate info:\n%s\n",
+			     gt_id, xe_gt_dump_powergate_info(fd, gt_id));
 		igt_assert(xe_gt_get_freq(fd, gt_id, "act") == 0);
 	} else {
 		act = xe_gt_get_freq(fd, gt_id, "act");
@@ -412,7 +417,8 @@ int igt_main()
 	igt_subtest("freq_fixed_idle") {
 		xe_for_each_gt(fd, gt) {
 			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
-				      "GT %d should be in C6\n", gt);
+				      "GT %d should be in C6\nPower Gate info:\n%s\n",
+				      gt, xe_gt_dump_powergate_info(fd, gt));
 			test_freq_fixed(fd, gt, true);
 		}
 	}
@@ -430,7 +436,8 @@ int igt_main()
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
 			igt_require_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
-				      "GT %d should be in C6\n", gt);
+				      "GT %d should be in C6\nPower Gate info:\n%s\n",
+				      gt, xe_gt_dump_powergate_info(fd, gt));
 			test_freq_range(fd, gt, true);
 		}
 	}
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index bfae1f844..6fe5f83eb 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -217,7 +217,9 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	unsigned long elapsed_ms, residency_start, residency_end;
 	struct timespec ts_start, ts_end;
 
-	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
+	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
+		     "GT %d not in C6\nPower Gate info:\n%s\n",
+		     gt, xe_gt_dump_powergate_info(fd, gt));
 
 	if (flag == TEST_S2IDLE) {
 		clock_gettime(CLOCK_BOOTTIME, &ts_start);
@@ -318,7 +320,8 @@ static void toggle_gt_c6(int fd, int n)
 		/* check if all gts are in C0 after forcewake is acquired */
 		xe_for_each_gt(fd, gt)
 			igt_assert_f(!xe_gt_is_in_c6(fd, gt),
-				     "Forcewake acquired, GT %d should be in C0\n", gt);
+				     "Forcewake acquired, GT %d should be in C0\nPower Gate info:\n%s\n",
+				     gt, xe_gt_dump_powergate_info(fd, gt));
 
 		if (n == NUM_REPS)
 			measure_power(&gpu, &gt_c0_power);
@@ -327,7 +330,8 @@ static void toggle_gt_c6(int fd, int n)
 		/* check if all gts are in C6 after forcewake is released */
 		xe_for_each_gt(fd, gt)
 			igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
-				     "Forcewake released, GT %d should be in C6\n", gt);
+				     "Forcewake released, GT %d should be in C6\nPower Gate info:\n%s\n",
+				     gt, xe_gt_dump_powergate_info(fd, gt));
 
 		if (n == NUM_REPS)
 			measure_power(&gpu, &gt_c6_power);
@@ -393,7 +397,8 @@ static void cpg_gt_toggle(int fd)
 
 	xe_for_each_gt(fd, gt)
 		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
-			      "GT %d is not in C6\n", gt);
+			      "GT %d not in C6\nPower Gate info:\n%s\n", gt,
+				  xe_gt_dump_powergate_info(fd, gt));
 
 	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
 	igt_assert_lte(0, fw_handle);
@@ -581,7 +586,8 @@ int igt_main()
 		xe_for_each_gt(fd, gt)
 			igt_dynamic_f("gt%u", gt)
 				igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1),
-					     "GT %d not in C6\n", gt);
+					     "GT %d not in C6\nPower Gate info:\n%s\n",
+					     gt, xe_gt_dump_powergate_info(fd, gt));
 	}
 
 	igt_describe("Validate idle residency measured over suspend cycle is within the tolerance");
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fb4b871e7..5031772f0 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -876,7 +876,9 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
-	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT %d should be in C6\n", gt);
+	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10),
+		      "GT %d should be in C6\nPower Gate info:\n%s\n",
+		      gt, xe_gt_dump_powergate_info(xe, gt));
 
 	/* While idle check full RC6. */
 	start = read_idle_residency(xe, gt);
-- 
2.43.0

