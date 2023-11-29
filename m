Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA24910E610
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:55:22 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 14:54:50 +0000
Message-Id: <20231129145457.7-14-francois.dugast@intel.com>
In-Reply-To: <20231129145457.7-1-francois.dugast@intel.com>
References: <20231129145457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 13/20] drm-uapi/xe: Split xe_sync types from
 flags
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

Align with commit ("drm/xe/uapi: Split xe_sync types from flags")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 benchmarks/gem_wsim.c              |  9 +++++----
 include/drm-uapi/xe_drm.h          | 16 +++++++--------
 lib/intel_batchbuffer.c            |  8 ++++----
 lib/intel_compute.c                |  6 ++++--
 lib/intel_ctx.c                    |  4 ++--
 lib/xe/xe_ioctl.c                  |  3 ++-
 lib/xe/xe_spin.c                   |  4 ++--
 lib/xe/xe_util.c                   |  4 ++--
 tests/intel/xe_dma_buf_sync.c      |  4 ++--
 tests/intel/xe_drm_fdinfo.c        |  4 ++--
 tests/intel/xe_evict.c             |  6 +++---
 tests/intel/xe_exec_balancer.c     | 10 +++++-----
 tests/intel/xe_exec_basic.c        |  4 ++--
 tests/intel/xe_exec_compute_mode.c |  5 +++--
 tests/intel/xe_exec_fault_mode.c   |  2 +-
 tests/intel/xe_exec_reset.c        | 14 ++++++-------
 tests/intel/xe_exec_store.c        | 11 +++++-----
 tests/intel/xe_exec_threads.c      | 14 ++++++-------
 tests/intel/xe_huc_copy.c          |  3 ++-
 tests/intel/xe_perf_pmu.c          |  8 ++++----
 tests/intel/xe_pm.c                |  4 ++--
 tests/intel/xe_pm_residency.c      |  2 +-
 tests/intel/xe_spin_batch.c        |  3 ++-
 tests/intel/xe_vm.c                | 32 +++++++++++++++---------------
 tests/intel/xe_waitfence.c         |  3 ++-
 25 files changed, 96 insertions(+), 87 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 514fa4ba7..66ad7563d 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1784,21 +1784,22 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	i = 0;
 	/* out fence */
 	w->xe.syncs[i].handle = syncobj_create(fd, 0);
-	w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
+	w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SIGNAL;
 	/* in fence(s) */
 	for_each_dep(dep, w->data_deps) {
 		int dep_idx = w->idx + dep->target;
 
 		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
 		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
-		w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 	}
 	for_each_dep(dep, w->fence_deps) {
 		int dep_idx = w->idx + dep->target;
 
 		igt_assert(wrk->steps[dep_idx].xe.syncs && wrk->steps[dep_idx].xe.syncs[0].handle);
 		w->xe.syncs[i].handle = wrk->steps[dep_idx].xe.syncs[0].handle;
-		w->xe.syncs[i++].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		w->xe.syncs[i++].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 	}
 	w->xe.exec.syncs = to_user_pointer(w->xe.syncs);
 }
