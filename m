Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6843710E8E2
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:56:08 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:54:02 +0000
Message-Id: <20231109155410.7-50-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 49/57] drm-uapi/xe: Crystal Reference Clock
 updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Align with kernel commit ("drm/xe/uapi: Crystal Reference Clock updates")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 11 ++++-------
 lib/xe/xe_query.c         | 19 +++++++++++++++++++
 lib/xe/xe_query.h         |  1 +
 lib/xe/xe_spin.c          | 12 +-----------
 tests/intel/xe_query.c    | 39 +++++++++++++++++++++------------------
 5 files changed, 46 insertions(+), 36 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 5949f6f6f..3881f8a94 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -429,8 +429,8 @@ struct drm_xe_query_gt {
 	__u16 type;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
-	/** @clock_freq: A clock frequency for timestamp */
-	__u32 clock_freq;
+	/** @reference_clock: A clock frequency for timestamp */
+	__u32 reference_clock;
 	/** @reserved: Reserved */
 	__u64 reserved[8];
 };
@@ -504,8 +504,8 @@ struct drm_xe_query_topology_mask {
  * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
  * .data points to this allocated structure.
  *
- * The query returns the engine cycles and the frequency that can
- * be used to calculate the engine timestamp. In addition the
+ * The query returns the engine cycles, which along with GT's @reference_clock,
+ * can be used to calculate the engine timestamp. In addition the
  * query returns a set of cpu timestamps that indicate when the command
  * streamer cycle count was captured.
  */
@@ -533,9 +533,6 @@ struct drm_xe_query_engine_cycles {
 	 */
 	__u64 engine_cycles;
 
-	/** @engine_frequency: Frequency of the engine cycles in Hz. */
-	__u64 engine_frequency;
-
 	/**
 	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
 	 * reading the engine_cycles register using the reference clockid set by the
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index e0554907e..f9db6d012 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -580,6 +580,25 @@ uint64_t xe_vram_size_region_near_gt(int fd, int gt)
 	return 0;
 }
 
+/**
+ * xe_gt_reference_clock:
+ * @fd: xe device fd
+ * @gt: gt ID
+ *
+ * Returns GT's reference crystal clock.
+ */
+uint32_t xe_gt_reference_clock(int fd, int gt)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	igt_assert(gt >= 0 && gt < xe_number_gt(fd));
+
+	return xe_dev->gt_list->gt_list[gt].reference_clock;
+}
+
 /**
  * xe_visible_vram_size_any_region:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 4fa6f0270..da3b5ef36 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -91,6 +91,7 @@ unsigned int xe_number_engines(int fd);
 bool xe_has_vram(int fd);
 uint64_t xe_vram_size_any_region(int fd);
 uint64_t xe_vram_size_region_near_gt(int fd, int gt);
+uint32_t xe_gt_reference_clock(int fd, int gt);
 uint64_t xe_visible_vram_size_any_region(int fd);
 uint64_t xe_vram_available_any_region(int fd);
 uint64_t xe_visible_vram_size_region_near_gt(int fd, int gt);
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index f4c5a3076..90194918f 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -16,16 +16,6 @@
 #include "xe_ioctl.h"
 #include "xe_spin.h"
 
-static uint32_t read_timestamp_frequency(int fd, int gt_id)
-{
-	struct xe_device *dev = xe_device_get(fd);
-
-	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
-	igt_assert(gt_id >= 0 && gt_id <= dev->gt_list->num_gt);
-
-	return dev->gt_list->gt_list[gt_id].clock_freq;
-}
-
 static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
 {
 	igt_assert(y > 0);
@@ -43,7 +33,7 @@ static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
  */
 uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t duration_ns)
 {
-	uint32_t f = read_timestamp_frequency(fd, gt_id);
+	uint32_t f = xe_gt_reference_clock(fd, gt_id);
 	uint64_t ctx_ticks = div64_u64_round_up(duration_ns * f, NSEC_PER_SEC);
 
 	igt_assert_lt_u64(ctx_ticks, XE_SPIN_MAX_CTX_TICKS);
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index e6cfafd0a..524a1949b 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -306,7 +306,7 @@ test_query_gt_list(int fd)
 	for (i = 0; i < gt_list->num_gt; i++) {
 		igt_info("type: %d\n", gt_list->gt_list[i].type);
 		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
-		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
+		igt_info("reference_clock: %u\n", gt_list->gt_list[i].reference_clock);
 	}
 }
 
