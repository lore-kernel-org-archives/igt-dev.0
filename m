Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740710E8DB
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:56:08 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:54:01 +0000
Message-Id: <20231109155410.7-49-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 48/57] drm-uapi/xe: Refactor engine information
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

Align with kernel commit ("drm/xe/uapi: Refactor engine information")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 benchmarks/gem_wsim.c          | 12 ++++++-----
 include/drm-uapi/xe_drm.h      | 10 +++++++--
 lib/xe/xe_ioctl.c              |  2 +-
 lib/xe/xe_query.c              |  2 +-
 tests/intel/xe_exec_balancer.c | 24 +++++++++++++++++++---
 tests/intel/xe_exec_reset.c    | 14 +++++++++----
 tests/intel/xe_exec_store.c    | 36 ++++++++++++++++++++-------------
 tests/intel/xe_exec_threads.c  | 37 +++++++++++++++++++++++++---------
 tests/intel/xe_huc_copy.c      | 12 +++++------
 tests/intel/xe_perf_pmu.c      | 27 ++++++++++++++++---------
 tests/intel/xe_pm_residency.c  |  6 +++---
 tests/intel/xe_query.c         | 10 +++++----
 tests/intel/xe_spin_batch.c    | 16 +++++++++++----
 13 files changed, 141 insertions(+), 67 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 876183cc6..0c566617b 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -214,6 +214,7 @@ struct xe_exec_queue {
 	uint32_t id;
 	unsigned int nr_ecis;
 	struct drm_xe_engine_class_instance *eci_list;
+	uint16_t gt_id;
 	uint32_t bo_placement;
 };
 
@@ -1746,7 +1747,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, PAGE_SIZE);
 	xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
 				   .preempt = (w->preempt_us > 0),
-				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->eci_list[0].gt_id,
+				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->gt_id,
 								1000LL * get_duration(wrk, w)));
 	w->xe.exec.exec_queue_id = eq->id;
 	w->xe.exec.num_batch_buffer = 1;
@@ -2296,7 +2297,8 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 				engine = xe_get_engine(ctx->engine_map[i]);
 				eq->eci_list[i] = engine->instance;
 				eq->bo_placement = vram_near_engine_if_possible(fd, engine);
-
+				igt_assert((i && eq->gt_id == engine->gt_id) || i == 0);
+				eq->gt_id = engine->gt_id;
 				/* check no mixing classes and no duplicates */
 				for (int j = 0; j < i; ++j) {
 					if (eq->eci_list[j].engine_class !=
@@ -2321,7 +2323,7 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 						id, ctx_idx, ring_str_map[ctx->engine_map[i]],
 						eq->eci_list[i].engine_class,
 						eq->eci_list[i].engine_instance,
-						eq->eci_list[i].gt_id);
+						eq->eci_list[i].sched_group_id);
 			}
 
 			xe_exec_queue_create_(ctx, eq);
@@ -2361,7 +2363,7 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 							id, ctx_idx, ring_str_map[i],
 							eq->eci_list[0].engine_class,
 							eq->eci_list[0].engine_instance,
-							eq->eci_list[0].gt_id);
+							eq->eci_list[0].sched_group_id);
 
 					xe_exec_queue_create_(ctx, eq);
 				}
@@ -2571,7 +2573,7 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
 		xe_spin_init_opts(&w->xe.data->spin,
 				  .addr = w->xe.exec.address,
 				  .preempt = (w->preempt_us > 0),
-				  .ctx_ticks = duration_to_ctx_ticks(fd, eq->eci_list[0].gt_id,
+				  .ctx_ticks = duration_to_ctx_ticks(fd, eq->gt_id,
 								1000LL * get_duration(wrk, w)));
 	xe_exec(fd, &w->xe.exec);
 }
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 1b74b0fd1..5949f6f6f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -211,8 +211,8 @@ struct drm_xe_engine_class_instance {
 	__u16 engine_class;
 	/** @engine_instance: Engine instance */
 	__u16 engine_instance;
-	/** @gt_id: GT ID the instance is associated with */
-	__u16 gt_id;
+	/** @sched_group_id: Scheduling Group ID for this engine instance */
+	__u16 sched_group_id;
 	/** @pad: MBZ */
 	__u16 pad;
 };
