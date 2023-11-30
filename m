Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759D310E76F
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 18:45:59 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:45:23 +0000
Message-Id: <20231130184536.7-9-francois.dugast@intel.com>
In-Reply-To: <20231130184536.7-1-francois.dugast@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 08/21] drm-uapi/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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

Align with kernel commit ("drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 benchmarks/gem_wsim.c             |  2 +-
 include/drm-uapi/xe_drm.h         | 24 +++++++++++++++++++++++-
 lib/xe/xe_query.c                 | 16 ++++++++--------
 lib/xe/xe_query.h                 |  8 ++++----
 tests/intel/xe_create.c           |  7 ++++---
 tests/intel/xe_drm_fdinfo.c       |  5 +++--
 tests/intel/xe_exec_store.c       |  8 ++++----
 tests/intel/xe_intel_bb.c         |  3 ++-
 tests/intel/xe_noexec_ping_pong.c |  5 +++--
 tests/intel/xe_waitfence.c        |  6 +++---
 10 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index abbe49a06..514fa4ba7 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -689,7 +689,7 @@ xe_get_default_engine(void)
 	struct drm_xe_engine_class_instance default_hwe, *hwe;
 
 	/* select RCS0 | CCS0 or first available engine */
-	default_hwe = *xe_engine(fd, 0);
+	default_hwe = xe_engine(fd, 0)->instance;
 	xe_for_each_engine(fd, hwe) {
 		if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
 		     hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) &&
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 01e0587dc..6e97270dc 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -124,7 +124,14 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 
-/** struct drm_xe_engine_class_instance - instance of an engine class */
+/**
+ * struct drm_xe_engine_class_instance - instance of an engine class
+ *
+ * It is returned as part of the @drm_xe_query_engine_info, but it also is
+ * used as the input of engine selection for both @drm_xe_exec_queue_create
+ * and @drm_xe_query_engine_cycles
+ *
+ */
 struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_RENDER		0
 #define DRM_XE_ENGINE_CLASS_COPY		1
@@ -145,6 +152,21 @@ struct drm_xe_engine_class_instance {
 	__u16 pad;
 };
 
+/**
+ * struct drm_xe_query_engine_info - describe hardware engine
+ *
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct @drm_xe_query_engine_info in .data.
+ */
+struct drm_xe_query_engine_info {
+	/** @instance: The @drm_xe_engine_class_instance */
+	struct drm_xe_engine_class_instance instance;
+
+	/** @reserved: Reserved */
+	__u64 reserved[3];
+};
+
 /**
  * enum drm_xe_memory_class - Supported memory classes.
  */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index ef7aaa6a1..f9dec1f7a 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -72,10 +72,10 @@ static uint64_t __memory_regions(const struct drm_xe_query_gt_list *gt_list)
 	return regions;
 }
 
-static struct drm_xe_engine_class_instance *
-xe_query_engines_new(int fd, unsigned int *num_engines)
+static struct drm_xe_query_engine_info *
+xe_query_engines(int fd, unsigned int *num_engines)
 {
-	struct drm_xe_engine_class_instance *engines;
+	struct drm_xe_query_engine_info *engines;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
 		.query = DRM_XE_DEVICE_QUERY_ENGINES,
@@ -253,7 +253,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
-	xe_dev->engines = xe_query_engines_new(fd, &xe_dev->number_engines);
+	xe_dev->engines = xe_query_engines(fd, &xe_dev->number_engines);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
 	xe_dev->vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->vram_size));
 	xe_dev->visible_vram_size = calloc(xe_dev->gt_list->num_gt, sizeof(*xe_dev->visible_vram_size));
@@ -427,16 +427,16 @@ uint64_t vram_if_possible(int fd, int gt)
  *
  * Returns engines array of xe device @fd.
  */
-xe_dev_FN(xe_engines, engines, struct drm_xe_engine_class_instance *);
+xe_dev_FN(xe_engines, engines, struct drm_xe_query_engine_info *);
 
 /**
  * xe_engine:
  * @fd: xe device fd
  * @idx: engine index
  *
- * Returns engine instance of xe device @fd and @idx.
+ * Returns engine info of xe device @fd and @idx.
  */
