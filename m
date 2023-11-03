Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354E210EA0A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:08 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:46 +0000
Message-Id: <20231103144359.7-52-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 51/64] drm-uapi/xe: Rename couple exec_queue
 items
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

Aligns with kernel commit ("drm/xe/uapi: Rename couple exec_queue items")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 benchmarks/gem_wsim.c           |  4 +--
 include/drm-uapi/xe_drm.h       | 20 +++++++++-----
 lib/xe/xe_ioctl.c               | 12 ++++-----
 tests/intel/xe_access_counter.c |  4 +--
 tests/intel/xe_create.c         |  4 +--
 tests/intel/xe_exec_balancer.c  | 48 ++++++++++++++++-----------------
 tests/intel/xe_exec_reset.c     | 22 +++++++--------
 tests/intel/xe_exec_store.c     | 16 +++++------
 tests/intel/xe_exec_threads.c   | 26 +++++++++---------
 tests/intel/xe_perf_pmu.c       | 20 +++++++-------
 tests/intel/xe_spin_batch.c     | 14 +++++-----
 11 files changed, 98 insertions(+), 92 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 163547f4e..6cee2d860 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2038,8 +2038,8 @@ static void xe_exec_queue_create_(struct ctx *ctx, struct xe_exec_queue *eq)
 {
 	struct drm_xe_exec_queue_create create = {
 		.vm_id = ctx->xe.vm->id,
-		.width = 1,
-		.num_placements = eq->nr_ecis,
+		.num_bb_per_exec = 1,
+		.num_dispositions = eq->nr_ecis,
 		.instances = to_user_pointer(eq->eci_list),
 	};
 
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index fd1efcf92..553755fa7 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -999,11 +999,17 @@ struct drm_xe_exec_queue_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @width: submission width (number BB per exec) for this exec queue */
-	__u16 width;
+	/**
+	 * @num_bb_per_exec: Indicates a submission width for this exec queue,
+	 * for how many batch buffers can be submitted in parallel.
+	 */
+	__u16 num_bb_per_exec;
 
-	/** @num_placements: number of valid placements for this exec queue */
-	__u16 num_placements;
+	/**
+	 * @num_dispositions: Indicates how the batch buffers will be
+	 * distributed to the hardware engines listed on @instance.
+	 */
+	__u16 num_dispositions;
 
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
@@ -1018,8 +1024,8 @@ struct drm_xe_exec_queue_create {
 	 * @instances: user pointer to a 2-d array of struct
 	 * drm_xe_engine_class_instance
 	 *
-	 * length = width (i) * num_placements (j)
-	 * index = j + i * width
+	 * length = num_bb_per_exec (i) * num_dispositions (j)
+	 * index = j + i * num_bb_per_exec
 	 */
 	__u64 instances;
 
@@ -1129,7 +1135,7 @@ struct drm_xe_exec {
 
 	/**
 	 * @num_batch_buffer: number of batch buffer in this exec, must match
-	 * the width of the engine
+	 * the @num_bb_per_exec of the struct drm_xe_exec_queue_create
 	 */
 	__u16 num_batch_buffer;
 
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index db0ca6bc0..91be33a28 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -283,8 +283,8 @@ uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async
 	struct drm_xe_exec_queue_create create = {
 		.extensions = ext,
 		.vm_id = vm,
-		.width = 1,
-		.num_placements = 1,
+		.num_bb_per_exec = 1,
+		.num_dispositions = 1,
 		.instances = to_user_pointer(&instance),
 	};
 
@@ -300,8 +300,8 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 	struct drm_xe_exec_queue_create create = {
 		.extensions = ext,
 		.vm_id = vm,
-		.width = 1,
-		.num_placements = 1,
+		.num_bb_per_exec = 1,
+		.num_dispositions = 1,
 		.instances = to_user_pointer(instance),
 	};
 
@@ -319,8 +319,8 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	};
 	struct drm_xe_exec_queue_create create = {
 		.vm_id = vm,
-		.width = 1,
-		.num_placements = 1,
+		.num_bb_per_exec = 1,
+		.num_dispositions = 1,
 		.instances = to_user_pointer(&instance),
 	};
 
diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
index 8966bfc9c..210b76893 100644
--- a/tests/intel/xe_access_counter.c
+++ b/tests/intel/xe_access_counter.c
@@ -55,8 +55,8 @@ igt_main
 		struct drm_xe_exec_queue_create create = {
 			.extensions = to_user_pointer(&ext),
 			.vm_id = xe_vm_create(fd, 0, 0),
-			.width = 1,
-			.num_placements = 1,
+			.num_bb_per_exec = 1,
+			.num_dispositions = 1,
 			.instances = to_user_pointer(&instance),
 		};
 
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index b04a3443f..7794064d0 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -100,8 +100,8 @@ static uint32_t __xe_exec_queue_create(int fd, uint32_t vm,
 	struct drm_xe_exec_queue_create create = {
 		.extensions = ext,
 		.vm_id = vm,
-		.width = 1,
-		.num_placements = 1,
+		.num_bb_per_exec = 1,
+		.num_dispositions = 1,
 		.instances = to_user_pointer(instance),
 	};
 	int err = 0;
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 23a5487d1..725dea82a 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -58,32 +58,32 @@ static void test_all_active(int fd, int gt, int class)
 	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, num_placements = 0;
+	int i, num_dispositions = 0;
 
 	xe_for_each_engine(fd, engine) {
 		if (engine->instance.engine_class != class ||
 		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = engine->instance;
+		eci_list[num_dispositions++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	if (num_placements < 2)
+	if (num_dispositions < 2)
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo_size = sizeof(*data) * num_placements;
+	bo_size = sizeof(*data) * num_dispositions;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size, bo_placement,
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = 1,
-			.num_placements = num_placements,
+			.num_bb_per_exec = 1,
+			.num_dispositions = num_dispositions,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -96,7 +96,7 @@ static void test_all_active(int fd, int gt, int class)
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		spin_opts.addr = addr + (char *)&data[i].spin - (char *)data;
 		xe_spin_init(&data[i].spin, &spin_opts);
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
@@ -109,7 +109,7 @@ static void test_all_active(int fd, int gt, int class)
 		xe_spin_wait_started(&data[i].spin);
 	}
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		xe_spin_end(&data[i].spin);
 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
 					NULL));
@@ -121,7 +121,7 @@ static void test_all_active(int fd, int gt, int class)
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	syncobj_destroy(fd, sync[0].handle);
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
@@ -203,7 +203,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	} *data;
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, j, b, num_placements = 0;
+	int i, j, b, num_dispositions = 0;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
@@ -212,10 +212,10 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = engine->instance;
+		eci_list[num_dispositions++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	if (num_placements < 2)
+	if (num_dispositions < 2)
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -243,8 +243,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	for (i = 0; i < n_exec_queues; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = flags & PARALLEL ? num_placements : 1,
-			.num_placements = flags & PARALLEL ? 1 : num_placements,
+			.num_bb_per_exec = flags & PARALLEL ? num_dispositions : 1,
+			.num_dispositions = flags & PARALLEL ? 1 : num_dispositions,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -253,7 +253,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		exec_queues[i] = create.exec_queue_id;
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
-	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
+	exec.num_batch_buffer = flags & PARALLEL ? num_dispositions : 1;
 
 	sync[0].handle = syncobj_create(fd, 0);
 	if (bo)
@@ -270,7 +270,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
-		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
 			batches[j] = batch_addr;
 
 		b = 0;
@@ -433,7 +433,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	} *data;
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, j, b, num_placements = 0;
+	int i, j, b, num_dispositions = 0;
 	int map_fd = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
@@ -443,10 +443,10 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = engine->instance;
+		eci_list[num_dispositions++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	if (num_placements < 2)
+	if (num_dispositions < 2)
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
@@ -477,8 +477,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	for (i = 0; i < n_exec_queues; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = flags & PARALLEL ? num_placements : 1,
-			.num_placements = flags & PARALLEL ? 1 : num_placements,
+			.num_bb_per_exec = flags & PARALLEL ? num_dispositions : 1,
+			.num_dispositions = flags & PARALLEL ? 1 : num_dispositions,
 			.instances = to_user_pointer(eci_list),
 			.extensions = 0,
 		};
@@ -487,7 +487,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 					&create), 0);
 		exec_queues[i] = create.exec_queue_id;
 	}
-	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
+	exec.num_batch_buffer = flags & PARALLEL ? num_dispositions : 1;
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	if (bo)
@@ -508,7 +508,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
-		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
 			batches[j] = batch_addr;
 
 		b = 0;
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index be22730a3..a9a17ff41 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -166,7 +166,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, j, b, num_placements = 0, bad_batches = 1;
+	int i, j, b, num_dispositions = 0, bad_batches = 1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 
@@ -178,10 +178,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = engine->instance;
+		eci_list[num_dispositions++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	if (num_placements < 2)
+	if (num_dispositions < 2)
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -208,8 +208,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		};
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = flags & PARALLEL ? num_placements : 1,
-			.num_placements = flags & PARALLEL ? 1 : num_placements,
+			.num_bb_per_exec = flags & PARALLEL ? num_dispositions : 1,
+			.num_dispositions = flags & PARALLEL ? 1 : num_dispositions,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -223,14 +223,14 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		exec_queues[i] = create.exec_queue_id;
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
-	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
+	exec.num_batch_buffer = flags & PARALLEL ? num_dispositions : 1;
 
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
 	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & EXEC_QUEUE_RESET ||
 				flags & GT_RESET))
