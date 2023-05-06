Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C7E10E155
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 00:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  5 May 2023 17:55:16 -0700
Message-Id: <20230506005528.1890922-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/15] perf_pmu: Support multi-tile in
 frequency subtest
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Simple conversion to run the frequency tests per each tile, as dynamic
subtests, picking the correct engine to stimulate each.

v2: Added new intel_ctx_t implementation for frequency subtest.
v3: Replace distance query with mtl specific static mapping
v4: Break as soon as you find one engine in gt

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com> (v2)
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf_pmu.c | 197 +++++++++++++++++++++++++++++++++---------
 1 file changed, 155 insertions(+), 42 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 8fb54aa03..0b1177785 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -238,19 +238,6 @@ static igt_spin_t *spin_sync(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 	return __spin_sync(fd, ahnd, ctx, e);
 }
 
-static igt_spin_t *spin_sync_flags(int fd, uint64_t ahnd,
-				   const intel_ctx_t *ctx, unsigned int flags)
-{
-	struct intel_execution_engine2 e = { };
-
-	e.class = gem_execbuf_flags_to_engine_class(flags);
-	e.instance = (flags & (I915_EXEC_BSD_MASK | I915_EXEC_RING_MASK)) ==
-		     (I915_EXEC_BSD | I915_EXEC_BSD_RING2) ? 1 : 0;
-	e.flags = flags;
-
-	return spin_sync(fd, ahnd, ctx, &e);
-}
-
 static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
 {
 	if (!spin)
@@ -1539,8 +1526,127 @@ test_interrupts_sync(int gem_fd)
 	igt_assert_lte(target, busy);
 }
 
+static int
+__i915_query(int fd, struct drm_i915_query *q)
+{
+	if (igt_ioctl(fd, DRM_IOCTL_I915_QUERY, q))
+		return -errno;
+
+	return 0;
+}
+
+static int
+__i915_query_items(int fd, struct drm_i915_query_item *items, uint32_t n_items)
+{
+	struct drm_i915_query q = {
+		.num_items = n_items,
+		.items_ptr = to_user_pointer(items),
+		};
+
+	return __i915_query(fd, &q);
+}
+
+#define i915_query_items(fd, items, n_items) \
+do { \
+	igt_assert_eq(__i915_query_items(fd, items, n_items), 0); \
+	errno = 0; \
+} while (0)
+
+static bool
+engine_in_gt(int i915, const struct i915_engine_class_instance *ci,
+	     unsigned int gt)
+{
+	/* If just one gt, return true always */
+	if (!IS_METEORLAKE(intel_get_drm_devid(i915)))
+		return true;
+
+	/*
+	 * This should ideally use a query mechanism, but such mechanisms are
+	 * not in upstream. Until a better solution is upstreamed, use a static
+	 * mapping here.
+	 */
+	switch (ci->engine_class) {
+		case I915_ENGINE_CLASS_RENDER:
+		case I915_ENGINE_CLASS_COMPUTE:
+		case I915_ENGINE_CLASS_COPY:
+			return gt == 0;
+		case I915_ENGINE_CLASS_VIDEO:
+		case I915_ENGINE_CLASS_VIDEO_ENHANCE:
+			return gt == 1;
+		default:
+			igt_assert_f(0, "Unsupported engine class %d\n", ci->engine_class);
+			return false;
+	}
+}
+
+static struct i915_engine_class_instance
+find_dword_engine(int i915, const unsigned int gt)
+{
+	struct drm_i915_query_engine_info *engines;
+	struct i915_engine_class_instance ci = { -1, -1 };
+	struct drm_i915_query_item item;
+	unsigned int i;
+
+	engines = malloc(4096);
+	igt_assert(engines);
+
+	memset(engines, 0, 4096);
+	memset(&item, 0, sizeof(item));
+	item.query_id = DRM_I915_QUERY_ENGINE_INFO;
+	item.length = 4096;
+	item.data_ptr = to_user_pointer(engines);
+	i915_query_items(i915, &item, 1);
+	igt_assert(item.length > 0);
+
+	for (i = 0; i < engines->num_engines; i++) {
+		struct drm_i915_engine_info *e =
+			(struct drm_i915_engine_info *)&engines->engines[i];
+
+		if (!gem_class_can_store_dword(i915, e->engine.engine_class))
+			continue;
+
+		if (engine_in_gt(i915, &e->engine, gt)) {
+			ci.engine_class = e->engine.engine_class;
+			ci.engine_instance = e->engine.engine_instance;
+			break;
+		}
+	}
+
+	free(engines);
+
+	return ci;
+}
+
+static igt_spin_t *spin_sync_gt(int i915, uint64_t ahnd, unsigned int gt,
+				const intel_ctx_t **ctx)
+{
+	struct i915_engine_class_instance ci = { -1, -1 };
+	struct intel_execution_engine2 e = { };
+
+	ci = find_dword_engine(i915, gt);
+
+	igt_require(ci.engine_class != (uint16_t)I915_ENGINE_CLASS_INVALID);
+
+	if (gem_has_contexts(i915)) {
+		e.class = ci.engine_class;
+		e.instance = ci.engine_instance;
+		e.flags = 0;
+		*ctx = intel_ctx_create_for_engine(i915, e.class, e.instance);
+	} else {
+		igt_require(gt == 0); /* Impossible anyway. */
+		e.class = gem_execbuf_flags_to_engine_class(I915_EXEC_DEFAULT);
+		e.instance = 0;
+		e.flags = I915_EXEC_DEFAULT;
+		*ctx = intel_ctx_0(i915);
+	}
+
+	igt_debug("Using engine %u:%u\n", e.class, e.instance);
+
+	return spin_sync(i915, ahnd, *ctx, &e);
+}
+
 static void
