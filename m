Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDC810E4E2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 02:54:10 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 18:54:06 -0800
Message-Id: <20221215025406.2436843-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [CI i-g-t] tests/perf_pmu: Try to understand GL #6806
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

CI ONLY, PLEASE DON'T REVIEW

Try to repro GL #6806 and see what is really happening there since it could
not be reproduced locally.

The only machine this is reproducing on is bat-dg2-11 which it appears has
been moved from trybot to drm-tip CI. So, sorry, not sending this patch to
trybot.

v2: See freq's (especially min) without setting min/max but after a spinner
    has been started

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c                 | 48 +++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 49 insertions(+)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index f363db2ba13..265cba24616 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1543,6 +1543,19 @@ test_interrupts_sync(int gem_fd)
 	igt_assert_lte(target, busy);
 }
 
+static void print_freq(int sysfs)
+{
+	igt_info("--------------- Freq ------------- \n");
+	igt_info("RP0 %u\n", igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz"));
+	igt_info("RP1 %u\n", igt_sysfs_get_u32(sysfs, "gt_RP1_freq_mhz"));
+	igt_info("RPn %u\n", igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz"));
+	igt_info("boost %u\n", igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz"));
+	igt_info("act %u\n", igt_sysfs_get_u32(sysfs, "gt_act_freq_mhz"));
+	igt_info("cur %u\n", igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz"));
+	igt_info("max %u\n", igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz"));
+	igt_info("min %u\n", igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz"));
+}
+
 static void
 test_frequency(int gem_fd)
 {
@@ -1568,6 +1581,27 @@ test_frequency(int gem_fd)
 	fd[0] = open_group(gem_fd, I915_PMU_REQUESTED_FREQUENCY, -1);
 	fd[1] = open_group(gem_fd, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
 
+	print_freq(sysfs);
+
+	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
+	spin = spin_sync_flags(gem_fd, ahnd, 0, I915_EXEC_DEFAULT);
+
+	slept = pmu_read_multi(fd[0], 2, start);
+	measured_usleep(batch_duration_ns / 1000);
+	slept = pmu_read_multi(fd[0], 2, val) - slept;
+
+	min[0] = 1e9*(val[0] - start[0]) / slept;
+	min[1] = 1e9*(val[1] - start[1]) / slept;
+
+	print_freq(sysfs);
+
+	igt_spin_free(gem_fd, spin);
+	gem_quiescent_gpu(gem_fd); /* Don't leak busy bo into the next phase */
+
+	usleep(1e6);
+
+	print_freq(sysfs);
+
 	/*
 	 * Set GPU to min frequency and read PMU counters.
 	 */
@@ -1578,6 +1612,8 @@ test_frequency(int gem_fd)
 	igt_require(igt_sysfs_set_u32(sysfs, "gt_boost_freq_mhz", min_freq));
 	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == min_freq);
 
+	print_freq(sysfs);
+
 	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
 	spin = spin_sync_flags(gem_fd, ahnd, 0, I915_EXEC_DEFAULT);
 
@@ -1588,11 +1624,15 @@ test_frequency(int gem_fd)
 	min[0] = 1e9*(val[0] - start[0]) / slept;
 	min[1] = 1e9*(val[1] - start[1]) / slept;
 
+	print_freq(sysfs);
+
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd); /* Don't leak busy bo into the next phase */
 
 	usleep(1e6);
 
+	print_freq(sysfs);
+
 	/*
 	 * Set GPU to max frequency and read PMU counters.
 	 */
@@ -1604,6 +1644,8 @@ test_frequency(int gem_fd)
 	igt_require(igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", max_freq));
 	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == max_freq);
 
+	print_freq(sysfs);
+
 	gem_quiescent_gpu(gem_fd);
 	spin = spin_sync_flags(gem_fd, ahnd, 0, I915_EXEC_DEFAULT);
 
@@ -1614,9 +1656,13 @@ test_frequency(int gem_fd)
 	max[0] = 1e9*(val[0] - start[0]) / slept;
 	max[1] = 1e9*(val[1] - start[1]) / slept;
 
+	print_freq(sysfs);
+
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd);
 
+	print_freq(sysfs);
+
 	/*
 	 * Restore min/max.
 	 */
@@ -1633,6 +1679,8 @@ test_frequency(int gem_fd)
 	igt_info("Max frequency: requested %.1f, actual %.1f\n",
 		 max[0], max[1]);
 
+	print_freq(sysfs);
+
 	assert_within_epsilon(min[0], min_freq, tolerance);
 	/*
 	 * On thermally throttled devices we cannot be sure maximum frequency
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 88c90221e5a..28e1b16849c 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -128,6 +128,7 @@ igt@i915_pm_backlight@basic-brightness
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
 igt@i915_pm_rps@basic-api
+igt@perf_pmu@frequency
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
 igt@prime_self_import@basic-with_fd_dup
-- 
2.38.0
