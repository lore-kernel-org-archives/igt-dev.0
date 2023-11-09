Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BADF10E8E0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:55:31 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:44 +0000
Message-Id: <20231109155410.7-32-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 31/57] xe: Rename 'hwe' to 'eci'
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

First of all eci aligns better with its struct name. The 'hwe' was
there only for legacy reasons.

But also, let's prepare in a way that we can also iterate over
the engine_info. So, let's be clear that we are iterating over
the engine_instances.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 benchmarks/gem_wsim.c              | 108 +++++++++++++-------------
 lib/igt_dummyload.h                |   2 +-
 lib/xe/xe_query.h                  |   4 +-
 lib/xe/xe_spin.c                   |  10 +--
 lib/xe/xe_spin.h                   |   2 +-
 tests/intel/xe_dma_buf_sync.c      |  26 +++----
 tests/intel/xe_evict.c             |  12 +--
 tests/intel/xe_exec_balancer.c     |  36 ++++-----
 tests/intel/xe_exec_basic.c        |  26 +++----
 tests/intel/xe_exec_compute_mode.c |  18 ++---
 tests/intel/xe_exec_fault_mode.c   |  18 ++---
 tests/intel/xe_exec_reset.c        |  70 ++++++++---------
 tests/intel/xe_exec_store.c        |  22 +++---
 tests/intel/xe_exec_threads.c      |  32 ++++----
 tests/intel/xe_guc_pc.c            |  10 +--
 tests/intel/xe_huc_copy.c          |  12 +--
 tests/intel/xe_perf_pmu.c          |  18 ++---
 tests/intel/xe_pm.c                |  30 ++++----
 tests/intel/xe_pm_residency.c      |  24 +++---
 tests/intel/xe_query.c             |  44 +++++------
 tests/intel/xe_spin_batch.c        |  34 ++++----
 tests/intel/xe_vm.c                | 120 ++++++++++++++---------------
 22 files changed, 339 insertions(+), 339 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 5d5353c94..43ae7cb51 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -212,8 +212,8 @@ struct xe_vm {
 
 struct xe_exec_queue {
 	uint32_t id;
-	unsigned int nr_hwes;
-	struct drm_xe_engine_class_instance *hwe_list;
+	unsigned int nr_ecis;
+	struct drm_xe_engine_class_instance *eci_list;
 };
 
 struct ctx {
@@ -540,11 +540,11 @@ static struct intel_engine_data *query_engines(void)
 		return &engines;
 
 	if (is_xe) {
-		struct drm_xe_engine_class_instance *hwe;
+		struct drm_xe_engine_class_instance *eci;
 
-		xe_for_each_engine(fd, hwe) {
-			engines.engines[engines.nengines].class = hwe->engine_class;
-			engines.engines[engines.nengines].instance = hwe->engine_instance;
+		xe_for_each_engine_instance(fd, eci) {
+			engines.engines[engines.nengines].class = eci->engine_class;
+			engines.engines[engines.nengines].instance = eci->engine_instance;
 			engines.nengines++;
 		}
 	} else
@@ -645,60 +645,60 @@ get_engine(enum intel_engine_id engine)
 static struct drm_xe_engine_class_instance
 xe_get_engine(enum intel_engine_id engine)
 {
-	struct drm_xe_engine_class_instance hwe = {}, *hwe1;
+	struct drm_xe_engine_class_instance eci = {}, *eci1;
 	bool found_physical = false;
 
 	switch (engine) {
 	case RCS:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
+		eci.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
 		break;
 	case BCS:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_COPY;
+		eci.engine_class = DRM_XE_ENGINE_CLASS_COPY;
 		break;
 	case VCS1:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+		eci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
 		break;
 	case VCS2:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
-		hwe.engine_instance = 1;
+		eci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+		eci.engine_instance = 1;
 		break;
 	case VECS:
-		hwe.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+		eci.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
 		break;
 	default:
 		igt_assert(0);
 	};
 
-	xe_for_each_engine(fd, hwe1) {
-		if (hwe.engine_class == hwe1->engine_class &&
-		    hwe.engine_instance  == hwe1->engine_instance) {
-			hwe = *hwe1;
+	xe_for_each_engine_instance(fd, eci1) {
+		if (eci.engine_class == eci1->engine_class &&
+		    eci.engine_instance  == eci1->engine_instance) {
+			eci = *eci1;
 			found_physical = true;
 			break;
 		}
 	}
 
 	igt_assert(found_physical);
-	return hwe;
+	return eci;
 }
 
 static struct drm_xe_engine_class_instance
 xe_get_default_engine(void)
 {
-	struct drm_xe_engine_class_instance default_hwe, *hwe;
+	struct drm_xe_engine_class_instance default_eci, *eci;
 
 	/* select RCS0 | CCS0 or first available engine */
-	default_hwe = xe_engine(fd, 0)->instance;
-	xe_for_each_engine(fd, hwe) {
-		if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
-		     hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) &&
-		    hwe->engine_instance == 0) {
-			default_hwe = *hwe;
+	default_eci = xe_engine(fd, 0)->instance;
+	xe_for_each_engine_instance(fd, eci) {
+		if ((eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+		     eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) &&
+		    eci->engine_instance == 0) {
+			default_eci = *eci;
 			break;
 		}
 	}
 
-	return default_hwe;
+	return default_eci;
 }
 
 static int parse_engine_map(struct w_step *step, const char *_str)
@@ -1735,7 +1735,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	int i;
 
 	w->bb_handle = xe_bo_create(fd, vm->id, PAGE_SIZE,
-				    vram_if_possible(fd, eq->hwe_list[0].gt_id),
+				    vram_if_possible(fd, eq->eci_list[0].gt_id),
 				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	w->xe.data = xe_bo_map(fd, w->bb_handle, PAGE_SIZE);
 	w->xe.exec.address =
@@ -1744,7 +1744,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, PAGE_SIZE);
 	xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
 				   .preempt = (w->preempt_us > 0),
-				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
+				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->eci_list[0].gt_id,
 								1000LL * get_duration(wrk, w)));
 	w->xe.exec.exec_queue_id = eq->id;
 	w->xe.exec.num_batch_buffer = 1;
@@ -2036,8 +2036,8 @@ static void xe_exec_queue_create_(struct ctx *ctx, struct xe_exec_queue *eq)
 	struct drm_xe_exec_queue_create create = {
 		.vm_id = ctx->xe.vm->id,
 		.width = 1,
-		.num_placements = eq->nr_hwes,
-		.instances = to_user_pointer(eq->hwe_list),
+		.num_placements = eq->nr_ecis,
+		.instances = to_user_pointer(eq->eci_list),
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
@@ -2286,25 +2286,25 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 			ctx->xe.queue_list = calloc(ctx->xe.nr_queues, sizeof(*ctx->xe.queue_list));
 			igt_assert(ctx->xe.queue_list);
 			eq = &ctx->xe.queue_list[ctx->xe.nr_queues - 1];
-			eq->nr_hwes = ctx->engine_map_count;
-			eq->hwe_list = calloc(eq->nr_hwes, sizeof(*eq->hwe_list));
-			for (i = 0; i < eq->nr_hwes; ++i) {
-				eq->hwe_list[i] = xe_get_engine(ctx->engine_map[i]);
+			eq->nr_ecis = ctx->engine_map_count;
+			eq->eci_list = calloc(eq->nr_ecis, sizeof(*eq->eci_list));
+			for (i = 0; i < eq->nr_ecis; ++i) {
+				eq->eci_list[i] = xe_get_engine(ctx->engine_map[i]);
 
 				/* check no mixing classes and no duplicates */
 				for (int j = 0; j < i; ++j) {
-					if (eq->hwe_list[j].engine_class !=
-					    eq->hwe_list[i].engine_class) {
-						free(eq->hwe_list);
-						eq->nr_hwes = 0;
+					if (eq->eci_list[j].engine_class !=
+					    eq->eci_list[i].engine_class) {
+						free(eq->eci_list);
+						eq->nr_ecis = 0;
 						wsim_err("Mixing of engine class not supported!\n");
 						return 1;
 					}
 
-					if (eq->hwe_list[j].engine_instance ==
-					    eq->hwe_list[i].engine_instance) {
-						free(eq->hwe_list);
-						eq->nr_hwes = 0;
+					if (eq->eci_list[j].engine_instance ==
+					    eq->eci_list[i].engine_instance) {
+						free(eq->eci_list);
+						eq->nr_ecis = 0;
 						wsim_err("Duplicate engine entry!\n");
 						return 1;
 					}
@@ -2313,9 +2313,9 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 				if (verbose > 3)
 					printf("%u ctx[%d] %s [%u:%u:%u]\n",
 						id, ctx_idx, ring_str_map[ctx->engine_map[i]],
-						eq->hwe_list[i].engine_class,
-						eq->hwe_list[i].engine_instance,
-						eq->hwe_list[i].gt_id);
+						eq->eci_list[i].engine_class,
+						eq->eci_list[i].engine_instance,
+						eq->eci_list[i].gt_id);
 			}
 
 			xe_exec_queue_create_(ctx, eq);
@@ -2335,22 +2335,22 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 			for (i = 0; i < NUM_ENGINES; i++) {
 				if (engine_classes[i]) {
 					eq = &ctx->xe.queue_list[i];
-					eq->nr_hwes = 1;
-					eq->hwe_list = calloc(1, sizeof(*eq->hwe_list));
+					eq->nr_ecis = 1;
+					eq->eci_list = calloc(1, sizeof(*eq->eci_list));
 
 					if (i == DEFAULT)
-						eq->hwe_list[0] = xe_get_default_engine();
+						eq->eci_list[0] = xe_get_default_engine();
 					else if (i == VCS)
-						eq->hwe_list[0] = xe_get_engine(VCS1);
+						eq->eci_list[0] = xe_get_engine(VCS1);
 					else
-						eq->hwe_list[0] = xe_get_engine(i);
+						eq->eci_list[0] = xe_get_engine(i);
 
 					if (verbose > 3)
 						printf("%u ctx[%d] %s [%u:%u:%u]\n",
 							id, ctx_idx, ring_str_map[i],
-							eq->hwe_list[0].engine_class,
-							eq->hwe_list[0].engine_instance,
-							eq->hwe_list[0].gt_id);
+							eq->eci_list[0].engine_class,
+							eq->eci_list[0].engine_instance,
+							eq->eci_list[0].gt_id);
 
 					xe_exec_queue_create_(ctx, eq);
 				}
@@ -2560,7 +2560,7 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
 		xe_spin_init_opts(&w->xe.data->spin,
 				  .addr = w->xe.exec.address,
 				  .preempt = (w->preempt_us > 0),
-				  .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
+				  .ctx_ticks = duration_to_ctx_ticks(fd, eq->eci_list[0].gt_id,
 								1000LL * get_duration(wrk, w)));
 	xe_exec(fd, &w->xe.exec);
 }
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index b771011af..8b61a4c8d 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -55,7 +55,7 @@ typedef struct igt_spin_factory {
 	unsigned int flags;
 	int fence;
 	uint64_t ahnd;
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	uint32_t vm;
 } igt_spin_factory_t;
 
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index fede00036..ef90d5b63 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -60,9 +60,9 @@ struct xe_device {
 	uint16_t dev_id;
 };
 
-#define xe_for_each_engine(__fd, __hwe) \
+#define xe_for_each_engine_instance(__fd, __eci) \
 	for (int __i = 0; __i < xe_number_engines(__fd) && \
-	     (__hwe = &xe_engine(__fd, __i)->instance); ++__i)
+	     (__eci = &xe_engine(__fd, __i)->instance); ++__i)
 #define xe_for_each_engine_class(__class) \
 	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
 	     ++__class)
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index f7fcb5a48..5fd383e07 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -213,8 +213,8 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 		spin->vm = xe_vm_create(fd, 0, 0);
 
 	if (!spin->engine) {
-		if (opt->hwe)
-			spin->engine = xe_exec_queue_create(fd, spin->vm, opt->hwe, 0);
+		if (opt->eci)
+			spin->engine = xe_exec_queue_create(fd, spin->vm, opt->eci, 0);
 		else
 			spin->engine = xe_exec_queue_create_class(fd, spin->vm, DRM_XE_ENGINE_CLASS_COPY);
 	}
@@ -281,7 +281,7 @@ void xe_spin_free(int fd, struct igt_spin *spin)
 	free(spin);
 }
 
-void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
+void xe_cork_init(int fd, struct drm_xe_engine_class_instance *eci,
 		  struct xe_cork *cork)
 {
 	uint64_t addr = xe_get_default_alignment(fd);
@@ -299,13 +299,13 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id),
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, 0x1000);
 
 	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
 
-	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	syncobj = syncobj_create(fd, 0);
 
 	xe_spin_init_opts(spin, .addr = addr, .preempt = true);
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index 5c8c45143..b7e327fbd 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -62,7 +62,7 @@ struct xe_cork {
 	uint32_t syncobj;
 };
 
-void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
+void xe_cork_init(int fd, struct drm_xe_engine_class_instance *eci,
 		  struct xe_cork *cork);
 bool xe_cork_started(struct xe_cork *cork);
 void xe_cork_wait_started(struct xe_cork *cork);
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index dfa957243..daa1dc2ca 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -87,8 +87,8 @@ static bool sync_file_busy(int sync_file)
  */
 
 static void
-test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
-		    struct drm_xe_engine_class_instance *hwe1,
+test_export_dma_buf(struct drm_xe_engine_class_instance *eci0,
+		    struct drm_xe_engine_class_instance *eci1,
 		    int n_bo, int flags)
 {
 	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
@@ -112,7 +112,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 	for (i = 0; i < N_FD; ++i) {
 		fd[i] = drm_open_driver(DRIVER_XE);
 		vm[i] = xe_vm_create(fd[i], 0, 0);
-		exec_queue[i] = xe_exec_queue_create(fd[i], vm[i], !i ? hwe0 : hwe1, 0);
+		exec_queue[i] = xe_exec_queue_create(fd[i], vm[i], !i ? eci0 : eci1, 0);
 	}
 
 	bo_size = sizeof(*data[0]) * N_FD;
@@ -120,7 +120,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 			xe_get_default_alignment(fd[0]));
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd[0], 0, bo_size,
-				     vram_if_possible(fd[0], hwe0->gt_id),
+				     vram_if_possible(fd[0], eci0->gt_id),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
 		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
@@ -223,32 +223,32 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe, *hwe0 = NULL, *hwe1;
+	struct drm_xe_engine_class_instance *eci, *eci0 = NULL, *eci1;
 	int fd;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
-		xe_for_each_engine(fd, hwe)
-			if (hwe0 == NULL) {
-				hwe0 = hwe;
+		xe_for_each_engine_instance(fd, eci)
+			if (eci0 == NULL) {
+				eci0 = eci;
 			} else {
-				hwe1 = hwe;
+				eci1 = eci;
 				break;
 			}
 	}
 
 	igt_subtest("export-dma-buf-once")
-		test_export_dma_buf(hwe0, hwe1, 1, 0);
+		test_export_dma_buf(eci0, eci1, 1, 0);
 
 	igt_subtest("export-dma-buf-many")
-		test_export_dma_buf(hwe0, hwe1, 16, 0);
+		test_export_dma_buf(eci0, eci1, 16, 0);
 
 	igt_subtest("export-dma-buf-once-read-sync")
-		test_export_dma_buf(hwe0, hwe1, 1, READ_SYNC);
+		test_export_dma_buf(eci0, eci1, 1, READ_SYNC);
 
 	igt_subtest("export-dma-buf-many-read-sync")
-		test_export_dma_buf(hwe0, hwe1, 16, READ_SYNC);
+		test_export_dma_buf(eci0, eci1, 16, READ_SYNC);
 
 	igt_fixture
 		drm_close_driver(fd);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2e2960b9b..660056f71 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -631,7 +631,7 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  */
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	const struct section {
 		const char *name;
 		int n_exec_queues;
@@ -759,28 +759,28 @@ igt_main
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
 
-		xe_for_each_engine(fd, hwe)
-			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
+		xe_for_each_engine_instance(fd, eci)
+			if (eci->engine_class != DRM_XE_ENGINE_CLASS_COPY)
 				break;
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			test_evict(-1, hwe, s->n_exec_queues, s->n_execs,
+			test_evict(-1, eci, s->n_exec_queues, s->n_execs,
 				   calc_bo_size(vram_size, s->mul, s->div),
 				   s->flags, NULL);
 	}
 
 	for (const struct section_cm *s = sections_cm; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			test_evict_cm(-1, hwe, s->n_exec_queues, s->n_execs,
+			test_evict_cm(-1, eci, s->n_exec_queues, s->n_execs,
 				      calc_bo_size(vram_size, s->mul, s->div),
 				      s->flags, NULL);
 	}
 
 	for (const struct section_threads *s = sections_threads; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			threads(-1, hwe, s->n_threads, s->n_exec_queues,
+			threads(-1, eci, s->n_threads, s->n_exec_queues,
 				 s->n_execs,
 				 calc_bo_size(vram_size, s->mul, s->div),
 				 s->flags);
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index ea06c23cd..f15a40613 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -53,15 +53,15 @@ static void test_all_active(int fd, int gt, int class)
 		struct xe_spin spin;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, num_placements = 0;
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
 
-		eci[num_placements++] = *hwe;
+		eci_list[num_placements++] = *eci;
 	}
 	if (num_placements < 2)
 		return;
@@ -79,7 +79,7 @@ static void test_all_active(int fd, int gt, int class)
 			.vm_id = vm,
 			.width = 1,
 			.num_placements = num_placements,
-			.instances = to_user_pointer(eci),
+			.instances = to_user_pointer(eci_list),
 		};
 
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
@@ -193,17 +193,17 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_placements = 0;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
 
-		eci[num_placements++] = *hwe;
+		eci_list[num_placements++] = *eci;
 	}
 	if (num_placements < 2)
 		return;
@@ -235,7 +235,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			.vm_id = vm,
 			.width = flags & PARALLEL ? num_placements : 1,
 			.num_placements = flags & PARALLEL ? 1 : num_placements,
-			.instances = to_user_pointer(eci),
+			.instances = to_user_pointer(eci_list),
 		};
 
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
@@ -419,18 +419,18 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t exec_sync;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_placements = 0;
 	int map_fd = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
 
-		eci[num_placements++] = *hwe;
+		eci_list[num_placements++] = *eci;
 	}
 	if (num_placements < 2)
 		return;
@@ -465,7 +465,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			.vm_id = vm,
 			.width = flags & PARALLEL ? num_placements : 1,
 			.num_placements = flags & PARALLEL ? 1 : num_placements,
-			.instances = to_user_pointer(eci),
+			.instances = to_user_pointer(eci_list),
 			.extensions = 0,
 		};
 
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 46b9dc2e0..ae406eb01 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -302,7 +302,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -336,37 +336,37 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 1, 1, s->flags);
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 2, 1, s->flags);
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1, 2, 1, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1,
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-many-vm-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 16,
 					  s->flags);
 
 		igt_subtest_f("no-exec-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 0, 1, s->flags);
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1, 0, 1, s->flags);
 	}
 
 	igt_fixture
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index a9f69deef..b0b4212be 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -291,7 +291,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -321,16 +321,16 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 1, s->flags);
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 2, s->flags);
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1,
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
@@ -339,8 +339,8 @@ igt_main
 			continue;
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 4c85fce76..b1c859b10 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -321,7 +321,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -386,23 +386,23 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 1, s->flags);
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 2, s->flags);
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1,
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
+			xe_for_each_engine_instance(fd, eci)
+				test_exec(fd, eci, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 988e63438..ddb0b7dba 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -159,8 +159,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint32_t data;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_placements = 0, bad_batches = 1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
@@ -168,11 +168,11 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
 
-		eci[num_placements++] = *hwe;
+		eci_list[num_placements++] = *eci;
 	}
 	if (num_placements < 2)
 		return;