-test_frequency(int gem_fd)
+test_frequency(int gem_fd, unsigned int gt)
 {
 	uint32_t min_freq, max_freq, boost_freq;
 	uint64_t val[2], start[2], slept;
@@ -1548,13 +1654,14 @@ test_frequency(int gem_fd)
 	igt_spin_t *spin;
 	int fd[2], sysfs;
 	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
+	const intel_ctx_t *ctx;
 
-	sysfs = igt_sysfs_open(gem_fd);
+	sysfs = igt_sysfs_gt_open(gem_fd, gt);
 	igt_require(sysfs >= 0);
 
-	min_freq = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
-	max_freq = igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
-	boost_freq = igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz");
+	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
+	max_freq = igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz");
+	boost_freq = igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz");
 	igt_info("Frequency: min=%u, max=%u, boost=%u MHz\n",
 		 min_freq, max_freq, boost_freq);
 	igt_require(min_freq > 0 && max_freq > 0 && boost_freq > 0);
@@ -1567,15 +1674,15 @@ test_frequency(int gem_fd)
 	/*
 	 * Set GPU to min frequency and read PMU counters.
 	 */
-	igt_require(igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", min_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == min_freq);
-	igt_require(igt_sysfs_set_u32(sysfs, "gt_max_freq_mhz", min_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == min_freq);
-	igt_require(igt_sysfs_set_u32(sysfs, "gt_boost_freq_mhz", min_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == min_freq);
+	igt_require(igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq));
+	igt_require(igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") == min_freq);
+	igt_require(igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", min_freq));
+	igt_require(igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz") == min_freq);
+	igt_require(igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", min_freq));
+	igt_require(igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz") == min_freq);
 
 	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
-	spin = spin_sync_flags(gem_fd, ahnd, 0, I915_EXEC_DEFAULT);
+	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
 
 	slept = pmu_read_multi(fd[0], 2, start);
 	measured_usleep(batch_duration_ns / 1000);
@@ -1584,6 +1691,7 @@ test_frequency(int gem_fd)
 	min[0] = 1e9*(val[0] - start[0]) / slept;
 	min[1] = 1e9*(val[1] - start[1]) / slept;
 
+	intel_ctx_destroy(gem_fd, ctx);
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd); /* Don't leak busy bo into the next phase */
 
@@ -1592,16 +1700,16 @@ test_frequency(int gem_fd)
 	/*
 	 * Set GPU to max frequency and read PMU counters.
 	 */
-	igt_require(igt_sysfs_set_u32(sysfs, "gt_max_freq_mhz", max_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == max_freq);
-	igt_require(igt_sysfs_set_u32(sysfs, "gt_boost_freq_mhz", boost_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == boost_freq);
+	igt_require(igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", max_freq));
+	igt_require(igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz") == max_freq);
+	igt_require(igt_sysfs_set_u32(sysfs, "rps_boost_freq_mhz", boost_freq));
+	igt_require(igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz") == boost_freq);
 
-	igt_require(igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", max_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == max_freq);
+	igt_require(igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", max_freq));
+	igt_require(igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") == max_freq);
 
 	gem_quiescent_gpu(gem_fd);
-	spin = spin_sync_flags(gem_fd, ahnd, 0, I915_EXEC_DEFAULT);
+	spin = spin_sync_gt(gem_fd, ahnd, gt, &ctx);
 
 	slept = pmu_read_multi(fd[0], 2, start);
 	measured_usleep(batch_duration_ns / 1000);
@@ -1610,16 +1718,17 @@ test_frequency(int gem_fd)
 	max[0] = 1e9*(val[0] - start[0]) / slept;
 	max[1] = 1e9*(val[1] - start[1]) / slept;
 
+	intel_ctx_destroy(gem_fd, ctx);
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd);
 
 	/*
 	 * Restore min/max.
 	 */
-	igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", min_freq);
-	if (igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") != min_freq)
+	igt_sysfs_set_u32(sysfs, "rps_min_freq_mhz", min_freq);
+	if (igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz") != min_freq)
 		igt_warn("Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
-			 min_freq, igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz"));
+			 min_freq, igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz"));
 	close(fd[0]);
 	close(fd[1]);
 	put_ahnd(ahnd);
@@ -1638,17 +1747,17 @@ test_frequency(int gem_fd)
 }
 
 static void
-test_frequency_idle(int gem_fd)
+test_frequency_idle(int gem_fd, unsigned int gt)
 {
 	uint32_t min_freq;
 	uint64_t val[2], start[2], slept;
 	double idle[2];
 	int fd[2], sysfs;
 
-	sysfs = igt_sysfs_open(gem_fd);
+	sysfs = igt_sysfs_gt_open(gem_fd, gt);
 	igt_require(sysfs >= 0);
 
-	min_freq = igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
+	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
 	close(sysfs);
 
 	/* While parked, our convention is to report the GPU at 0Hz */
@@ -2458,10 +2567,14 @@ igt_main
 	/**
 	 * Test GPU frequency.
 	 */
-	igt_subtest("frequency")
-		test_frequency(fd);
-	igt_subtest("frequency-idle")
-		test_frequency_idle(fd);
+	igt_subtest_with_dynamic("frequency") {
+		for_each_gt(fd, gt, tmp) {
+			igt_dynamic_f("gt%u", gt)
+				test_frequency(fd, gt);
+			igt_dynamic_f("idle-gt%u", gt)
+				test_frequency_idle(fd, gt);
+		}
+	}
 
 	/**
 	 * Test interrupt count reporting.
-- 
2.34.1