-struct drm_xe_engine_class_instance *xe_engine(int fd, int idx)
+struct drm_xe_query_engine_info *xe_engine(int fd, int idx)
 {
 	struct xe_device *xe_dev;
 
@@ -658,7 +658,7 @@ bool xe_has_engine_class(int fd, uint16_t engine_class)
 	igt_assert(xe_dev);
 
 	for (int i = 0; i < xe_dev->number_engines; i++)
-		if (xe_dev->engines[i].engine_class == engine_class)
+		if (xe_dev->engines[i].instance.engine_class == engine_class)
 			return true;
 
 	return false;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index bf9f2b955..fede00036 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -33,7 +33,7 @@ struct xe_device {
 	uint64_t memory_regions;
 
 	/** @engines: array of hardware engines */
-	struct drm_xe_engine_class_instance *engines;
+	struct drm_xe_query_engine_info *engines;
 
 	/** @number_engines: length of hardware engines array */
 	unsigned int number_engines;
@@ -62,7 +62,7 @@ struct xe_device {
 
 #define xe_for_each_engine(__fd, __hwe) \
 	for (int __i = 0; __i < xe_number_engines(__fd) && \
-	     (__hwe = xe_engine(__fd, __i)); ++__i)
+	     (__hwe = &xe_engine(__fd, __i)->instance); ++__i)
 #define xe_for_each_engine_class(__class) \
 	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
 	     ++__class)
@@ -81,8 +81,8 @@ uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
-struct drm_xe_engine_class_instance *xe_engines(int fd);
-struct drm_xe_engine_class_instance *xe_engine(int fd, int idx);
+struct drm_xe_query_engine_info *xe_engines(int fd);
+struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
 uint16_t xe_region_class(int fd, uint64_t region);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index a3327d9f2..a1ef8a725 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -149,7 +149,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 	igt_nsec_elapsed(&tv);
 
 	igt_fork(n, nproc) {
-		struct drm_xe_engine_class_instance *hwe;
+		struct drm_xe_query_engine_info *engine;
 		uint32_t exec_queue, exec_queues[exec_queues_per_process];
 		int idx, err, i;
 
@@ -157,8 +157,9 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 
 		for (i = 0; i < exec_queues_per_process; i++) {
 			idx = rand() % num_engines;
-			hwe = xe_engine(fd, idx);
-			err = __xe_exec_queue_create(fd, vm, hwe, 0, &exec_queue);
+			engine = xe_engine(fd, idx);
+			err = __xe_exec_queue_create(fd, vm, &engine->instance,
+						     0, &exec_queue);
 			igt_debug("[%2d] Create exec_queue: err=%d, exec_queue=%u [idx = %d]\n",
 				  n, err, exec_queue, i);
 			if (err)
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index d50cc6df1..cec3e0825 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -40,7 +40,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo
 #define BO_SIZE (65536)
 
 /* Subtests */
-static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
+static void test_active(int fd, struct drm_xe_query_engine_info *engine)
 {
 	struct drm_xe_query_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(fd), region;
@@ -89,7 +89,8 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
 		data = xe_bo_map(fd, bo, bo_size);
 
 		for (i = 0; i < N_EXEC_QUEUES; i++) {
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+			exec_queues[i] = xe_exec_queue_create(fd, vm,
+							      &engine->instance, 0);
 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0, true);
 			syncobjs[i] = syncobj_create(fd, 0);
 		}
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 0b7b3d3e9..48e843af5 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -63,7 +63,7 @@ static void store(int fd)
 		.syncs = to_user_pointer(&sync),
 	};
 	struct data *data;
-	struct drm_xe_engine_class_instance *engine;
+	struct drm_xe_query_engine_info *engine;
 	uint32_t vm;
 	uint32_t exec_queue;
 	uint32_t syncobj;
@@ -82,14 +82,14 @@ static void store(int fd)
 
 	engine = xe_engine(fd, 1);
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, engine->gt_id),
+			  vram_if_possible(fd, engine->instance.gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	xe_vm_bind_async(fd, vm, engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
+	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
 	store_dword_batch(data, addr, value);
 
-	exec_queue = xe_exec_queue_create(fd, vm, engine, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	exec.exec_queue_id = exec_queue;
 	exec.address = data->addr;
 	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index c686604d2..804e176ee 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -193,7 +193,8 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 
 	if (new_context) {
 		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-		ctx = xe_exec_queue_create(xe, vm, xe_engine(xe, 0), 0);
+		ctx = xe_exec_queue_create(xe, vm, &xe_engine(xe, 0)->instance,
+					   0);
 		intel_bb_destroy(ibb);
 		ibb = intel_bb_create_with_context(xe, ctx, vm, NULL, PAGE_SIZE);
 		intel_bb_out(ibb, MI_BATCH_BUFFER_END);
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index e27cc4582..585af413d 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -43,7 +43,7 @@
   *	there is worked queued on one of the VM's compute exec_queues.
  */
 
-static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
+static void test_ping_pong(int fd, struct drm_xe_query_engine_info *engine)
 {
 	size_t vram_size = xe_vram_size(fd, 0);
 	size_t align = xe_get_default_alignment(fd);
@@ -75,7 +75,8 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
 			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
 				   bo_size, NULL, 0);
 		}
-		exec_queues[i] = xe_exec_queue_create(fd, vm[i], eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm[i],
+						      &engine->instance, 0);
 	}
 
 	igt_info("Now sleeping for %ds.\n", SECONDS_TO_WAIT);
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index ad8adc2b0..bab2bed42 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -81,7 +81,7 @@ enum waittype {
 static void
 waitfence(int fd, enum waittype wt)
 {
-	struct drm_xe_engine_class_instance *eci = NULL;
+	struct drm_xe_query_engine_info *engine = NULL;
 	struct timespec ts;
 	int64_t current, signalled;
 	uint32_t bo_1;
@@ -114,11 +114,11 @@ waitfence(int fd, enum waittype wt)
 		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
 			  MS_TO_NS(10), timeout);
 	} else if (wt == ENGINE) {
-		eci = xe_engine(fd, 1);
+		engine = xe_engine(fd, 1);
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
 		timeout = current + MS_TO_NS(10);
-		signalled = wait_with_eci_abstime(fd, &wait_fence, 7, eci, timeout);
+		signalled = wait_with_eci_abstime(fd, &wait_fence, 7, &engine->instance, timeout);
 		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
 			  ", signalled: %" PRId64
 			  ", elapsed: %" PRId64 "\n",
-- 
2.34.1