@@ -203,7 +203,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			.vm_id = vm,
 			.width = flags & PARALLEL ? num_placements : 1,
 			.num_placements = flags & PARALLEL ? 1 : num_placements,
-			.instances = to_user_pointer(eci),
+			.instances = to_user_pointer(eci_list),
 		};
 
 		if (flags & CANCEL)
@@ -773,7 +773,7 @@ gt_reset(int fd, int n_threads, int n_sec)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -790,61 +790,61 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 
 	igt_subtest("spin")
-		xe_for_each_engine(fd, hwe)
-			test_spin(fd, hwe);
+		xe_for_each_engine_instance(fd, eci)
+			test_spin(fd, eci);
 
 	igt_subtest("cancel")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(fd, hwe, 1, 1, CANCEL);
+		xe_for_each_engine_instance(fd, eci)
+			test_legacy_mode(fd, eci, 1, 1, CANCEL);
 
 	igt_subtest("execqueue-reset")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(fd, hwe, 2, 2, EXEC_QUEUE_RESET);
+		xe_for_each_engine_instance(fd, eci)
+			test_legacy_mode(fd, eci, 2, 2, EXEC_QUEUE_RESET);
 
 	igt_subtest("cat-error")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
+		xe_for_each_engine_instance(fd, eci)
+			test_legacy_mode(fd, eci, 2, 2, CAT_ERROR);
 
 	igt_subtest("gt-reset")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
