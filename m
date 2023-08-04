Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A318B10E0A7
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Aug 2023 10:59:07 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  4 Aug 2023 10:24:53 +0000
Message-Id: <20230804102454.948216-2-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230804102454.948216-1-marcin.bernatowicz@linux.intel.com>
References: <20230804102454.948216-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/xe_spin: introduced xe_spin_opts;
 fixed duration xe_spin
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: mauro.chehab@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Introduced struct xe_spin_opts for xe_spin initialization,
adjusted tests to new xe_spin_init signature.

Extended spinner with fixed duration capability. It allows
to prepare fixed duration (ex. 10ms) workloads and take workloads/second
measurements, a handy utility for scheduling tests.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_spin.c            | 121 ++++++++++++++++++++++++++++++------
 lib/xe/xe_spin.h            |  23 ++++++-
 tests/xe/xe_dma_buf_sync.c  |   6 +-
 tests/xe/xe_exec_balancer.c |   9 ++-
 tests/xe/xe_exec_reset.c    |  24 ++++---
 tests/xe/xe_exec_threads.c  |   7 ++-
 tests/xe/xe_vm.c            |   9 +--
 7 files changed, 154 insertions(+), 45 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index cd9c1a7d3..44fca2258 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -16,41 +16,126 @@
 #include "xe_ioctl.h"
 #include "xe_spin.h"
 
+static int read_timestamp_frequency(int fd, int gt_id)
+{
+	struct xe_device *dev = xe_device_get(fd);
+
+	igt_assert(dev && dev->gts && dev->gts->num_gt);
+	igt_assert(gt_id >= 0 && gt_id <= dev->gts->num_gt);
+
+	return dev->gts->gts[gt_id].clock_freq;
+}
+
+static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
+{
+	return (x + y - 1) / y;
+}
+
+/**
+ * duration_to_ctx_ticks:
+ * @fd: opened device
+ * @gt_id: tile id
+ * @duration_ns: duration in nanoseconds to be converted to context timestamp ticks
+ * @return: duration converted to context timestamp ticks, 0 on failure.
+ */
+uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t duration_ns)
+{
+	int f = read_timestamp_frequency(fd, gt_id);
+	uint64_t ctx_ticks = div64_u64_round_up(duration_ns * f, NSEC_PER_SEC);
+
+	return ctx_ticks > XE_SPIN_MAX_CTX_TICKS ? 0 : ctx_ticks;
+}
+
+#define MI_SRM_CS_MMIO				(1 << 19)
+#define MI_LRI_CS_MMIO				(1 << 19)
+#define MI_LRR_DST_CS_MMIO			(1 << 19)
+#define MI_LRR_SRC_CS_MMIO			(1 << 18)
+#define CTX_TIMESTAMP 0x3a8;
+#define CS_GPR(x) (0x600 + 8 * (x))
+enum { START_TS, NOW_TS };
+
 /**
  * xe_spin_init:
  * @spin: pointer to mapped bo in which spinner code will be written
- * @addr: offset of spinner within vm
- * @preempt: allow spinner to be preempted or not
+ * @opts: pointer to spinner initialization options
  */
