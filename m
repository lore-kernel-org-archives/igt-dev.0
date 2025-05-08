Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69226C3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 05:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230E510E32B;
	Thu,  8 May 2025 05:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qp9DnxCh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1D610E32B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 05:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746682019; x=1778218019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m1ppxSOoav4j4ku+/qzeVpPLKB7HPVq9g7Fr24Zz9Z4=;
 b=Qp9DnxChs8NwyFOJ7hzysCuKzjqZE37hbLU2GkoRECVOABLSSDbYbwzJ
 ZRbtwUhi3rknTmteTD2K/XsDESF2Nu5T11USr0vy48KXC+fHgybe+tVGv
 vM60jG+XCtXbN+DpxAkTXooQF4eW7Lxuzh40DrlPDDFW0MChL32ebmHiH
 M/K6vDTMPmvt77Ju98BVGYDvg2YKD9wygV+S6Gtf960WLEL/p0eHiKbwf
 KLIuE16MqNCj/uM95RF9AaJMEaPNw6vgw2vGAzTCduCVQYVU/4Qs9NfCE
 bIsXEOasj+6N3LLRVm8MYjUC9wWEjQFD3VRI+15TNF34jH9XG8QQn8YhA g==;
X-CSE-ConnectionGUID: qc/CaKjrQ2GJotKEHBvUwQ==
X-CSE-MsgGUID: d0AEmF9ISmqSwgpfgCI+7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59798131"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="59798131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:26:59 -0700
X-CSE-ConnectionGUID: mt5ECJPCRqCYDnnqN18GFg==
X-CSE-MsgGUID: 0f8A+hZIQTqdojiYyGgalQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="167124030"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 22:26:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 3/5] tests/intel/xe_pmu: Add tests to validate engine
 activity with single engine active
Date: Thu,  8 May 2025 11:20:04 +0530
Message-ID: <20250508055006.734259-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508055006.734259-1-riana.tauro@intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 114 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 1ad927822..d78b8bea5 100644
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
@@ -165,6 +174,43 @@ static void check_and_end_cork(int fd, struct xe_cork *cork)
 		xe_cork_sync_end(fd, cork);
 }
 
+static void log_all_engines(int num_engines, int skip_idx, int flag,
+			    uint64_t *before, uint64_t *after)
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
+		/*
+		 * If flag is load and skip_idx is set, then check all engines for load except
+		 * the skip engine id and vice versa
+		 */
+		if (flag == TEST_LOAD) {
+			if (engine_idx == skip_idx)
+				assert_within_epsilon(engine_active_ticks, 0.0f, tolerance);
+			else
+				assert_within_epsilon(engine_active_ticks, engine_total_ticks,
+						      tolerance);
+		} else {
+			if (engine_idx == skip_idx)
+				assert_within_epsilon(engine_active_ticks, engine_total_ticks,
+						      tolerance);
+			else
+				assert_within_epsilon(engine_active_ticks, 0.0f, tolerance);
+		}
+	}
+}
+
 static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
@@ -216,6 +262,63 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 		igt_assert(!engine_active_ticks);
 }
 
+static void engine_activity_load_single(int fd, int num_engines,
+					struct drm_xe_engine_class_instance *eci,
+					unsigned int flags)
+{
+	uint64_t ahnd, before[2 * num_engines], after[2 * num_engines], config;
+	struct drm_xe_engine_class_instance *eci_;
+	struct xe_cork *cork = NULL;
+	int pmu_fd[num_engines * 2];
+	int idx = 0, busy_idx = 0;
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	xe_for_each_engine(fd, eci_) {
+		if (eci_->engine_class == eci->engine_class &&
+		    eci_->engine_instance == eci->engine_instance)
+			busy_idx = idx >> 1;
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
+		xe_cork_sync_end(fd, cork);
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	if (flags & TEST_LOAD) {
+		check_and_end_cork(fd, cork);
+		xe_cork_destroy(fd, cork);
+	}
+
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+
+	for (idx = 0; idx < num_engines * 2; idx += 2) {
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+	}
+
+	/*
+	 * TEST_IDLE is passed to log_all_engines to test if all other engines are idle
+	 * except the busy_idx
+	 */
+	log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
+}
+
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks;
@@ -544,12 +647,13 @@ static void restore_gt_freq(int fd, uint32_t *stash_min, uint32_t *stash_max)
 
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
@@ -571,6 +675,14 @@ igt_main
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

