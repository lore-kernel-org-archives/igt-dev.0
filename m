Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7367510EA26
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:14 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:52 +0000
Message-Id: <20231103144359.7-58-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 57/64] squash! drm-uapi/xe: Rename couple
 exec_queue items
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

(squash instead of the fixup so the commit message can be updated)

(new full commit message with new subject)

drm-uapi/xe: Exec queue documentation and variable renaming

Aligns with kernel commit ("drm/xe/uapi: Exec queue documentation and variable renaming")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 benchmarks/gem_wsim.c           |   2 +-
 include/drm-uapi/xe_drm.h       | 172 +++++++++++++++++++++++---------
 lib/xe/xe_ioctl.c               |   6 +-
 tests/intel/xe_access_counter.c |   2 +-
 tests/intel/xe_create.c         |   2 +-
 tests/intel/xe_exec_balancer.c  |  46 ++++-----
 tests/intel/xe_exec_reset.c     |  20 ++--
 tests/intel/xe_exec_store.c     |  14 +--
 tests/intel/xe_exec_threads.c   |  26 ++---
 tests/intel/xe_perf_pmu.c       |  18 ++--
 tests/intel/xe_spin_batch.c     |  12 +--
 11 files changed, 198 insertions(+), 122 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 996d3504b..0c566617b 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2040,7 +2040,7 @@ static void xe_exec_queue_create_(struct ctx *ctx, struct xe_exec_queue *eq)
 	struct drm_xe_exec_queue_create create = {
 		.vm_id = ctx->xe.vm->id,
 		.num_bb_per_exec = 1,
-		.num_dispositions = eq->nr_ecis,
+		.num_eng_per_bb = eq->nr_ecis,
 		.instances = to_user_pointer(eq->eci_list),
 	};
 
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 17b25f66d..cb77559f1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -898,6 +898,67 @@ struct drm_xe_vm_bind_op {
 	__u64 reserved[2];
 };
 
+/**
+ * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
+ */
+struct drm_xe_vm_bind {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to bind to */
+	__u32 vm_id;
+
+	/**
+	 * @exec_queue_id: exec_queue_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
+	 * and exec queue must have same vm_id. If zero, the default VM bind engine
+	 * is used.
+	 */
+	__u32 exec_queue_id;
+
+	/** @num_binds: number of binds in this IOCTL */
+	__u32 num_binds;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		/** @bind: used if num_binds == 1 */
+		struct drm_xe_vm_bind_op bind;
+
+		/**
+		 * @vector_of_binds: userptr to array of struct
+		 * drm_xe_vm_bind_op if num_binds > 1
+		 */
+		__u64 vector_of_binds;
+	};
+
+	/** @num_syncs: amount of syncs to wait on */
+	__u32 num_syncs;
+
+	/** @pad2: MBZ */
+	__u32 pad2;
+
+	/** @syncs: pointer to struct drm_xe_sync array */
+	__u64 syncs;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+/* For use with XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY */
+
+/* Monitor 128KB contiguous region with 4K sub-granularity */
+#define XE_ACC_GRANULARITY_128K 0
+
+/* Monitor 2MB contiguous region with 64KB sub-granularity */
+#define XE_ACC_GRANULARITY_2M 1
+
+/* Monitor 16MB contiguous region with 512KB sub-granularity */
+#define XE_ACC_GRANULARITY_16M 2
+
+/* Monitor 64MB contiguous region with 2M sub-granularity */
+#define XE_ACC_GRANULARITY_64M 3
+
 /**
  * struct drm_xe_sync - Main structure for sync objects and user fences
  *
@@ -952,51 +1013,66 @@ struct drm_xe_sync {
 };
 
 /**
- * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
+ * DOC: Execution Queue
+ *
+ * The Execution Queue abstracts the Hardware Engine that is going to be used
+ * with the execution of the Batch Buffers in &DRM_IOCTL_XE_EXEC
+ *
+ * In a regular usage of this execution queue, only one hardware engine pointer
+ * would be given as input of the @instances below and both @num_bb_per_exec and
+ * @num_eng_per_bb would be set to '1'.
+ *
+ * Regular execution example::
+ *
+ *                    ┌─────┐
+ *                    │ BB0 │
+ *                    └──┬──┘
+ *                       │     @num_bb_per_exec = 1
+ *                       │     @num_eng_per_bb = 1
+ *                       │     @instances = {Engine0}
+ *                       ▼
+ *                   ┌───────┐
+ *                   │Engine0│
+ *                   └───────┘
+ *
+ * However this execution queue is flexible to be used for parallel submission or
+ * for load balancing submission (a.k.a virtual load balancing).
+ *
+ * In a parallel submission, different batch buffers will be simultaneously
+ * dispatched to different engines listed in @instances, in a 1-1 relationship.
+ *
+ * Parallel execution example::
+ *
+ *               ┌─────┐   ┌─────┐
+ *               │ BB0 │   │ BB1 │
+ *               └──┬──┘   └──┬──┘
+ *                  │         │     @num_bb_per_exec = 2
+ *                  │         │     @num_eng_per_bb = 1
+ *                  │         │     @instances = {Engine0, Engine1}
+ *                  ▼         ▼
+ *              ┌───────┐ ┌───────┐
+ *              │Engine0│ │Engine1│
+ *              └───────┘ └───────┘
+ *
+ * On a load balancing submission, each batch buffer is virtually dispatched
+ * to all of the listed engine @instances. Then, underneath driver, firmware, or
+ * hardware can select the best available engine to actually run the job.
+ *
+ * Virtual Load Balancing example::
+ *
+ *                    ┌─────┐
+ *                    │ BB0 │
+ *                    └──┬──┘
+ *                       │      @num_bb_per_exec = 1
+ *                       │      @num_eng_per_bb = 2
+ *                       │      @instances = {Engine0, Engine1}
+ *                  ┌────┴────┐
+ *                  │         │
+ *                  ▼         ▼
+ *              ┌───────┐ ┌───────┐
+ *              │Engine0│ │Engine1│
+ *              └───────┘ └───────┘
  */