-void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt)
+void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 {
-	uint64_t batch_offset = (char *)&spin->batch - (char *)spin;
-	uint64_t batch_addr = addr + batch_offset;
-	uint64_t start_offset = (char *)&spin->start - (char *)spin;
-	uint64_t start_addr = addr + start_offset;
-	uint64_t end_offset = (char *)&spin->end - (char *)spin;
-	uint64_t end_addr = addr + end_offset;
+	uint64_t loop_addr;
+	uint64_t start_addr = opts->addr + offsetof(struct xe_spin, start);
+	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
+	uint64_t ticks_delta_addr = opts->addr + offsetof(struct xe_spin, ticks_delta);
+	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
 	int b = 0;
 
 	spin->start = 0;
 	spin->end = 0xffffffff;
+	spin->ticks_delta = 0;
+
+	if (opts->ctx_ticks) {
+		/* store start timestamp */
+		spin->batch[b++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_CS_MMIO;
+		spin->batch[b++] = CS_GPR(START_TS) + 4;
+		spin->batch[b++] = 0;
+		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
+		spin->batch[b++] = CTX_TIMESTAMP;
+		spin->batch[b++] = CS_GPR(START_TS);
+	}
+
+	loop_addr = opts->addr + (char *)&spin->batch[b] - (char *)spin;
 
 	spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
 	spin->batch[b++] = start_addr;
 	spin->batch[b++] = start_addr >> 32;
 	spin->batch[b++] = 0xc0ffee;
 
-	if (preempt)
+	if (opts->preempt)
 		spin->batch[b++] = (0x5 << 23);
 
+	if (opts->ctx_ticks) {
+		spin->batch[b++] = MI_LOAD_REGISTER_IMM(1) | MI_LRI_CS_MMIO;
+		spin->batch[b++] = CS_GPR(NOW_TS) + 4;
+		spin->batch[b++] = 0;
+		spin->batch[b++] = MI_LOAD_REGISTER_REG | MI_LRR_DST_CS_MMIO | MI_LRR_SRC_CS_MMIO;
+		spin->batch[b++] = CTX_TIMESTAMP;
+		spin->batch[b++] = CS_GPR(NOW_TS);
+
+		/* delta = now - start; inverted to match COND_BBE */
+		spin->batch[b++] = MI_MATH(4);
+		spin->batch[b++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(NOW_TS));
+		spin->batch[b++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(START_TS));
+		spin->batch[b++] = MI_MATH_SUB;
+		spin->batch[b++] = MI_MATH_STOREINV(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
+
+		/* Save delta for reading by COND_BBE */
+		spin->batch[b++] = MI_STORE_REGISTER_MEM | MI_SRM_CS_MMIO | 2;
+		spin->batch[b++] = CS_GPR(NOW_TS);
+		spin->batch[b++] = ticks_delta_addr;
+		spin->batch[b++] = ticks_delta_addr >> 32;
+
+		/* Delay between SRM and COND_BBE to post the writes */
+		for (int n = 0; n < 8; n++) {
+			spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			spin->batch[b++] = pad_addr;
+			spin->batch[b++] = pad_addr >> 32;
+			spin->batch[b++] = 0xc0ffee;
+		}
+
+		/* Break if delta [time elapsed] > ns */
+		spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
+		spin->batch[b++] = ~(opts->ctx_ticks);
+		spin->batch[b++] = ticks_delta_addr;
+		spin->batch[b++] = ticks_delta_addr >> 32;
+	}
+
 	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
 	spin->batch[b++] = 0;
 	spin->batch[b++] = end_addr;
 	spin->batch[b++] = end_addr >> 32;
 
 	spin->batch[b++] = MI_BATCH_BUFFER_START | 1 << 8 | 1;
-	spin->batch[b++] = batch_addr;
-	spin->batch[b++] = batch_addr >> 32;
+	spin->batch[b++] = loop_addr;
+	spin->batch[b++] = loop_addr >> 32;
 
 	igt_assert(b <= ARRAY_SIZE(spin->batch));
 }
@@ -106,6 +191,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 		.num_syncs = 1,
 		.syncs = to_user_pointer(&sync),
 	};
+	struct xe_spin_opts spin_opts = {};
 
 	igt_assert(ahnd);
 	spin = calloc(1, sizeof(struct igt_spin));
@@ -132,11 +218,9 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
 	xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
 
-	if (!(opt->flags & IGT_SPIN_NO_PREEMPTION))
-		xe_spin_init(xe_spin, addr, true);
-	else
-		xe_spin_init(xe_spin, addr, false);
-
+	spin_opts.addr = addr;
+	spin_opts.preempt = !(opt->flags & IGT_SPIN_NO_PREEMPTION);
+	xe_spin_init(xe_spin, &spin_opts);
 	exec.exec_queue_id = spin->engine;
 	exec.address = addr;
 	sync.handle = spin->syncobj;
@@ -191,6 +275,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 	size_t bo_size = xe_get_default_alignment(fd);
 	uint32_t vm, bo, exec_queue, syncobj;
 	struct xe_spin *spin;
+	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = true };
 	struct drm_xe_sync sync = {
 		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
 	};
