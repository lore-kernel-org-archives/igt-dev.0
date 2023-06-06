Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0077610E129
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 01:21:54 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 18:21:47 -0700
Message-Id: <20230606012150.2119065-2-ashutosh.dixit@intel.com>
In-Reply-To: <20230606012150.2119065-1-ashutosh.dixit@intel.com>
References: <20230606012150.2119065-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/gem_ctx_freq: Add support for
 multi-gts
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

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Run subtest sysfs-range on available sysfs interfaces.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_ctx_freq.c | 99 ++++++++++++++++++++++++++-------------
 1 file changed, 66 insertions(+), 33 deletions(-)

diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index 2c30934daa23..b2f6c2af55e1 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -24,12 +24,15 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <limits.h>
 #include <sched.h>
 #include <stdlib.h>
 #include <stdint.h>
 #include <unistd.h>
 
 #include "i915/gem.h"
+#include "i915/gem_engine_topology.h"
+#include "i915_drm.h"
 #include "igt.h"
 #include "igt_perf.h"
 #include "igt_sysfs.h"
@@ -49,6 +52,7 @@
 #define SAMPLE_PERIOD (USEC_PER_SEC / 10)
 #define PMU_TOLERANCE 100
 
+static int i915 = -1;
 static int sysfs = -1;
 
 static void kick_rps_worker(void)
@@ -90,7 +94,7 @@ static void pmu_assert(double actual, double target)
 		     actual, target, PMU_TOLERANCE);
 }
 
-static void busy_wait_until_idle(int i915, igt_spin_t *spin)
+static void busy_wait_until_idle(igt_spin_t *spin)
 {
 	igt_spin_end(spin);
 	do {
@@ -98,9 +102,9 @@ static void busy_wait_until_idle(int i915, igt_spin_t *spin)
 	} while (gem_bo_busy(i915, spin->handle));
 }
 
-static void __igt_spin_free_idle(int i915, igt_spin_t *spin)
+static void __igt_spin_free_idle(igt_spin_t *spin)
 {
-	busy_wait_until_idle(i915, spin);
+	busy_wait_until_idle(spin);
 
 	igt_spin_free(i915, spin);
 }
@@ -115,23 +119,25 @@ static void triangle_fill(uint32_t *t, unsigned int nstep,
 	}
 }
 
-static void set_sysfs_freq(uint32_t min, uint32_t max)
+static void set_sysfs_freq(int dirfd, uint32_t min, uint32_t max)
 {
-	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", min);
-	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", max);
+	igt_sysfs_rps_printf(dirfd, RPS_MIN_FREQ_MHZ, "%u", min);
+	igt_sysfs_rps_printf(dirfd, RPS_MAX_FREQ_MHZ, "%u", max);
 }
 
-static bool get_sysfs_freq(uint32_t *min, uint32_t *max)
+static bool get_sysfs_freq(int dirfd, uint32_t *min, uint32_t *max)
 {
-	return (igt_sysfs_scanf(sysfs, "gt_min_freq_mhz", "%u", min) == 1 &&
-		igt_sysfs_scanf(sysfs, "gt_max_freq_mhz", "%u", max) == 1);
+	return (igt_sysfs_rps_scanf(dirfd, RPS_MIN_FREQ_MHZ, "%u", min) == 1 &&
+		igt_sysfs_rps_scanf(dirfd, RPS_MAX_FREQ_MHZ, "%u", max) == 1);
 }
 