+		xe_for_each_engine_instance(fd, eci)
+			test_legacy_mode(fd, eci, 2, 2, GT_RESET);
 
 	igt_subtest("close-fd-no-exec")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(-1, hwe, 16, 0, CLOSE_FD);
+		xe_for_each_engine_instance(fd, eci)
+			test_legacy_mode(-1, eci, 16, 0, CLOSE_FD);
 
 	igt_subtest("close-fd")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD);
+		xe_for_each_engine_instance(fd, eci)
+			test_legacy_mode(-1, eci, 16, 256, CLOSE_FD);
 
 	igt_subtest("close-execqueues-close-fd")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD |
+		xe_for_each_engine_instance(fd, eci)
+			test_legacy_mode(-1, eci, 16, 256, CLOSE_FD |
 					 CLOSE_EXEC_QUEUES);
 
 	igt_subtest("cm-execqueue-reset")
-		xe_for_each_engine(fd, hwe)
-			test_compute_mode(fd, hwe, 2, 2, EXEC_QUEUE_RESET);
+		xe_for_each_engine_instance(fd, eci)
+			test_compute_mode(fd, eci, 2, 2, EXEC_QUEUE_RESET);
 
 	igt_subtest("cm-cat-error")
-		xe_for_each_engine(fd, hwe)
-			test_compute_mode(fd, hwe, 2, 2, CAT_ERROR);
+		xe_for_each_engine_instance(fd, eci)
+			test_compute_mode(fd, eci, 2, 2, CAT_ERROR);
 
 	igt_subtest("cm-gt-reset")
