Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C721FCA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 07:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797FA10E3D7;
	Mon, 18 Aug 2025 07:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpQ0eGTk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AFF10E3D7
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755502837; x=1787038837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QGXIXIA1ezsd2sPu7ufyFNKNCFD0mnEIk1J0mHvHx5w=;
 b=bpQ0eGTkc0XwB2zejY7nkx2/TUcriN8wjwPtW1gEQI5aoJ3T5bZ/9MvR
 ZXZVI6r3OeTpW4Fe+x5Nm1C7/LlUzYKOFpoVLHQHJQHAxR0nRJc8zcx/E
 KetHQMyPPWcrovZcS9ThNd5rkdiDWriq9BnMdQkxcRec+mNDLEadqdkpj
 4TUINt5uUxzXCs5u4mU1HQq0G9L4tiKLcypA89fofPvljRYeScaFxDaqr
 2Px0KugPks1+fZ8F5pNEuXxP3r7DlqIKqpO0PG/ffg/YBc5htuBYdStU+
 PROekpbMHClQ9GqwHvSVND95zJA3q5XN+lBKBIAHEEx9XzAlB7sy/Ib3B A==;
X-CSE-ConnectionGUID: /SvOl0eESdKBuMM6HvTvtA==
X-CSE-MsgGUID: iFGhDl06TuSWXyhPw270FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57630024"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57630024"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:40:36 -0700
X-CSE-ConnectionGUID: wJOniug1RVG37WGH3SC0lA==
X-CSE-MsgGUID: T2/ixEUeRFqXqoAd98po6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172849340"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:40:34 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v1] tests/intel/xe_pmu: Add tests to validate engine
 activity accuracy
Date: Mon, 18 Aug 2025 13:02:49 +0530
Message-Id: <20250818073249.3348233-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add test to validate the engine activity is reported with expected
accuracy. Load the engine for 2%, 50% and 90%.

co-developed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 152 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index a98fba5a4..9fd538a01 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -72,6 +72,12 @@
  * SUBTEST: engine-activity-render-node-load-idle
  * Description: Test to validate engine activity on render node by running workload and trailing idle
  *
+ * SUBTEST: engine-activity-accuracy-2
+ * SUBTEST: engine-activity-accuracy-50
+ * SUBTEST: engine-activity-accuracy-90
+ * Description: Test to validate accuracy of engine activity for the above percentage by
+ *		running workload
+ *
  * SUBTEST: all-fn-engine-activity-load
  * Description: Test to validate engine activity by running load on all functions simultaneously
  *
@@ -482,6 +488,140 @@ static void engine_activity_load_all(int fd, int num_engines, unsigned int flags
 	check_all_engines(num_engines, flag, before, after);
 }
 