-struct drm_xe_vm_bind {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @vm_id: The ID of the VM to bind to */
-	__u32 vm_id;
-
-	/**
-	 * @exec_queue_id: exec_queue_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
-	 * and exec queue must have same vm_id. If zero, the default VM bind engine
-	 * is used.
-	 */
-	__u32 exec_queue_id;
-
-	/** @num_binds: number of binds in this IOCTL */
-	__u32 num_binds;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	union {
-		/** @bind: used if num_binds == 1 */
-		struct drm_xe_vm_bind_op bind;
-
-		/**
-		 * @vector_of_binds: userptr to array of struct
-		 * drm_xe_vm_bind_op if num_binds > 1
-		 */
-		__u64 vector_of_binds;
-	};
-
-	/** @num_syncs: amount of syncs to wait on */
-	__u32 num_syncs;
-
-	/** @pad2: MBZ */
-	__u32 pad2;
-
-	/** @syncs: pointer to struct drm_xe_sync array */
-	__u64 syncs;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
 
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
@@ -1013,10 +1089,10 @@ struct drm_xe_exec_queue_create {
 	__u16 num_bb_per_exec;
 
 	/**
-	 * @num_dispositions: Indicates how the batch buffers will be
-	 * distributed to the hardware engines listed on @instance.
+	 * @num_eng_per_bb: Indicates how many possible engines are available
+	 * at @instances for the Xe to distribute the load.
 	 */
-	__u16 num_dispositions;
+	__u16 num_eng_per_bb;
 
 	/** @vm_id: VM to use for this exec queue */
 	__u32 vm_id;
@@ -1033,7 +1109,7 @@ struct drm_xe_exec_queue_create {
 	 *
 	 * Every engine in the array needs to have the same @sched_group_id
 	 *
-	 * length = num_bb_per_exec (i) * num_dispositions (j)
+	 * length = num_bb_per_exec (i) * num_eng_per_bb (j)
 	 * index = j + i * num_bb_per_exec
 	 */
 	__u64 instances;
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index b98139044..a8b18021e 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -284,7 +284,7 @@ uint32_t xe_bind_exec_queue_create(int fd, uint32_t vm, uint64_t ext, bool async
 		.extensions = ext,
 		.vm_id = vm,
 		.num_bb_per_exec = 1,
-		.num_dispositions = 1,
+		.num_eng_per_bb = 1,
 		.instances = to_user_pointer(&instance),
 	};
 
@@ -301,7 +301,7 @@ uint32_t xe_exec_queue_create(int fd, uint32_t vm,
 		.extensions = ext,
 		.vm_id = vm,
 		.num_bb_per_exec = 1,
-		.num_dispositions = 1,
+		.num_eng_per_bb = 1,
 		.instances = to_user_pointer(instance),
 	};
 
@@ -320,7 +320,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class)
 	struct drm_xe_exec_queue_create create = {
 		.vm_id = vm,
 		.num_bb_per_exec = 1,
-		.num_dispositions = 1,
+		.num_eng_per_bb = 1,
 		.instances = to_user_pointer(&instance),
 	};
 
diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
index 210b76893..06469fbc7 100644
--- a/tests/intel/xe_access_counter.c
+++ b/tests/intel/xe_access_counter.c
@@ -56,7 +56,7 @@ igt_main
 			.extensions = to_user_pointer(&ext),
 			.vm_id = xe_vm_create(fd, 0, 0),
 			.num_bb_per_exec = 1,
-			.num_dispositions = 1,
+			.num_eng_per_bb = 1,
 			.instances = to_user_pointer(&instance),
 		};
 
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 7794064d0..c70729ebd 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -101,7 +101,7 @@ static uint32_t __xe_exec_queue_create(int fd, uint32_t vm,
 		.extensions = ext,
 		.vm_id = vm,
 		.num_bb_per_exec = 1,
-		.num_dispositions = 1,
+		.num_eng_per_bb = 1,
 		.instances = to_user_pointer(instance),
 	};
 	int err = 0;
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 0b4c33fc5..00e2949af 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -58,7 +58,7 @@ static void test_all_active(int fd, int gt, int class)
 	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, num_dispositions = 0;
+	int i, num_eng_per_bb = 0;
 	int sched_id = -1;
 
 	xe_for_each_engine(fd, engine) {
@@ -71,25 +71,25 @@ static void test_all_active(int fd, int gt, int class)
 		else
 			igt_assert_eq(sched_id, engine->instance.sched_group_id);
 
-		eci_list[num_dispositions++] = engine->instance;
+		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	if (num_dispositions < 2)
+	if (num_eng_per_bb < 2)
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo_size = sizeof(*data) * num_dispositions;
+	bo_size = sizeof(*data) * num_eng_per_bb;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size, bo_placement,
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
 			.num_bb_per_exec = 1,
-			.num_dispositions = num_dispositions,
+			.num_eng_per_bb = num_eng_per_bb,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -102,7 +102,7 @@ static void test_all_active(int fd, int gt, int class)
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		spin_opts.addr = addr + (char *)&data[i].spin - (char *)data;
 		xe_spin_init(&data[i].spin, &spin_opts);
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
@@ -115,7 +115,7 @@ static void test_all_active(int fd, int gt, int class)
 		xe_spin_wait_started(&data[i].spin);
 	}
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		xe_spin_end(&data[i].spin);
 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
 					NULL));