-		xe_for_each_engine(fd, hwe)
-			test_compute_mode(fd, hwe, 2, 2, GT_RESET);
+		xe_for_each_engine_instance(fd, eci)
+			test_compute_mode(fd, eci, 2, 2, GT_RESET);
 
 	igt_subtest("cm-close-fd-no-exec")
-		xe_for_each_engine(fd, hwe)
-			test_compute_mode(-1, hwe, 16, 0, CLOSE_FD);
+		xe_for_each_engine_instance(fd, eci)
+			test_compute_mode(-1, eci, 16, 0, CLOSE_FD);
 
 	igt_subtest("cm-close-fd")
-		xe_for_each_engine(fd, hwe)
-			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD);
+		xe_for_each_engine_instance(fd, eci)
+			test_compute_mode(-1, eci, 16, 256, CLOSE_FD);
 
 	igt_subtest("cm-close-execqueues-close-fd")
-		xe_for_each_engine(fd, hwe)
-			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD |
+		xe_for_each_engine_instance(fd, eci)
+			test_compute_mode(-1, eci, 16, 256, CLOSE_FD |
 					  CLOSE_EXEC_QUEUES);
 
 	for (const struct section *s = sections; s->name; s++) {
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 48e843af5..fb2c639c3 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -228,8 +228,8 @@ static void store_all(int fd, int gt, int class)
 	size_t bo_size;
 	uint64_t addr = 0x100000;
 	uint32_t bo = 0;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *eci;
 	int i, num_placements = 0;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -242,10 +242,10 @@ static void store_all(int fd, int gt, int class)
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
-		eci[num_placements++] = *hwe;
+		eci_list[num_placements++] = *eci;
 	}
 
 	igt_require(num_placements);
@@ -255,7 +255,7 @@ static void store_all(int fd, int gt, int class)
 			.vm_id = vm,
 			.width = 1,
 			.num_placements = num_placements,
-			.instances = to_user_pointer(eci),
+			.instances = to_user_pointer(eci_list),
 		};
 
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
@@ -296,7 +296,7 @@ static void store_all(int fd, int gt, int class)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	int fd, class, gt;
 
 	igt_fixture {
@@ -314,12 +314,12 @@ igt_main
 	}
 
 	igt_subtest("cachelines")
-		xe_for_each_engine(fd, hwe)
-			store_cachelines(fd, hwe, 0);
+		xe_for_each_engine_instance(fd, eci)
+			store_cachelines(fd, eci, 0);
 
 	igt_subtest("page-sized")
-		xe_for_each_engine(fd, hwe)
-			store_cachelines(fd, hwe, PAGES);
+		xe_for_each_engine_instance(fd, eci)
+			store_cachelines(fd, eci, PAGES);
 
 	igt_fixture {
 		xe_device_put(fd);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 8a01b150d..803413ae7 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -64,8 +64,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_placements = 0;
 	bool owns_vm = false, owns_fd = false;
 
@@ -81,11 +81,11 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		owns_vm = true;
 	}
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
 
-		eci[num_placements++] = *hwe;
+		eci_list[num_placements++] = *eci;
 	}
 	igt_assert(num_placements > 1);
 
