Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A9010EA19
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:27 +0000
Message-Id: <20231103144359.7-33-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 32/64] fixup! drm-uapi/xe: Align with
 drm_xe_query_engine_info
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

---
 benchmarks/gem_wsim.c             | 2 +-
 lib/xe/xe_query.c                 | 6 +++---
 lib/xe/xe_query.h                 | 4 ++--
 tests/intel/xe_create.c           | 7 ++++---
 tests/intel/xe_drm_fdinfo.c       | 5 +++--
 tests/intel/xe_exec_store.c       | 8 ++++----
 tests/intel/xe_intel_bb.c         | 3 ++-
 tests/intel/xe_noexec_ping_pong.c | 5 +++--
 8 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index d451b8733..5d5353c94 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -688,7 +688,7 @@ xe_get_default_engine(void)
 	struct drm_xe_engine_class_instance default_hwe, *hwe;
 
 	/* select RCS0 | CCS0 or first available engine */
-	default_hwe = *xe_engine(fd, 0);
+	default_hwe = xe_engine(fd, 0)->instance;
 	xe_for_each_engine(fd, hwe) {
 		if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
 		     hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) &&
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 4c1715b18..63f80a8b3 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -422,9 +422,9 @@ xe_dev_FN(xe_engines, engines, struct drm_xe_query_engine_info *);
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
 
@@ -432,7 +432,7 @@ struct drm_xe_engine_class_instance *xe_engine(int fd, int idx)
 	igt_assert(xe_dev);
 	igt_assert(idx >= 0 && idx < xe_dev->number_engines);
 
-	return &xe_dev->engines[idx].instance;
+	return &xe_dev->engines[idx];
 }
 
 /**
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 149606c37..fede00036 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -62,7 +62,7 @@ struct xe_device {
 
 #define xe_for_each_engine(__fd, __hwe) \
 	for (int __i = 0; __i < xe_number_engines(__fd) && \
-	     (__hwe = xe_engine(__fd, __i)); ++__i)
+	     (__hwe = &xe_engine(__fd, __i)->instance); ++__i)
 #define xe_for_each_engine_class(__class) \
 	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
 	     ++__class)
@@ -82,7 +82,7 @@ uint64_t system_memory(int fd);
 uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
 struct drm_xe_query_engine_info *xe_engines(int fd);
-struct drm_xe_engine_class_instance *xe_engine(int fd, int idx);
+struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
 const char *xe_region_name(uint64_t region);
 uint16_t xe_region_class(int fd, uint64_t region);
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 9d71b7463..b04a3443f 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -148,7 +148,7 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 	igt_nsec_elapsed(&tv);
 
 	igt_fork(n, nproc) {
-		struct drm_xe_engine_class_instance *hwe;
+		struct drm_xe_query_engine_info *engine;
 		uint32_t exec_queue, exec_queues[exec_queues_per_process];
 		int idx, err, i;
 
@@ -156,8 +156,9 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
 
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
index 6a0092954..c84087c72 100644
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
index e7a566f62..b64812f9d 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -192,7 +192,8 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 
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
-- 
2.34.1