@@ -127,7 +127,7 @@ static void test_all_active(int fd, int gt, int class)
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
 	syncobj_destroy(fd, sync[0].handle);
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
@@ -209,7 +209,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	} *data;
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, j, b, num_dispositions = 0;
+	int i, j, b, num_eng_per_bb = 0;
 	int sched_id = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
@@ -224,10 +224,10 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		else
 			igt_assert_eq(sched_id, engine->instance.sched_group_id);
 
-		eci_list[num_dispositions++] = engine->instance;
+		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	if (num_dispositions < 2)
+	if (num_eng_per_bb < 2)
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -255,8 +255,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	for (i = 0; i < n_exec_queues; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.num_bb_per_exec = flags & PARALLEL ? num_dispositions : 1,
-			.num_dispositions = flags & PARALLEL ? 1 : num_dispositions,
+			.num_bb_per_exec = flags & PARALLEL ? num_eng_per_bb : 1,
+			.num_eng_per_bb = flags & PARALLEL ? 1 : num_eng_per_bb,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -265,7 +265,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		exec_queues[i] = create.exec_queue_id;
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
-	exec.num_batch_buffer = flags & PARALLEL ? num_dispositions : 1;
+	exec.num_batch_buffer = flags & PARALLEL ? num_eng_per_bb : 1;
 
 	sync[0].handle = syncobj_create(fd, 0);
 	if (bo)
@@ -282,7 +282,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
-		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
+		for (j = 0; j < num_eng_per_bb && flags & PARALLEL; ++j)
 			batches[j] = batch_addr;
 
 		b = 0;
@@ -445,7 +445,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	} *data;
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, j, b, num_dispositions = 0;
+	int i, j, b, num_eng_per_bb = 0;
 	int map_fd = -1;
 	int sched_id = -1;
 