@@ -119,7 +119,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 			.vm_id = vm,
 			.width = flags & PARALLEL ? num_placements : 1,
 			.num_placements = flags & PARALLEL ? 1 : num_placements,
-			.instances = to_user_pointer(eci),
+			.instances = to_user_pointer(eci_list),
 		};
 
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
@@ -964,7 +964,7 @@ static void *thread(void *data)
 static void threads(int fd, int flags)
 {
 	struct thread_data *threads_data;
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	uint64_t addr = 0x1a0000;
 	uint64_t userptr = 0x00007000eadbe000;
 	pthread_mutex_t mutex;
@@ -976,7 +976,7 @@ static void threads(int fd, int flags)
 	int n_threads = 0;
 	int gt;
 
-	xe_for_each_engine(fd, hwe)
+	xe_for_each_engine_instance(fd, eci)
 		++n_engines;
 
 	if (flags & BALANCER) {
@@ -984,9 +984,9 @@ static void threads(int fd, int flags)
 			xe_for_each_engine_class(class) {
 				int num_placements = 0;
 
-				xe_for_each_engine(fd, hwe) {
-					if (hwe->engine_class != class ||
-					    hwe->gt_id != gt)
+				xe_for_each_engine_instance(fd, eci) {
+					if (eci->engine_class != class ||
+					    eci->gt_id != gt)
 						continue;
 					++num_placements;
 				}
@@ -1012,7 +1012,7 @@ static void threads(int fd, int flags)
 					       0);
 	}
 
-	xe_for_each_engine(fd, hwe) {
+	xe_for_each_engine_instance(fd, eci) {
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
@@ -1024,7 +1024,7 @@ static void threads(int fd, int flags)
 			threads_data[i].fd = fd;
 		threads_data[i].vm_legacy_mode = vm_legacy_mode;
 		threads_data[i].vm_compute_mode = vm_compute_mode;
-		threads_data[i].eci = hwe;
+		threads_data[i].eci = eci;
 #define N_EXEC_QUEUE	16
 		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
 #define N_EXEC		1024
@@ -1048,9 +1048,9 @@ static void threads(int fd, int flags)
 			xe_for_each_engine_class(class) {
 				int num_placements = 0;
 
-				xe_for_each_engine(fd, hwe) {
-					if (hwe->engine_class != class ||
-					    hwe->gt_id != gt)
+				xe_for_each_engine_instance(fd, eci) {
+					if (eci->engine_class != class ||
+					    eci->gt_id != gt)
 						continue;
 					++num_placements;
 				}
diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index dd768ecdc..062968050 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -385,7 +385,7 @@ static void test_reset(int fd, int gt_id, int cycles)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	int fd;
 	int gt;
 	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
@@ -415,10 +415,10 @@ igt_main
 
 	igt_subtest("freq_fixed_exec") {
 		xe_for_each_gt(fd, gt) {
-			xe_for_each_engine(fd, hwe)
+			xe_for_each_engine_instance(fd, eci)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
-					exec_basic(fd, hwe, MAX_N_EXEC_QUEUES, 16);
+					exec_basic(fd, eci, MAX_N_EXEC_QUEUES, 16);
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
@@ -437,10 +437,10 @@ igt_main
 
 	igt_subtest("freq_range_exec") {
 		xe_for_each_gt(fd, gt) {
-			xe_for_each_engine(fd, hwe)
+			xe_for_each_engine_instance(fd, eci)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
-					exec_basic(fd, hwe, MAX_N_EXEC_QUEUES, 16);
+					exec_basic(fd, eci, MAX_N_EXEC_QUEUES, 16);
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index dbc5afc17..5eaf4778a 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -152,17 +152,17 @@ __test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
 static void
 test_huc_copy(int fd)
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	uint32_t vm;
 	uint32_t tested_gts = 0;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
-		    !(tested_gts & BIT(hwe->gt_id))) {
-			tested_gts |= BIT(hwe->gt_id);
-			__test_huc_copy(fd, vm, hwe);
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
+		    !(tested_gts & BIT(eci->gt_id))) {
+			tested_gts |= BIT(eci->gt_id);
+			__test_huc_copy(fd, vm, eci);
 		}
 	}
 
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index 63a8eb9b2..9b7c5d9d3 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -202,18 +202,18 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 		struct xe_spin spin;
 	} *data;
 	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
-	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int num_placements = 0;
 	uint64_t config, count, idle;
 
 	config = engine_group_get_config(gt, class);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
 
-		eci[num_placements++] = *hwe;
+		eci_list[num_placements++] = *eci;
 	}
 
 	igt_skip_on_f(!num_placements, "Engine class:%d gt:%d not enabled on this platform\n",
@@ -231,7 +231,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 			.vm_id = vm,
 			.width = 1,
 			.num_placements = num_placements,
-			.instances = to_user_pointer(eci),
+			.instances = to_user_pointer(eci_list),
 		};
 
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
@@ -291,7 +291,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	const struct section {
 		const char *name;
 		int class;
@@ -321,8 +321,8 @@ igt_main
 	}
 
 	igt_subtest("any-engine-group-busy")
-		xe_for_each_engine(fd, hwe)
-			test_any_engine_busyness(fd, hwe);
+		xe_for_each_engine_instance(fd, eci)
+			test_any_engine_busyness(fd, eci);
 
 	igt_fixture {
 		xe_device_put(fd);
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index d78ca31a8..690663a79 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -440,7 +440,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	device_t device;
 	uint32_t d3cold_allowed;
 	int sysfs_fd;
@@ -471,8 +471,8 @@ igt_main
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
 
 		/* Always perform initial once-basic exec checking for health */
-		xe_for_each_engine(device.fd_xe, hwe)
-			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
+		xe_for_each_engine_instance(device.fd_xe, eci)
+			test_exec(device, eci, 1, 1, NO_SUSPEND, NO_RPM);
 
 		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
@@ -486,30 +486,30 @@ igt_main
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 2, s->state,
+			xe_for_each_engine_instance(device.fd_xe, eci)
+				test_exec(device, eci, 1, 2, s->state,
 					  NO_RPM);
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
 			igt_system_suspend_autoresume(s->state,
 						      SUSPEND_TEST_NONE);
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 2, NO_SUSPEND,
+			xe_for_each_engine_instance(device.fd_xe, eci)
+				test_exec(device, eci, 1, 2, NO_SUSPEND,
 					  NO_RPM);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 16, 32, s->state,
+			xe_for_each_engine_instance(device.fd_xe, eci)
+				test_exec(device, eci, 16, 32, s->state,
 					  NO_RPM);
 		}
 
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
-				xe_for_each_engine(device.fd_xe, hwe)
-					test_exec(device, hwe, 1, 2, s->state,
+				xe_for_each_engine_instance(device.fd_xe, eci)
+					test_exec(device, eci, 1, 2, s->state,
 						  NO_RPM);
 			}
 		}
@@ -523,15 +523,15 @@ igt_main
 
 		igt_subtest_f("%s-basic-exec", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 1, 1,
+			xe_for_each_engine_instance(device.fd_xe, eci)
+				test_exec(device, eci, 1, 1,
 					  NO_SUSPEND, d->state);
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			xe_for_each_engine(device.fd_xe, hwe)
-				test_exec(device, hwe, 16, 32,
+			xe_for_each_engine_instance(device.fd_xe, eci)
+				test_exec(device, eci, 16, 32,
 					  NO_SUSPEND, d->state);
 		}
 	}
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 4f590c83c..373170d5b 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -72,7 +72,7 @@ static void close_fw_handle(int sig)
 		close(fw_handle);
 }
 
-static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned long *done)
+static void exec_load(int fd, struct drm_xe_engine_class_instance *eci, unsigned long *done)
 {
 	uint32_t bo = 0;
 	uint32_t exec_queue, syncobj, vm;
@@ -97,11 +97,11 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 	};
 
 	vm = xe_vm_create(fd, 0, 0);
-	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bo_size = xe_get_default_alignment(fd);
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, hwe->gt_id),
+			  vram_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	syncobj = syncobj_create(fd, 0);
@@ -225,7 +225,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
-static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	const int tol = 20;
 	unsigned long *done;
@@ -233,18 +233,18 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
 	unsigned long elapsed_ms, residency_end, residency_start;
 
 	igt_debug("Running on %s:%d\n",
-		  xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
+		  xe_engine_class_string(eci->engine_class), eci->engine_instance);
 	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(done != MAP_FAILED);
 	memset(done, 0, 4096);
 
 	igt_fork(child, 1)
-		exec_load(fd, hwe, done);
+		exec_load(fd, eci, done);
 
 	start = READ_ONCE(done[1]);
-	residency_start = read_idle_residency(fd, hwe->gt_id);
+	residency_start = read_idle_residency(fd, eci->gt_id);
 	elapsed_ms = measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
-	residency_end = read_idle_residency(fd, hwe->gt_id);
+	residency_end = read_idle_residency(fd, eci->gt_id);
 	end = READ_ONCE(done[1]);
 	*done = 1;
 
@@ -312,7 +312,7 @@ igt_main
 	uint32_t d3cold_allowed;
 	int fd, gt;
 	char pci_slot_name[NAME_MAX];
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -346,9 +346,9 @@ igt_main
 	igt_describe("Validate idle residency on exec");
 	igt_subtest("idle-residency-on-exec") {
 		xe_for_each_gt(fd, gt) {
-			xe_for_each_engine(fd, hwe) {
-				if (gt == hwe->gt_id && !hwe->engine_instance)
-					idle_residency_on_exec(fd, hwe);
+			xe_for_each_engine_instance(fd, eci) {
+				if (gt == eci->gt_id && !eci->engine_instance)
+					idle_residency_on_exec(fd, eci);
 			}
 		}
 	}
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 98fe7386b..e5739ad78 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -178,14 +178,14 @@ const char *get_topo_name(int value)
 static void
 test_query_engines(int fd)
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	int i = 0;
 
-	xe_for_each_engine(fd, hwe) {
-		igt_assert(hwe);
+	xe_for_each_engine_instance(fd, eci) {
+		igt_assert(eci);
 		igt_info("engine %d: %s, engine instance: %d, tile: TILE-%d\n", i++,
-			 xe_engine_class_string(hwe->engine_class), hwe->engine_instance,
-								    hwe->gt_id);
+			 xe_engine_class_string(eci->engine_class), eci->engine_instance,
+								    eci->gt_id);
 	}
 
 	igt_assert(i > 0);
@@ -497,7 +497,7 @@ query_engine_cycles(int fd, struct drm_xe_query_engine_cycles *resp)
 }
 
 static void
-__engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
+__engine_cycles(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	struct drm_xe_query_engine_cycles ts1 = {};
 	struct drm_xe_query_engine_cycles ts2 = {};
@@ -519,11 +519,11 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 	};
 
 	igt_debug("engine[%u:%u]\n",
-		  hwe->engine_class,
-		  hwe->engine_instance);
+		  eci->engine_class,
+		  eci->engine_instance);
 
 	vm = xe_vm_create(fd, 0, 0);
-	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm);
 
