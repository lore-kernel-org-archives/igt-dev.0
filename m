Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D0110E764
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 18:45:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:45:22 +0000
Message-Id: <20231130184536.7-8-francois.dugast@intel.com>
In-Reply-To: <20231130184536.7-1-francois.dugast@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 07/21] xe: s/hw_engine/engine
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

HW engine is redundant after exec_queue name was created.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 benchmarks/gem_wsim.c              |  8 ++---
 lib/xe/xe_query.c                  | 36 ++++++++++----------
 lib/xe/xe_query.h                  | 22 ++++++------
 tests/intel/xe_create.c            |  4 +--
 tests/intel/xe_dma_buf_sync.c      |  2 +-
 tests/intel/xe_drm_fdinfo.c        |  2 +-
 tests/intel/xe_evict.c             |  2 +-
 tests/intel/xe_exec_balancer.c     | 28 ++++++++--------
 tests/intel/xe_exec_basic.c        | 12 +++----
 tests/intel/xe_exec_compute_mode.c |  8 ++---
 tests/intel/xe_exec_fault_mode.c   |  8 ++---
 tests/intel/xe_exec_reset.c        | 44 ++++++++++++------------
 tests/intel/xe_exec_store.c        | 18 +++++-----
 tests/intel/xe_exec_threads.c      | 24 ++++++-------
 tests/intel/xe_huc_copy.c          |  2 +-
 tests/intel/xe_intel_bb.c          |  2 +-
 tests/intel/xe_noexec_ping_pong.c  |  2 +-
 tests/intel/xe_pat.c               |  4 +--
 tests/intel/xe_perf_pmu.c          |  6 ++--
 tests/intel/xe_pm.c                | 14 ++++----
 tests/intel/xe_pm_residency.c      |  2 +-
 tests/intel/xe_query.c             |  6 ++--
 tests/intel/xe_spin_batch.c        | 10 +++---
 tests/intel/xe_vm.c                | 54 +++++++++++++++---------------
 tests/intel/xe_waitfence.c         |  2 +-
 25 files changed, 161 insertions(+), 161 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index eb9fd6266..abbe49a06 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -543,7 +543,7 @@ static struct intel_engine_data *query_engines(void)
 	if (is_xe) {
 		struct drm_xe_engine_class_instance *hwe;
 
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			engines.engines[engines.nengines].class = hwe->engine_class;
 			engines.engines[engines.nengines].instance = hwe->engine_instance;
 			engines.nengines++;
@@ -670,7 +670,7 @@ xe_get_engine(enum intel_engine_id engine)
 		igt_assert(0);
 	};
 