@@ -519,7 +519,7 @@ query_engine_cycles(int fd, struct drm_xe_query_engine_cycles *resp)
 }
 
 static void
-__engine_cycles(int fd, struct drm_xe_engine_class_instance *eci)
+__engine_cycles(int fd, struct drm_xe_query_engine_info *engine)
 {
 	struct drm_xe_query_engine_cycles ts1 = {};
 	struct drm_xe_query_engine_cycles ts2 = {};
@@ -528,7 +528,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *eci)
 	int i, usable = 0;
 	igt_spin_t *spin;
 	uint64_t ahnd;
-	uint32_t vm;
+	uint32_t vm, ref_clock;
 	struct {
 		int32_t id;
 		const char *name;
@@ -541,11 +541,14 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *eci)
 	};
 
 	igt_debug("engine[%u:%u]\n",
-		  eci->engine_class,
-		  eci->engine_instance);
+		  engine->instance.engine_class,
+		  engine->instance.engine_instance);
+
+	ref_clock = xe_gt_reference_clock(fd, engine->gt_id);
+	igt_debug("GT reference_clock %u\n", ref_clock);
 
 	vm = xe_vm_create(fd, 0, 0);
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm);
 
@@ -554,10 +557,10 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *eci)
 	for (i = 0; i < NUM_SNAPSHOTS * ARRAY_SIZE(clock); i++) {
 		int index = i / NUM_SNAPSHOTS;
 
-		ts1.eci = *eci;
+		ts1.eci = engine->instance;
 		ts1.clockid = clock[index].id;
 
-		ts2.eci = *eci;
+		ts2.eci = engine->instance;
 		ts2.clockid = clock[index].id;
 
 		query_engine_cycles(fd, &ts1);
@@ -566,23 +569,23 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *eci)
 		igt_debug("[1] cpu_ts before %llu, reg read time %llu\n",
 			  ts1.cpu_timestamp,
 			  ts1.cpu_delta);
-		igt_debug("[1] engine_ts %llu, freq %llu Hz, width %u\n",
-			  ts1.engine_cycles, ts1.engine_frequency, ts1.width);
+		igt_debug("[1] engine_ts %llu, width %u\n",
+			  ts1.engine_cycles, ts1.width);
 
 		igt_debug("[2] cpu_ts before %llu, reg read time %llu\n",
 			  ts2.cpu_timestamp,
 			  ts2.cpu_delta);
-		igt_debug("[2] engine_ts %llu, freq %llu Hz, width %u\n",
-			  ts2.engine_cycles, ts2.engine_frequency, ts2.width);
+		igt_debug("[2] engine_ts %llu, width %u\n",
+			  ts2.engine_cycles, ts2.width);
 
 		delta_cpu = ts2.cpu_timestamp - ts1.cpu_timestamp;
 
 		if (ts2.engine_cycles >= ts1.engine_cycles)
 			delta_cs = (ts2.engine_cycles - ts1.engine_cycles) *
-				   NSEC_PER_SEC / ts1.engine_frequency;
+				   NSEC_PER_SEC / ref_clock;
 		else
 			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
-				   NSEC_PER_SEC / ts1.engine_frequency;
+				   NSEC_PER_SEC / ref_clock;
 
 		igt_debug("delta_cpu[%lu], delta_cs[%lu]\n",
 			  delta_cpu, delta_cs);
@@ -620,13 +623,13 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *eci)
  */
 static void test_query_engine_cycles(int fd)
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 
 	igt_require(query_engine_cycles_supported(fd));
 
-	xe_for_each_engine_instance(fd, eci) {
-		igt_assert(eci);
-		__engine_cycles(fd, eci);
+	xe_for_each_engine(fd, engine) {
+		igt_assert(engine);
+		__engine_cycles(fd, engine);
 	}
 }
 
-- 
2.34.1