-		bad_batches = num_placements;
+		bad_batches = num_dispositions;
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t base_addr = flags & CAT_ERROR && i < bad_batches ?
@@ -244,7 +244,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
-		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
 			batches[j] = batch_addr;
 
 		if (i < bad_batches) {
@@ -263,7 +263,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			exec_addr = batch_addr;
 		}
 
-		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
 			batches[j] = exec_addr;
 
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
@@ -690,8 +690,8 @@ static void submit_jobs(struct gt_thread_data *t)
 		};
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = 1,
-			.num_placements = 1,
+			.num_bb_per_exec = 1,
+			.num_dispositions = 1,
 			.instances = to_user_pointer(&instance),
 		};
 		struct drm_xe_exec exec;
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 75eb8b39d..3f10d1942 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -134,7 +134,7 @@ static void store_all(int fd, int gt, int class)
 	uint32_t bo = 0;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	struct drm_xe_engine_class_instance *eci;
-	int i, num_placements = 0;
+	int i, num_dispositions = 0;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	bo_size = sizeof(*data);
@@ -149,16 +149,16 @@ static void store_all(int fd, int gt, int class)
 	xe_for_each_engine_instance(fd, eci) {
 		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
-		eci_list[num_placements++] = *eci;
+		eci_list[num_dispositions++] = *eci;
 	}
 
