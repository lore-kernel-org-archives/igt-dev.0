Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD2B10EC76
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 05:35:50 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Oct 2022 11:05:20 +0530
Message-Id: <20221017053524.2538178-5-riana.tauro@intel.com>
In-Reply-To: <20221017053524.2538178-1-riana.tauro@intel.com>
References: <20221017053524.2538178-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 4/8] i915/i915_pm_rc6_residency: Add
 energy support for dgfx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_power library reads energy using hwmon interface for dgfx and
rapl otherwise. Modify rc6-idle and rc6-fence to use igt_power interface.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 63 +++++++++++++++++-------------
 1 file changed, 36 insertions(+), 27 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index 670461c8..3554f5d7 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -378,26 +378,29 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
 	unsigned long slept, cycles;
 	unsigned long *done;
 	uint64_t rc6, ts[2];
-	struct rapl rapl;
+	struct igt_power gpu;
 	int fd;
 
 	fd = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
 	igt_drop_caches_set(i915, DROP_IDLE);
 	igt_require(__pmu_wait_for_rc6(fd));
-	gpu_power_open(&rapl);
+	igt_power_open(i915, &gpu, "gpu");
 
 	/* While idle check full RC6. */
-	rapl_read(&rapl, &sample[0]);
+	igt_power_get_energy(&gpu, &sample[0]);
 	rc6 = -__pmu_read_single(fd, &ts[0]);
 	slept = measured_usleep(duration_ns / 1000);
 	rc6 += __pmu_read_single(fd, &ts[1]);
 	igt_debug("slept=%lu perf=%"PRIu64", rc6=%"PRIu64"\n",
 		  slept, ts[1] - ts[0], rc6);
-	if (rapl_read(&rapl, &sample[1]))  {
-		double idle = power_J(&rapl, &sample[0], &sample[1]);
+	igt_power_get_energy(&gpu, &sample[1]);
+	if (sample[1].energy) {
+		double idle = igt_power_get_mJ(&gpu, &sample[0], &sample[1]);
+
 		igt_log(IGT_LOG_DOMAIN,
-                        idle > 1e-3 && gen > 6 ? IGT_LOG_WARN : IGT_LOG_INFO,
-                        "Total energy used while idle: %.1fmJ\n", idle * 1e3);
+			!gem_has_lmem(i915) && idle > 1e-3 && gen > 6 ? IGT_LOG_WARN : IGT_LOG_INFO,
+			"Total energy used while idle: %.1fmJ (%.1fmW)\n",
+			idle, (idle * 1e9) / slept);
 	}
 	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
 
@@ -408,7 +411,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
 		igt_fork(child, 1) /* Setup up a very light load */
 			bg_load(i915, ctx_id, flags, phases[p].flags, done);
 
-		rapl_read(&rapl, &sample[0]);
+		igt_power_get_energy(&gpu, &sample[0]);
 		cycles = -READ_ONCE(done[1]);
 		rc6 = -__pmu_read_single(fd, &ts[0]);
 		slept = measured_usleep(duration_ns / 1000);
@@ -416,14 +419,15 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
 		cycles += READ_ONCE(done[1]);
 		igt_debug("%s: slept=%lu perf=%"PRIu64", cycles=%lu, rc6=%"PRIu64"\n",
 			  phases[p].name, slept, ts[1] - ts[0], cycles, rc6);
-		if (rapl_read(&rapl, &sample[1]))  {
-			phases[p].power = power_J(&rapl, &sample[0], &sample[1]);
+		igt_power_get_energy(&gpu, &sample[1]);
+		if (sample[1].energy) {
+			phases[p].power = igt_power_get_mJ(&gpu, &sample[0], &sample[1]);
 			igt_info("Total energy used for %s: %.1fmJ (%.1fmW)\n",
 				 phases[p].name,
-				 phases[p].power * 1e3,
-				 phases[p].power * 1e12 / slept);
+				 phases[p].power,
+				 phases[p].power * 1e9 / slept);
 			phases[p].power /= slept; /* normalize */
-			phases[p].power *= 1e12; /* => mW */
+			phases[p].power *= 1e9; /* => mW */
 		}
 
 		*done = 1;