@@ -461,10 +461,10 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		else
 			igt_assert_eq(sched_id, engine->instance.sched_group_id);
 
-		eci_list[num_dispositions++] = engine->instance;
+		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	if (num_dispositions < 2)
+	if (num_eng_per_bb < 2)
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT |
@@ -495,8 +495,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	for (i = 0; i < n_exec_queues; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.num_bb_per_exec = flags & PARALLEL ? num_dispositions : 1,
-			.num_dispositions = flags & PARALLEL ? 1 : num_dispositions,
+			.num_bb_per_exec = flags & PARALLEL ? num_eng_per_bb : 1,
+			.num_eng_per_bb = flags & PARALLEL ? 1 : num_eng_per_bb,
 			.instances = to_user_pointer(eci_list),
 			.extensions = 0,
 		};
@@ -505,7 +505,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 					&create), 0);
 		exec_queues[i] = create.exec_queue_id;
 	}
-	exec.num_batch_buffer = flags & PARALLEL ? num_dispositions : 1;
+	exec.num_batch_buffer = flags & PARALLEL ? num_eng_per_bb : 1;
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	if (bo)
@@ -526,7 +526,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
-		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
+		for (j = 0; j < num_eng_per_bb && flags & PARALLEL; ++j)
 			batches[j] = batch_addr;
 
 		b = 0;
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index c532459e9..fc90d965c 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -166,7 +166,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, j, b, num_dispositions = 0, bad_batches = 1;
+	int i, j, b, num_eng_per_bb = 0, bad_batches = 1;
 	int sched_id = -1;
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
@@ -184,10 +184,10 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		else
 			igt_assert_eq(sched_id, engine->instance.sched_group_id);
 
-		eci_list[num_dispositions++] = engine->instance;
+		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	if (num_dispositions < 2)
+	if (num_eng_per_bb < 2)
 		return;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -214,8 +214,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		};
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.num_bb_per_exec = flags & PARALLEL ? num_dispositions : 1,
-			.num_dispositions = flags & PARALLEL ? 1 : num_dispositions,
+			.num_bb_per_exec = flags & PARALLEL ? num_eng_per_bb : 1,
+			.num_eng_per_bb = flags & PARALLEL ? 1 : num_eng_per_bb,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -229,14 +229,14 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		exec_queues[i] = create.exec_queue_id;
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
-	exec.num_batch_buffer = flags & PARALLEL ? num_dispositions : 1;
+	exec.num_batch_buffer = flags & PARALLEL ? num_eng_per_bb : 1;
 
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
 	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & EXEC_QUEUE_RESET ||
 				flags & GT_RESET))
-		bad_batches = num_dispositions;
+		bad_batches = num_eng_per_bb;
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t base_addr = flags & CAT_ERROR && i < bad_batches ?
@@ -250,7 +250,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
-		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
+		for (j = 0; j < num_eng_per_bb && flags & PARALLEL; ++j)
 			batches[j] = batch_addr;
 
 		if (i < bad_batches) {
@@ -269,7 +269,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			exec_addr = batch_addr;
 		}
 