-	igt_require(num_placements);
+	igt_require(num_dispositions);
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = 1,
-			.num_placements = num_placements,
+			.num_bb_per_exec = 1,
+			.num_dispositions = num_dispositions,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -171,7 +171,7 @@ static void store_all(int fd, int gt, int class)
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 
 		store_dword_batch(data, addr, i);
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
@@ -191,7 +191,7 @@ static void store_all(int fd, int gt, int class)
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index b63356000..98ec4c1ab 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -69,7 +69,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	} *data;
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, j, b, num_placements = 0;
+	int i, j, b, num_dispositions = 0;
 	bool owns_vm = false, owns_fd = false;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
@@ -89,10 +89,10 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		    engine->instance.gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = engine->instance;
+		eci_list[num_dispositions++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	igt_assert(num_placements > 1);
+	igt_assert(num_dispositions > 1);
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
@@ -122,8 +122,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	for (i = 0; i < n_exec_queues; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = flags & PARALLEL ? num_placements : 1,
-			.num_placements = flags & PARALLEL ? 1 : num_placements,
+			.num_bb_per_exec = flags & PARALLEL ? num_dispositions : 1,
+			.num_dispositions = flags & PARALLEL ? 1 : num_dispositions,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -134,7 +134,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
-	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
+	exec.num_batch_buffer = flags & PARALLEL ? num_dispositions : 1;
 
 	pthread_barrier_wait(&barrier);
 
@@ -153,7 +153,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
-		for (j = 0; j < num_placements && flags & PARALLEL; ++j)
+		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
 			batches[j] = batch_addr;
 
 		b = 0;
@@ -991,16 +991,16 @@ static void threads(int fd, int flags)
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
-				int num_placements = 0;
+				int num_dispositions = 0;
 
 				xe_for_each_engine_instance(fd, eci) {
 					if (eci->engine_class != class ||
 					    eci->gt_id != gt)
 						continue;
-					++num_placements;
+					++num_dispositions;
 				}
 
-				if (num_placements > 1)
+				if (num_dispositions > 1)
 					n_engines += 2;
 			}
 	}
