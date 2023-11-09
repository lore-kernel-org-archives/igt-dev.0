Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9BA10E8F1
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:56:10 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:54:08 +0000
Message-Id: <20231109155410.7-56-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 55/57] drm-uapi/xe: Align on a common way to
 return arrays (engines)
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

Align with commit ("drm/xe/uapi: Align on a common way to return
arrays (engines)")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 benchmarks/gem_wsim.c              |  6 +--
 include/drm-uapi/xe_drm.h          | 78 ++++++++++++++++++------------
 lib/xe/xe_query.c                  | 32 ++++++------
 lib/xe/xe_query.h                  | 15 +++---
 lib/xe/xe_spin.c                   |  2 +-
 lib/xe/xe_spin.h                   |  2 +-
 tests/intel/xe_create.c            |  2 +-
 tests/intel/xe_dma_buf_sync.c      |  6 +--
 tests/intel/xe_drm_fdinfo.c        |  2 +-
 tests/intel/xe_evict.c             | 10 ++--
 tests/intel/xe_exec_balancer.c     |  6 +--
 tests/intel/xe_exec_basic.c        |  4 +-
 tests/intel/xe_exec_compute_mode.c |  4 +-
 tests/intel/xe_exec_fault_mode.c   |  4 +-
 tests/intel/xe_exec_reset.c        | 10 ++--
 tests/intel/xe_exec_store.c        |  8 +--
 tests/intel/xe_exec_threads.c      | 10 ++--
 tests/intel/xe_guc_pc.c            |  4 +-
 tests/intel/xe_huc_copy.c          |  2 +-
 tests/intel/xe_noexec_ping_pong.c  |  2 +-
 tests/intel/xe_perf_pmu.c          |  6 +--
 tests/intel/xe_pm.c                |  4 +-
 tests/intel/xe_pm_residency.c      |  6 +--
 tests/intel/xe_query.c             |  6 +--
 tests/intel/xe_spin_batch.c        |  2 +-
 tests/intel/xe_vm.c                | 16 +++---
 26 files changed, 129 insertions(+), 120 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 0c566617b..bd7479a83 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -644,10 +644,10 @@ get_engine(enum intel_engine_id engine)
 	return ci;
 }
 
-static struct drm_xe_query_engine_info *
+static struct drm_xe_engine *
 xe_get_engine(enum intel_engine_id engine_class)
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance eci = {}, *eci1;
 	bool found_physical = false;
 