@@ -2375,7 +2376,7 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 		if (w->type == SW_FENCE) {
 			w->xe.syncs = calloc(1, sizeof(struct drm_xe_sync));
 			w->xe.syncs[0].handle = syncobj_create(fd, 0);
-			w->xe.syncs[0].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+			w->xe.syncs[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		}
 
 	return 0;
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 8bc669c55..1e98363b2 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -880,16 +880,16 @@ struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_SYNC_FLAG_SYNCOBJ		0x0
-#define DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ	0x1
-#define DRM_XE_SYNC_FLAG_DMA_BUF		0x2
-#define DRM_XE_SYNC_FLAG_USER_FENCE		0x3
-#define DRM_XE_SYNC_FLAG_SIGNAL		0x10
+#define DRM_XE_SYNC_TYPE_SYNCOBJ		0x0
+#define DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ	0x1
+#define DRM_XE_SYNC_TYPE_USER_FENCE		0x2
+	/** @type: Type of the this sync object */
+	__u32 type;
+
+#define DRM_XE_SYNC_FLAG_SIGNAL	(1 << 0)
+	/** @flags: Sync Flags */
 	__u32 flags;
 
-	/** @pad: MBZ */
-	__u32 pad;
-
 	union {
 		__u32 handle;
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ef55b6330..6c85c5aa3 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1318,8 +1318,8 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 static void __unbind_xe_objects(struct intel_bb *ibb)
 {
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	int ret;
 
@@ -2306,8 +2306,8 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	uint32_t engine = flags & (I915_EXEC_BSD_MASK | I915_EXEC_RING_MASK);
 	uint32_t engine_id;
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_vm_bind_op *bind_ops;
 	void *map;
diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index dd921bf46..de797c6f7 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -106,7 +106,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 		uint64_t alignment = xe_get_default_alignment(fd);
 		struct drm_xe_sync sync = { 0 };
 
-		sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
+		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 		sync.handle = syncobj_create(fd, 0);
 
 		for (int i = 0; i < entries; i++) {
@@ -162,7 +163,8 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 		uint32_t vm = execenv->vm;
 		struct drm_xe_sync sync = { 0 };
 
-		sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
+		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 		sync.handle = syncobj_create(fd, 0);
 
 		for (int i = 0; i < entries; i++) {
diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index f82564572..b43dd6391 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -423,8 +423,8 @@ intel_ctx_t *intel_ctx_xe(int fd, uint32_t vm, uint32_t exec_queue,
 int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offset)
 {
 	struct drm_xe_sync syncs[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.exec_queue_id = ctx->exec_queue,
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index c6d7af878..56d2fe592 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -405,7 +405,8 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
 void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
 {
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		.handle = syncobj_create(fd, 0),
 	};
 
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 91bc6664d..deba06f73 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -191,7 +191,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	struct igt_spin *spin;
 	struct xe_spin *xe_spin;
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -289,7 +289,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 	uint32_t vm, bo, exec_queue, syncobj;
 	struct xe_spin *spin;
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 1bb52b142..ae6cf3979 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -179,8 +179,8 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
 {
 	struct drm_xe_vm_bind_op *bind_ops;
 	struct drm_xe_sync tabsyncs[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, .handle = sync_in },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, .handle = sync_out },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .handle = sync_in },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, .handle = sync_out },
 	};
 	struct drm_xe_sync *syncs;
 	uint32_t num_binds = 0;
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index dfa957243..eca3a5e95 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -145,8 +145,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 		uint64_t sdi_addr = addr + sdi_offset;
 		uint64_t spin_offset = (char *)&data[i]->spin - (char *)data[i];
 		struct drm_xe_sync sync[2] = {
-			{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ, },
-			{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, },
+			{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 		};
 		struct drm_xe_exec exec = {
 			.num_batch_buffer = 1,
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index ec457b1c1..fd6c07410 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -48,8 +48,8 @@ static void test_active(int fd, struct drm_xe_engine *engine)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2e2960b9b..5b06b8953 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -38,8 +38,8 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t bind_exec_queues[3] = { 0, 0, 0 };
 	uint64_t addr = 0x100000000, base_addr = 0x100000000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -219,7 +219,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x100000000, base_addr = 0x100000000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index ea06c23cd..742724641 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -37,8 +37,8 @@ static void test_all_active(int fd, int gt, int class)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -177,8 +177,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_syncs = 2,
@@ -401,7 +401,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 46b9dc2e0..2defd1e35 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -81,8 +81,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, int n_vm, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+	    { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	    { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index a9f69deef..881f3829b 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -88,8 +88,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
-	          .timeline_value = USER_FENCE_VALUE },
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 4c85fce76..228e7e44a 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -107,7 +107,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 988e63438..b8f5c6fbc 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -30,8 +30,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -141,8 +141,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_syncs = 2,
@@ -338,8 +338,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -504,7 +504,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 2927214e3..dec8546a3 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -55,7 +55,8 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 static void store(int fd)
 {
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -122,8 +123,8 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 			     unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, }
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
 	};
 
 	struct drm_xe_exec exec = {
@@ -212,8 +213,8 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 static void store_all(int fd, int gt, int class)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, }
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 8a01b150d..9aa989ab5 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -47,8 +47,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	      int class, int n_exec_queues, int n_execs, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
 	struct drm_xe_exec exec = {
@@ -126,7 +126,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 					&create), 0);
 		exec_queues[i] = create.exec_queue_id;
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 	exec.num_batch_buffer = flags & PARALLEL ? num_placements : 1;
@@ -255,7 +255,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 {
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
@@ -459,8 +459,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		 int n_execs, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
 	struct drm_xe_exec exec = {
@@ -539,7 +539,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		else
 			bind_exec_queues[i] = 0;
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index dbc5afc17..035d86ea8 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -118,7 +118,8 @@ __test_huc_copy(int fd, uint32_t vm, struct drm_xe_engine_class_instance *hwe)
 	};
 
 	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
-	sync.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 	sync.handle = syncobj_create(fd, 0);
 
 	for(int i = 0; i < BO_DICT_ENTRIES; i++) {
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index ba5488c48..42cf62729 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -81,8 +81,8 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -185,8 +185,8 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a8fc56e4b..c899bd67a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -231,8 +231,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 4f590c83c..5542f8fb4 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -87,7 +87,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 	} *data;
 
 	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 
 	struct drm_xe_exec exec = {
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 2e2a0ed0e..c75709c4e 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -145,7 +145,8 @@ static void xe_spin_fixed_duration(int fd)
 {
 	struct drm_xe_sync sync = {
 		.handle = syncobj_create(fd, 0),
-		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 0cc1c0de2..7871fa789 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -274,7 +274,7 @@ static void test_partial_unbinds(int fd)
 	uint64_t addr = 0x1a0000;
 
 	struct drm_xe_sync sync = {
-	    .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
+	    .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	    .handle = syncobj_create(fd, 0),
 	};
 
@@ -314,7 +314,7 @@ static void unbind_all(int fd, int n_vmas)
 	uint32_t vm;
 	int i;
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -389,8 +389,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	uint32_t vm;
 	uint64_t addr = 0x1000 * 512;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES + 1];
 	struct drm_xe_exec exec = {
@@ -433,7 +433,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	for (i = 0; i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
-		sync_all[i].flags = DRM_XE_SYNC_FLAG_SYNCOBJ;
+		sync_all[i].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
 		sync_all[i].handle = syncobjs[i];
 	};
 
@@ -576,8 +576,8 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -759,8 +759,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -948,8 +948,8 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		 unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1109,7 +1109,7 @@ static void *hammer_thread(void *tdata)
 {
 	struct thread_data *t = tdata;
 	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1235,8 +1235,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			 unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
@@ -1536,8 +1536,8 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		     int unbind_n_pages, unsigned int flags)
 {
 	struct drm_xe_sync sync[2] = {
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index a902ad408..3be987954 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -28,7 +28,8 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		    uint64_t addr, uint64_t size, uint64_t val)
 {
 	struct drm_xe_sync sync[1] = {};
-	sync[0].flags = DRM_XE_SYNC_FLAG_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
 
 	sync[0].addr = to_user_pointer(&wait_fence);
 	sync[0].timeline_value = val;
-- 
2.34.1