@@ -1055,16 +1055,16 @@ static void threads(int fd, int flags)
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
-				int num_placements = 0;
+				int num_dispositions = 0;
 
 				xe_for_each_engine_instance(fd, eci) {
 					if (eci->engine_class != class ||
 					    eci->gt_id != gt)
 						continue;
-					++num_placements;
+					++num_dispositions;
 				}
 
-				if (num_placements > 1) {
+				if (num_dispositions > 1) {
 					threads_data[i].mutex = &mutex;
 					threads_data[i].cond = &cond;
 					if (flags & SHARED_VM)
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index c267a464f..a0467efa1 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -204,7 +204,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
 	struct drm_xe_engine_class_instance *eci;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int num_placements = 0;
+	int num_dispositions = 0;
 	uint64_t config, count, idle;
 
 	config = engine_group_get_config(gt, class);
@@ -213,24 +213,24 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
 
-		eci_list[num_placements++] = *eci;
+		eci_list[num_dispositions++] = *eci;
 	}
 
-	igt_skip_on_f(!num_placements, "Engine class:%d gt:%d not enabled on this platform\n",
+	igt_skip_on_f(!num_dispositions, "Engine class:%d gt:%d not enabled on this platform\n",
 		      class, gt);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo_size = sizeof(*data) * num_placements;
+	bo_size = sizeof(*data) * num_dispositions;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd), 0);
 	data = xe_bo_map(fd, bo, bo_size);
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = 1,
-			.num_placements = num_placements,
+			.num_bb_per_exec = 1,
+			.num_dispositions = num_dispositions,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -247,7 +247,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	idle = pmu_read(pmu_fd);
 	igt_assert(!idle);
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		spin_opts.addr = addr + (char *)&data[i].spin - (char *)data;
 		xe_spin_init(&data[i].spin, &spin_opts);
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
@@ -260,7 +260,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 		xe_spin_wait_started(&data[i].spin);
 	}
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		xe_spin_end(&data[i].spin);
 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
 					NULL));
@@ -274,7 +274,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 
 
 	syncobj_destroy(fd, sync[0].handle);
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index c6f851acc..a7f2781fd 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -97,7 +97,7 @@ static void spin_all(int fd, int gt, int class)
 {
 	uint64_t ahnd;
 	uint32_t exec_queues[MAX_INSTANCE], vm;
-	int i, num_placements = 0;
+	int i, num_dispositions = 0;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	igt_spin_t *spin[MAX_INSTANCE];
 	struct drm_xe_engine_class_instance *eci;
@@ -107,17 +107,17 @@ static void spin_all(int fd, int gt, int class)
 	xe_for_each_engine_instance(fd, eci) {
 		if (eci->engine_class != class || eci->gt_id != gt)
 			continue;
-		eci_list[num_placements++] = *eci;
+		eci_list[num_dispositions++] = *eci;
 	}
-	if (num_placements < 2)
+	if (num_dispositions < 2)
 		return;
 	vm = xe_vm_create(fd, 0, 0);
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.width = 1,
-			.num_placements = num_placements,
+			.num_bb_per_exec = 1,
+			.num_dispositions = num_dispositions,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -127,7 +127,7 @@ static void spin_all(int fd, int gt, int class)
 		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queues[i], .vm = vm);
 	}
 
-	for (i = 0; i < num_placements; i++) {
+	for (i = 0; i < num_dispositions; i++) {
 		igt_spin_free(fd, spin[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
-- 
2.34.1
