Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC13310EA0A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:04 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:42 +0000
Message-Id: <20231103144359.7-48-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 47/64] xe: Get near_mem_region directly from
 engine_info.
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

Start querying the engine_info instead of the eci.

The big advantage is that you get the near_mem_region
directly instead of having to do yet another for_each_engine
loop to get the right engine again.

Also, it is going to be useful as we get more information
in the engine_info itself.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 benchmarks/gem_wsim.c              |  36 ++++---
 lib/xe/xe_query.c                  |  33 ++----
 lib/xe/xe_query.h                  |   4 +-
 lib/xe/xe_spin.c                   |   6 +-
 lib/xe/xe_spin.h                   |   2 +-
 tests/intel/xe_dma_buf_sync.c      |  26 ++---
 tests/intel/xe_evict.c             |  46 ++++----
 tests/intel/xe_exec_balancer.c     |  39 ++++---
 tests/intel/xe_exec_basic.c        |  32 +++---
 tests/intel/xe_exec_compute_mode.c |  26 ++---
 tests/intel/xe_exec_fault_mode.c   |  24 ++---
 tests/intel/xe_exec_reset.c        |  93 ++++++++--------
 tests/intel/xe_exec_store.c        |   2 +-
 tests/intel/xe_exec_threads.c      |  38 ++++---
 tests/intel/xe_guc_pc.c            |  16 +--
 tests/intel/xe_pm.c                |  36 +++----
 tests/intel/xe_pm_residency.c      |  25 ++---
 tests/intel/xe_vm.c                | 168 ++++++++++++++---------------
 18 files changed, 334 insertions(+), 318 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 5154974e3..163547f4e 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -214,6 +214,7 @@ struct xe_exec_queue {
 	uint32_t id;
 	unsigned int nr_ecis;
 	struct drm_xe_engine_class_instance *eci_list;
+	uint32_t bo_placement;
 };
 
 struct ctx {
@@ -642,13 +643,14 @@ get_engine(enum intel_engine_id engine)
 	return ci;
 }
 