-		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
+		for (j = 0; j < num_eng_per_bb && flags & PARALLEL; ++j)
 			batches[j] = exec_addr;
 
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
@@ -697,7 +697,7 @@ static void submit_jobs(struct gt_thread_data *t)
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
 			.num_bb_per_exec = 1,
-			.num_dispositions = 1,
+			.num_eng_per_bb = 1,
 			.instances = to_user_pointer(&instance),
 		};
 		struct drm_xe_exec exec;
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 408959098..2e5099514 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -134,7 +134,7 @@ static void store_all(int fd, int gt, int class)
 	uint32_t bo = 0;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	struct drm_xe_query_engine_info *engine;
-	int i, num_dispositions = 0;
+	int i, num_eng_per_bb = 0;
 	int sched_id = -1;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -157,16 +157,16 @@ static void store_all(int fd, int gt, int class)
 		else
 			igt_assert_eq(sched_id, engine->instance.sched_group_id);
 
-		eci_list[num_dispositions++] = engine->instance;
+		eci_list[num_eng_per_bb++] = engine->instance;
 	}
 
-	igt_require(num_dispositions);
+	igt_require(num_eng_per_bb);
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
 			.num_bb_per_exec = 1,
-			.num_dispositions = num_dispositions,
+			.num_eng_per_bb = num_eng_per_bb,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -179,7 +179,7 @@ static void store_all(int fd, int gt, int class)
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 
 		store_dword_batch(data, addr, i);
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
@@ -199,7 +199,7 @@ static void store_all(int fd, int gt, int class)
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 5967c81ec..df87fab2b 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -69,7 +69,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	} *data;
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int i, j, b, num_dispositions = 0;
+	int i, j, b, num_eng_per_bb = 0;
 	bool owns_vm = false, owns_fd = false;
 	int sched_id = -1;
 
@@ -95,10 +95,10 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		else
 			igt_assert_eq(sched_id, engine->instance.sched_group_id);
 
-		eci_list[num_dispositions++] = engine->instance;
+		eci_list[num_eng_per_bb++] = engine->instance;
 		bo_placement = vram_near_engine_if_possible(fd, engine);
 	}
-	igt_assert(num_dispositions > 1);
+	igt_assert(num_eng_per_bb > 1);
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
@@ -128,8 +128,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	for (i = 0; i < n_exec_queues; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
-			.num_bb_per_exec = flags & PARALLEL ? num_dispositions : 1,
-			.num_dispositions = flags & PARALLEL ? 1 : num_dispositions,
+			.num_bb_per_exec = flags & PARALLEL ? num_eng_per_bb : 1,
+			.num_eng_per_bb = flags & PARALLEL ? 1 : num_eng_per_bb,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -140,7 +140,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
-	exec.num_batch_buffer = flags & PARALLEL ? num_dispositions : 1;
+	exec.num_batch_buffer = flags & PARALLEL ? num_eng_per_bb : 1;
 
 	pthread_barrier_wait(&barrier);
 
@@ -159,7 +159,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t batches[MAX_INSTANCE];
 		int e = i % n_exec_queues;
 
-		for (j = 0; j < num_dispositions && flags & PARALLEL; ++j)
+		for (j = 0; j < num_eng_per_bb && flags & PARALLEL; ++j)
 			batches[j] = batch_addr;
 
 		b = 0;
@@ -996,7 +996,7 @@ static void threads(int fd, int flags)
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
-				int num_dispositions = 0;
+				int num_eng_per_bb = 0;
 				int sched_id = -1;
 
 				xe_for_each_engine(fd, engine) {
@@ -1008,10 +1008,10 @@ static void threads(int fd, int flags)
 						sched_id = engine->instance.sched_group_id;
 					else
 						igt_assert_eq(sched_id, engine->instance.sched_group_id);
-					++num_dispositions;
+					++num_eng_per_bb;
 				}
 
-				if (num_dispositions > 1)
+				if (num_eng_per_bb > 1)
 					n_engines += 2;
 		}
 	}