-	xe_for_each_hw_engine(fd, hwe1) {
+	xe_for_each_engine(fd, hwe1) {
 		if (hwe.engine_class == hwe1->engine_class &&
 		    hwe.engine_instance  == hwe1->engine_instance) {
 			hwe = *hwe1;
@@ -689,8 +689,8 @@ xe_get_default_engine(void)
 	struct drm_xe_engine_class_instance default_hwe, *hwe;
 
 	/* select RCS0 | CCS0 or first available engine */
-	default_hwe = *xe_hw_engine(fd, 0);
-	xe_for_each_hw_engine(fd, hwe) {
+	default_hwe = *xe_engine(fd, 0);
+	xe_for_each_engine(fd, hwe) {
 		if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
 		     hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) &&
 		    hwe->engine_instance == 0) {
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index fa17b46b6..ef7aaa6a1 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -75,7 +75,7 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
 static struct drm_xe_engine_class_instance *
 xe_query_engines_new(int fd, unsigned int *num_engines)
 {
-	struct drm_xe_engine_class_instance *hw_engines;
+	struct drm_xe_engine_class_instance *engines;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
 		.query = DRM_XE_DEVICE_QUERY_ENGINES,
@@ -86,15 +86,15 @@ xe_query_engines_new(int fd, unsigned int *num_engines)
 	igt_assert(num_engines);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	hw_engines = malloc(query.size);
-	igt_assert(hw_engines);
+	engines = malloc(query.size);
+	igt_assert(engines);
 
-	query.data = to_user_pointer(hw_engines);
+	query.data = to_user_pointer(engines);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	*num_engines = query.size / sizeof(*hw_engines);
+	*num_engines = query.size / sizeof(*engines);
 
-	return hw_engines;
+	return engines;
 }
 
 static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
@@ -221,7 +221,7 @@ static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
 	free(xe_dev->gt_list);
-	free(xe_dev->hw_engines);
+	free(xe_dev->engines);
 	free(xe_dev->mem_regions);
 	free(xe_dev->vram_size);
 	free(xe_dev);
@@ -253,7 +253,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
-	xe_dev->hw_engines = xe_query_engines_new(fd, &xe_dev->number_hw_engines);
+	xe_dev->engines = xe_query_engines_new(fd, &xe_dev->number_engines);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
 	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
@@ -422,29 +422,29 @@ uint64_t vram_if_possible(int fd, int gt)
 }
 
 /**
- * xe_hw_engines:
+ * xe_engines:
  * @fd: xe device fd
  *
  * Returns engines array of xe device @fd.
  */
-xe_dev_FN(xe_hw_engines, hw_engines, struct drm_xe_engine_class_instance *);
+xe_dev_FN(xe_engines, engines, struct drm_xe_engine_class_instance *);
 
 /**
- * xe_hw_engine:
+ * xe_engine:
  * @fd: xe device fd
  * @idx: engine index
  *
  * Returns engine instance of xe device @fd and @idx.
  */
-struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx)
+struct drm_xe_engine_class_instance *xe_engine(int fd, int idx)
 {
 	struct xe_device *xe_dev;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(idx >= 0 && idx < xe_dev->number_hw_engines);
+	igt_assert(idx >= 0 && idx < xe_dev->number_engines);
 
-	return &xe_dev->hw_engines[idx];
+	return &xe_dev->engines[idx];
 }
 
 /**
@@ -529,12 +529,12 @@ uint32_t xe_min_page_size(int fd, uint64_t region)
 xe_dev_FN(xe_config, config, struct drm_xe_query_config *);
 
 /**
- * xe_number_hw_engine:
+ * xe_number_engine:
  * @fd: xe device fd
  *
  * Returns number of hw engines of xe device @fd.
  */
-xe_dev_FN(xe_number_hw_engines, number_hw_engines, unsigned int);
+xe_dev_FN(xe_number_engines, number_engines, unsigned int);
 
 /**
  * xe_has_vram:
@@ -657,8 +657,8 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	for (int i = 0; i < xe_dev->number_hw_engines; i++)
-		if (xe_dev->hw_engines[i].engine_class == engine_class)
+	for (int i = 0; i < xe_dev->number_engines; i++)
+		if (xe_dev->engines[i].engine_class == engine_class)
 			return true;
 
 	return false;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index be92ec5ed..bf9f2b955 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -32,11 +32,11 @@ struct xe_device {
 	/** @gt_list: bitmask of all memory regions */
 	uint64_t memory_regions;
 
-	/** @hw_engines: array of hardware engines */
-	struct drm_xe_engine_class_instance *hw_engines;
+	/** @engines: array of hardware engines */
+	struct drm_xe_engine_class_instance *engines;
 
-	/** @number_hw_engines: length of hardware engines array */
-	unsigned int number_hw_engines;
+	/** @number_engines: length of hardware engines array */
+	unsigned int number_engines;
 
 	/** @mem_regions: regions memory information and usage */
 	struct drm_xe_query_mem_regions *mem_regions;
@@ -60,10 +60,10 @@ struct xe_device {
 	uint16_t dev_id;
 };
 
-#define xe_for_each_hw_engine(__fd, __hwe) \
-	for (int __i = 0; __i < xe_number_hw_engines(__fd) && \
-	     (__hwe = xe_hw_engine(__fd, __i)); ++__i)
-#define xe_for_each_hw_engine_class(__class) \
+#define xe_for_each_engine(__fd, __hwe) \
+	for (int __i = 0; __i < xe_number_engines(__fd) && \
+	     (__hwe = xe_engine(__fd, __i)); ++__i)
+#define xe_for_each_engine_class(__class) \
 	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
 	     ++__class)
 #define xe_for_each_gt(__fd, __gt) \
@@ -81,14 +81,14 @@ uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
-struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
-struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
+struct drm_xe_engine_class_instance *xe_engines(int fd);
+struct drm_xe_engine_class_instance *xe_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
 uint16_t xe_region_class(int fd, uint64_t region);
 uint32_t xe_min_page_size(int fd, uint64_t region);
 struct drm_xe_query_config *xe_config(int fd);
-unsigned int xe_number_hw_engines(int fd);
+unsigned int xe_number_engines(int fd);
 bool xe_has_vram(int fd);
 uint64_t xe_vram_size(int fd, int gt);
 uint64_t xe_visible_vram_size(int fd, int gt);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index c5097f086..a3327d9f2 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -140,7 +140,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
 
 	fd = drm_reopen_driver(fd);
-	num_engines = xe_number_hw_engines(fd);
+	num_engines = xe_number_engines(fd);
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
 	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
@@ -157,7 +157,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 
 		for (i = 0; i < exec_queues_per_process; i++) {
 			idx = rand() % num_engines;
-			hwe = xe_hw_engine(fd, idx);
+			hwe = xe_engine(fd, idx);
 			err = __xe_exec_queue_create(fd, vm, hwe, 0, &exec_queue);
 			igt_debug("[%2d] Create exec_queue: err=%d, exec_queue=%u [idx = %d]\n",
 				  n, err, exec_queue, i);
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index aeb4c4995..dfa957243 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -229,7 +229,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			if (hwe0 == NULL) {
 				hwe0 = hwe;
 			} else {
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 6bca5a6f1..d50cc6df1 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -313,7 +313,7 @@ igt_main
 
 	igt_describe("Create and compare active memory consumption by client");
 	igt_subtest("drm-active")
-		test_active(xe, xe_hw_engine(xe, 0));
+		test_active(xe, xe_engine(xe, 0));
 
 	igt_fixture {
 		drm_close_driver(xe);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 436a2be02..2e2960b9b 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -759,7 +759,7 @@ igt_main
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
 
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
 				break;
 	}
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index fa3d7a338..ea06c23cd 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -57,7 +57,7 @@ static void test_all_active(int fd, int gt, int class)
 	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
 	int i, num_placements = 0;
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -199,7 +199,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -426,7 +426,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -632,25 +632,25 @@ igt_main
 
 	igt_subtest("virtual-all-active")
 		xe_for_each_gt(fd, gt)
-			xe_for_each_hw_engine_class(class)
+			xe_for_each_engine_class(class)
 				test_all_active(fd, gt, class);
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_exec(fd, gt, class, 1, 1,
 						  s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_exec(fd, gt, class, 1, 2,
 						  s->flags);
 
 		igt_subtest_f("many-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_exec(fd, gt, class, 1,
 						  s->flags & (REBIND | INVALIDATE) ?
 						  64 : 1024,
@@ -658,7 +658,7 @@ igt_main
 
 		igt_subtest_f("many-execqueues-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_exec(fd, gt, class, 16,
 						  s->flags & (REBIND | INVALIDATE) ?
 						  64 : 1024,
@@ -666,23 +666,23 @@ igt_main
 
 		igt_subtest_f("no-exec-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_exec(fd, gt, class, 1, 0,
 						  s->flags);
 
 		igt_subtest_f("once-cm-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_cm(fd, gt, class, 1, 1, s->flags);
 
 		igt_subtest_f("twice-cm-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_cm(fd, gt, class, 1, 2, s->flags);
 
 		igt_subtest_f("many-cm-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_cm(fd, gt, class, 1,
 						s->flags & (REBIND | INVALIDATE) ?
 						64 : 1024,
@@ -690,7 +690,7 @@ igt_main
 
 		igt_subtest_f("many-execqueues-cm-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_cm(fd, gt, class, 16,
 						s->flags & (REBIND | INVALIDATE) ?
 						64 : 1024,
@@ -698,7 +698,7 @@ igt_main
 
 		igt_subtest_f("no-exec-cm-%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_cm(fd, gt, class, 1, 0, s->flags);
 	}
 
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 23acdd434..46b9dc2e0 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -336,36 +336,36 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, 1, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-many-vm-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 16,
 					  s->flags);
 
 		igt_subtest_f("no-exec-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 98a98256e..a9f69deef 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -321,15 +321,15 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
@@ -339,7 +339,7 @@ igt_main
 			continue;
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 3eb448ef4..4c85fce76 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -386,22 +386,22 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_hw_engine(fd, hwe)
+			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index d8b8e0355..988e63438 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -168,7 +168,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -790,106 +790,106 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("spin")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_spin(fd, hwe);
 
 	igt_subtest("cancel")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 1, 1, CANCEL);
 
 	igt_subtest("execqueue-reset")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, EXEC_QUEUE_RESET);
 
 	igt_subtest("cat-error")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
 
 	igt_subtest("gt-reset")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
 
 	igt_subtest("close-fd-no-exec")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(-1, hwe, 16, 0, CLOSE_FD);
 
 	igt_subtest("close-fd")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD);
 
 	igt_subtest("close-execqueues-close-fd")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD |
 					 CLOSE_EXEC_QUEUES);
 
 	igt_subtest("cm-execqueue-reset")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 2, 2, EXEC_QUEUE_RESET);
 
 	igt_subtest("cm-cat-error")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 2, 2, CAT_ERROR);
 
 	igt_subtest("cm-gt-reset")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 2, 2, GT_RESET);
 
 	igt_subtest("cm-close-fd-no-exec")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 0, CLOSE_FD);
 
 	igt_subtest("cm-close-fd")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD);
 
 	igt_subtest("cm-close-execqueues-close-fd")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD |
 					  CLOSE_EXEC_QUEUES);
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("%s-cancel", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_balancer(fd, gt, class, 1, 1,
 						      CANCEL | s->flags);
 
 		igt_subtest_f("%s-execqueue-reset", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      EXEC_QUEUE_RESET | s->flags);
 
 		igt_subtest_f("%s-cat-error", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      CAT_ERROR | s->flags);
 
 		igt_subtest_f("%s-gt-reset", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      GT_RESET | s->flags);
 
 		igt_subtest_f("%s-close-fd-no-exec", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_balancer(-1, gt, class, 16, 0,
 						      CLOSE_FD | s->flags);
 
 		igt_subtest_f("%s-close-fd", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_balancer(-1, gt, class, 16, 256,
 						      CLOSE_FD | s->flags);
 
 		igt_subtest_f("%s-close-execqueues-close-fd", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					test_balancer(-1, gt, class, 16, 256, CLOSE_FD |
 						      CLOSE_EXEC_QUEUES | s->flags);
 	}
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 9ee5edeb4..0b7b3d3e9 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -63,7 +63,7 @@ static void store(int fd)
 		.syncs = to_user_pointer(&sync),
 	};
 	struct data *data;
-	struct drm_xe_engine_class_instance *hw_engine;
+	struct drm_xe_engine_class_instance *engine;
 	uint32_t vm;
 	uint32_t exec_queue;
 	uint32_t syncobj;
@@ -80,16 +80,16 @@ static void store(int fd)
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	hw_engine = xe_hw_engine(fd, 1);
+	engine = xe_engine(fd, 1);
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, hw_engine->gt_id),
+			  vram_if_possible(fd, engine->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	xe_vm_bind_async(fd, vm, hw_engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
+	xe_vm_bind_async(fd, vm, engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
 	store_dword_batch(data, addr, value);
 
-	exec_queue = xe_exec_queue_create(fd, vm, hw_engine, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, engine, 0);
 	exec.exec_queue_id = exec_queue;
 	exec.address = data->addr;
 	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
@@ -242,7 +242,7 @@ static void store_all(int fd, int gt, int class)
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 		eci[num_placements++] = *hwe;
@@ -309,16 +309,16 @@ igt_main
 
 	igt_subtest("basic-all") {
 		xe_for_each_gt(fd, gt)
-			xe_for_each_hw_engine_class(class)
+			xe_for_each_engine_class(class)
 				store_all(fd, gt, class);
 	}
 
 	igt_subtest("cachelines")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			store_cachelines(fd, hwe, 0);
 
 	igt_subtest("page-sized")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			store_cachelines(fd, hwe, PAGES);
 
 	igt_fixture {
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index f37fc612a..8a01b150d 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -81,7 +81,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		owns_vm = true;
 	}
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -969,22 +969,22 @@ static void threads(int fd, int flags)
 	uint64_t userptr = 0x00007000eadbe000;
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
-	int n_hw_engines = 0, class;
+	int n_engines = 0, class;
 	uint64_t i = 0;
 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
 	bool go = false;
 	int n_threads = 0;
 	int gt;
 
-	xe_for_each_hw_engine(fd, hwe)
-		++n_hw_engines;
+	xe_for_each_engine(fd, hwe)
+		++n_engines;
 
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
-			xe_for_each_hw_engine_class(class) {
+			xe_for_each_engine_class(class) {
 				int num_placements = 0;
 
-				xe_for_each_hw_engine(fd, hwe) {
+				xe_for_each_engine(fd, hwe) {
 					if (hwe->engine_class != class ||
 					    hwe->gt_id != gt)
 						continue;
@@ -992,11 +992,11 @@ static void threads(int fd, int flags)
 				}
 
 				if (num_placements > 1)
-					n_hw_engines += 2;
+					n_engines += 2;
 			}
 	}
 
-	threads_data = calloc(n_hw_engines, sizeof(*threads_data));
+	threads_data = calloc(n_engines, sizeof(*threads_data));
 	igt_assert(threads_data);
 
 	pthread_mutex_init(&mutex, 0);
@@ -1012,7 +1012,7 @@ static void threads(int fd, int flags)
 					       0);
 	}
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
@@ -1045,10 +1045,10 @@ static void threads(int fd, int flags)
 
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
-			xe_for_each_hw_engine_class(class) {
+			xe_for_each_engine_class(class) {
 				int num_placements = 0;
 
-				xe_for_each_hw_engine(fd, hwe) {
+				xe_for_each_engine(fd, hwe) {
 					if (hwe->engine_class != class ||
 					    hwe->gt_id != gt)
 						continue;
@@ -1123,7 +1123,7 @@ static void threads(int fd, int flags)
 	pthread_cond_broadcast(&cond);
 	pthread_mutex_unlock(&mutex);
 
-	for (i = 0; i < n_hw_engines; ++i)
+	for (i = 0; i < n_engines; ++i)
 		pthread_join(threads_data[i].thread, NULL);
 
 	if (vm_legacy_mode)
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index eda9e5216..dbc5afc17 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -158,7 +158,7 @@ test_huc_copy(int fd)
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
 		    !(tested_gts & BIT(hwe->gt_id))) {
 			tested_gts |= BIT(hwe->gt_id);
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 6663731d9..c686604d2 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -193,7 +193,7 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 
 	if (new_context) {
 		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-		ctx = xe_exec_queue_create(xe, vm, xe_hw_engine(xe, 0), 0);
+		ctx = xe_exec_queue_create(xe, vm, xe_engine(xe, 0), 0);
 		intel_bb_destroy(ibb);
 		ibb = intel_bb_create_with_context(xe, ctx, vm, NULL, PAGE_SIZE);
 		intel_bb_out(ibb, MI_BATCH_BUFFER_END);
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 5e3349247..e27cc4582 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -98,7 +98,7 @@ igt_simple_main
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	test_ping_pong(fd, xe_hw_engine(fd, 0));
+	test_ping_pong(fd, xe_engine(fd, 0));
 
 	drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 48a4a0f04..700fb1e1b 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -438,8 +438,8 @@ static void pat_index_dw(struct xe_pat_param *p)
 	bops = buf_ops_create(fd);
 
 	n_engines = 0;
-	i = rand() % xe_number_hw_engines(fd);
-	xe_for_each_hw_engine(fd, hwe) {
+	i = rand() % xe_number_engines(fd);
+	xe_for_each_engine(fd, hwe) {
 		if (i == n_engines++)
 			break;
 	}
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index e825ff5a3..ba5488c48 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -209,7 +209,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 
 	config = engine_group_get_config(gt, class);
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -315,13 +315,13 @@ igt_main
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("%s", s->name)
 			xe_for_each_gt(fd, gt)
-				xe_for_each_hw_engine_class(class)
+				xe_for_each_engine_class(class)
 					if (class == s->class)
 						test_engine_group_busyness(fd, gt, class, s->name);
 	}
 
 	igt_subtest("any-engine-group-busy")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_any_engine_busyness(fd, hwe);
 
 	igt_fixture {
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 2e5c61b59..d78ca31a8 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -471,7 +471,7 @@ igt_main
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
 
 		/* Always perform initial once-basic exec checking for health */
-		xe_for_each_hw_engine(device.fd_xe, hwe)
+		xe_for_each_engine(device.fd_xe, hwe)
 			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
@@ -486,7 +486,7 @@ igt_main
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
-			xe_for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, s->state,
 					  NO_RPM);
 		}
@@ -494,13 +494,13 @@ igt_main
 		igt_subtest_f("%s-exec-after", s->name) {
 			igt_system_suspend_autoresume(s->state,
 						      SUSPEND_TEST_NONE);
-			xe_for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
 					  NO_RPM);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
-			xe_for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32, s->state,
 					  NO_RPM);
 		}
@@ -508,7 +508,7 @@ igt_main
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
-				xe_for_each_hw_engine(device.fd_xe, hwe)
+				xe_for_each_engine(device.fd_xe, hwe)
 					test_exec(device, hwe, 1, 2, s->state,
 						  NO_RPM);
 			}
@@ -523,14 +523,14 @@ igt_main
 
 		igt_subtest_f("%s-basic-exec", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			xe_for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 1,
 					  NO_SUSPEND, d->state);
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			xe_for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32,
 					  NO_SUSPEND, d->state);
 		}
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 6c9a95429..4f590c83c 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -346,7 +346,7 @@ igt_main
 	igt_describe("Validate idle residency on exec");
 	igt_subtest("idle-residency-on-exec") {
 		xe_for_each_gt(fd, gt) {
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				if (gt == hwe->gt_id && !hwe->engine_instance)
 					idle_residency_on_exec(fd, hwe);
 			}
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 4a23dcb60..48042337a 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -181,7 +181,7 @@ test_query_engines(int fd)
 	struct drm_xe_engine_class_instance *hwe;
 	int i = 0;
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		igt_assert(hwe);
 		igt_info("engine %d: %s, engine instance: %d, tile: TILE-%d\n", i++,
 			 xe_engine_class_string(hwe->engine_class), hwe->engine_instance,
@@ -602,7 +602,7 @@ static void test_query_engine_cycles(int fd)
 
 	igt_require(query_engine_cycles_supported(fd));
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		igt_assert(hwe);
 		__engine_cycles(fd, hwe);
 	}
@@ -626,7 +626,7 @@ static void test_engine_cycles_invalid(int fd)
 	igt_require(query_engine_cycles_supported(fd));
 
 	/* get one engine */
-	xe_for_each_hw_engine(fd, hwe)
+	xe_for_each_engine(fd, hwe)
 		break;
 
 	/* sanity check engine selection is valid */
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 6abe700da..2e2a0ed0e 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -72,8 +72,8 @@ static void spin_basic_all(int fd)
 
 	vm = xe_vm_create(fd, 0, 0);
 	ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
-	spin = malloc(sizeof(*spin) * xe_number_hw_engines(fd));
-	xe_for_each_hw_engine(fd, hwe) {
+	spin = malloc(sizeof(*spin) * xe_number_engines(fd));
+	xe_for_each_engine(fd, hwe) {
 		igt_debug("Run on engine: %s:%d\n",
 			  xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
 		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = hwe);
@@ -104,7 +104,7 @@ static void spin_all(int fd, int gt, int class)
 
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 
-	xe_for_each_hw_engine(fd, hwe) {
+	xe_for_each_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 		eci[num_placements++] = *hwe;
@@ -217,7 +217,7 @@ igt_main
 		spin_basic(fd);
 
 	igt_subtest("spin-batch")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			spin(fd, hwe);
 
 	igt_subtest("spin-basic-all")
@@ -225,7 +225,7 @@ igt_main
 
 	igt_subtest("spin-all") {
 		xe_for_each_gt(fd, gt)
-			xe_for_each_hw_engine_class(class)
+			xe_for_each_engine_class(class)
 				spin_all(fd, gt, class);
 	}
 
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 749e2a51d..c9b57b444 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1863,7 +1863,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
 				hwe_non_copy = hwe;
 				break;
@@ -1895,45 +1895,45 @@ igt_main
 		userptr_invalid(fd);
 
 	igt_subtest("shared-pte-page")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4,
 					xe_get_default_alignment(fd));
 
 	igt_subtest("shared-pde-page")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4, 0x1000ul * 512);
 
 	igt_subtest("shared-pde2-page")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4, 0x1000ul * 512 * 512);
 
 	igt_subtest("shared-pde3-page")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4, 0x1000ul * 512 * 512 * 512);
 
 	igt_subtest("bind-execqueues-independent")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_bind_execqueues_independent(fd, hwe, 0);
 
 	igt_subtest("bind-execqueues-conflict")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_bind_execqueues_independent(fd, hwe, CONFLICT);
 
 	igt_subtest("bind-array-twice")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_bind_array(fd, hwe, 2, 0);
 
 	igt_subtest("bind-array-many")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_bind_array(fd, hwe, 16, 0);
 
 	igt_subtest("bind-array-exec_queue-twice")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_bind_array(fd, hwe, 2,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
 	igt_subtest("bind-array-exec_queue-many")
-		xe_for_each_hw_engine(fd, hwe)
+		xe_for_each_engine(fd, hwe)
 			test_bind_array(fd, hwe, 16,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
@@ -1941,41 +1941,41 @@ igt_main
 	     bind_size = bind_size << 1) {
 		igt_subtest_f("large-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size, 0);
 				break;
 			}
 		igt_subtest_f("large-split-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT);
 				break;
 			}
 		igt_subtest_f("large-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_MISALIGNED);
 				break;
 			}
 		igt_subtest_f("large-split-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_MISALIGNED);
 				break;
 			}
 		igt_subtest_f("large-userptr-binds-%lld", (long long)bind_size)
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
 		igt_subtest_f("large-userptr-split-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_USERPTR);
@@ -1983,7 +1983,7 @@ igt_main
 			}
 		igt_subtest_f("large-userptr-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_MISALIGNED |
 						 LARGE_BIND_FLAG_USERPTR);
@@ -1991,7 +1991,7 @@ igt_main
 			}
 		igt_subtest_f("large-userptr-split-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_hw_engine(fd, hwe) {
+			xe_for_each_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_MISALIGNED |
@@ -2002,13 +2002,13 @@ igt_main
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
 	igt_subtest_f("mixed-binds-%lld", (long long)bind_size)
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size, 0);
 			break;
 		}
 
 	igt_subtest_f("mixed-misaligned-binds-%lld", (long long)bind_size)
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED);
 			break;
@@ -2016,14 +2016,14 @@ igt_main
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-binds-%lld", (long long)bind_size)
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size, 0);
 			break;
 		}
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-misaligned-binds-%lld", (long long)bind_size)
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED);
 			break;
@@ -2031,7 +2031,7 @@ igt_main
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-binds-%lld", (long long) bind_size)
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
@@ -2039,7 +2039,7 @@ igt_main
 
 	igt_subtest_f("mixed-userptr-misaligned-binds-%lld",
 		      (long long)bind_size)
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED |
 					 LARGE_BIND_FLAG_USERPTR);
@@ -2048,7 +2048,7 @@ igt_main
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-binds-%lld", (long long)bind_size)
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
@@ -2057,7 +2057,7 @@ igt_main
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-misaligned-binds-%lld",
 		      (long long)bind_size)
-		xe_for_each_hw_engine(fd, hwe) {
+		xe_for_each_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED |
 					 LARGE_BIND_FLAG_USERPTR);
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 0169f4b9c..ad8adc2b0 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -114,7 +114,7 @@ waitfence(int fd, enum waittype wt)
 		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
 			  MS_TO_NS(10), timeout);
 	} else if (wt == ENGINE) {
-		eci = xe_hw_engine(fd, 1);
+		eci = xe_engine(fd, 1);
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
 		timeout = current + MS_TO_NS(10);
-- 
2.34.1