@@ -532,10 +532,10 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 	for (i = 0; i < NUM_SNAPSHOTS * ARRAY_SIZE(clock); i++) {
 		int index = i / NUM_SNAPSHOTS;
 
-		ts1.eci = *hwe;
+		ts1.eci = *eci;
 		ts1.clockid = clock[index].id;
 
-		ts2.eci = *hwe;
+		ts2.eci = *eci;
 		ts2.clockid = clock[index].id;
 
 		query_engine_cycles(fd, &ts1);
@@ -598,13 +598,13 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
  */
 static void test_query_engine_cycles(int fd)
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 
 	igt_require(query_engine_cycles_supported(fd));
 
-	xe_for_each_engine(fd, hwe) {
-		igt_assert(hwe);
-		__engine_cycles(fd, hwe);
+	xe_for_each_engine_instance(fd, eci) {
+		igt_assert(eci);
+		__engine_cycles(fd, eci);
 	}
 }
 
@@ -614,7 +614,7 @@ static void test_query_engine_cycles(int fd)
  */
 static void test_engine_cycles_invalid(int fd)
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	struct drm_xe_query_engine_cycles ts = {};
 	struct drm_xe_device_query query = {
 		.extensions = 0,
@@ -626,28 +626,28 @@ static void test_engine_cycles_invalid(int fd)
 	igt_require(query_engine_cycles_supported(fd));
 
 	/* get one engine */
-	xe_for_each_engine(fd, hwe)
+	xe_for_each_engine_instance(fd, eci)
 		break;
 
 	/* sanity check engine selection is valid */
-	ts.eci = *hwe;
+	ts.eci = *eci;
 	query_engine_cycles(fd, &ts);
 
 	/* bad instance */
-	ts.eci = *hwe;
+	ts.eci = *eci;
 	ts.eci.engine_instance = 0xffff;
 	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
-	ts.eci = *hwe;
+	ts.eci = *eci;
 
 	/* bad class */
 	ts.eci.engine_class = 0xffff;
 	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
-	ts.eci = *hwe;
+	ts.eci = *eci;
 
 	/* bad gt */
 	ts.eci.gt_id = 0xffff;
 	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
-	ts.eci = *hwe;
+	ts.eci = *eci;
 
 	/* bad clockid */
 	ts.clockid = -1;
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 2e2a0ed0e..9139d3286 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -35,10 +35,10 @@ static void spin_basic(int fd)
 
 /**
  * SUBTEST: spin-batch
- * Description: Create vm and engine of hwe class and run the spinner on it.
+ * Description: Create vm and engine of eci class and run the spinner on it.
  */
 
-static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
+static void spin(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	uint64_t ahnd;
 	unsigned int exec_queue;
@@ -46,7 +46,7 @@ static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
 	igt_spin_t *spin;
 
 	vm = xe_vm_create(fd, 0, 0);
-	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 
 	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm);
@@ -60,11 +60,11 @@ static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
 
 /**
  * SUBTEST: spin-basic-all
- * Description: Basic test which validates the functionality of spinner on all hwe.
+ * Description: Basic test which validates the functionality of spinner on all eci.
  */
 static void spin_basic_all(int fd)
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	uint64_t ahnd;
 	uint32_t vm;
 	igt_spin_t **spin;
@@ -73,10 +73,10 @@ static void spin_basic_all(int fd)
 	vm = xe_vm_create(fd, 0, 0);
 	ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
 	spin = malloc(sizeof(*spin) * xe_number_engines(fd));
-	xe_for_each_engine(fd, hwe) {
+	xe_for_each_engine_instance(fd, eci) {
 		igt_debug("Run on engine: %s:%d\n",
-			  xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
-		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = hwe);
+			  xe_engine_class_string(eci->engine_class), eci->engine_instance);
+		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .eci = eci);
 		i++;
 	}
 
@@ -98,16 +98,16 @@ static void spin_all(int fd, int gt, int class)
 	uint64_t ahnd;
 	uint32_t exec_queues[MAX_INSTANCE], vm;
 	int i, num_placements = 0;
-	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	igt_spin_t *spin[MAX_INSTANCE];
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
+	xe_for_each_engine_instance(fd, eci) {
+		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
-		eci[num_placements++] = *hwe;
+		eci_list[num_placements++] = *eci;
 	}
 	if (num_placements < 2)
 		return;
@@ -118,7 +118,7 @@ static void spin_all(int fd, int gt, int class)
 			.vm_id = vm,
 			.width = 1,
 			.num_placements = num_placements,
-			.instances = to_user_pointer(eci),
+			.instances = to_user_pointer(eci_list),
 		};
 
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
@@ -206,7 +206,7 @@ static void xe_spin_fixed_duration(int fd)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance *eci;
 	int fd;
 	int gt, class;
 
