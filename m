Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C8CC3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 05:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A675910E0D5;
	Tue, 20 May 2025 05:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3Rfs5Pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CB810E0D5
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 05:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747720199; x=1779256199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CN8ew5vx+R6Qbp5IhsBEM15c2uqEkkHVU7qK7jEPYaE=;
 b=S3Rfs5PrXwhsADX/lwpUS13Y2SD2/wDbdg7FO7R5HGBae6a8ctZzaf11
 pPXXqK+uSCiDAxuwH59SqAvQtSW8Q1I+EPbAFnr84CCLe+nUrt9Ag4bE8
 sDdeceoGJElQgMFfiUX2u+coRMTnz38D6LMkm97VzKpSsWn4bGF15R0+6
 e9bIg+hfSqYEuXTno6E2odJeE/hp1/Uy/qXSMPydQxHZ1b+sXlYrVwYPB
 QSc10JOBPKuieSyExwgapSw8UfFsN2UEhY7IPe6XQxEIkAM4F83StCNPl
 huQ0FxCBzf50zMdV3/qOLnCkjUbnq8VayNGiKKLOk1Ett00OzdVlXIAks g==;
X-CSE-ConnectionGUID: vyYj5HAvR/uryC+XA3bKiw==
X-CSE-MsgGUID: y4DHv7IyR5mG17PmZsB3Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60293556"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60293556"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:49:59 -0700
X-CSE-ConnectionGUID: gVU4MBsVRnSW7ho6jzjYYQ==
X-CSE-MsgGUID: 3lK5LsyLS5e4k5EDHzzoyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139621484"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 22:49:57 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 3/5] tests/intel/xe_pmu: Add tests to validate engine
 activity with single engine active
Date: Tue, 20 May 2025 11:43:34 +0530
Message-ID: <20250520061336.656057-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520061336.656057-1-riana.tauro@intel.com>
References: <20250520061336.656057-1-riana.tauro@intel.com>
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

Add a test that validates by running workload on a single engine and
checks if others are idle.

Also add a trailing idle test case.

v2: use allocator
v3: rename function to check_all_engines
    use flags array (Umesh)
v4: do not use flag to end cork (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 99 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 344132ad3..6d4e27178 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -24,6 +24,14 @@
  * SUBTEST: engine-activity-load
  * Description: Test to validate engine activity stats by running a workload
  *
+ * SUBTEST: engine-activity-single-load
+ * Description: Test to validate engine activity by running workload on one engine and check if
+ *		all other engines are idle
+ *
+ * SUBTEST: engine-activity-single-load-idle
+ * Description: Test to validate engine activity by running workload and trailing idle on one engine
+ *		and check if all other engines are idle
+ *
  * SUBTEST: all-fn-engine-activity-load
  * Description: Test to validate engine activity by running load on all functions simultaneously
  *
@@ -51,6 +59,7 @@
 /* flag masks */
 #define TEST_LOAD		BIT(0)
 #define TEST_TRAILING_IDLE	BIT(1)
+#define TEST_IDLE		BIT(2)
 
 const double tolerance = 0.1;
 static char xe_device[NAME_MAX];
@@ -165,6 +174,29 @@ static void end_cork(int fd, struct xe_cork *cork)
 		xe_cork_sync_end(fd, cork);
 }
 
+static void check_all_engines(int num_engines, int *flag, uint64_t *before, uint64_t *after)
+{
+	uint64_t engine_active_ticks, engine_total_ticks;
+	int engine_idx = 0;
+
+	for (int idx = 0; idx < num_engines * 2; idx += 2) {
+		engine_idx = idx >> 1;
+
+		engine_active_ticks = after[idx] - before[idx];
+		engine_total_ticks = after[idx + 1] - before[idx + 1];
+
+		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", engine_idx,
+			  after[idx], before[idx], engine_active_ticks);
+		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", engine_idx,
+			  after[idx + 1], before[idx + 1], engine_total_ticks);
+
+		if (flag[engine_idx] == TEST_LOAD)
+			assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+		else if (flag[engine_idx] == TEST_IDLE)
+			assert_within_epsilon(engine_active_ticks, 0.0f, tolerance);
+	}
+}
+
 static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
@@ -215,6 +247,62 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 		igt_assert(!engine_active_ticks);
 }
 
+static void engine_activity_load_single(int fd, int num_engines,
+					struct drm_xe_engine_class_instance *eci,
+					unsigned int flags)
+{
+	uint64_t ahnd, before[2 * num_engines], after[2 * num_engines], config;
+	struct drm_xe_engine_class_instance *eci_;
+	struct xe_cork *cork = NULL;
+	int pmu_fd[num_engines * 2], flag[num_engines];
+	int idx = 0, engine_idx;
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	xe_for_each_engine(fd, eci_) {
+		engine_idx = idx >> 1;
+		flag[engine_idx] = TEST_IDLE;
+
+		if (eci_->engine_class == eci->engine_class &&
+		    eci_->engine_instance == eci->engine_instance)
+			flag[engine_idx] = TEST_LOAD;
+
+		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		config = get_event_config(eci_->gt_id, eci_, "engine-total-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+	}
+
+	vm = xe_vm_create(fd, 0, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	if (flags & TEST_LOAD) {
+		cork = xe_cork_create_opts(fd, eci, vm, 1, 1, .ahnd = ahnd);
+		xe_cork_sync_start(fd, cork);
+	}
+
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	if (flags & TEST_TRAILING_IDLE)
+		end_cork(fd, cork);
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	end_cork(fd, cork);
+
+	if (cork)
+		xe_cork_destroy(fd, cork);
+
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+
+	for (idx = 0; idx < num_engines * 2; idx += 2) {
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+	}
+
+	check_all_engines(num_engines, flag, before, after);
+}
+
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks;
@@ -550,12 +638,13 @@ static void restore_gt_freq(int fd, uint32_t *stash_min, uint32_t *stash_max)
 
 igt_main
 {
-	int fd, gt;
+	int fd, gt, num_engines;
 	struct drm_xe_engine_class_instance *eci;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		xe_perf_device(fd, xe_device, sizeof(xe_device));
+		num_engines = xe_number_engines(fd);
 	}
 
 	igt_describe("Validate PMU gt-c6 residency counters when idle");
@@ -577,6 +666,14 @@ igt_main
 	test_each_engine("engine-activity-load", fd, eci)
 		engine_activity(fd, eci, TEST_LOAD);
 
+	igt_describe("Validate engine activity of all engines when one engine is loaded");
+	test_each_engine("engine-activity-single-load", fd, eci)
+		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD);
+
+	igt_describe("Validate engine activity of all engines with one engine loaded and trailing idle");
+	test_each_engine("engine-activity-single-load-idle", fd, eci)
+		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
+
 	igt_subtest_group {
 		unsigned int num_fns;
 
-- 
2.47.1