@@ -211,7 +296,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
 	syncobj = syncobj_create(fd, 0);
 
-	xe_spin_init(spin, addr, true);
+	xe_spin_init(spin, &spin_opts);
 	exec.exec_queue_id = exec_queue;
 	exec.address = addr;
 	sync.handle = syncobj;
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index c84db175d..14053a07e 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -15,15 +15,34 @@
 #include "xe_query.h"
 #include "lib/igt_dummyload.h"
 
+#define XE_SPIN_MAX_CTX_TICKS UINT32_MAX - 1000
+
+/** struct xe_spin_opts
+ *
+ * @addr: offset of spinner within vm
+ * @preempt: allow spinner to be preempted or not
+ * @ctx_ticks: number of ticks after which spinner is stopped, applied if > 0
+ *
+ * Used to initialize struct xe_spin spinner behavior.
+ */
+struct xe_spin_opts {
+	uint64_t addr;
+	bool preempt;
+	uint32_t ctx_ticks;
+};
+
 /* Mapped GPU object */
 struct xe_spin {
-	uint32_t batch[16];
+	uint32_t batch[128];
 	uint64_t pad;
 	uint32_t start;
 	uint32_t end;
+	uint32_t ticks_delta;
 };
+
 igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
-void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
+uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t ns);
+void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index 29d675154..627f4c1e5 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -144,7 +144,6 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 		uint64_t sdi_offset = (char *)&data[i]->data - (char *)data[i];
 		uint64_t sdi_addr = addr + sdi_offset;
 		uint64_t spin_offset = (char *)&data[i]->spin - (char *)data[i];