@@ -228,6 +228,12 @@ struct drm_xe_query_engine_info {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
 
+	/** @tile_id: Tile ID where this Engine lives */
+	__u16 tile_id;
+
+	/** @gt_id: GT ID where this Engine lives */
+	__u16 gt_id;
+
 	/**
 	 * @near_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_regions that is near this engine.
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 025357b4e..a8b18021e 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -315,7 +315,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	struct drm_xe_engine_class_instance instance = {
 		.engine_class = class,
 		.engine_instance = 0,
-		.gt_id = 0,
+		.sched_group_id = 0,
 	};
 	struct drm_xe_exec_queue_create create = {
 		.vm_id = vm,
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 5f13b65b7..e0554907e 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -569,7 +569,7 @@ uint64_t xe_vram_size_region_near_gt(int fd, int gt)
 	igt_assert(xe_dev);
 
 	xe_for_each_engine(fd, engine) {
-		if (gt == engine->instance.gt_id)
+		if (gt == engine->gt_id)
 			for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
 				if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
 				    ((1 << xe_dev->mem_regions->regions[i].instance) &
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index d06fec3ba..00e2949af 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -59,12 +59,18 @@ static void test_all_active(int fd, int gt, int class)
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, num_eng_per_bb = 0;
+	int sched_id = -1;
 
 	xe_for_each_engine(fd, engine) {
 		if (engine->instance.engine_class != class ||
-		    engine->instance.gt_id != gt)
+		    engine->gt_id != gt)
 			continue;
 
+		if (sched_id == -1)
+			sched_id = engine->instance.sched_group_id;
+		else
+			igt_assert_eq(sched_id, engine->instance.sched_group_id);
+
 		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
@@ -204,14 +210,20 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_eng_per_bb = 0;
+	int sched_id = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
 	xe_for_each_engine(fd, engine) {
 		if (engine->instance.engine_class != class ||
-		    engine->instance.gt_id != gt)
+		    engine->gt_id != gt)
 			continue;
 
+		if (sched_id == -1)
+			sched_id = engine->instance.sched_group_id;
+		else
+			igt_assert_eq(sched_id, engine->instance.sched_group_id);
+
 		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
@@ -435,14 +447,20 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_eng_per_bb = 0;
 	int map_fd = -1;
+	int sched_id = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
 	xe_for_each_engine(fd, engine) {
 		if (engine->instance.engine_class != class ||
-		    engine->instance.gt_id != gt)
+		    engine->gt_id != gt)
 			continue;
 
+		if (sched_id == -1)
+			sched_id = engine->instance.sched_group_id;
+		else
+			igt_assert_eq(sched_id, engine->instance.sched_group_id);
+
 		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index cc446ff47..fc90d965c 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -167,6 +167,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_eng_per_bb = 0, bad_batches = 1;
+	int sched_id = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 
@@ -175,9 +176,14 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	xe_for_each_engine(fd, engine) {
 		if (engine->instance.engine_class != class ||
-		    engine->instance.gt_id != gt)
+		    engine->gt_id != gt)
 			continue;
 
+		if (sched_id == -1)
+			sched_id = engine->instance.sched_group_id;
+		else
+			igt_assert_eq(sched_id, engine->instance.sched_group_id);
+
 		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
@@ -449,7 +455,7 @@ test_legacy_mode(int fd, struct drm_xe_query_engine_info *engine,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, engine->instance.gt_id);
+		xe_force_gt_reset(fd, engine->gt_id);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -613,7 +619,7 @@ test_compute_mode(int fd, struct drm_xe_query_engine_info *engine,
 	}
 
 	if (flags & GT_RESET)
-		xe_force_gt_reset(fd, engine->instance.gt_id);
+		xe_force_gt_reset(fd, engine->gt_id);
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
@@ -686,7 +692,7 @@ static void submit_jobs(struct gt_thread_data *t)
 		struct drm_xe_engine_class_instance instance = {
 			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 			.engine_instance = 0,
-			.gt_id = 0,
+			.sched_group_id = 0,
 		};
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 8b2ae34b0..8b3147451 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -86,7 +86,7 @@ static void store(int fd)
 			  vram_near_engine_if_possible(fd, engine),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, &sync, 1);
+	xe_vm_bind_async(fd, vm, engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
 	store_dword_batch(data, addr, value);
 
@@ -119,7 +119,7 @@ static void store(int fd)
  * @cachelines: cachelines
  * @page-sized: page-sized
  */
-static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
+static void store_cachelines(int fd, struct drm_xe_query_engine_info *engine,
 			     unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
@@ -149,19 +149,19 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
-	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queues = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	syncobjs = syncobj_create(fd, 0);
 	sync[0].handle = syncobj_create(fd, 0);
 
 	for (i = 0; i < count; i++) {
 		bo[i] = xe_bo_create(fd, vm, bo_size,
-				     vram_near_engine_if_possible(fd, eci),
+				     vram_near_engine_if_possible(fd, engine),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
 		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
 								    bo_size, 0,
 								    ALLOC_STRATEGY_LOW_TO_HIGH);
-		xe_vm_bind_async(fd, vm, eci->gt_id, bo[i], 0, dst_offset[i], bo_size, sync, 1);
+		xe_vm_bind_async(fd, vm, engine->gt_id, bo[i], 0, dst_offset[i], bo_size, sync, 1);
 	}
 
 	batch_map = xe_bo_map(fd, bo[i-1], bo_size);
@@ -234,8 +234,9 @@ static void store_all(int fd, int gt, int class)
 	uint64_t addr = 0x100000;
 	uint32_t bo = 0;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	int i, num_eng_per_bb = 0;
+	int sched_id = -1;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data);
@@ -247,10 +248,17 @@ static void store_all(int fd, int gt, int class)
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class != class || eci->gt_id != gt)
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class != class ||
+		    engine->gt_id != gt)
 			continue;