@@ -440,7 +444,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
 	munmap(done, 4096);
 	close(fd);
 
-	rapl_close(&rapl);
+	igt_power_close(&gpu);
 
 	if (phases[1].power - phases[0].power > 10) {
 		igt_assert_f(2 * phases[2].power - phases[0].power <= phases[1].power,
@@ -460,7 +464,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 	struct power_sample sample[2];
 	unsigned long slept;
 	uint64_t rc6, ts[2], ahnd;
-	struct rapl rapl;
+	struct igt_power gpu;
 	int fd;
 
 	igt_require_sw_sync();
@@ -468,20 +472,23 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 	fd = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
 	igt_drop_caches_set(i915, DROP_IDLE);
 	igt_require(__pmu_wait_for_rc6(fd));
-	gpu_power_open(&rapl);
+	igt_power_open(i915, &gpu, "gpu");
 
 	/* While idle check full RC6. */
-	rapl_read(&rapl, &sample[0]);
+	igt_power_get_energy(&gpu, &sample[0]);
 	rc6 = -__pmu_read_single(fd, &ts[0]);
 	slept = measured_usleep(duration_ns / 1000);
 	rc6 += __pmu_read_single(fd, &ts[1]);
 	igt_debug("slept=%lu perf=%"PRIu64", rc6=%"PRIu64"\n",
 		  slept, ts[1] - ts[0], rc6);
-	if (rapl_read(&rapl, &sample[1]))  {
-		double idle = power_J(&rapl, &sample[0], &sample[1]);
+
+	igt_power_get_energy(&gpu, &sample[1]);
+	if (sample[1].energy) {
+		double idle = igt_power_get_mJ(&gpu, &sample[0], &sample[1]);
 		igt_log(IGT_LOG_DOMAIN,
-			idle > 1e-3 && gen > 6 ? IGT_LOG_WARN : IGT_LOG_INFO,
-			"Total energy used while idle: %.1fmJ\n", idle * 1e3);
+			!gem_has_lmem(i915) && idle > 1e-3 && gen > 6 ? IGT_LOG_WARN : IGT_LOG_INFO,
+			"Total energy used while idle: %.1fmJ (%.1fmW)\n",
+			idle, (idle * 1e9) / slept);
 	}
 	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
 
@@ -502,18 +509,20 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 				    .flags = IGT_SPIN_FENCE_IN);
 		close(fence);
 
-		rapl_read(&rapl, &sample[0]);
+		igt_power_get_energy(&gpu, &sample[0]);
 		rc6 = -__pmu_read_single(fd, &ts[0]);
 		slept = measured_usleep(duration_ns / 1000);
 		rc6 += __pmu_read_single(fd, &ts[1]);
 		igt_debug("%s: slept=%lu perf=%"PRIu64", rc6=%"PRIu64"\n",
 			  e->name, slept, ts[1] - ts[0], rc6);
-		if (rapl_read(&rapl, &sample[1]))  {
-			double power = power_J(&rapl, &sample[0], &sample[1]);
+
+		igt_power_get_energy(&gpu, &sample[1]);
+		if (sample[1].energy) {
+			double power = igt_power_get_mJ(&gpu, &sample[0], &sample[1]);
 			igt_info("Total energy used for %s: %.1fmJ (%.1fmW)\n",
 				 e->name,
-				 power * 1e3,
-				 power * 1e12 / slept);
+				 power,
+				 power * 1e9 / slept);
 		}
 
 		igt_assert(gem_bo_busy(i915, spin->handle));
@@ -526,7 +535,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 	}
 	put_ahnd(ahnd);
 
-	rapl_close(&rapl);
+	igt_power_close(&gpu);
 	close(fd);
 }
 
-- 
2.25.1