@@ -2253,7 +2253,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 
 static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	struct xe_exec_queue *eq;
 	struct w_step *w;
 	struct ctx *ctx;
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index d6936f5ab..76ba74089 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -179,9 +179,9 @@ struct drm_xe_ext_set_property {
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
  *
- * It is returned as part of the @drm_xe_query_engine_info, but it also is
- * used as the input of engine selection for both @drm_xe_exec_queue_create
- * and @drm_xe_query_engine_cycles
+ * It is returned as part of the @drm_xe_engine, but it also is used as
+ * the input of engine selection for both @drm_xe_exec_queue_create and
+ * @drm_xe_query_engine_cycles
  *
  * The @engine_class can be:
  *  - %DRM_XE_ENGINE_CLASS_RENDER
@@ -218,13 +218,9 @@ struct drm_xe_engine_class_instance {
 };
 
 /**
- * struct drm_xe_query_engine_info - describe hardware engine
- *
- * If a query is made with a struct @drm_xe_device_query where .query
- * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
- * struct @drm_xe_query_engine_info in .data.
+ * struct drm_xe_engine - describe hardware engine
  */
-struct drm_xe_query_engine_info {
+struct drm_xe_engine {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
 
@@ -260,6 +256,22 @@ struct drm_xe_query_engine_info {
 	__u64 reserved[5];
 };
 
+/**
+ * struct drm_xe_query_engine - describe engines
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct @drm_xe_query_engine in .data.
+ */
+struct drm_xe_query_engine {
+	/** @num_engines: number of engines returned in @engines */
+	__u32 num_engines;
+	/** @pad: MBZ */
+	__u32 pad;
+	/** @engines: The returned engines for this device */
+	struct drm_xe_engine engines[];
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
@@ -625,28 +637,32 @@ struct drm_xe_query_uc_fw_version {
  *
  * .. code-block:: C
  *
- *	struct drm_xe_engine_class_instance *hwe;
- *	struct drm_xe_device_query query = {
- *		.extensions = 0,
- *		.query = DRM_XE_DEVICE_QUERY_ENGINES,
- *		.size = 0,
- *		.data = 0,
- *	};
- *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
- *	hwe = malloc(query.size);
- *	query.data = (uintptr_t)hwe;
- *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
- *	int num_engines = query.size / sizeof(*hwe);
- *	for (int i = 0; i < num_engines; i++) {
- *		printf("Engine %d: %s\n", i,
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
- *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
- *			"UNKNOWN");
- *	}
- *	free(hwe);
+ *     struct drm_xe_query_engine *engines;
+ *     struct drm_xe_device_query query = {
+ *         .extensions = 0,
+ *         .query = DRM_XE_DEVICE_QUERY_ENGINES,
+ *         .size = 0,
+ *         .data = 0,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *     engines = malloc(query.size);
+ *     query.data = (uintptr_t)engines;
+ *     ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+ *     for (int i = 0; i < engines->num_engines; i++) {
+ *         printf("Engine %d: %s\n", i,
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_COPY ? "COPY":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
+ *             engines->engines[i].instance.engine_class ==
+ *                 DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
+ *             "UNKNOWN");
+ *     }
+ *     free(engines);
  */
 struct drm_xe_device_query {
 	/** @extensions: Pointer to the first extension struct, if any */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index e662df7b4..803631d33 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -70,10 +70,9 @@ static uint64_t __all_memory_regions(struct drm_xe_query_mem_region *mem_regions
 	return regions;
 }
 
-static struct drm_xe_query_engine_info *
-xe_query_engines(int fd, unsigned int *num_engines)
+static struct drm_xe_query_engine *xe_query_engines(int fd)
 {
-	struct drm_xe_query_engine_info *engines;
+	struct drm_xe_query_engine *engines;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
 		.query = DRM_XE_DEVICE_QUERY_ENGINES,
@@ -81,7 +80,6 @@ xe_query_engines(int fd, unsigned int *num_engines)
 		.data = 0,
 	};
 
-	igt_assert(num_engines);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
 	engines = malloc(query.size);
@@ -90,8 +88,6 @@ xe_query_engines(int fd, unsigned int *num_engines)
 	query.data = to_user_pointer(engines);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	*num_engines = query.size / sizeof(*engines);
-
 	return engines;
 }
 
@@ -116,7 +112,7 @@ static struct drm_xe_query_mem_region *xe_query_mem_regions_new(int fd)
 	return mem_regions;
 }
 
-static uint64_t mem_region_near_engine(struct drm_xe_query_engine_info *engine)
+static uint64_t mem_region_near_engine(struct drm_xe_engine *engine)
 {
 	uint64_t region;
 
@@ -227,7 +223,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt = xe_query_gt_new(fd);
-	xe_dev->engines = xe_query_engines(fd, &xe_dev->number_engines);
+	xe_dev->engines = xe_query_engines(fd);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->all_memory_regions_mask = __all_memory_regions(xe_dev->mem_regions);
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
@@ -373,7 +369,7 @@ uint64_t any_vram(int fd)
  *
  * Returns memory bitmask for the vram region that is near the given @engine.
  */
-uint64_t vram_near_engine(int fd, struct drm_xe_query_engine_info *engine)
+uint64_t vram_near_engine(int fd, struct drm_xe_engine *engine)
 {
 	struct xe_device *xe_dev;
 
@@ -405,7 +401,7 @@ uint64_t any_vram_if_possible(int fd)
  * vram region near the given @engine. Otherwise it returns a bitmask for a
  * system memory region.
  */
-uint64_t vram_near_engine_if_possible(int fd, struct drm_xe_query_engine_info *engine)
+uint64_t vram_near_engine_if_possible(int fd, struct drm_xe_engine *engine)
 {
 	return vram_near_engine(fd, engine) ?: system_memory(fd);
 }
@@ -416,7 +412,7 @@ uint64_t vram_near_engine_if_possible(int fd, struct drm_xe_query_engine_info *e
  *
  * Returns engines array of xe device @fd.
  */
-xe_dev_FN(xe_engines, engines, struct drm_xe_query_engine_info *);
+xe_dev_FN(xe_engines, engines->engines, struct drm_xe_engine *);
 
 /**
  * xe_engine:
@@ -425,15 +421,15 @@ xe_dev_FN(xe_engines, engines, struct drm_xe_query_engine_info *);
  *
  * Returns engine info of xe device @fd and @idx.
  */
-struct drm_xe_query_engine_info *xe_engine(int fd, int idx)
+struct drm_xe_engine *xe_engine(int fd, int idx)
 {
 	struct xe_device *xe_dev;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(idx >= 0 && idx < xe_dev->number_engines);
+	igt_assert(idx >= 0 && idx < xe_dev->engines->num_engines);
 
-	return &xe_dev->engines[idx];
+	return &xe_dev->engines->engines[idx];
 }
 
 /**
@@ -523,7 +519,7 @@ xe_dev_FN(xe_config, config, struct drm_xe_query_config *);
  *
  * Returns number of hw engines of xe device @fd.
  */
-xe_dev_FN(xe_number_engines, number_engines, unsigned int);
+xe_dev_FN(xe_number_engines, engines->num_engines, unsigned int);
 
 /**
  * xe_has_vram:
@@ -563,7 +559,7 @@ uint64_t xe_vram_size_any_region(int fd)
 uint64_t xe_vram_size_region_near_tile(int fd, int tile)
 {
 	struct xe_device *xe_dev;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
@@ -694,8 +690,8 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	for (int i = 0; i < xe_dev->number_engines; i++)
-		if (xe_dev->engines[i].instance.engine_class == engine_class)
+	for (int i = 0; i < xe_dev->engines->num_engines; i++)
+		if (xe_dev->engines->engines[i].instance.engine_class == engine_class)
 			return true;
 
 	return false;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 6916a9239..8ba432089 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -32,11 +32,8 @@ struct xe_device {
 	/** @gt_list: bitmask of all memory regions */
 	uint64_t all_memory_regions_mask;
 
-	/** @engines: array of hardware engines */
-	struct drm_xe_query_engine_info *engines;
-
-	/** @number_engines: length of hardware engines array */
-	unsigned int number_engines;
+	/** @engines: hardware engines */
+	struct drm_xe_query_engine *engines;
 
 	/** @mem_regions: regions memory information and usage */
 	struct drm_xe_query_mem_region *mem_regions;
@@ -77,11 +74,11 @@ unsigned int xe_number_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 uint64_t any_vram(int fd);
-uint64_t vram_near_engine(int fd, struct drm_xe_query_engine_info *engine);
+uint64_t vram_near_engine(int fd, struct drm_xe_engine *engine);
 uint64_t any_vram_if_possible(int fd);
-uint64_t vram_near_engine_if_possible(int fd, struct drm_xe_query_engine_info *engine);
-struct drm_xe_query_engine_info *xe_engines(int fd);
-struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
+uint64_t vram_near_engine_if_possible(int fd, struct drm_xe_engine *engine);
+struct drm_xe_engine *xe_engines(int fd);
+struct drm_xe_engine *xe_engine(int fd, int idx);
 struct drm_xe_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
 uint16_t xe_region_class(int fd, uint64_t region);
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 90194918f..49c2941f3 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -272,7 +272,7 @@ void xe_spin_free(int fd, struct igt_spin *spin)
 	free(spin);
 }
 
-void xe_cork_init(int fd, struct drm_xe_query_engine_info *engine,
+void xe_cork_init(int fd, struct drm_xe_engine *engine,
 		  struct xe_cork *cork)
 {
 	uint64_t addr = xe_get_default_alignment(fd);
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 5e0207e99..75eed722a 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -62,7 +62,7 @@ struct xe_cork {
 	uint32_t syncobj;
 };
 
-void xe_cork_init(int fd, struct drm_xe_query_engine_info *engine,
+void xe_cork_init(int fd, struct drm_xe_engine *engine,
 		  struct xe_cork *cork);
 bool xe_cork_started(struct xe_cork *cork);
 void xe_cork_wait_started(struct xe_cork *cork);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index edd8e2e43..7800530c3 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -148,7 +148,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 	igt_nsec_elapsed(&tv);
 
 	igt_fork(n, nproc) {
-		struct drm_xe_query_engine_info *engine;
+		struct drm_xe_engine *engine;
 		uint32_t exec_queue, exec_queues[exec_queues_per_process];
 		int idx, err, i;
 
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 7fc801e05..e45a6696f 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -87,8 +87,8 @@ static bool sync_file_busy(int sync_file)
  */
 
 static void
-test_export_dma_buf(struct drm_xe_query_engine_info *engine0,
-		    struct drm_xe_query_engine_info *engine1,
+test_export_dma_buf(struct drm_xe_engine *engine0,
+		    struct drm_xe_engine *engine1,
 		    int n_bo, int flags)
 {
 	struct drm_xe_engine_class_instance *eci0 = &engine0->instance;
@@ -226,7 +226,7 @@ test_export_dma_buf(struct drm_xe_query_engine_info *engine0,
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine, *engine0 = NULL, *engine1;
+	struct drm_xe_engine *engine, *engine0 = NULL, *engine1;
 	int fd;
 
 	igt_fixture {
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 03a724e9c..f47d35a4d 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -40,7 +40,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo
 #define BO_SIZE (65536)
 
 /* Subtests */
-static void test_active(int fd, struct drm_xe_query_engine_info *engine)
+static void test_active(int fd, struct drm_xe_engine *engine)
 {
 	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(fd), region;
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 3d06570bf..048fa18c4 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -30,7 +30,7 @@
 #define BIND_EXEC_QUEUE		(0x1 << 6)
 
 static void
-test_evict(int fd, struct drm_xe_query_engine_info *engine,
+test_evict(int fd, struct drm_xe_engine *engine,
 	   int n_exec_queues, int n_execs, size_t bo_size,
 	   unsigned long flags, pthread_barrier_t *barrier)
 {
@@ -212,7 +212,7 @@ test_evict(int fd, struct drm_xe_query_engine_info *engine,
 }
 
 static void
-test_evict_cm(int fd, struct drm_xe_query_engine_info *engine,
+test_evict_cm(int fd, struct drm_xe_engine *engine,
 	      int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags,
 	      pthread_barrier_t *barrier)
 {
@@ -382,7 +382,7 @@ struct thread_data {
 	pthread_cond_t *cond;
 	pthread_barrier_t *barrier;
 	int fd;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	int n_exec_queues;
 	int n_execs;
 	uint64_t bo_size;
@@ -410,7 +410,7 @@ static void *thread(void *data)
 }
 
 static void
-threads(int fd, struct drm_xe_query_engine_info *engine,
+threads(int fd, struct drm_xe_engine *engine,
 	int n_threads, int n_exec_queues, int n_execs, size_t bo_size,
 	unsigned long flags)
 {
@@ -634,7 +634,7 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  */
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	const struct section {
 		const char *name;
 		int n_exec_queues;
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index fe806677d..937ba9d17 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -56,7 +56,7 @@ static void test_all_active(int fd, int gt, int class)
 		struct xe_spin spin;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, num_eng_per_bb = 0;
 	int sched_id = -1;
@@ -207,7 +207,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_eng_per_bb = 0;
 	int sched_id = -1;
@@ -443,7 +443,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t exec_sync;
 		uint32_t data;
 	} *data;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_eng_per_bb = 0;
 	int map_fd = -1;
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 8c12dbbe9..e6566b1ab 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -77,7 +77,7 @@
  */
 
 static void
-test_exec(int fd, struct drm_xe_query_engine_info *engine,
+test_exec(int fd, struct drm_xe_engine *engine,
 	  int n_exec_queues, int n_execs, int n_vm, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -304,7 +304,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	const struct section {
 		const char *name;
 		unsigned int flags;
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 4928b47f6..897e9c28a 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -81,7 +81,7 @@
  * @bindexecqueue-userptr-invalidate:	bindexecqueue userptr invalidate
  */
 static void
-test_exec(int fd, struct drm_xe_query_engine_info *engine,
+test_exec(int fd, struct drm_xe_engine *engine,
 	  int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
@@ -292,7 +292,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	const struct section {
 		const char *name;
 		unsigned int flags;
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 61d40a0b2..a9d8c2f34 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -100,7 +100,7 @@
  */
 
 static void
-test_exec(int fd, struct drm_xe_query_engine_info *engine,
+test_exec(int fd, struct drm_xe_engine *engine,
 	  int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
@@ -322,7 +322,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	const struct section {
 		const char *name;
 		unsigned int flags;
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 05ce4cdf2..8bf226526 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -25,7 +25,7 @@
  * SUBTEST: spin
  * Description: test spin
  */
-static void test_spin(int fd, struct drm_xe_query_engine_info *engine)
+static void test_spin(int fd, struct drm_xe_engine *engine)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -164,7 +164,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint32_t data;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_eng_per_bb = 0, bad_batches = 1;
 	int sched_id = -1;
@@ -345,7 +345,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  */
 
 static void
-test_legacy_mode(int fd, struct drm_xe_query_engine_info *engine,
+test_legacy_mode(int fd, struct drm_xe_engine *engine,
 		 int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
@@ -512,7 +512,7 @@ test_legacy_mode(int fd, struct drm_xe_query_engine_info *engine,
  */
 
 static void
-test_compute_mode(int fd, struct drm_xe_query_engine_info *engine,
+test_compute_mode(int fd, struct drm_xe_engine *engine,
 		  int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
@@ -789,7 +789,7 @@ gt_reset(int fd, int n_threads, int n_sec)
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	const struct section {
 		const char *name;
 		unsigned int flags;
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 8b3147451..9e458819a 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -64,7 +64,7 @@ static void store(int fd)
 		.syncs = to_user_pointer(&sync),
 	};
 	struct data *data;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	uint32_t vm;
 	uint32_t exec_queue;
 	uint32_t syncobj;
@@ -119,7 +119,7 @@ static void store(int fd)
  * @cachelines: cachelines
  * @page-sized: page-sized
  */
-static void store_cachelines(int fd, struct drm_xe_query_engine_info *engine,
+static void store_cachelines(int fd, struct drm_xe_engine *engine,
 			     unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -234,7 +234,7 @@ static void store_all(int fd, int gt, int class)
 	uint64_t addr = 0x100000;
 	uint32_t bo = 0;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	int i, num_eng_per_bb = 0;
 	int sched_id = -1;
 
@@ -309,7 +309,7 @@ static void store_all(int fd, int gt, int class)
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	int fd, class, gt;
 
 	igt_fixture {
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index a0b0c96ea..0fe4439ba 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -67,7 +67,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_eng_per_bb = 0;
 	bool owns_vm = false, owns_fd = false;
@@ -261,7 +261,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 static void
 test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
-		  struct drm_xe_query_engine_info *engine,
+		  struct drm_xe_engine *engine,
 		  int n_exec_queues, int n_execs, unsigned int flags)
 {
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
@@ -467,7 +467,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 static void
 test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
-		 struct drm_xe_query_engine_info *engine, int n_exec_queues,
+		 struct drm_xe_engine *engine, int n_exec_queues,
 		 int n_execs, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -712,7 +712,7 @@ struct thread_data {
 	int gt;
 	uint32_t vm_legacy_mode;
 	uint32_t vm_compute_mode;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	int n_exec_queue;
 	int n_exec;
 	int flags;
@@ -978,7 +978,7 @@ static void *thread(void *data)
 static void threads(int fd, int flags)
 {
 	struct thread_data *threads_data;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	uint64_t addr = 0x1a0000;
 	uint64_t userptr = 0x00007000eadbe000;
 	pthread_mutex_t mutex;
diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index 0bcd3ab94..85ce07775 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -31,7 +31,7 @@
  */
 #define ACT_FREQ_LATENCY_US 100000
 
-static void exec_basic(int fd, struct drm_xe_query_engine_info *engine,
+static void exec_basic(int fd, struct drm_xe_engine *engine,
 		       int n_exec_queues, int n_execs)
 {
 	uint32_t vm;
@@ -387,7 +387,7 @@ static void test_reset(int fd, int gt_id, int cycles)
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	int fd;
 	int gt;
 	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 7ba4c22bb..9ab2ee985 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -153,7 +153,7 @@ __test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
 static void
 test_huc_copy(int fd)
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	uint32_t vm;
 	uint32_t tested_gts = 0;
 
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index fa9b284ee..fc9eb0879 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -43,7 +43,7 @@
   *	there is worked queued on one of the VM's compute exec_queues.
  */
 
-static void test_ping_pong(int fd, struct drm_xe_query_engine_info *engine)
+static void test_ping_pong(int fd, struct drm_xe_engine *engine)
 {
 	size_t vram_size = xe_vram_size_any_region(fd);
 	size_t align = xe_get_default_alignment(fd);
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index 3b286fe6a..b852c1a3c 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -76,7 +76,7 @@ static uint64_t engine_group_get_config(int gt, int class)
  * Run type: FULL
  *
  */
-static void test_any_engine_busyness(int fd, struct drm_xe_query_engine_info *engine)
+static void test_any_engine_busyness(int fd, struct drm_xe_engine *engine)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -202,7 +202,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 		struct xe_spin spin;
 	} *data;
 	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int num_eng_per_bb = 0;
 	uint64_t config, count, idle;
@@ -298,7 +298,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	const struct section {
 		const char *name;
 		int class;
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 2ae4237ea..24fe9533e 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -224,7 +224,7 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
  */
 
 static void
-test_exec(device_t device, struct drm_xe_query_engine_info *engine,
+test_exec(device_t device, struct drm_xe_engine *engine,
 	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
 	  enum igt_acpi_d_state d_state)
 {
@@ -442,7 +442,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	device_t device;
 	uint32_t d3cold_allowed;
 	int sysfs_fd;
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 20909f737..9fff2c71a 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -72,7 +72,7 @@ static void close_fw_handle(int sig)
 		close(fw_handle);
 }
 
-static void exec_load(int fd, struct drm_xe_query_engine_info *engine, unsigned long *done)
+static void exec_load(int fd, struct drm_xe_engine *engine, unsigned long *done)
 {
 	uint32_t bo = 0;
 	uint32_t exec_queue, syncobj, vm;
@@ -226,7 +226,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
-static void idle_residency_on_exec(int fd, struct drm_xe_query_engine_info *engine)
+static void idle_residency_on_exec(int fd, struct drm_xe_engine *engine)
 {
 	const int tol = 20;
 	unsigned long *done;
@@ -314,7 +314,7 @@ igt_main
 	uint32_t d3cold_allowed;
 	int fd, gt;
 	char pci_slot_name[NAME_MAX];
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 41cb10b9e..a26700d4e 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -178,7 +178,7 @@ const char *get_topo_name(int value)
 static void
 test_query_engines(int fd)
 {
-	struct drm_xe_query_engine_info *engines;
+	struct drm_xe_engine *engines;
 	struct drm_xe_engine_class_instance *eci;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
@@ -520,7 +520,7 @@ query_engine_cycles(int fd, struct drm_xe_query_engine_cycles *resp)
 }
 
 static void
-__engine_cycles(int fd, struct drm_xe_query_engine_info *engine)
+__engine_cycles(int fd, struct drm_xe_engine *engine)
 {
 	struct drm_xe_query_engine_cycles ts1 = {};
 	struct drm_xe_query_engine_cycles ts2 = {};
@@ -624,7 +624,7 @@ __engine_cycles(int fd, struct drm_xe_query_engine_info *engine)
  */
 static void test_query_engine_cycles(int fd)
 {
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 
 	igt_require(query_engine_cycles_supported(fd));
 
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 5825fcc8c..0e83b3df6 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -100,7 +100,7 @@ static void spin_all(int fd, int gt, int class)
 	int i, num_eng_per_bb = 0;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	igt_spin_t *spin[MAX_INSTANCE];
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	int sched_id = -1;
 
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index d7b5ac85f..84ce5e0e4 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -385,7 +385,7 @@ struct shared_pte_page_data {
 #define MAX_N_EXEC_QUEUES 4
 
 static void
-shared_pte_page(int fd, struct drm_xe_query_engine_info *engine, int n_bo,
+shared_pte_page(int fd, struct drm_xe_engine *engine, int n_bo,
 		uint64_t addr_stride)
 {
 	uint32_t vm;
@@ -571,7 +571,7 @@ shared_pte_page(int fd, struct drm_xe_query_engine_info *engine, int n_bo,
 #define CONFLICT	(0x1 << 0)
 
 static void
-test_bind_execqueues_independent(int fd, struct drm_xe_query_engine_info *engine,
+test_bind_execqueues_independent(int fd, struct drm_xe_engine *engine,
 			      unsigned int flags)
 {
 	uint32_t vm;
@@ -756,7 +756,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_query_engine_info *engine
  * Test category: functionality test
  */
 static void
-test_bind_array(int fd, struct drm_xe_query_engine_info *engine, int n_execs,
+test_bind_array(int fd, struct drm_xe_engine *engine, int n_execs,
 		unsigned int flags)
 {
 	uint32_t vm;
@@ -948,7 +948,7 @@ test_bind_array(int fd, struct drm_xe_query_engine_info *engine, int n_execs,
  */
 
 static void
-test_large_binds(int fd, struct drm_xe_query_engine_info *engine,
+test_large_binds(int fd, struct drm_xe_engine *engine,
 		 int n_exec_queues, int n_execs, size_t bo_size,
 		 unsigned int flags)
 {
@@ -1107,7 +1107,7 @@ struct thread_data {
 	int fd;
 	uint32_t vm;
 	uint64_t addr;
-	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine *engine;
 	void *map;
 	int *exit;
 };
@@ -1235,7 +1235,7 @@ static void *hammer_thread(void *tdata)
  */
 
 static void
-test_munmap_style_unbind(int fd, struct drm_xe_query_engine_info *engine,
+test_munmap_style_unbind(int fd, struct drm_xe_engine *engine,
 			 int bo_n_pages, int n_binds,
 			 int unbind_n_page_offset, int unbind_n_pages,
 			 unsigned int flags)
@@ -1539,7 +1539,7 @@ try_again_after_invalidate:
  */
 
 static void
-test_mmap_style_bind(int fd, struct drm_xe_query_engine_info *engine,
+test_mmap_style_bind(int fd, struct drm_xe_engine *engine,
 		     int bo_n_pages, int n_binds, int unbind_n_page_offset,
 		     int unbind_n_pages, unsigned int flags)
 {
@@ -1771,7 +1771,7 @@ test_mmap_style_bind(int fd, struct drm_xe_query_engine_info *engine,
 
 igt_main
 {
-	struct drm_xe_query_engine_info *engine, *engine_non_copy = NULL;
+	struct drm_xe_engine *engine, *engine_non_copy = NULL;
 	uint64_t bind_size;
 	int fd;
 	const struct section {
-- 
2.34.1