-		eci_list[num_eng_per_bb++] = *eci;
+
+		if (sched_id == -1)
+			sched_id = engine->instance.sched_group_id;
+		else
+			igt_assert_eq(sched_id, engine->instance.sched_group_id);
+
+		eci_list[num_eng_per_bb++] = engine->instance;
 	}
 
 	igt_require(num_eng_per_bb);
@@ -301,7 +309,7 @@ static void store_all(int fd, int gt, int class)
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	int fd, class, gt;
 
 	igt_fixture {
@@ -319,12 +327,12 @@ igt_main
 	}
 
 	igt_subtest("cachelines")
-		xe_for_each_engine_instance(fd, eci)
-			store_cachelines(fd, eci, 0);
+		xe_for_each_engine(fd, engine)
+			store_cachelines(fd, engine, 0);
 
 	igt_subtest("page-sized")
-		xe_for_each_engine_instance(fd, eci)
-			store_cachelines(fd, eci, PAGES);
+		xe_for_each_engine(fd, engine)
+			store_cachelines(fd, engine, PAGES);
 
 	igt_fixture {
 		xe_device_put(fd);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 2aac6bcdc..df87fab2b 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -71,6 +71,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int i, j, b, num_eng_per_bb = 0;
 	bool owns_vm = false, owns_fd = false;
+	int sched_id = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
@@ -86,9 +87,14 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	xe_for_each_engine(fd, engine) {
 		if (engine->instance.engine_class != class ||
-		    engine->instance.gt_id != gt)
+		    engine->gt_id != gt)
 			continue;
 
+		if (sched_id == -1)
+			sched_id = engine->instance.sched_group_id;
+		else
+			igt_assert_eq(sched_id, engine->instance.sched_group_id);
+
 		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
@@ -973,7 +979,6 @@ static void threads(int fd, int flags)
 {
 	struct thread_data *threads_data;
 	struct drm_xe_query_engine_info *engine;
-	struct drm_xe_engine_class_instance *eci;
 	uint64_t addr = 0x1a0000;
 	uint64_t userptr = 0x00007000eadbe000;
 	pthread_mutex_t mutex;
@@ -985,24 +990,30 @@ static void threads(int fd, int flags)
 	int n_threads = 0;
 	int gt;
 
-	xe_for_each_engine_instance(fd, eci)
+	xe_for_each_engine(fd, engine)
 		++n_engines;
 
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
 				int num_eng_per_bb = 0;
+				int sched_id = -1;
 
-				xe_for_each_engine_instance(fd, eci) {
-					if (eci->engine_class != class ||
-					    eci->gt_id != gt)
+				xe_for_each_engine(fd, engine) {
+					if (engine->instance.engine_class != class ||
+					    engine->gt_id != gt)
 						continue;
+
+					if (sched_id == -1)
+						sched_id = engine->instance.sched_group_id;
+					else
+						igt_assert_eq(sched_id, engine->instance.sched_group_id);
 					++num_eng_per_bb;
 				}
 
 				if (num_eng_per_bb > 1)
 					n_engines += 2;
-			}
+		}
 	}
 
 	threads_data = calloc(n_engines, sizeof(*threads_data));