@@ -217,8 +217,8 @@ igt_main
 		spin_basic(fd);
 
 	igt_subtest("spin-batch")
-		xe_for_each_engine(fd, hwe)
-			spin(fd, hwe);
+		xe_for_each_engine_instance(fd, eci)
+			spin(fd, eci);
 
 	igt_subtest("spin-basic-all")
 		spin_basic_all(fd);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index f53e9edf9..2a008e0c4 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1756,7 +1756,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
+	struct drm_xe_engine_class_instance *eci, *eci_non_copy = NULL;
 	uint64_t bind_size;
 	int fd;
 	const struct section {
@@ -1854,9 +1854,9 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
-		xe_for_each_engine(fd, hwe)
-			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
-				hwe_non_copy = hwe;
+		xe_for_each_engine_instance(fd, eci)
+			if (eci->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
+				eci_non_copy = eci;
 				break;
 			}
 	}
@@ -1886,104 +1886,104 @@ igt_main
 		userptr_invalid(fd);
 
 	igt_subtest("shared-pte-page")
-		xe_for_each_engine(fd, hwe)
-			shared_pte_page(fd, hwe, 4,
+		xe_for_each_engine_instance(fd, eci)
+			shared_pte_page(fd, eci, 4,
 					xe_get_default_alignment(fd));
 
 	igt_subtest("shared-pde-page")
-		xe_for_each_engine(fd, hwe)
-			shared_pte_page(fd, hwe, 4, 0x1000ul * 512);
+		xe_for_each_engine_instance(fd, eci)
+			shared_pte_page(fd, eci, 4, 0x1000ul * 512);
 
 	igt_subtest("shared-pde2-page")
-		xe_for_each_engine(fd, hwe)
-			shared_pte_page(fd, hwe, 4, 0x1000ul * 512 * 512);
+		xe_for_each_engine_instance(fd, eci)
+			shared_pte_page(fd, eci, 4, 0x1000ul * 512 * 512);
 
 	igt_subtest("shared-pde3-page")
-		xe_for_each_engine(fd, hwe)
-			shared_pte_page(fd, hwe, 4, 0x1000ul * 512 * 512 * 512);
+		xe_for_each_engine_instance(fd, eci)
+			shared_pte_page(fd, eci, 4, 0x1000ul * 512 * 512 * 512);
 
 	igt_subtest("bind-execqueues-independent")
-		xe_for_each_engine(fd, hwe)
-			test_bind_execqueues_independent(fd, hwe, 0);
+		xe_for_each_engine_instance(fd, eci)
+			test_bind_execqueues_independent(fd, eci, 0);
 
 	igt_subtest("bind-execqueues-conflict")
-		xe_for_each_engine(fd, hwe)
-			test_bind_execqueues_independent(fd, hwe, CONFLICT);
+		xe_for_each_engine_instance(fd, eci)
+			test_bind_execqueues_independent(fd, eci, CONFLICT);
 
 	igt_subtest("bind-array-twice")
-		xe_for_each_engine(fd, hwe)
-			test_bind_array(fd, hwe, 2, 0);
+		xe_for_each_engine_instance(fd, eci)
+			test_bind_array(fd, eci, 2, 0);
 
 	igt_subtest("bind-array-many")
-		xe_for_each_engine(fd, hwe)
-			test_bind_array(fd, hwe, 16, 0);
+		xe_for_each_engine_instance(fd, eci)
+			test_bind_array(fd, eci, 16, 0);
 
 	igt_subtest("bind-array-exec_queue-twice")
-		xe_for_each_engine(fd, hwe)
-			test_bind_array(fd, hwe, 2,
+		xe_for_each_engine_instance(fd, eci)
+			test_bind_array(fd, eci, 2,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
 	igt_subtest("bind-array-exec_queue-many")
-		xe_for_each_engine(fd, hwe)
-			test_bind_array(fd, hwe, 16,
+		xe_for_each_engine_instance(fd, eci)
+			test_bind_array(fd, eci, 16,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
 	for (bind_size = 0x1ull << 21; bind_size <= 0x1ull << 31;
 	     bind_size = bind_size << 1) {
 		igt_subtest_f("large-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine(fd, hwe) {
-				test_large_binds(fd, hwe, 4, 16, bind_size, 0);
+			xe_for_each_engine_instance(fd, eci) {
+				test_large_binds(fd, eci, 4, 16, bind_size, 0);
 				break;
 			}
 		igt_subtest_f("large-split-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine(fd, hwe) {
-				test_large_binds(fd, hwe, 4, 16, bind_size,
+			xe_for_each_engine_instance(fd, eci) {
+				test_large_binds(fd, eci, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT);
 				break;
 			}
 		igt_subtest_f("large-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine(fd, hwe) {
-				test_large_binds(fd, hwe, 4, 16, bind_size,
+			xe_for_each_engine_instance(fd, eci) {
+				test_large_binds(fd, eci, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_MISALIGNED);
 				break;
 			}
 		igt_subtest_f("large-split-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine(fd, hwe) {
-				test_large_binds(fd, hwe, 4, 16, bind_size,
+			xe_for_each_engine_instance(fd, eci) {
+				test_large_binds(fd, eci, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_MISALIGNED);
 				break;
 			}
 		igt_subtest_f("large-userptr-binds-%lld", (long long)bind_size)
-			xe_for_each_engine(fd, hwe) {
-				test_large_binds(fd, hwe, 4, 16, bind_size,
+			xe_for_each_engine_instance(fd, eci) {
+				test_large_binds(fd, eci, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
 		igt_subtest_f("large-userptr-split-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine(fd, hwe) {
-				test_large_binds(fd, hwe, 4, 16, bind_size,
+			xe_for_each_engine_instance(fd, eci) {
+				test_large_binds(fd, eci, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
 		igt_subtest_f("large-userptr-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine(fd, hwe) {
-				test_large_binds(fd, hwe, 4, 16, bind_size,
+			xe_for_each_engine_instance(fd, eci) {
+				test_large_binds(fd, eci, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_MISALIGNED |
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
 		igt_subtest_f("large-userptr-split-misaligned-binds-%lld",
 			      (long long)bind_size)
-			xe_for_each_engine(fd, hwe) {
-				test_large_binds(fd, hwe, 4, 16, bind_size,
+			xe_for_each_engine_instance(fd, eci) {
+				test_large_binds(fd, eci, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_MISALIGNED |
 						 LARGE_BIND_FLAG_USERPTR);
@@ -1993,45 +1993,45 @@ igt_main
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
 	igt_subtest_f("mixed-binds-%lld", (long long)bind_size)
-		xe_for_each_engine(fd, hwe) {
-			test_large_binds(fd, hwe, 4, 16, bind_size, 0);
+		xe_for_each_engine_instance(fd, eci) {
+			test_large_binds(fd, eci, 4, 16, bind_size, 0);
 			break;
 		}
 
 	igt_subtest_f("mixed-misaligned-binds-%lld", (long long)bind_size)
-		xe_for_each_engine(fd, hwe) {
-			test_large_binds(fd, hwe, 4, 16, bind_size,
+		xe_for_each_engine_instance(fd, eci) {
+			test_large_binds(fd, eci, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED);
 			break;
 		}
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-binds-%lld", (long long)bind_size)
-		xe_for_each_engine(fd, hwe) {
-			test_large_binds(fd, hwe, 4, 16, bind_size, 0);
+		xe_for_each_engine_instance(fd, eci) {
+			test_large_binds(fd, eci, 4, 16, bind_size, 0);
 			break;
 		}
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-misaligned-binds-%lld", (long long)bind_size)
-		xe_for_each_engine(fd, hwe) {
-			test_large_binds(fd, hwe, 4, 16, bind_size,
+		xe_for_each_engine_instance(fd, eci) {
+			test_large_binds(fd, eci, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED);
 			break;
 		}
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-binds-%lld", (long long) bind_size)
-		xe_for_each_engine(fd, hwe) {
-			test_large_binds(fd, hwe, 4, 16, bind_size,
+		xe_for_each_engine_instance(fd, eci) {
+			test_large_binds(fd, eci, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
 		}
 
 	igt_subtest_f("mixed-userptr-misaligned-binds-%lld",
 		      (long long)bind_size)
-		xe_for_each_engine(fd, hwe) {
-			test_large_binds(fd, hwe, 4, 16, bind_size,
+		xe_for_each_engine_instance(fd, eci) {
+			test_large_binds(fd, eci, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED |
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
@@ -2039,8 +2039,8 @@ igt_main
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-binds-%lld", (long long)bind_size)
-		xe_for_each_engine(fd, hwe) {
-			test_large_binds(fd, hwe, 4, 16, bind_size,
+		xe_for_each_engine_instance(fd, eci) {
+			test_large_binds(fd, eci, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
 		}
@@ -2048,8 +2048,8 @@ igt_main
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-misaligned-binds-%lld",
 		      (long long)bind_size)
-		xe_for_each_engine(fd, hwe) {
-			test_large_binds(fd, hwe, 4, 16, bind_size,
+		xe_for_each_engine_instance(fd, eci) {
+			test_large_binds(fd, eci, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED |
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
@@ -2057,10 +2057,10 @@ igt_main
 
 	for (const struct section *s = munmap_sections; s->name; s++) {
 		igt_subtest_f("munmap-style-unbind-%s", s->name) {
-			igt_require_f(hwe_non_copy,
+			igt_require_f(eci_non_copy,
 				      "Requires non-copy engine to run\n");
 
-			test_munmap_style_unbind(fd, hwe_non_copy,
+			test_munmap_style_unbind(fd, eci_non_copy,
 						 s->bo_n_pages,
 						 s->n_binds,
 						 s->unbind_n_page_offset,
@@ -2071,10 +2071,10 @@ igt_main
 
 	for (const struct section *s = mmap_sections; s->name; s++) {
 		igt_subtest_f("mmap-style-bind-%s", s->name) {
-			igt_require_f(hwe_non_copy,
+			igt_require_f(eci_non_copy,
 				      "Requires non-copy engine to run\n");
 
-			test_mmap_style_bind(fd, hwe_non_copy,
+			test_mmap_style_bind(fd, eci_non_copy,
 					     s->bo_n_pages,
 					     s->n_binds,
 					     s->unbind_n_page_offset,
-- 
2.34.1