-static struct drm_xe_engine_class_instance
-xe_get_engine(enum intel_engine_id engine)
+static struct drm_xe_query_engine_info *
+xe_get_engine(enum intel_engine_id engine_class)
 {
+	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci = {}, *eci1;
 	bool found_physical = false;
 
-	switch (engine) {
+	switch (engine_class) {
 	case RCS:
 		eci.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
 		break;
@@ -669,17 +671,17 @@ xe_get_engine(enum intel_engine_id engine)
 		igt_assert(0);
 	};
 
-	xe_for_each_engine_instance(fd, eci1) {
+	xe_for_each_engine(fd, engine) {
+		eci1 = &engine->instance;
 		if (eci.engine_class == eci1->engine_class &&
 		    eci.engine_instance  == eci1->engine_instance) {
-			eci = *eci1;
 			found_physical = true;
 			break;
 		}
 	}
 
 	igt_assert(found_physical);
-	return eci;
+	return engine;
 }
 
 static struct drm_xe_engine_class_instance
@@ -1735,7 +1737,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	int i;
 
 	w->bb_handle = xe_bo_create(fd, vm->id, PAGE_SIZE,
-				    vram_near_eci_if_possible(fd, &eq->eci_list[0]),
+				    eq->bo_placement,
 				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	w->xe.data = xe_bo_map(fd, w->bb_handle, PAGE_SIZE);
 	w->xe.exec.address =
@@ -2250,6 +2252,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 
 static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 {
+	struct drm_xe_query_engine_info *engine;
 	struct xe_exec_queue *eq;
 	struct w_step *w;
 	struct ctx *ctx;
@@ -2290,7 +2293,9 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 			eq->nr_ecis = ctx->engine_map_count;
 			eq->eci_list = calloc(eq->nr_ecis, sizeof(*eq->eci_list));
 			for (i = 0; i < eq->nr_ecis; ++i) {
-				eq->eci_list[i] = xe_get_engine(ctx->engine_map[i]);
+				engine = xe_get_engine(ctx->engine_map[i]);
+				eq->eci_list[i] = engine->instance;
+				eq->bo_placement = vram_near_engine_if_possible(fd, engine);
 
 				/* check no mixing classes and no duplicates */
 				for (int j = 0; j < i; ++j) {
@@ -2339,12 +2344,17 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 					eq->nr_ecis = 1;
 					eq->eci_list = calloc(1, sizeof(*eq->eci_list));
 
-					if (i == DEFAULT)
+					if (i == DEFAULT) {
+						engine = xe_engine(fd, 0);
 						eq->eci_list[0] = xe_get_default_engine();
-					else if (i == VCS)
-						eq->eci_list[0] = xe_get_engine(VCS1);
-					else
-						eq->eci_list[0] = xe_get_engine(i);
+					} else if (i == VCS) {
+						engine = xe_get_engine(VCS1);
+						eq->eci_list[0] = engine->instance;
+					} else {
+						engine = xe_get_engine(i);
+						eq->eci_list[0] = engine->instance;
+					}
+					eq->bo_placement = vram_near_engine_if_possible(fd, engine);
 
 					if (verbose > 3)
 						printf("%u ctx[%d] %s [%u:%u:%u]\n",
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 267e538d0..84daf4077 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -365,33 +365,20 @@ uint64_t any_vram(int fd)
 }
 
 /**
- * vram_near_eci:
+ * vram_near_engine:
  * @fd: xe device fd
- * @eci: engine class instance
+ * @engine: engine info
  *
- * Returns memory bitmask for the vram region that is near the given @eci.
+ * Returns memory bitmask for the vram region that is near the given @engine.
  */
-uint64_t vram_near_eci(int fd, struct drm_xe_engine_class_instance *eci)
+uint64_t vram_near_engine(int fd, struct drm_xe_query_engine_info *engine)
 {
 	struct xe_device *xe_dev;
-	struct drm_xe_query_engine_info *engine;
-	struct drm_xe_engine_class_instance *eci1;
-
-	if (!xe_has_vram(fd))
-		return 0;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	xe_for_each_engine(fd, engine) {
-		eci1 = &engine->instance;
-		if (eci1->engine_class == eci->engine_class &&
-		    eci1->engine_instance == eci->engine_instance &&
-		    eci1->gt_id == eci->gt_id)
-			return mem_region_near_engine(engine);
-	}
-
-	return 0;
+	return xe_has_vram(fd) ? mem_region_near_engine(engine) : 0;
 }
 
 /**
@@ -408,17 +395,17 @@ uint64_t any_vram_if_possible(int fd)
 }
 
 /**
- * vram_near_eci_if_possible:
+ * vram_near_engine_if_possible:
  * @fd: xe device fd
- * @eci: engine class instance
+ * @engine: engine info
  *
  * Returns a memory region bitmask. If possible, it returns a bitmask for a
- * vram region near the given @eci. Otherwise it returns a bitmask for a
+ * vram region near the given @engine. Otherwise it returns a bitmask for a
  * system memory region.
  */
-uint64_t vram_near_eci_if_possible(int fd, struct drm_xe_engine_class_instance *eci)
+uint64_t vram_near_engine_if_possible(int fd, struct drm_xe_query_engine_info *engine)
 {
-	return vram_near_eci(fd, eci) ?: system_memory(fd);
+	return vram_near_engine(fd, engine) ?: system_memory(fd);
 }
 
 /**
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 3eee75ff4..4fa6f0270 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -77,9 +77,9 @@ unsigned int xe_number_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 uint64_t any_vram(int fd);
-uint64_t vram_near_eci(int fd, struct drm_xe_engine_class_instance *eci);
+uint64_t vram_near_engine(int fd, struct drm_xe_query_engine_info *engine);
 uint64_t any_vram_if_possible(int fd);
-uint64_t vram_near_eci_if_possible(int fd, struct drm_xe_engine_class_instance *eci);
+uint64_t vram_near_engine_if_possible(int fd, struct drm_xe_query_engine_info *engine);
 struct drm_xe_query_engine_info *xe_engines(int fd);
 struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 506ddc090..f4c5a3076 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -282,7 +282,7 @@ void xe_spin_free(int fd, struct igt_spin *spin)
 	free(spin);
 }
 
-void xe_cork_init(int fd, struct drm_xe_engine_class_instance *eci,
+void xe_cork_init(int fd, struct drm_xe_query_engine_info *engine,
 		  struct xe_cork *cork)
 {
 	uint64_t addr = xe_get_default_alignment(fd);
@@ -301,13 +301,13 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *eci,
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, eci),
+	bo = xe_bo_create(fd, vm, bo_size, vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, 0x1000);
 
 	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
 
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	syncobj = syncobj_create(fd, 0);
 
 	xe_spin_init_opts(spin, .addr = addr, .preempt = true);
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index b7e327fbd..5e0207e99 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -62,7 +62,7 @@ struct xe_cork {
 	uint32_t syncobj;
 };
 
-void xe_cork_init(int fd, struct drm_xe_engine_class_instance *eci,
+void xe_cork_init(int fd, struct drm_xe_query_engine_info *engine,
 		  struct xe_cork *cork);
 bool xe_cork_started(struct xe_cork *cork);
 void xe_cork_wait_started(struct xe_cork *cork);
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 9a42f8e35..7fc801e05 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -87,10 +87,12 @@ static bool sync_file_busy(int sync_file)
  */
 
 static void
-test_export_dma_buf(struct drm_xe_engine_class_instance *eci0,
-		    struct drm_xe_engine_class_instance *eci1,
+test_export_dma_buf(struct drm_xe_query_engine_info *engine0,
+		    struct drm_xe_query_engine_info *engine1,
 		    int n_bo, int flags)
 {
+	struct drm_xe_engine_class_instance *eci0 = &engine0->instance;
+	struct drm_xe_engine_class_instance *eci1 = &engine1->instance;
 	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
 	int fd[N_FD];
 	uint32_t bo[MAX_N_BO];
@@ -120,7 +122,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *eci0,
 			xe_get_default_alignment(fd[0]));
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd[0], 0, bo_size,
-				     vram_near_eci_if_possible(fd[0], eci0),
+				     vram_near_engine_if_possible(fd[0], engine0),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
 		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
@@ -224,32 +226,32 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *eci0,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci, *eci0 = NULL, *eci1;
+	struct drm_xe_query_engine_info *engine, *engine0 = NULL, *engine1;
 	int fd;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
-		xe_for_each_engine_instance(fd, eci)
-			if (eci0 == NULL) {
-				eci0 = eci;
+		xe_for_each_engine(fd, engine)
+			if (engine0 == NULL) {
+				engine0 = engine;
 			} else {
-				eci1 = eci;
+				engine1 = engine;
 				break;
 			}
 	}
 
 	igt_subtest("export-dma-buf-once")
-		test_export_dma_buf(eci0, eci1, 1, 0);
+		test_export_dma_buf(engine0, engine1, 1, 0);
 
 	igt_subtest("export-dma-buf-many")
-		test_export_dma_buf(eci0, eci1, 16, 0);
+		test_export_dma_buf(engine0, engine1, 16, 0);
 
 	igt_subtest("export-dma-buf-once-read-sync")
-		test_export_dma_buf(eci0, eci1, 1, READ_SYNC);
+		test_export_dma_buf(engine0, engine1, 1, READ_SYNC);
 
 	igt_subtest("export-dma-buf-many-read-sync")
-		test_export_dma_buf(eci0, eci1, 16, READ_SYNC);
+		test_export_dma_buf(engine0, engine1, 16, READ_SYNC);
 
 	igt_fixture
 		drm_close_driver(fd);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2a667a679..7f7eba52f 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -30,7 +30,7 @@
 #define BIND_EXEC_QUEUE		(0x1 << 6)
 
 static void
-test_evict(int fd, struct drm_xe_engine_class_instance *eci,
+test_evict(int fd, struct drm_xe_query_engine_info *engine,
 	   int n_exec_queues, int n_execs, size_t bo_size,
 	   unsigned long flags, pthread_barrier_t *barrier)
 {
@@ -82,9 +82,9 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < n_exec_queues; i++) {
 		if (flags & MULTI_VM)
 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm ,
-						      eci, 0);
+						      &engine->instance, 0);
 		else
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+			exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
 
@@ -103,17 +103,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 			if (flags & MULTI_VM) {
 				__bo = bo[i] = xe_bo_create(fd, 0,
 							    bo_size,
-							    vram_near_eci(fd, eci),
+							    vram_near_engine(fd, engine),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else if (flags & THREADED) {
 				__bo = bo[i] = xe_bo_create(fd, vm,
 							    bo_size,
-							    vram_near_eci(fd, eci),
+							    vram_near_engine(fd, engine),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else {
 				__bo = bo[i] = xe_bo_create(fd, _vm,
 							    bo_size,
-							    vram_near_eci(fd, eci) |
+							    vram_near_engine(fd, engine) |
 							    system_memory(fd),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			}
@@ -212,7 +212,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 }
 
 static void
-test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
+test_evict_cm(int fd, struct drm_xe_query_engine_info *engine,
 	      int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags,
 	      pthread_barrier_t *barrier)
 {
@@ -263,9 +263,9 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < n_exec_queues; i++) {
 		if (flags & MULTI_VM)
 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 :
-							      vm, eci, 0);
+							      vm, &engine->instance, 0);
 		else
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+			exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	}
 
 	for (i = 0; i < n_execs; i++) {
@@ -283,17 +283,17 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 			if (flags & MULTI_VM) {
 				__bo = bo[i] = xe_bo_create(fd, 0,
 							    bo_size,
-							    vram_near_eci(fd, eci),
+							    vram_near_engine(fd, engine),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else if (flags & THREADED) {
 				__bo = bo[i] = xe_bo_create(fd, vm,
 							    bo_size,
-							    vram_near_eci(fd, eci),
+							    vram_near_engine(fd, engine),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else {
 				__bo = bo[i] = xe_bo_create(fd, _vm,
 							    bo_size,
-							    vram_near_eci(fd, eci) |
+							    vram_near_engine(fd, engine) |
 							    system_memory(fd),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			}
@@ -382,7 +382,7 @@ struct thread_data {
 	pthread_cond_t *cond;
 	pthread_barrier_t *barrier;
 	int fd;
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	int n_exec_queues;
 	int n_execs;
 	uint64_t bo_size;
@@ -400,17 +400,17 @@ static void *thread(void *data)
 	pthread_mutex_unlock(t->mutex);
 
 	if (t->flags & COMPUTE_THREAD)
-		test_evict_cm(t->fd, t->eci, t->n_exec_queues, t->n_execs,
+		test_evict_cm(t->fd, t->engine, t->n_exec_queues, t->n_execs,
 			      t->bo_size, t->flags, t->barrier);
 	else
-		test_evict(t->fd, t->eci, t->n_exec_queues, t->n_execs,
+		test_evict(t->fd, t->engine, t->n_exec_queues, t->n_execs,
 			   t->bo_size, t->flags, t->barrier);
 
 	return NULL;
 }
 
 static void
-threads(int fd, struct drm_xe_engine_class_instance *eci,
+threads(int fd, struct drm_xe_query_engine_info *engine,
 	int n_threads, int n_exec_queues, int n_execs, size_t bo_size,
 	unsigned long flags)
 {
@@ -433,7 +433,7 @@ threads(int fd, struct drm_xe_engine_class_instance *eci,
 		threads_data[i].cond = &cond;
 		threads_data[i].barrier = &barrier;
 		threads_data[i].fd = fd;
-		threads_data[i].eci = eci;
+		threads_data[i].engine = engine;
 		threads_data[i].n_exec_queues = n_exec_queues;
 		threads_data[i].n_execs = n_execs;
 		threads_data[i].bo_size = bo_size;
@@ -634,7 +634,7 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  */
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	const struct section {
 		const char *name;
 		int n_exec_queues;
@@ -762,28 +762,28 @@ igt_main
 		vram_size = xe_visible_vram_size_any_region(fd);
 		igt_assert(vram_size);
 
-		xe_for_each_engine_instance(fd, eci)
-			if (eci->engine_class != DRM_XE_ENGINE_CLASS_COPY)
+		xe_for_each_engine(fd, engine)
+			if (engine->instance.engine_class != DRM_XE_ENGINE_CLASS_COPY)
 				break;
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			test_evict(-1, eci, s->n_exec_queues, s->n_execs,
+			test_evict(-1, engine, s->n_exec_queues, s->n_execs,
 				   calc_bo_size(vram_size, s->mul, s->div),
 				   s->flags, NULL);
 	}
 
 	for (const struct section_cm *s = sections_cm; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			test_evict_cm(-1, eci, s->n_exec_queues, s->n_execs,
+			test_evict_cm(-1, engine, s->n_exec_queues, s->n_execs,
 				      calc_bo_size(vram_size, s->mul, s->div),
 				      s->flags, NULL);
 	}
 
 	for (const struct section_threads *s = sections_threads; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			threads(-1, eci, s->n_threads, s->n_exec_queues,
+			threads(-1, engine, s->n_threads, s->n_exec_queues,
 				 s->n_execs,
 				 calc_bo_size(vram_size, s->mul, s->div),
 				 s->flags);
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 22fce66f7..23a5487d1 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -51,19 +51,22 @@ static void test_all_active(int fd, int gt, int class)
 	uint32_t syncobjs[MAX_INSTANCE];
 	size_t bo_size;
 	uint32_t bo = 0;
+	uint32_t bo_placement;
 	struct {
 		struct xe_spin spin;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, num_placements = 0;
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class != class || eci->gt_id != gt)
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class != class ||
+		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = *eci;
+		eci_list[num_placements++] = engine->instance;
+		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
 	if (num_placements < 2)
 		return;
@@ -72,7 +75,7 @@ static void test_all_active(int fd, int gt, int class)
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, &eci_list[0]),
+	bo = xe_bo_create(fd, vm, bo_size, bo_placement,
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -192,22 +195,25 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
 	size_t bo_size;
 	uint32_t bo = 0;
+	uint32_t bo_placement;
 	struct {
 		uint32_t batch[16];
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_placements = 0;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class != class || eci->gt_id != gt)
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class != class ||
+		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = *eci;
+		eci_list[num_placements++] = engine->instance;
+		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
 	if (num_placements < 2)
 		return;
@@ -229,7 +235,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, &eci_list[0]),
+		bo = xe_bo_create(fd, vm, bo_size, bo_placement,
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -417,6 +423,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	size_t bo_size;
 	uint32_t bo = 0;
+	uint32_t bo_placement;
 	struct {
 		uint32_t batch[16];
 		uint64_t pad;
@@ -424,18 +431,20 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t exec_sync;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_placements = 0;
 	int map_fd = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class != class || eci->gt_id != gt)
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class != class ||
+		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = *eci;
+		eci_list[num_placements++] = engine->instance;
+		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
 	if (num_placements < 2)
 		return;
@@ -459,7 +468,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, &eci_list[0]),
+		bo = xe_bo_create(fd, vm, bo_size, bo_placement,
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 5b1fe6469..8c12dbbe9 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -77,7 +77,7 @@
  */
 
 static void
-test_exec(int fd, struct drm_xe_engine_class_instance *eci,
+test_exec(int fd, struct drm_xe_query_engine_info *engine,
 	  int n_exec_queues, int n_execs, int n_vm, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -143,7 +143,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			bo_flags |= DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING;
 
 		bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size,
-				  vram_near_eci_if_possible(fd, eci), bo_flags);
+				  vram_near_engine_if_possible(fd, engine), bo_flags);
 		if (!(flags & DEFER_BIND))
 			data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -151,7 +151,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < n_exec_queues; i++) {
 		uint32_t __vm = vm[i % n_vm];
 
-		exec_queues[i] = xe_exec_queue_create(fd, __vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, __vm, &engine->instance, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd,
 									__vm, 0,
@@ -304,7 +304,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -338,37 +338,37 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1, 1, 1, s->flags);
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1, 2, 1, s->flags);
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1, 2, 1, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1,
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 16,
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-many-vm-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 16,
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 16,
 					  s->flags);
 
 		igt_subtest_f("no-exec-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1, 0, 1, s->flags);
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1, 0, 1, s->flags);
 	}
 
 	igt_fixture
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 91c2319e7..fe4bf4522 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -81,7 +81,7 @@
  * @bindexecqueue-userptr-invalidate:	bindexecqueue userptr invalidate
  */
 static void
-test_exec(int fd, struct drm_xe_engine_class_instance *eci,
+test_exec(int fd, struct drm_xe_query_engine_info *engine,
 	  int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
@@ -121,7 +121,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	for (i = 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		if (flags & BIND_EXECQUEUE)
 			bind_exec_queues[i] =
 				xe_bind_exec_queue_create(fd, vm, 0, true);
@@ -143,14 +143,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	} else {
 		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
-				  bo_size, vram_near_eci_if_possible(fd, eci),
+				  bo_size, vram_near_engine_if_possible(fd, engine),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
 
 	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		if (flags & BIND_EXECQUEUE)
 			bind_exec_queues[i] =
 				xe_bind_exec_queue_create(fd, vm, 0, true);
@@ -292,7 +292,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -322,16 +322,16 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1, 1, s->flags);
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1, 2, s->flags);
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1,
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
@@ -340,8 +340,8 @@ igt_main
 			continue;
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 16,
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 7f5ad8701..1cd3688ac 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -100,7 +100,7 @@
  */
 
 static void
-test_exec(int fd, struct drm_xe_engine_class_instance *eci,
+test_exec(int fd, struct drm_xe_query_engine_info *engine,
 	  int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
@@ -158,14 +158,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		else
 			bo = xe_bo_create(fd, 0, bo_size,
-					  vram_near_eci_if_possible(fd, eci),
+					  vram_near_engine_if_possible(fd, engine),
 					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] =
 				xe_bind_exec_queue_create(fd, vm, 0, true);
@@ -322,7 +322,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -387,23 +387,23 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1, 1, s->flags);
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1, 2, s->flags);
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 1,
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_engine_instance(fd, eci)
-				test_exec(fd, eci, 16,
+			xe_for_each_engine(fd, engine)
+				test_exec(fd, engine, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 119356338..be22730a3 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -25,7 +25,7 @@
  * SUBTEST: spin
  * Description: test spin
  */
-static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
+static void test_spin(int fd, struct drm_xe_query_engine_info *engine)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -53,11 +53,11 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_eci_if_possible(fd, eci),
+			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, bo_size);
 
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	syncobj = syncobj_create(fd, 0);
 
 	sync[0].handle = syncobj_create(fd, 0);
@@ -156,6 +156,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t syncobjs[MAX_N_EXECQUEUES];
 	size_t bo_size;
 	uint32_t bo = 0;
+	uint32_t bo_placement;
 	struct {
 		struct xe_spin spin;
 		uint32_t batch[16];
@@ -163,7 +164,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint32_t data;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_placements = 0, bad_batches = 1;
 
@@ -172,11 +173,13 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class != class || eci->gt_id != gt)
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class != class ||
+		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = *eci;
+		eci_list[num_placements++] = engine->instance;
+		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
 	if (num_placements < 2)
 		return;
@@ -186,7 +189,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, &eci_list[0]),
+	bo = xe_bo_create(fd, vm, bo_size, bo_placement,
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -336,7 +339,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  */
 
 static void
-test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
+test_legacy_mode(int fd, struct drm_xe_query_engine_info *engine,
 		 int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
@@ -376,7 +379,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_eci_if_possible(fd, eci),
+			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -400,7 +403,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		else if (flags & EXEC_QUEUE_RESET)
 			ext = to_user_pointer(&preempt_timeout);
 
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, ext);
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
 
@@ -446,7 +449,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, eci->gt_id);
+		xe_force_gt_reset(fd, engine->instance.gt_id);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -503,7 +506,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
  */
 
 static void
-test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
+test_compute_mode(int fd, struct drm_xe_query_engine_info *engine,
 		  int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
@@ -545,7 +548,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_eci_if_possible(fd, eci),
+			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	memset(data, 0, bo_size);
@@ -564,7 +567,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		else
 			ext = 0;
 
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, ext);
 	};
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
@@ -610,7 +613,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, eci->gt_id);
+		xe_force_gt_reset(fd, engine->instance.gt_id);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -780,7 +783,7 @@ gt_reset(int fd, int n_threads, int n_sec)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -797,61 +800,61 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("spin")
-		xe_for_each_engine_instance(fd, eci)
-			test_spin(fd, eci);
+		xe_for_each_engine(fd, engine)
+			test_spin(fd, engine);
 
 	igt_subtest("cancel")
-		xe_for_each_engine_instance(fd, eci)
-			test_legacy_mode(fd, eci, 1, 1, CANCEL);
+		xe_for_each_engine(fd, engine)
+			test_legacy_mode(fd, engine, 1, 1, CANCEL);
 
 	igt_subtest("execqueue-reset")
-		xe_for_each_engine_instance(fd, eci)
-			test_legacy_mode(fd, eci, 2, 2, EXEC_QUEUE_RESET);
+		xe_for_each_engine(fd, engine)
+			test_legacy_mode(fd, engine, 2, 2, EXEC_QUEUE_RESET);
 
 	igt_subtest("cat-error")
-		xe_for_each_engine_instance(fd, eci)
-			test_legacy_mode(fd, eci, 2, 2, CAT_ERROR);
+		xe_for_each_engine(fd, engine)
+			test_legacy_mode(fd, engine, 2, 2, CAT_ERROR);
 
 	igt_subtest("gt-reset")
-		xe_for_each_engine_instance(fd, eci)
-			test_legacy_mode(fd, eci, 2, 2, GT_RESET);
+		xe_for_each_engine(fd, engine)
+			test_legacy_mode(fd, engine, 2, 2, GT_RESET);
 
 	igt_subtest("close-fd-no-exec")
-		xe_for_each_engine_instance(fd, eci)
-			test_legacy_mode(-1, eci, 16, 0, CLOSE_FD);
+		xe_for_each_engine(fd, engine)
+			test_legacy_mode(-1, engine, 16, 0, CLOSE_FD);
 
 	igt_subtest("close-fd")
-		xe_for_each_engine_instance(fd, eci)
-			test_legacy_mode(-1, eci, 16, 256, CLOSE_FD);
+		xe_for_each_engine(fd, engine)
+			test_legacy_mode(-1, engine, 16, 256, CLOSE_FD);
 
 	igt_subtest("close-execqueues-close-fd")
-		xe_for_each_engine_instance(fd, eci)
-			test_legacy_mode(-1, eci, 16, 256, CLOSE_FD |
+		xe_for_each_engine(fd, engine)
+			test_legacy_mode(-1, engine, 16, 256, CLOSE_FD |
 					 CLOSE_EXEC_QUEUES);
 
 	igt_subtest("cm-execqueue-reset")
-		xe_for_each_engine_instance(fd, eci)
-			test_compute_mode(fd, eci, 2, 2, EXEC_QUEUE_RESET);
+		xe_for_each_engine(fd, engine)
+			test_compute_mode(fd, engine, 2, 2, EXEC_QUEUE_RESET);
 
 	igt_subtest("cm-cat-error")
-		xe_for_each_engine_instance(fd, eci)
-			test_compute_mode(fd, eci, 2, 2, CAT_ERROR);
+		xe_for_each_engine(fd, engine)
+			test_compute_mode(fd, engine, 2, 2, CAT_ERROR);
 
 	igt_subtest("cm-gt-reset")
-		xe_for_each_engine_instance(fd, eci)
-			test_compute_mode(fd, eci, 2, 2, GT_RESET);
+		xe_for_each_engine(fd, engine)
+			test_compute_mode(fd, engine, 2, 2, GT_RESET);
 
 	igt_subtest("cm-close-fd-no-exec")
-		xe_for_each_engine_instance(fd, eci)
-			test_compute_mode(-1, eci, 16, 0, CLOSE_FD);
+		xe_for_each_engine(fd, engine)
+			test_compute_mode(-1, engine, 16, 0, CLOSE_FD);
 
 	igt_subtest("cm-close-fd")
-		xe_for_each_engine_instance(fd, eci)
-			test_compute_mode(-1, eci, 16, 256, CLOSE_FD);
+		xe_for_each_engine(fd, engine)
+			test_compute_mode(-1, engine, 16, 256, CLOSE_FD);
 
 	igt_subtest("cm-close-execqueues-close-fd")
-		xe_for_each_engine_instance(fd, eci)
-			test_compute_mode(-1, eci, 16, 256, CLOSE_FD |
+		xe_for_each_engine(fd, engine)
+			test_compute_mode(-1, engine, 16, 256, CLOSE_FD |
 					  CLOSE_EXEC_QUEUES);
 
 	for (const struct section *s = sections; s->name; s++) {
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 1c99e7569..75eb8b39d 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -83,7 +83,7 @@ static void store(int fd)
 
 	engine = xe_engine(fd, 1);
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_eci_if_possible(fd, &engine->instance),
+			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, &sync, 1);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index fa8ef8645..b63356000 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -61,12 +61,13 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
 	size_t bo_size;
 	uint32_t bo = 0;
+	uint32_t bo_placement;
 	struct {
 		uint32_t batch[16];
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_placements = 0;
 	bool owns_vm = false, owns_fd = false;
@@ -83,11 +84,13 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		owns_vm = true;
 	}
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class != class || eci->gt_id != gt)
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class != class ||
+		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = *eci;
+		eci_list[num_placements++] = engine->instance;
+		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
 	igt_assert(num_placements > 1);
 
@@ -109,7 +112,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_near_eci_if_possible(fd, &eci_list[0]),
+				  bo_placement,
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -252,7 +255,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 static void
 test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
-		  struct drm_xe_engine_class_instance *eci,
+		  struct drm_xe_query_engine_info *engine,
 		  int n_exec_queues, int n_execs, unsigned int flags)
 {
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
@@ -312,14 +315,14 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, 0, bo_size,
-				  vram_near_eci_if_possible(fd, eci),
+				  vram_near_engine_if_possible(fd, engine),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++)
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 
 	pthread_barrier_wait(&barrier);
 
@@ -458,7 +461,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 static void
 test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
-		 struct drm_xe_engine_class_instance *eci, int n_exec_queues,
+		 struct drm_xe_query_engine_info *engine, int n_exec_queues,
 		 int n_execs, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -518,7 +521,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_near_eci_if_possible(fd, eci),
+				  vram_near_engine_if_possible(fd, engine),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -535,9 +538,9 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t ext = to_user_pointer(&preempt_timeout);
 
 		if (flags & HANG && i == hang_exec_queue)
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+			exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, ext);
 		else
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+			exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
 									0, true);
@@ -703,7 +706,7 @@ struct thread_data {
 	int gt;
 	uint32_t vm_legacy_mode;
 	uint32_t vm_compute_mode;
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	int n_exec_queue;
 	int n_exec;
 	int flags;
@@ -725,11 +728,11 @@ static void *thread(void *data)
 			      t->flags);
 	else if (t->flags & COMPUTE_MODE)
 		test_compute_mode(t->fd, t->vm_compute_mode, t->addr,
-				  t->userptr, t->eci, t->n_exec_queue, t->n_exec,
+				  t->userptr, t->engine, t->n_exec_queue, t->n_exec,
 				  t->flags);
 	else
 		test_legacy_mode(t->fd, t->vm_legacy_mode, t->addr, t->userptr,
-				 t->eci, t->n_exec_queue, t->n_exec,
+				 t->engine, t->n_exec_queue, t->n_exec,
 				 t->flags);
 
 	return NULL;
@@ -969,6 +972,7 @@ static void *thread(void *data)
 static void threads(int fd, int flags)
 {
 	struct thread_data *threads_data;
+	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance *eci;
 	uint64_t addr = 0x1a0000;
 	uint64_t userptr = 0x00007000eadbe000;
@@ -1017,7 +1021,7 @@ static void threads(int fd, int flags)
 					       0);
 	}
 
-	xe_for_each_engine_instance(fd, eci) {
+	xe_for_each_engine(fd, engine) {
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
@@ -1029,7 +1033,7 @@ static void threads(int fd, int flags)
 			threads_data[i].fd = fd;
 		threads_data[i].vm_legacy_mode = vm_legacy_mode;
 		threads_data[i].vm_compute_mode = vm_compute_mode;
-		threads_data[i].eci = eci;
+		threads_data[i].engine = engine;
 #define N_EXEC_QUEUE	16
 		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
 #define N_EXEC		1024
diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index a36f6542b..0bcd3ab94 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -31,7 +31,7 @@
  */
 #define ACT_FREQ_LATENCY_US 100000
 
-static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
+static void exec_basic(int fd, struct drm_xe_query_engine_info *engine,
 		       int n_exec_queues, int n_execs)
 {
 	uint32_t vm;
@@ -68,12 +68,12 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_eci_if_possible(fd, eci),
+			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
@@ -387,7 +387,7 @@ static void test_reset(int fd, int gt_id, int cycles)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	int fd;
 	int gt;
 	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
@@ -417,10 +417,10 @@ igt_main
 
 	igt_subtest("freq_fixed_exec") {
 		xe_for_each_gt(fd, gt) {
-			xe_for_each_engine_instance(fd, eci)
+			xe_for_each_engine(fd, engine)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
-					exec_basic(fd, eci, MAX_N_EXEC_QUEUES, 16);
+					exec_basic(fd, engine, MAX_N_EXEC_QUEUES, 16);
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
@@ -439,10 +439,10 @@ igt_main
 
 	igt_subtest("freq_range_exec") {
 		xe_for_each_gt(fd, gt) {
-			xe_for_each_engine_instance(fd, eci)
+			xe_for_each_engine(fd, engine)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
-					exec_basic(fd, eci, MAX_N_EXEC_QUEUES, 16);
+					exec_basic(fd, engine, MAX_N_EXEC_QUEUES, 16);
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 3c0aed4f9..5ca499915 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -224,7 +224,7 @@ static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
  */
 
 static void
-test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
+test_exec(device_t device, struct drm_xe_query_engine_info *engine,
 	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
 	  enum igt_acpi_d_state d_state)
 {
@@ -274,12 +274,12 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
 	bo = xe_bo_create(device.fd_xe, vm, bo_size,
-			  vram_near_eci_if_possible(device.fd_xe, eci),
+			  vram_near_engine_if_possible(device.fd_xe, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(device.fd_xe, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(device.fd_xe, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(device.fd_xe, vm, &engine->instance, 0);
 		bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(device.fd_xe, 0);
 	};
@@ -442,7 +442,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	device_t device;
 	uint32_t d3cold_allowed;
 	int sysfs_fd;
@@ -473,8 +473,8 @@ igt_main
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
 
 		/* Always perform initial once-basic exec checking for health */
-		xe_for_each_engine_instance(device.fd_xe, eci)
-			test_exec(device, eci, 1, 1, NO_SUSPEND, NO_RPM);
+		xe_for_each_engine(device.fd_xe, engine)
+			test_exec(device, engine, 1, 1, NO_SUSPEND, NO_RPM);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -488,30 +488,30 @@ igt_main
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
-			xe_for_each_engine_instance(device.fd_xe, eci)
-				test_exec(device, eci, 1, 2, s->state,
+			xe_for_each_engine(device.fd_xe, engine)
+				test_exec(device, engine, 1, 2, s->state,
 					  NO_RPM);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
 			igt_system_suspend_autoresume(s->state,
 						      SUSPEND_TEST_NONE);
-			xe_for_each_engine_instance(device.fd_xe, eci)
-				test_exec(device, eci, 1, 2, NO_SUSPEND,
+			xe_for_each_engine(device.fd_xe, engine)
+				test_exec(device, engine, 1, 2, NO_SUSPEND,
 					  NO_RPM);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
-			xe_for_each_engine_instance(device.fd_xe, eci)
-				test_exec(device, eci, 16, 32, s->state,
+			xe_for_each_engine(device.fd_xe, engine)
+				test_exec(device, engine, 16, 32, s->state,
 					  NO_RPM);
 		}
 
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
-				xe_for_each_engine_instance(device.fd_xe, eci)
-					test_exec(device, eci, 1, 2, s->state,
+				xe_for_each_engine(device.fd_xe, engine)
+					test_exec(device, engine, 1, 2, s->state,
 						  NO_RPM);
 			}
 		}
@@ -525,15 +525,15 @@ igt_main
 
 		igt_subtest_f("%s-basic-exec", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			xe_for_each_engine_instance(device.fd_xe, eci)
-				test_exec(device, eci, 1, 1,
+			xe_for_each_engine(device.fd_xe, engine)
+				test_exec(device, engine, 1, 1,
 					  NO_SUSPEND, d->state);
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			xe_for_each_engine_instance(device.fd_xe, eci)
-				test_exec(device, eci, 16, 32,
+			xe_for_each_engine(device.fd_xe, engine)
+				test_exec(device, engine, 16, 32,
 					  NO_SUSPEND, d->state);
 		}
 	}
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index f701696ac..34693a6a2 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -72,7 +72,7 @@ static void close_fw_handle(int sig)
 		close(fw_handle);
 }
 
-static void exec_load(int fd, struct drm_xe_engine_class_instance *eci, unsigned long *done)
+static void exec_load(int fd, struct drm_xe_query_engine_info *engine, unsigned long *done)
 {
 	uint32_t bo = 0;
 	uint32_t exec_queue, syncobj, vm;
@@ -98,11 +98,11 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *eci, unsigned
 	};
 
 	vm = xe_vm_create(fd, 0, 0);
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	bo_size = xe_get_default_alignment(fd);
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_eci_if_possible(fd, eci),
+			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	syncobj = syncobj_create(fd, 0);
@@ -226,7 +226,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
-static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *eci)
+static void idle_residency_on_exec(int fd, struct drm_xe_query_engine_info *engine)
 {
 	const int tol = 20;
 	unsigned long *done;
@@ -234,18 +234,19 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
 	unsigned long elapsed_ms, residency_end, residency_start;
 
 	igt_debug("Running on %s:%d\n",
-		  xe_engine_class_string(eci->engine_class), eci->engine_instance);
+		  xe_engine_class_string(engine->instance.engine_class),
+		  engine->instance.engine_instance);
 	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(done != MAP_FAILED);
 	memset(done, 0, 4096);
 
 	igt_fork(child, 1)
-		exec_load(fd, eci, done);
+		exec_load(fd, engine, done);
 
 	start = READ_ONCE(done[1]);
-	residency_start = read_idle_residency(fd, eci->gt_id);
+	residency_start = read_idle_residency(fd, engine->instance.gt_id);
 	elapsed_ms = measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
-	residency_end = read_idle_residency(fd, eci->gt_id);
+	residency_end = read_idle_residency(fd, engine->instance.gt_id);
 	end = READ_ONCE(done[1]);
 	*done = 1;
 
@@ -313,7 +314,7 @@ igt_main
 	uint32_t d3cold_allowed;
 	int fd, gt;
 	char pci_slot_name[NAME_MAX];
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -347,9 +348,9 @@ igt_main
 	igt_describe("Validate idle residency on exec");
 	igt_subtest("idle-residency-on-exec") {
 		xe_for_each_gt(fd, gt) {
-			xe_for_each_engine_instance(fd, eci) {
-				if (gt == eci->gt_id && !eci->engine_instance)
-					idle_residency_on_exec(fd, eci);
+			xe_for_each_engine(fd, engine) {
+				if (gt == engine->instance.gt_id && !engine->instance.engine_instance)
+					idle_residency_on_exec(fd, engine);
 			}
 		}
 	}
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7dd0ec5f2..d1c700fcb 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -344,7 +344,7 @@ struct shared_pte_page_data {
 #define MAX_N_EXEC_QUEUES 4
 
 static void
-shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
+shared_pte_page(int fd, struct drm_xe_query_engine_info *engine, int n_bo,
 		uint64_t addr_stride)
 {
 	uint32_t vm;
@@ -384,14 +384,14 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd, vm, bo_size,
-				     vram_near_eci_if_possible(fd, eci),
+				     vram_near_engine_if_possible(fd, engine),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data[i] = xe_bo_map(fd, bo[i], bo_size);
 	}
 
 	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
@@ -530,7 +530,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 #define CONFLICT	(0x1 << 0)
 
 static void
-test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *eci,
+test_bind_execqueues_independent(int fd, struct drm_xe_query_engine_info *engine,
 			      unsigned int flags)
 {
 	uint32_t vm;
@@ -566,12 +566,12 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_eci_if_possible(fd, eci),
+			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < N_EXEC_QUEUES; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0, true);
 		syncobjs[i] = syncobj_create(fd, 0);
 	}
@@ -715,7 +715,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
  * Test category: functionality test
  */
 static void
-test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
+test_bind_array(int fd, struct drm_xe_query_engine_info *engine, int n_execs,
 		unsigned int flags)
 {
 	uint32_t vm;
@@ -750,20 +750,20 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_eci_if_possible(fd, eci),
+			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (flags & BIND_ARRAY_BIND_EXEC_QUEUE_FLAG)
 		bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0, true);
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 
 	for (i = 0; i < n_execs; ++i) {
 		bind_ops[i].obj = bo;
 		bind_ops[i].obj_offset = 0;
 		bind_ops[i].range = bo_size;
 		bind_ops[i].addr = addr;
-		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
+		bind_ops[i].tile_mask = 0x1 << engine->instance.gt_id;
 		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
 		bind_ops[i].flags = DRM_XE_VM_BIND_FLAG_ASYNC;
 		bind_ops[i].region = 0;
@@ -907,7 +907,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  */
 
 static void
-test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
+test_large_binds(int fd, struct drm_xe_query_engine_info *engine,
 		 int n_exec_queues, int n_execs, size_t bo_size,
 		 unsigned int flags)
 {
@@ -951,13 +951,13 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 			    xe_visible_vram_size_any_region(fd));
 
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_near_eci_if_possible(fd, eci),
+				  vram_near_engine_if_possible(fd, engine),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map = xe_bo_map(fd, bo, bo_size);
 	}
 
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
 
@@ -1066,7 +1066,7 @@ struct thread_data {
 	int fd;
 	uint32_t vm;
 	uint64_t addr;
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	void *map;
 	int *exit;
 };
@@ -1088,7 +1088,7 @@ static void *hammer_thread(void *tdata)
 		uint64_t pad;
 		uint32_t data;
 	} *data = t->map;
-	uint32_t exec_queue = xe_exec_queue_create(t->fd, t->vm, t->eci, 0);
+	uint32_t exec_queue = xe_exec_queue_create(t->fd, t->vm, &t->engine->instance, 0);
 	int b;
 	int i = 0;
 
@@ -1194,7 +1194,7 @@ static void *hammer_thread(void *tdata)
  */
 
 static void
-test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
+test_munmap_style_unbind(int fd, struct drm_xe_query_engine_info *engine,
 			 int bo_n_pages, int n_binds,
 			 int unbind_n_page_offset, int unbind_n_pages,
 			 unsigned int flags)
@@ -1247,13 +1247,13 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map != MAP_FAILED);
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_near_eci_if_possible(fd, eci),
+				  vram_near_engine_if_possible(fd, engine),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(map, 0, bo_size);
 
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 
 	sync[0].handle = syncobj_create(fd, 0);
 	sync[1].handle = syncobj_create(fd, 0);
@@ -1280,7 +1280,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		t.fd = fd;
 		t.vm = vm;
 		t.addr = addr + page_size / 2;
-		t.eci = eci;
+		t.engine = engine;
 		t.exit = &exit;
 		t.map = map + page_size / 2;
 		t.barrier = &barrier;
@@ -1498,7 +1498,7 @@ try_again_after_invalidate:
  */
 
 static void
-test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
+test_mmap_style_bind(int fd, struct drm_xe_query_engine_info *engine,
 		     int bo_n_pages, int n_binds, int unbind_n_page_offset,
 		     int unbind_n_pages, unsigned int flags)
 {
@@ -1552,15 +1552,15 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map0 != MAP_FAILED);
 		igt_assert(map1 != MAP_FAILED);
 	} else {
-		bo0 = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, eci), 0);
+		bo0 = xe_bo_create(fd, vm, bo_size, vram_near_engine_if_possible(fd, engine), 0);
 		map0 = xe_bo_map(fd, bo0, bo_size);
-		bo1 = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, eci), 0);
+		bo1 = xe_bo_create(fd, vm, bo_size, vram_near_engine_if_possible(fd, engine), 0);
 		map1 = xe_bo_map(fd, bo1, bo_size);
 	}
 	memset(map0, 0, bo_size);
 	memset(map1, 0, bo_size);
 
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 
 	sync[0].handle = syncobj_create(fd, 0);
 	sync[1].handle = syncobj_create(fd, 0);
@@ -1588,7 +1588,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		t.vm = vm;
 #define PAGE_SIZE	4096
 		t.addr = addr + PAGE_SIZE / 2;
-		t.eci = eci;
+		t.engine = engine;
 		t.exit = &exit;
 		t.map = map0 + PAGE_SIZE / 2;
 		t.barrier = &barrier;
@@ -1730,7 +1730,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci, *eci_non_copy = NULL;
+	struct drm_xe_query_engine_info *engine, *engine_non_copy = NULL;
 	uint64_t bind_size;
 	int fd;
 	const struct section {
@@ -1828,9 +1828,9 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
-		xe_for_each_engine_instance(fd, eci)
-			if (eci->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
-				eci_non_copy = eci;
+		xe_for_each_engine(fd, engine)
+			if (engine->instance.engine_class != DRM_XE_ENGINE_CLASS_COPY) {
+				engine_non_copy = engine;
 				break;
 			}
 	}
@@ -1857,104 +1857,104 @@ igt_main
 		userptr_invalid(fd);
 
 	igt_subtest("shared-pte-page")
-		xe_for_each_engine_instance(fd, eci)
-			shared_pte_page(fd, eci, 4,
+		xe_for_each_engine(fd, engine)
+			shared_pte_page(fd, engine, 4,
 					xe_get_default_alignment(fd));
 
 	igt_subtest("shared-pde-page")
-		xe_for_each_engine_instance(fd, eci)
-			shared_pte_page(fd, eci, 4, 0x1000ul * 512);
+		xe_for_each_engine(fd, engine)
+			shared_pte_page(fd, engine, 4, 0x1000ul * 512);
 
 	igt_subtest("shared-pde2-page")
-		xe_for_each_engine_instance(fd, eci)
-			shared_pte_page(fd, eci, 4, 0x1000ul * 512 * 512);
+		xe_for_each_engine(fd, engine)
+			shared_pte_page(fd, engine, 4, 0x1000ul * 512 * 512);
 
 	igt_subtest("shared-pde3-page")
-		xe_for_each_engine_instance(fd, eci)
-			shared_pte_page(fd, eci, 4, 0x1000ul * 512 * 512 * 512);
+		xe_for_each_engine(fd, engine)
+			shared_pte_page(fd, engine, 4, 0x1000ul * 512 * 512 * 512);
 
 	igt_subtest("bind-execqueues-independent")
-		xe_for_each_engine_instance(fd, eci)
-			test_bind_execqueues_independent(fd, eci, 0);
+		xe_for_each_engine(fd, engine)
+			test_bind_execqueues_independent(fd, engine, 0);
 
 	igt_subtest("bind-execqueues-conflict")
-		xe_for_each_engine_instance(fd, eci)
-			test_bind_execqueues_independent(fd, eci, CONFLICT);
+		xe_for_each_engine(fd, engine)
+			test_bind_execqueues_independent(fd, engine, CONFLICT);
 
 	igt_subtest("bind-array-twice")
-		xe_for_each_engine_instance(fd, eci)
-			test_bind_array(fd, eci, 2, 0);
+		xe_for_each_engine(fd, engine)
+			test_bind_array(fd, engine, 2, 0);
 
 	igt_subtest("bind-array-many")
-		xe_for_each_engine_instance(fd, eci)
-			test_bind_array(fd, eci, 16, 0);
+		xe_for_each_engine(fd, engine)
+			test_bind_array(fd, engine, 16, 0);
 
 	igt_subtest("bind-array-exec_queue-twice")
-		xe_for_each_engine_instance(fd, eci)
-			test_bind_array(fd, eci, 2,
+		xe_for_each_engine(fd, engine)
+			test_bind_array(fd, engine, 2,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
 	igt_subtest("bind-array-exec_queue-many")
-		xe_for_each_engine_instance(fd, eci)
-			test_bind_array(fd, eci, 16,
+		xe_for_each_engine(fd, engine)
+			test_bind_array(fd, engine, 16,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
 	for (bind_size = 0x1ull << 21; bind_size <= 0x1ull << 31;
 	     bind_size = bind_size << 1) {
 		igt_subtest_f("large-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine_instance(fd, eci) {
-				test_large_binds(fd, eci, 4, 16, bind_size, 0);
+			xe_for_each_engine(fd, engine) {
+				test_large_binds(fd, engine, 4, 16, bind_size, 0);
 				break;
 			}
 		igt_subtest_f("large-split-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine_instance(fd, eci) {
-				test_large_binds(fd, eci, 4, 16, bind_size,
+			xe_for_each_engine(fd, engine) {
+				test_large_binds(fd, engine, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT);
 				break;
 			}
 		igt_subtest_f("large-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine_instance(fd, eci) {
-				test_large_binds(fd, eci, 4, 16, bind_size,
+			xe_for_each_engine(fd, engine) {
+				test_large_binds(fd, engine, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_MISALIGNED);
 				break;
 			}
 		igt_subtest_f("large-split-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine_instance(fd, eci) {
-				test_large_binds(fd, eci, 4, 16, bind_size,
+			xe_for_each_engine(fd, engine) {
+				test_large_binds(fd, engine, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_MISALIGNED);
 				break;
 			}
 		igt_subtest_f("large-userptr-binds-%lld", (long long)bind_size)
-			xe_for_each_engine_instance(fd, eci) {
-				test_large_binds(fd, eci, 4, 16, bind_size,
+			xe_for_each_engine(fd, engine) {
+				test_large_binds(fd, engine, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
 		igt_subtest_f("large-userptr-split-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine_instance(fd, eci) {
-				test_large_binds(fd, eci, 4, 16, bind_size,
+			xe_for_each_engine(fd, engine) {
+				test_large_binds(fd, engine, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
 		igt_subtest_f("large-userptr-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine_instance(fd, eci) {
-				test_large_binds(fd, eci, 4, 16, bind_size,
+			xe_for_each_engine(fd, engine) {
+				test_large_binds(fd, engine, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_MISALIGNED |
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
 		igt_subtest_f("large-userptr-split-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine_instance(fd, eci) {
-				test_large_binds(fd, eci, 4, 16, bind_size,
+			xe_for_each_engine(fd, engine) {
+				test_large_binds(fd, engine, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_MISALIGNED |
 						 LARGE_BIND_FLAG_USERPTR);
@@ -1964,45 +1964,45 @@ igt_main
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
 	igt_subtest_f("mixed-binds-%lld", (long long)bind_size)
-		xe_for_each_engine_instance(fd, eci) {
-			test_large_binds(fd, eci, 4, 16, bind_size, 0);
+		xe_for_each_engine(fd, engine) {
+			test_large_binds(fd, engine, 4, 16, bind_size, 0);
 			break;
 		}
 
 	igt_subtest_f("mixed-misaligned-binds-%lld", (long long)bind_size)
-		xe_for_each_engine_instance(fd, eci) {
-			test_large_binds(fd, eci, 4, 16, bind_size,
+		xe_for_each_engine(fd, engine) {
+			test_large_binds(fd, engine, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED);
 			break;
 		}
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-binds-%lld", (long long)bind_size)
-		xe_for_each_engine_instance(fd, eci) {
-			test_large_binds(fd, eci, 4, 16, bind_size, 0);
+		xe_for_each_engine(fd, engine) {
+			test_large_binds(fd, engine, 4, 16, bind_size, 0);
 			break;
 		}
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-misaligned-binds-%lld", (long long)bind_size)
-		xe_for_each_engine_instance(fd, eci) {
-			test_large_binds(fd, eci, 4, 16, bind_size,
+		xe_for_each_engine(fd, engine) {
+			test_large_binds(fd, engine, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED);
 			break;
 		}
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-binds-%lld", (long long) bind_size)
-		xe_for_each_engine_instance(fd, eci) {
-			test_large_binds(fd, eci, 4, 16, bind_size,
+		xe_for_each_engine(fd, engine) {
+			test_large_binds(fd, engine, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
 		}
 
 	igt_subtest_f("mixed-userptr-misaligned-binds-%lld",
 		      (long long)bind_size)
-		xe_for_each_engine_instance(fd, eci) {
-			test_large_binds(fd, eci, 4, 16, bind_size,
+		xe_for_each_engine(fd, engine) {
+			test_large_binds(fd, engine, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED |
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
@@ -2010,8 +2010,8 @@ igt_main
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-binds-%lld", (long long)bind_size)
-		xe_for_each_engine_instance(fd, eci) {
-			test_large_binds(fd, eci, 4, 16, bind_size,
+		xe_for_each_engine(fd, engine) {
+			test_large_binds(fd, engine, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
 		}
@@ -2019,8 +2019,8 @@ igt_main
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-misaligned-binds-%lld",
 		      (long long)bind_size)
-		xe_for_each_engine_instance(fd, eci) {
-			test_large_binds(fd, eci, 4, 16, bind_size,
+		xe_for_each_engine(fd, engine) {
+			test_large_binds(fd, engine, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED |
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
@@ -2028,10 +2028,10 @@ igt_main
 
 	for (const struct section *s = munmap_sections; s->name; s++) {
 		igt_subtest_f("munmap-style-unbind-%s", s->name) {
-			igt_require_f(eci_non_copy,
+			igt_require_f(engine_non_copy,
 				      "Requires non-copy engine to run\n");
 
-			test_munmap_style_unbind(fd, eci_non_copy,
+			test_munmap_style_unbind(fd, engine_non_copy,
 						 s->bo_n_pages,
 						 s->n_binds,
 						 s->unbind_n_page_offset,
@@ -2042,10 +2042,10 @@ igt_main
 
 	for (const struct section *s = mmap_sections; s->name; s++) {
 		igt_subtest_f("mmap-style-bind-%s", s->name) {
-			igt_require_f(eci_non_copy,
+			igt_require_f(engine_non_copy,
 				      "Requires non-copy engine to run\n");
 
-			test_mmap_style_bind(fd, eci_non_copy,
+			test_mmap_style_bind(fd, engine_non_copy,
 					     s->bo_n_pages,
 					     s->n_binds,
 					     s->unbind_n_page_offset,
-- 
2.34.1