@@ -1056,11 +1067,17 @@ static void threads(int fd, int flags)
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
 				int num_eng_per_bb = 0;
+				int sched_id = -1;
 
-				xe_for_each_engine_instance(fd, eci) {
-					if (eci->engine_class != class ||
-					    eci->gt_id != gt)
+				xe_for_each_engine(fd, engine) {
+					if (engine->instance.engine_class != class ||
+					    engine->gt_id != gt)
 						continue;
+
+					if (sched_id == -1)
+						sched_id = engine->instance.sched_group_id;
+					else
+						igt_assert_eq(sched_id, engine->instance.sched_group_id);
 					++num_eng_per_bb;
 				}
 
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index 6cf38e2c9..7ba4c22bb 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -153,17 +153,17 @@ __test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
 static void
 test_huc_copy(int fd)
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	uint32_t vm;
 	uint32_t tested_gts = 0;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
-		    !(tested_gts & BIT(eci->gt_id))) {
-			tested_gts |= BIT(eci->gt_id);
-			__test_huc_copy(fd, vm, eci);
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE &&
+		    !(tested_gts & BIT(engine->gt_id))) {
+			tested_gts |= BIT(engine->gt_id);
+			__test_huc_copy(fd, vm, &engine->instance);
 		}
 	}
 
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index 49e494205..3b286fe6a 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -76,7 +76,7 @@ static uint64_t engine_group_get_config(int gt, int class)
  * Run type: FULL
  *
  */
-static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance *eci)
+static void test_any_engine_busyness(int fd, struct drm_xe_query_engine_info *engine)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -106,13 +106,13 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd), 0);
 	spin = xe_bo_map(fd, bo, bo_size);
 
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
 	syncobj = syncobj_create(fd, 0);
 
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-	pmu_fd = open_pmu(fd, DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(eci->gt_id));
+	pmu_fd = open_pmu(fd, DRM_XE_PMU_ANY_ENGINE_GROUP_BUSY(engine->gt_id));
 	idle = pmu_read(pmu_fd);
 	igt_assert(!idle);
 
@@ -202,18 +202,25 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 		struct xe_spin spin;
 	} *data;
 	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	int num_eng_per_bb = 0;
 	uint64_t config, count, idle;
+	int sched_id = -1;
 
 	config = engine_group_get_config(gt, class);
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class != class || eci->gt_id != gt)
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class != class ||
+		    engine->gt_id != gt)
 			continue;
 