+#define assert_within(x, ref, tol) \
+	igt_assert_f((double)(x) <= ((double)(ref) + (tol)) && \
+		     (double)(x) >= ((double)(ref) - (tol)), \
+		     "%f not within +%f/-%f of %f! ('%s' vs '%s')\n", \
+		     (double)(x), (double)(tol), (double)(tol), \
+		     (double)(ref), #x, #ref)
+
+static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
+		     unsigned long target_percentage, unsigned long target_iter)
+{
+	unsigned long active_us, cycle_us, calibration_us, idle_us, test_us;
+	const unsigned long min_test_us = 1e6;
+	uint64_t config, before[2], after[2];
+	int link[2], pmu_fd[2];
+	double engine_activity, expected;
+
+	cycle_us = min_test_us / target_iter;
+	active_us = cycle_us * target_percentage / 100;
+	idle_us = cycle_us - active_us;
+	test_us = cycle_us * target_iter;
+	calibration_us = test_us / 2;
+
+	while (idle_us < 2500 || active_us < 2500) {
+		active_us *= 2;
+		idle_us *= 2;
+	}
+
+	igt_info("calibration=%lums, test=%lums, cycle=%lums; ratio=%.2f%% (%luus/%luus)\n",
+		 calibration_us / 1000, test_us / 1000, cycle_us / 1000,
+		 ((double)active_us / cycle_us) * 100.0, active_us, idle_us);
+
+	igt_assert(pipe(link) == 0);
+
+	igt_fork(child, 1) {
+		const unsigned int timeout[] = { calibration_us * 1000, test_us * 1000 };
+		uint64_t total_active_ns = 0, total_ns = 0;
+		igt_spin_t *spin;
+		uint64_t vm, ahnd;
+
+		vm = xe_vm_create(fd, 0, 0);
+		intel_allocator_init();
+		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+		for (int pass = 0; pass < ARRAY_SIZE(timeout); pass++) {
+			unsigned int target_idle_us = idle_us;
+			struct timespec start = { };
+			uint64_t pass_active_ns = 0;
+			unsigned long pass_ns = 0;
+			double avg = 0.0, var = 0.0;
+			int n = 0;
+
+			igt_nsec_elapsed(&start);
+
+			while (pass_ns < timeout[pass]) {
+				unsigned long loop_ns, loop_active_ns, loop_idle_ns, now;
+				double err, prev_avg, cur_val;
+
+				/* idle sleep */
+				igt_measured_usleep(target_idle_us);
+
+				/* start spinner */
+				spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+				loop_idle_ns = igt_nsec_elapsed(&start);
+				igt_measured_usleep(active_us);
+				igt_spin_free(fd, spin);
+
+				now = igt_nsec_elapsed(&start);
+				loop_active_ns = now - loop_idle_ns;
+				loop_ns = now - pass_ns;
+				pass_ns = now;
+
+				pass_active_ns += loop_active_ns;
+				total_active_ns += loop_active_ns;
+				total_ns += loop_ns;
+
+				/* Re-calibrate according to err */
+				err = (double)total_active_ns / total_ns -
+				      (double)target_percentage / 100.0;
+
+				target_idle_us = (double)target_idle_us * (1.0 + err);
+
+				/* Running average and variance for debug. */
+				cur_val = 100.0 * total_active_ns / total_ns;
+				prev_avg = avg;
+				avg += (cur_val - avg) / ++n;
+				var += (cur_val - avg) * (cur_val - prev_avg);
+			}
+
+			expected = (double)pass_active_ns / pass_ns;
+
+			igt_info("%u: %d cycles, busy %" PRIu64 " us, idle %" PRIu64 " us -> %.2f%% "
+				 "(target: %lu%%; average = %.2f ± %.3f%%)\n",
+				 pass, n, pass_active_ns / 1000, (pass_ns - pass_active_ns) / 1000,
+				 100 * expected, target_percentage, avg, sqrt(var / n));
+
+			igt_assert_eq(write(link[1], &expected, sizeof(expected)),
+				      sizeof(expected));
+		}
+
+		xe_vm_destroy(fd, vm);
+		put_ahnd(ahnd);
+	}
+
+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
+	pmu_fd[0] = open_group(fd, config, -1);
+
+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
+
+	/* wait for calibration cycle to complete */
+	igt_assert_eq(read(link[0], &expected, sizeof(expected)),
+		      sizeof(expected));
+
+	pmu_read_multi(pmu_fd[0], 2, before);
+	igt_assert_eq(read(link[0], &expected, sizeof(expected)),
+		      sizeof(expected));
+	pmu_read_multi(pmu_fd[0], 2, after);
+
+	close(pmu_fd[0]);
+	close(pmu_fd[1]);
+
+	close(link[1]);
+	close(link[0]);
+
+	igt_waitchildren();
+
+	engine_activity = (double)(after[0] - before[0]) / (after[1] - before[1]);
+
+	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
+		 (engine_activity - expected) * 100, 100 * engine_activity, 100 * expected);
+
+	assert_within(100.0 * engine_activity, 100.0 * expected, 3);
+}
+
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks;
@@ -986,6 +1126,18 @@ igt_main
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
 	}
 
+	igt_subtest_group {
+		const unsigned int percent[] = { 2, 50, 90 };
+
+		for (unsigned int i = 0; i < ARRAY_SIZE(percent); i++) {
+			char test_name[NAME_MAX];
+
+			snprintf(test_name, NAME_MAX, "engine-activity-accuracy-%u", percent[i]);
+			test_each_engine(test_name, fd, eci)
+				accuracy(fd, eci, percent[i], 10);
+		}
+	}
+
 	igt_describe("Validate engine activity when PMU is opened after load");
 	test_each_engine("engine-activity-after-load-start", fd, eci)
 		engine_activity_load_start(fd, eci);
-- 
2.34.1