-static void sysfs_range(int i915)
+static void sysfs_range(int dirfd, int gt)
 {
 #define N_STEPS 10
 	uint32_t frequencies[TRIANGLE_SIZE(N_STEPS)];
-	uint32_t sys_min, sys_max;
+	struct i915_engine_class_instance *ci;
+	uint32_t sys_min, sys_max, ctx;
+	unsigned int count;
 	igt_spin_t *spin;
 	double measured;
 	int pmu;
@@ -144,12 +150,19 @@ static void sysfs_range(int i915)
 	 * constriained sysfs range.
 	 */
 
-	igt_require(get_sysfs_freq(&sys_min, &sys_max));
+	igt_require(get_sysfs_freq(dirfd, &sys_min, &sys_max));
 	igt_info("System min freq: %dMHz; max freq: %dMHz\n", sys_min, sys_max);
 
 	triangle_fill(frequencies, N_STEPS, sys_min, sys_max);
 
-	pmu = perf_i915_open(i915, I915_PMU_REQUESTED_FREQUENCY);
+	ci = gem_list_engines(i915, 1 << gt, ~0U, &count);
+	igt_require(ci);
+	ctx = gem_context_create_for_engine(i915,
+					    ci[0].engine_class,
+					    ci[0].engine_instance);
+	free(ci);
+
+	pmu = perf_i915_open(i915, __I915_PMU_REQUESTED_FREQUENCY(gt));
 	igt_require(pmu >= 0);
 
 	for (int outer = 0; outer <= 2*N_STEPS; outer++) {
@@ -157,17 +170,17 @@ static void sysfs_range(int i915)
 		uint32_t cur, discard;
 
 		gem_quiescent_gpu(i915);
-		spin = igt_spin_new(i915, .ahnd = ahnd);
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx_id = ctx);
 		usleep(10000);
 
-		set_sysfs_freq(sys_freq, sys_freq);
-		get_sysfs_freq(&cur, &discard);
+		set_sysfs_freq(dirfd, sys_freq, sys_freq);
+		get_sysfs_freq(dirfd, &cur, &discard);
 
 		measured = measure_frequency(pmu, SAMPLE_PERIOD);
 		igt_debugfs_dump(i915, "i915_rps_boost_info");
 
-		set_sysfs_freq(sys_min, sys_max);
-		__igt_spin_free_idle(i915, spin);
+		set_sysfs_freq(dirfd, sys_min, sys_max);
+		__igt_spin_free_idle(spin);
 
 		igt_info("sysfs: Measured %.1fMHz, expected %dMhz\n",
 			 measured, cur);
@@ -175,42 +188,57 @@ static void sysfs_range(int i915)
 	}
 	gem_quiescent_gpu(i915);
 
+	gem_context_destroy(i915, ctx);
 	close(pmu);
 	put_ahnd(ahnd);
 
 #undef N_STEPS
 }
 
-static void restore_sysfs_freq(int sig)
+static void __restore_sysfs_freq(int dirfd)
 {
 	char buf[256];
 
 	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0)
-		igt_sysfs_set(sysfs, "gt_min_freq_mhz", buf);
+		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
 
-	if (igt_sysfs_read(sysfs, "gt_RP0_freq_mhz", buf, sizeof(buf)) > 0) {
-		igt_sysfs_set(sysfs, "gt_max_freq_mhz", buf);
-		igt_sysfs_set(sysfs, "gt_boost_freq_mhz", buf);
+	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0) {
+		igt_sysfs_rps_set(dirfd, RPS_MAX_FREQ_MHZ, buf);
+		igt_sysfs_rps_set(dirfd, RPS_BOOST_FREQ_MHZ, buf);
 	}
 }
 
-static void disable_boost(void)
+static void restore_sysfs_freq(int sig)
+{
+	int dirfd, gt;
+
+	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
+		__restore_sysfs_freq(dirfd);
+}
+
+static void __disable_boost(int dirfd)
 {
 	char buf[256];
 
-	if (igt_sysfs_read(sysfs, "gt_RPn_freq_mhz", buf, sizeof(buf)) > 0) {
-		igt_sysfs_set(sysfs, "gt_min_freq_mhz", buf);
-		igt_sysfs_set(sysfs, "gt_boost_freq_mhz", buf);
+	if (igt_sysfs_rps_read(dirfd, RPS_RPn_FREQ_MHZ, buf, sizeof(buf)) > 0) {
+		igt_sysfs_rps_set(dirfd, RPS_MIN_FREQ_MHZ, buf);
+		igt_sysfs_rps_set(dirfd, RPS_BOOST_FREQ_MHZ, buf);
 	}
 
-	if (igt_sysfs_read(sysfs, "gt_RP0_freq_mhz", buf, sizeof(buf)) > 0)
-		igt_sysfs_set(sysfs, "gt_max_freq_mhz", buf);
+	if (igt_sysfs_rps_read(dirfd, RPS_RP0_FREQ_MHZ, buf, sizeof(buf)) > 0)
+		igt_sysfs_rps_set(dirfd, RPS_MAX_FREQ_MHZ, buf);
 }
 
-igt_main
+static void disable_boost(void)
 {
-	int i915 = -1;
+	int dirfd, gt;
+
+	for_each_sysfs_gt_dirfd(i915, dirfd, gt)
+		__disable_boost(dirfd);
+}
 
+igt_main
+{
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
@@ -222,6 +250,11 @@ igt_main
 		disable_boost();
 	}
 
-	igt_subtest_f("sysfs")
-		sysfs_range(i915);
+	igt_subtest_with_dynamic_f("sysfs") {
+		int dirfd, gt;
+
+		for_each_sysfs_gt_dirfd(i915, dirfd, gt)
+			igt_dynamic_f("gt%u", gt)
+				sysfs_range(dirfd, gt);
+	}
 }
-- 
2.38.0