-		eci_list[num_eng_per_bb++] = *eci;
+		if (sched_id == -1)
+			sched_id = engine->instance.sched_group_id;
+		else
+			igt_assert_eq(sched_id, engine->instance.sched_group_id);
+
+		eci_list[num_eng_per_bb++] = engine->instance;
 	}
 
 	igt_skip_on_f(!num_eng_per_bb, "Engine class:%d gt:%d not enabled on this platform\n",
@@ -291,7 +298,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 
 igt_main
 {
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
 	const struct section {
 		const char *name;
 		int class;
@@ -321,8 +328,8 @@ igt_main
 	}
 
 	igt_subtest("any-engine-group-busy")
-		xe_for_each_engine_instance(fd, eci)
-			test_any_engine_busyness(fd, eci);
+		xe_for_each_engine(fd, engine)
+			test_any_engine_busyness(fd, engine);
 
 	igt_fixture {
 		xe_device_put(fd);
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 34693a6a2..20909f737 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -244,9 +244,9 @@ static void idle_residency_on_exec(int fd, struct drm_xe_query_engine_info *engi
 		exec_load(fd, engine, done);
 
 	start = READ_ONCE(done[1]);
-	residency_start = read_idle_residency(fd, engine->instance.gt_id);
+	residency_start = read_idle_residency(fd, engine->gt_id);
 	elapsed_ms = measured_usleep(SLEEP_DURATION * USEC_PER_SEC) / 1000;
-	residency_end = read_idle_residency(fd, engine->instance.gt_id);
+	residency_end = read_idle_residency(fd, engine->gt_id);
 	end = READ_ONCE(done[1]);
 	*done = 1;
 
@@ -349,7 +349,7 @@ igt_main
 	igt_subtest("idle-residency-on-exec") {
 		xe_for_each_gt(fd, gt) {
 			xe_for_each_engine(fd, engine) {
-				if (gt == engine->instance.gt_id && !engine->instance.engine_instance)
+				if (gt == engine->gt_id && !engine->instance.engine_instance)
 					idle_residency_on_exec(fd, engine);
 			}
 		}
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index ea98ace5c..e6cfafd0a 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -201,10 +201,12 @@ test_query_engines(int fd)
 	for (i = 0; i < num_engines; i++) {
 		eci = &engines[i].instance;
 		igt_assert(eci);
-		igt_info("engine %d: %s, engine instance: %d, gt: GT-%d\n", i,
+		igt_info("engine %d: %s, tile: TILE-%d, gt: GT-%d, engine instance: %d, scheduling group:%d\n", i,
 			 xe_engine_class_string(eci->engine_class),
+			 engines[i].tile_id,
+			 engines[i].gt_id,
 			 eci->engine_instance,
-			 eci->gt_id);
+			 eci->sched_group_id);
 		igt_info("near_mem_regions: 0x%016llx\n",
 			 engines[i].near_mem_regions);
 		igt_info("far_mem_regions: 0x%016llx\n",
@@ -664,8 +666,8 @@ static void test_engine_cycles_invalid(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
 	ts.eci = *eci;
 
-	/* bad gt */
-	ts.eci.gt_id = 0xffff;
+	/* bad sched group */
+	ts.eci.sched_group_id = 0xffff;
 	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
 	ts.eci = *eci;
 
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 114a8c31f..5825fcc8c 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -100,14 +100,22 @@ static void spin_all(int fd, int gt, int class)
 	int i, num_eng_per_bb = 0;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	igt_spin_t *spin[MAX_INSTANCE];
-	struct drm_xe_engine_class_instance *eci;
+	struct drm_xe_query_engine_info *engine;
+	int sched_id = -1;
 
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 
-	xe_for_each_engine_instance(fd, eci) {
-		if (eci->engine_class != class || eci->gt_id != gt)
+	xe_for_each_engine(fd, engine) {
+		if (engine->instance.engine_class != class ||
+		    engine->gt_id != gt)
 			continue;
-		eci_list[num_eng_per_bb++] = *eci;
+
+		if (sched_id == -1)
+			sched_id = engine->instance.sched_group_id;
+		else
+			igt_assert_eq(sched_id, engine->instance.sched_group_id);
+
+                eci_list[num_eng_per_bb++] = engine->instance;
 	}
 	if (num_eng_per_bb < 2)
 		return;
-- 
2.34.1