@@ -1066,7 +1066,7 @@ static void threads(int fd, int flags)
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
-				int num_dispositions = 0;
+				int num_eng_per_bb = 0;
 				int sched_id = -1;
 
 				xe_for_each_engine(fd, engine) {
@@ -1078,10 +1078,10 @@ static void threads(int fd, int flags)
 						sched_id = engine->instance.sched_group_id;
 					else
 						igt_assert_eq(sched_id, engine->instance.sched_group_id);
-					++num_dispositions;
+					++num_eng_per_bb;
 				}
 
-				if (num_dispositions > 1) {
+				if (num_eng_per_bb > 1) {
 					threads_data[i].mutex = &mutex;
 					threads_data[i].cond = &cond;
 					if (flags & SHARED_VM)
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index 02b24982e..3b286fe6a 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -204,7 +204,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
 	struct drm_xe_query_engine_info *engine;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
-	int num_dispositions = 0;
+	int num_eng_per_bb = 0;
 	uint64_t config, count, idle;
 	int sched_id = -1;
 
@@ -220,24 +220,24 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 		else
 			igt_assert_eq(sched_id, engine->instance.sched_group_id);
 
-		eci_list[num_dispositions++] = engine->instance;
+		eci_list[num_eng_per_bb++] = engine->instance;
 	}
 
-	igt_skip_on_f(!num_dispositions, "Engine class:%d gt:%d not enabled on this platform\n",
+	igt_skip_on_f(!num_eng_per_bb, "Engine class:%d gt:%d not enabled on this platform\n",
 		      class, gt);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo_size = sizeof(*data) * num_dispositions;
+	bo_size = sizeof(*data) * num_eng_per_bb;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd), 0);
 	data = xe_bo_map(fd, bo, bo_size);
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
 			.num_bb_per_exec = 1,
-			.num_dispositions = num_dispositions,
+			.num_eng_per_bb = num_eng_per_bb,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -254,7 +254,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	idle = pmu_read(pmu_fd);
 	igt_assert(!idle);
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		spin_opts.addr = addr + (char *)&data[i].spin - (char *)data;
 		xe_spin_init(&data[i].spin, &spin_opts);
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
@@ -267,7 +267,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 		xe_spin_wait_started(&data[i].spin);
 	}
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		xe_spin_end(&data[i].spin);
 		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
 					NULL));
@@ -281,7 +281,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 
 
 	syncobj_destroy(fd, sync[0].handle);
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 44382638c..5825fcc8c 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -97,7 +97,7 @@ static void spin_all(int fd, int gt, int class)
 {
 	uint64_t ahnd;
 	uint32_t exec_queues[MAX_INSTANCE], vm;
-	int i, num_dispositions = 0;
+	int i, num_eng_per_bb = 0;
 	struct drm_xe_engine_class_instance eci_list[MAX_INSTANCE];
 	igt_spin_t *spin[MAX_INSTANCE];
 	struct drm_xe_query_engine_info *engine;
@@ -115,17 +115,17 @@ static void spin_all(int fd, int gt, int class)
 		else
 			igt_assert_eq(sched_id, engine->instance.sched_group_id);
 
-                eci_list[num_dispositions++] = engine->instance;
+                eci_list[num_eng_per_bb++] = engine->instance;
 	}
-	if (num_dispositions < 2)
+	if (num_eng_per_bb < 2)
 		return;
 	vm = xe_vm_create(fd, 0, 0);
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
 			.num_bb_per_exec = 1,
-			.num_dispositions = num_dispositions,
+			.num_eng_per_bb = num_eng_per_bb,
 			.instances = to_user_pointer(eci_list),
 		};
 
@@ -135,7 +135,7 @@ static void spin_all(int fd, int gt, int class)
 		spin[i] = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queues[i], .vm = vm);
 	}
 
-	for (i = 0; i < num_dispositions; i++) {
+	for (i = 0; i < num_eng_per_bb; i++) {
 		igt_spin_free(fd, spin[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
-- 
2.34.1
