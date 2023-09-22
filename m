Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6B710E718
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 21:52:40 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:52:31 -0700
Message-Id: <20230922215233.2438200-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
References: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] i915/pmu: Switch to new busyness
 counter if old one is unavailable
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

MTL onwards, the old busyness counter is deprecated and users must use
the busyness ticks counter. Add support in IGT tests to switch to new
counter as needed.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/i915_drm_local.h |  10 ++++
 tests/intel/perf_pmu.c    | 115 +++++++++++++++++++++++++-------------
 2 files changed, 86 insertions(+), 39 deletions(-)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 0f47578c6..b94b88de3 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -26,6 +26,13 @@ extern "C" {
 #define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
 #define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
 
+#define I915_SAMPLE_BUSY_TICKS (I915_SAMPLE_SEMA + 1)
+
+#define I915_PMU_ENGINE_BUSY_TICKS(class, instance) \
+	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_BUSY_TICKS)
+
+#define I915_PMU_TOTAL_ACTIVE_TICKS	__I915_PMU_OTHER(5)
+
 /*
  * Top 4 bits of every non-engine counter are GT id.
  */
@@ -40,6 +47,9 @@ extern "C" {
 #define __I915_PMU_INTERRUPTS(gt)		___I915_PMU_OTHER(gt, 2)
 #define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
 #define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
+#define __I915_PMU_TOTAL_ACTIVE_TICKS(gt)	___I915_PMU_OTHER(gt, 5)
+
+#define   I915_SCHEDULER_CAP_ENGINE_BUSY_TICKS_STATS	(1ul << 5)
 
 #define I915_GEM_CREATE_EXT_SET_PAT 2
 
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index eafa3d988..5999d1e22 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -334,6 +334,35 @@ static char *get_drpc(int i915, int gt_id)
 	return igt_sysfs_get(gt_dir, "drpc");
 }
 