-		uint64_t spin_addr = addr + spin_offset;
 		struct drm_xe_sync sync[2] = {
 			{ .flags = DRM_XE_SYNC_SYNCOBJ, },
 			{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
@@ -153,14 +152,15 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 			.num_batch_buffer = 1,
 			.syncs = to_user_pointer(sync),
 		};
+		struct xe_spin_opts spin_opts = { .addr = addr + spin_offset, .preempt = true };
 		uint32_t syncobj;
 		int b = 0;
 		int sync_fd;
 
 		/* Write spinner on FD[0] */
-		xe_spin_init(&data[i]->spin, spin_addr, true);
+		xe_spin_init(&data[i]->spin, &spin_opts);
 		exec.exec_queue_id = exec_queue[0];
-		exec.address = spin_addr;
+		exec.address = spin_opts.addr;
 		xe_exec(fd[0], &exec);
 
 		/* Export prime BO as sync file and veify business */
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index f364a4b7a..d7d8dd8fb 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -52,6 +52,7 @@ static void test_all_active(int fd, int gt, int class)
 	struct {
 		struct xe_spin spin;
 	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_engine_class_instance *hwe;
 	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
 	int i, num_placements = 0;
@@ -90,16 +91,14 @@ static void test_all_active(int fd, int gt, int class)
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
 	for (i = 0; i < num_placements; i++) {
-		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
-		uint64_t spin_addr = addr + spin_offset;
-
-		xe_spin_init(&data[i].spin, spin_addr, false);
+		spin_opts.addr = addr + (char *)&data[i].spin - (char *)data;
+		xe_spin_init(&data[i].spin, &spin_opts);
 		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
 		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
 		sync[1].handle = syncobjs[i];
 
 		exec.exec_queue_id = exec_queues[i];
-		exec.address = spin_addr;
+		exec.address = spin_opts.addr;
 		xe_exec(fd, &exec);
 		xe_spin_wait_started(&data[i].spin);
 	}
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index a2d33baf1..be6bbada6 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -44,6 +44,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	size_t bo_size;
 	uint32_t bo = 0;
 	struct xe_spin *spin;
+	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo_size = sizeof(*spin);
@@ -60,7 +61,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-	xe_spin_init(spin, addr, false);
+	xe_spin_init(spin, &spin_opts);
 
 	sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
 	sync[1].flags |= DRM_XE_SYNC_SIGNAL;
@@ -165,6 +166,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
 	struct drm_xe_engine_class_instance *hwe;
 	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
 	int i, j, b, num_placements = 0, bad_batches = 1;
@@ -236,7 +238,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = base_addr + batch_offset;
 		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
-		uint64_t spin_addr = base_addr + spin_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = base_addr + sdi_offset;
 		uint64_t exec_addr;
@@ -247,8 +248,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			batches[j] = batch_addr;
 
 		if (i < bad_batches) {
-			xe_spin_init(&data[i].spin, spin_addr, false);
-			exec_addr = spin_addr;
+			spin_opts.addr = base_addr + spin_offset;
+			xe_spin_init(&data[i].spin, &spin_opts);
+			exec_addr = spin_opts.addr;
 		} else {
 			b = 0;
 			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
@@ -368,6 +370,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
 	int i, b;
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
@@ -417,15 +420,15 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = base_addr + batch_offset;
 		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
-		uint64_t spin_addr = base_addr + spin_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = base_addr + sdi_offset;
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
 		if (!i) {
-			xe_spin_init(&data[i].spin, spin_addr, false);
-			exec_addr = spin_addr;
+			spin_opts.addr = base_addr + spin_offset;
+			xe_spin_init(&data[i].spin, &spin_opts);
+			exec_addr = spin_opts.addr;
 		} else {
 			b = 0;
 			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
@@ -539,6 +542,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_sync;
 		uint32_t data;
 	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
 	int i, b;
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
@@ -593,15 +597,15 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = base_addr + batch_offset;
 		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
-		uint64_t spin_addr = base_addr + spin_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = base_addr + sdi_offset;
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
 		if (!i) {
-			xe_spin_init(&data[i].spin, spin_addr, false);
-			exec_addr = spin_addr;
+			spin_opts.addr = base_addr + spin_offset;
+			xe_spin_init(&data[i].spin, &spin_opts);
+			exec_addr = spin_opts.addr;
 		} else {
 			b = 0;
 			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index e64c1639a..ff4ebc280 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -486,6 +486,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
 	int i, j, b, hang_exec_queue = n_exec_queues / 2;
 	bool owns_vm = false, owns_fd = false;
 
@@ -562,15 +563,15 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = addr + batch_offset;
 		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
-		uint64_t spin_addr = addr + spin_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = addr + sdi_offset;
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
 		if (flags & HANG && e == hang_exec_queue && i == e) {
-			xe_spin_init(&data[i].spin, spin_addr, false);
-			exec_addr = spin_addr;
+			spin_opts.addr = addr + spin_offset;
+			xe_spin_init(&data[i].spin, &spin_opts);
+			exec_addr = spin_opts.addr;
 		} else {
 			b = 0;
 			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index e42c04e33..87604a407 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -727,6 +727,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 		uint64_t pad;
 		uint32_t data;
 	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = true };
 	int i, b;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
@@ -755,14 +756,14 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = addr + sdi_offset;
 		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
-		uint64_t spin_addr = addr + spin_offset;
 		int e = i;
 
 		if (i == 0) {
-			/* Cork 1st exec_queue with a spinner */
-			xe_spin_init(&data[i].spin, spin_addr, true);
+			/* Cork 1st engine with a spinner */
+			spin_opts.addr = addr + spin_offset;
+			xe_spin_init(&data[i].spin, &spin_opts);
 			exec.exec_queue_id = exec_queues[e];
-			exec.address = spin_addr;
+			exec.address = spin_opts.addr;
 			sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
 			sync[1].flags |= DRM_XE_SYNC_SIGNAL;
 			sync[1].handle = syncobjs[e];
-- 
2.30.2