+static uint64_t __to_ns(uint64_t val)
+{
+	return busy_ticks_only ?
+	       (val * NSEC_PER_SEC) / cs_ts_freq :
+	       val;
+}
+
+#define __batch_duration_ns \
+({ \
+	unsigned long __delay_ns = busy_ticks_only ? \
+				   2000e6 : \
+				   batch_duration_ns; \
+	__delay_ns; \
+})
+
+#define __I915_PMU_ENGINE_BUSY(c, i) \
+({ \
+	uint64_t __config; \
+	typeof(c) __c = c; \
+	typeof(i) __i = i; \
+	\
+	if (busy_ticks_only) \
+		__config = I915_PMU_ENGINE_BUSY_TICKS(__c, __i); \
+	else \
+		__config = I915_PMU_ENGINE_BUSY(__c, __i); \
+	\
+	__config; \
+})
+
 static int open_pmu(int i915, uint64_t config)
 {
 	int fd;
@@ -506,10 +535,11 @@ single(int gem_fd, const intel_ctx_t *ctx,
 		spin = NULL;
 
 	val = pmu_read_single(fd);
-	slept = measured_usleep(batch_duration_ns / 1000);
+	slept = measured_usleep(__batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(gem_fd, spin, flags);
 	val = pmu_read_single(fd) - val;
+	val = __to_ns(val);
 
 	if (flags & FLAG_HANG)
 		igt_force_gpu_reset(gem_fd);
@@ -555,11 +585,12 @@ busy_start(int gem_fd, const intel_ctx_t *ctx,
 
 	spin = __igt_sync_spin(gem_fd, ahnd, ctx, e);
 
-	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
+	fd = open_pmu(gem_fd, __I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	val = __pmu_read_single(fd, &ts[0]);
-	slept = measured_usleep(batch_duration_ns / 1000);
+	slept = measured_usleep(__batch_duration_ns / 1000);
 	val = __pmu_read_single(fd, &ts[1]) - val;
+	val = __to_ns(val);
 	igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
 
 	igt_spin_free(gem_fd, spin);
@@ -611,11 +642,12 @@ busy_double_start(int gem_fd, const intel_ctx_t *ctx,
 	 * Open PMU as fast as possible after the second spin batch in attempt
 	 * to be faster than the driver handling lite-restore.
 	 */
-	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
+	fd = open_pmu(gem_fd, __I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	val = __pmu_read_single(fd, &ts[0]);
-	slept = measured_usleep(batch_duration_ns / 1000);
+	slept = measured_usleep(__batch_duration_ns / 1000);
 	val = __pmu_read_single(fd, &ts[1]) - val;
+	val = __to_ns(val);
 	igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
 
 	igt_spin_end(spin[0]);
@@ -685,8 +717,8 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 			busy_idx = i;
 
 		fd[i++] = open_group(gem_fd,
-				     I915_PMU_ENGINE_BUSY(e_->class,
-							  e_->instance),
+				     __I915_PMU_ENGINE_BUSY(e_->class,
+							    e_->instance),
 				     fd[0]);
 	}
 
@@ -694,7 +726,7 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 
 	spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
 	pmu_read_multi(fd[0], num_engines, tval[0]);
-	slept = measured_usleep(batch_duration_ns / 1000);
+	slept = measured_usleep(__batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(gem_fd, spin, flags);
 	pmu_read_multi(fd[0], num_engines, tval[1]);
@@ -706,7 +738,7 @@ busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	put_ahnd(ahnd);
 
 	for (i = 0; i < num_engines; i++)
-		val[i] = tval[1][i] - tval[0][i];
+		val[i] = __to_ns(tval[1][i] - tval[0][i]);
 
 	log_busy(num_engines, val);
 
@@ -756,7 +788,7 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 		else
 			spin = __igt_sync_spin_poll(gem_fd, ahnd, ctx, e_);
 
-		val[i++] = I915_PMU_ENGINE_BUSY(e_->class, e_->instance);
+		val[i++] = __I915_PMU_ENGINE_BUSY(e_->class, e_->instance);
 	}
 	igt_assert(i == num_engines);
 	igt_require(spin); /* at least one busy engine */
@@ -769,7 +801,7 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
 
 	pmu_read_multi(fd[0], num_engines, tval[0]);
-	slept = measured_usleep(batch_duration_ns / 1000);
+	slept = measured_usleep(__batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(gem_fd, spin, flags);
 	pmu_read_multi(fd[0], num_engines, tval[1]);
@@ -781,7 +813,7 @@ most_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	put_ahnd(ahnd);
 
 	for (i = 0; i < num_engines; i++)
-		val[i] = tval[1][i] - tval[0][i];
+		val[i] = __to_ns(tval[1][i] - tval[0][i]);
 
 	log_busy(num_engines, val);
 
@@ -815,7 +847,7 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 		else
 			spin = __igt_sync_spin_poll(gem_fd, ahnd, ctx, e);
 
-		val[i++] = I915_PMU_ENGINE_BUSY(e->class, e->instance);
+		val[i++] = __I915_PMU_ENGINE_BUSY(e->class, e->instance);
 	}
 	igt_assert(i == num_engines);
 
@@ -827,7 +859,7 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	usleep(__igt_sync_spin_wait(gem_fd, spin) * num_engines / 1e3);
 
 	pmu_read_multi(fd[0], num_engines, tval[0]);
-	slept = measured_usleep(batch_duration_ns / 1000);
+	slept = measured_usleep(__batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(gem_fd, spin, flags);
 	pmu_read_multi(fd[0], num_engines, tval[1]);
@@ -839,7 +871,7 @@ all_busy_check_all(int gem_fd, const intel_ctx_t *ctx,
 	put_ahnd(ahnd);
 
 	for (i = 0; i < num_engines; i++)
-		val[i] = tval[1][i] - tval[0][i];
+		val[i] = __to_ns(tval[1][i] - tval[0][i]);
 
 	log_busy(num_engines, val);
 
@@ -870,7 +902,7 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
 		spin = NULL;
 
 	pmu_read_multi(fd[0], 2, val[0]);
-	measured_usleep(batch_duration_ns / 1000);
+	measured_usleep(__batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		end_spin(gem_fd, spin, flags);
 	pmu_read_multi(fd[0], 2, val[1]);
@@ -983,7 +1015,7 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 		     "sampling failed to start withing 10ms\n");
 
 	val[0] = __pmu_read_single(fd, &ts[0]);
-	slept = measured_usleep(batch_duration_ns / 1000);
+	slept = measured_usleep(__batch_duration_ns / 1000);
 	if (flags & TEST_TRAILING_IDLE)
 		obj_ptr[0] = 1;
 	val[1] = __pmu_read_single(fd, &ts[1]);
@@ -1104,11 +1136,11 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
 
 	total = pmu_read_multi(pmu, 2, start);
 
-	sema = measured_usleep(batch_duration_ns * sema_pct / 100 / 1000);
+	sema = measured_usleep(__batch_duration_ns * sema_pct / 100 / 1000);
 	*map = 2; __sync_synchronize();
-	busy = measured_usleep(batch_duration_ns * (busy_pct - sema_pct) / 100 / 1000);
+	busy = measured_usleep(__batch_duration_ns * (busy_pct - sema_pct) / 100 / 1000);
 	igt_spin_end(spin);
-	measured_usleep(batch_duration_ns * (100 - busy_pct) / 100 / 1000);
+	measured_usleep(__batch_duration_ns * (100 - busy_pct) / 100 / 1000);
 
 	total = pmu_read_multi(pmu, 2, val) - total;
 	igt_spin_free(gem_fd, spin);
@@ -1116,7 +1148,7 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
 
 	busy += sema;
 	val[SEMA] -= start[SEMA];
-	val[BUSY] -= start[BUSY];
+	val[BUSY] -= __to_ns(start[BUSY]);
 
 	igt_info("%s, target: {%.1f%% [%d], %.1f%% [%d]}, measured: {%.1f%%, %.1f%%}\n",
 		 e->name,
@@ -1145,7 +1177,7 @@ sema_busy(int gem_fd, const intel_ctx_t *ctx,
 
 	fd[0] = open_group(gem_fd, I915_PMU_ENGINE_SEMA(e->class, e->instance),
 			   -1);
-	fd[1] = open_group(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance),
+	fd[1] = open_group(gem_fd, __I915_PMU_ENGINE_BUSY(e->class, e->instance),
 			   fd[0]);
 
 	__sema_busy(gem_fd, ahnd, fd[0], ctx, e, 50, 100);
@@ -1173,8 +1205,9 @@ static void test_awake(int i915, const intel_ctx_t *ctx)
 		igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 
 		val = pmu_read_single(fd);
-		slept = measured_usleep(batch_duration_ns / 1000);
+		slept = measured_usleep(__batch_duration_ns / 1000);
 		val = pmu_read_single(fd) - val;
+		val = __to_ns(val);
 
 		gem_quiescent_gpu(i915);
 		assert_within_epsilon(val, slept, tolerance);
@@ -1185,7 +1218,7 @@ static void test_awake(int i915, const intel_ctx_t *ctx)
 		igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 
 	val = pmu_read_single(fd);
-	slept = measured_usleep(batch_duration_ns / 1000);
+	slept = measured_usleep(__batch_duration_ns / 1000);
 	val = pmu_read_single(fd) - val;
 
 	gem_quiescent_gpu(i915);
@@ -1405,7 +1438,7 @@ static void
 multi_client(int gem_fd, const intel_ctx_t *ctx,
 	     const struct intel_execution_engine2 *e)
 {
-	uint64_t config = I915_PMU_ENGINE_BUSY(e->class, e->instance);
+	uint64_t config = __I915_PMU_ENGINE_BUSY(e->class, e->instance);
 	unsigned long slept[2];
 	uint64_t val[2], ts[2], perf_slept[2];
 	igt_spin_t *spin;
@@ -1426,14 +1459,16 @@ multi_client(int gem_fd, const intel_ctx_t *ctx,
 	spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
 
 	val[0] = val[1] = __pmu_read_single(fd[0], &ts[0]);
-	slept[1] = measured_usleep(batch_duration_ns / 1000);
+	slept[1] = measured_usleep(__batch_duration_ns / 1000);
 	val[1] = __pmu_read_single(fd[1], &ts[1]) - val[1];
+	val[1] = __to_ns(val[1]);
 	perf_slept[1] = ts[1] - ts[0];
 	igt_debug("slept=%lu perf=%"PRIu64"\n", slept[1], perf_slept[1]);
 	close(fd[1]);
 
-	slept[0] = measured_usleep(batch_duration_ns / 1000) + slept[1];
+	slept[0] = measured_usleep(__batch_duration_ns / 1000) + slept[1];
 	val[0] = __pmu_read_single(fd[0], &ts[1]) - val[0];
+	val[0] = __to_ns(val[0]);
 	perf_slept[0] = ts[1] - ts[0];
 	igt_debug("slept=%lu perf=%"PRIu64"\n", slept[0], perf_slept[0]);
 
@@ -1463,7 +1498,7 @@ static void invalid_init(int i915)
 #define ATTR_INIT() \
 do { \
 	memset(&attr, 0, sizeof (attr)); \
-	attr.config = I915_PMU_ENGINE_BUSY(I915_ENGINE_CLASS_RENDER, 0); \
+	attr.config = __I915_PMU_ENGINE_BUSY(I915_ENGINE_CLASS_RENDER, 0); \
 	attr.type = i915_perf_type_id(i915); \
 	igt_assert(attr.type != 0); \
 	errno = 0; \
@@ -1510,7 +1545,7 @@ static void cpu_hotplug(int gem_fd)
 	igt_require(cpu0_hotplug_support());
 
 	fd = open_pmu(gem_fd,
-		      I915_PMU_ENGINE_BUSY(I915_ENGINE_CLASS_RENDER, 0));
+		      __I915_PMU_ENGINE_BUSY(I915_ENGINE_CLASS_RENDER, 0));
 
 	/*
 	 * Create two spinners so test can ensure shorter gaps in engine
@@ -1608,6 +1643,7 @@ static void cpu_hotplug(int gem_fd)
 	}
 
 	val = __pmu_read_single(fd, &ts[1]) - val;
+	val = __to_ns(val);
 
 	end_spin(gem_fd, spin[0], FLAG_SYNC);
 	end_spin(gem_fd, spin[1], FLAG_SYNC);
@@ -1839,7 +1875,7 @@ test_frequency(int gem_fd, unsigned int gt)
 	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
 
 	slept = pmu_read_multi(fd[0], 2, start);
-	measured_usleep(batch_duration_ns / 1000);
+	measured_usleep(__batch_duration_ns / 1000);
 	slept = pmu_read_multi(fd[0], 2, val) - slept;
 
 	min[0] = 1e9*(val[0] - start[0]) / slept;
@@ -1869,7 +1905,7 @@ test_frequency(int gem_fd, unsigned int gt)
 	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
 
 	slept = pmu_read_multi(fd[0], 2, start);
-	measured_usleep(batch_duration_ns / 1000);
+	measured_usleep(__batch_duration_ns / 1000);
 	slept = pmu_read_multi(fd[0], 2, val) - slept;
 
 	max[0] = 1e9*(val[0] - start[0]) / slept;
@@ -1927,7 +1963,7 @@ test_frequency_idle(int gem_fd, unsigned int gt)
 	measured_usleep(2000); /* Wait for timers to cease */
 
 	slept = pmu_read_multi(fd[0], 2, start);
-	measured_usleep(batch_duration_ns / 1000);
+	measured_usleep(__batch_duration_ns / 1000);
 	slept = pmu_read_multi(fd[0], 2, val) - slept;
 
 	close(fd[0]);
@@ -2150,7 +2186,7 @@ static void
 test_enable_race(int gem_fd, const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e)
 {
-	uint64_t config = I915_PMU_ENGINE_BUSY(e->class, e->instance);
+	uint64_t config = __I915_PMU_ENGINE_BUSY(e->class, e->instance);
 	struct igt_helper_process engine_load = { };
 	const uint32_t bbend = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = { };
@@ -2223,7 +2259,7 @@ accuracy(int gem_fd, const intel_ctx_t *ctx,
 	unsigned long test_us;
 	unsigned long cycle_us, busy_us, idle_us;
 	double busy_r, expected;
-	uint64_t val[2];
+	uint64_t val[2], _val;
 	uint64_t ts[2];
 	int link[2];
 	int fd;
@@ -2342,7 +2378,7 @@ accuracy(int gem_fd, const intel_ctx_t *ctx,
 		put_ahnd(ahnd);
 	}
 
-	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(e->class, e->instance));
+	fd = open_pmu(gem_fd, __I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	/* Let the child run. */
 	read(link[0], &expected, sizeof(expected));
@@ -2359,7 +2395,8 @@ accuracy(int gem_fd, const intel_ctx_t *ctx,
 
 	igt_waitchildren();
 
-	busy_r = (double)(val[1] - val[0]) / (ts[1] - ts[0]);
+	_val = __to_ns(val[1] - val[0]);
+	busy_r = (double)_val / (ts[1] - ts[0]);
 
 	igt_info("error=%.2f%% (%.2f%% vs %.2f%%)\n",
 		 (busy_r - expected) * 100, 100 * busy_r, 100 * expected);
@@ -2392,7 +2429,7 @@ static void faulting_read(int gem_fd, const struct mmap_offset *t)
 	ptr = create_mmap(gem_fd, t, 4096);
 	igt_require(ptr != NULL);
 
-	fd = open_pmu(gem_fd, I915_PMU_ENGINE_BUSY(0, 0));
+	fd = open_pmu(gem_fd, __I915_PMU_ENGINE_BUSY(0, 0));
 	igt_require(fd != -1);
 	igt_assert_eq(read(fd, ptr, 4096), 2 * sizeof(uint64_t));
 	close(fd);
@@ -2433,7 +2470,7 @@ static void test_unload(unsigned int num_engines)
 		cfg = intel_ctx_cfg_all_physical(i915);
 		for_each_ctx_cfg_engine(i915, &cfg, e) {
 			fd[count] = perf_i915_open_group(i915,
-							 I915_PMU_ENGINE_BUSY(e->class, e->instance),
+							 __I915_PMU_ENGINE_BUSY(e->class, e->instance),
 							 fd[count - 1]);
 			if (fd[count] != -1)
 				count++;
@@ -2580,7 +2617,7 @@ igt_main
 	 * is correctly rejected.
 	 */
 	test_each_engine("init-busy", fd, ctx, e)
-		init(fd, ctx, e, I915_PMU_ENGINE_BUSY(e->class, e->instance));
+		init(fd, ctx, e, __I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	test_each_engine("init-wait", fd, ctx, e)
 		init(fd, ctx, e, I915_PMU_ENGINE_WAIT(e->class, e->instance));
-- 
2.38.1
