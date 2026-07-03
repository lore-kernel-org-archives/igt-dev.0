Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE2FC43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 06:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0768610E57D;
	Fri,  3 Jul 2026 06:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGxPojlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010A610E57D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 06:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783058936; x=1814594936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bMm18Mvg6CxsAy0qMpIOo4mdudIOfJ/YmyLcWt8+Z4Q=;
 b=WGxPojlMj6MTdIU/GXw5qYjOg1Za7Y/g8zaFNZ2DS/R8VfLO4IkL9tEl
 rSMUC1AUw3gittiOKiO1h9J37DSxJXPEzsLq0Onj+k89gH+gt/qxmOs/8
 q1szqGcCzTYH6+aSRE2TvaEV6bAxuk2teHPmjwimpAbgjjXIIvAbPCz41
 K5Nwo5cXBhKBlJKbJru3h9sWP/5G/s2VPuqVEi2vE7thUVsaIQY/WA1T4
 aI0mXsGdUdOIQHNQ5bKZR5HCEizYX3rRxfRn2zMg6PlYgXkdHXGV8eHc6
 Gx7EwZDefIsrRiseAD/Ee+vFLDrYwNzAvWCsU36Y0Hg3146E+cM4H2ldi A==;
X-CSE-ConnectionGUID: cI02A1m6Sg2xBtjXUHp5xg==
X-CSE-MsgGUID: FR7ygaqBS82/6j7u5dVOXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83792734"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83792734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:08:55 -0700
X-CSE-ConnectionGUID: jKngKnuyTc2+Jv+i1cLong==
X-CSE-MsgGUID: dbpy9Av/RAqumV7PFF7l2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253684381"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:08:52 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: thomas.hellstrom@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v11] tests/intel/xe_vm: Add oversubscribe concurrent
 bind stress subtest
Date: Fri,  3 Jul 2026 06:08:43 +0000
Message-ID: <20260703060843.1137197-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Previous coverage lacked a scenario combining multi-process bind
with VRAM oversubscription. This generates memory pressure with
multi-process VM Bind activity and concurrent submission, exercising
the bind pipeline under eviction pressure.

v7:  Save errno immediately in create_test_bos before it can be clobbered.
     Handle non-ENOMEM/ENOSPC failures in create_test_bos.
     Remove dead code (retries == 0 check) in xe_exec_with_retry.
     Add igt_skip when both vram and sram n_bufs are 0.
     Add MAP_FAILED check on result_bo.ptr after xe_bo_map. (Nishit)
v8: Add error check while performing vmbind.
v9: Assert if vmbind fails for VRAM/ SRAM.
    Moved wait fence for vm bind immediately after call.
v10:Add igt_debug() message when batch_bo bind fails with ENOMEM/ENOSPC
    Added check for failed bind against ENOMEM/ENOSPC.
    Removed xe_exec_with_retry() (Nishit)
v11: Added fix for some nits.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 445 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 435 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 386a0981a..6a9ad45c3 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -21,6 +21,20 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
+#define MIN_BUFS_PER_PROC 2
+#define MAX_PROCS 20
+/*
+ * Cap SRAM test usage on large-RAM platforms (e.g. PVC). On small-RAM
+ * platforms (e.g. BMG with ~32 GB RAM) 50% of RAM is ~16 GB which is
+ * below this cap, so behavior is unchanged. On large-RAM platforms
+ * 50% can be hundreds of GB; cap it to a bounded value that still
+ * provides meaningful memory pressure for the concurrent bind test.
+ */
+#define MAX_SRAM_TEST_SIZE GB(32)
+#define TIMEOUT_NS (30ULL * 1000000000ULL)
+#define INT_ADD_CNT 4
+#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
 
 enum overcommit_stage {
 	EXPECT_NONE,
@@ -29,6 +43,88 @@ enum overcommit_stage {
 	EXPECT_EXEC,
 };
 
+struct gem_bo {
+	uint32_t handle;
+	uint64_t size;
+	int *ptr;
+	uint64_t addr;
+};
+
+struct xe_oversubscribe_ctx {
+	uint32_t vm_id;
+	uint32_t exec_queue_id;
+};
+
+struct mem_bind_sync {
+	struct gem_bo *bufs;
+	int n_bufs;
+	uint64_t *binds_ufence;
+};
+
+static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx)
+{
+	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
+						  &xe_engine(fd, 0)->instance, 0);
+}
+
+static int xe_vm_bind_array_get_err(int fd, uint32_t vm,
+				    struct drm_xe_vm_bind_op *bind_ops,
+				    uint32_t num_bind, struct drm_xe_sync *sync,
+				    uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = num_bind,
+		.vector_of_binds = (uintptr_t)bind_ops,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.exec_queue_id = 0,
+	};
+
+	igt_assert(num_bind > 0);
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
+		return -errno;
+
+	return 0;
+}
+
+static uint64_t *
+vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bos, int size,
+		 int *out_err)
+{
+	uint64_t *ufence;
+	struct drm_xe_sync bind_sync;
+	struct drm_xe_vm_bind_op *binds;
+	int i;
+
+	binds = calloc(size, sizeof(*binds));
+	igt_assert(binds);
+
+	ufence = calloc(1, sizeof(*ufence));
+	igt_assert(ufence);
+	bind_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.addr = to_user_pointer(ufence),
+		.timeline_value = 1,
+	};
+
+	for (i = 0; i < size; i++) {
+		binds[i] = (struct drm_xe_vm_bind_op) {
+			.obj = bos[i].handle,
+			.obj_offset = 0,
+			.range = bos[i].size,
+			.addr = bos[i].addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		};
+	}
+	*out_err = xe_vm_bind_array_get_err(fd, ctx->vm_id, binds, size, &bind_sync, 1);
+	free(binds);
+	return ufence;
+}
+
 static uint32_t
 addr_low(uint64_t addr)
 {
@@ -1541,11 +1637,12 @@ static void *hammer_thread(void *tdata)
 		uint32_t data;
 	} *data = t->map;
 	uint32_t exec_queue = xe_exec_queue_create(t->fd, t->vm, t->eci, 0);
-	int b;
+	int b, ret;
 	int i = 0;
 
 	sync[0].handle = syncobj_create(t->fd, 0);
-	pthread_barrier_wait(t->barrier);
+	ret = pthread_barrier_wait(t->barrier);
+	igt_assert(ret == 0 || ret == PTHREAD_BARRIER_SERIAL_THREAD);
 
 	while (!*t->exit) {
 		uint64_t batch_offset = (char *)&data->batch - (char *)data;
@@ -1673,7 +1770,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		uint32_t data;
 	} *data;
 	void *map;
-	int i, b;
+	int i, b, ret;
 	int invalidate = 0;
 	struct thread_data t;
 	pthread_barrier_t barrier;
@@ -1739,9 +1836,10 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		t.exit = &exit;
 		t.map = map + page_size / 2;
 		t.barrier = &barrier;
-		pthread_barrier_init(&barrier, NULL, 2);
+		igt_assert_eq(pthread_barrier_init(&barrier, NULL, 2), 0);
 		pthread_create(&t.thread, 0, hammer_thread, &t);
-		pthread_barrier_wait(&barrier);
+		ret = pthread_barrier_wait(&barrier);
+		igt_assert(ret == 0 || ret == PTHREAD_BARRIER_SERIAL_THREAD);
 	}
 
 	/* Verify we can use every page */
@@ -1912,7 +2010,7 @@ try_again_after_invalidate:
 	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
 		exit = 1;
 		pthread_join(t.thread, NULL);
-		pthread_barrier_destroy(&barrier);
+		igt_assert_eq(pthread_barrier_destroy(&barrier), 0);
 	}
 
 	syncobj_destroy(fd, sync[0].handle);
@@ -1979,7 +2077,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		uint32_t data;
 	} *data;
 	void *map0, *map1;
-	int i, b;
+	int i, b, ret;
 	struct thread_data t;
 	pthread_barrier_t barrier;
 	int exit = 0;
@@ -2047,9 +2145,10 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		t.exit = &exit;
 		t.map = map0 + PAGE_SIZE / 2;
 		t.barrier = &barrier;
-		pthread_barrier_init(&barrier, NULL, 2);
+		igt_assert_eq(pthread_barrier_init(&barrier, NULL, 2), 0);
 		pthread_create(&t.thread, 0, hammer_thread, &t);
-		pthread_barrier_wait(&barrier);
+		ret = pthread_barrier_wait(&barrier);
+		igt_assert(ret == 0 || ret == PTHREAD_BARRIER_SERIAL_THREAD);
 	}
 
 	/* Verify we can use every page */
@@ -2168,7 +2267,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE) {
 		exit = 1;
 		pthread_join(t.thread, NULL);
-		pthread_barrier_destroy(&barrier);
+		igt_assert_eq(pthread_barrier_destroy(&barrier), 0);
 	}
 
 	syncobj_destroy(fd, sync[0].handle);
@@ -2664,6 +2763,8 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	bind_err = __xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, 0x1000, 0);
 	if (bind_err) {
 		if (errno == ENOMEM || errno == ENOSPC) {
+			igt_debug("batch_bo bind failed with %s, treating as expected bind failure\n",
+				  strerror(errno));
 			actual_stage = EXPECT_BIND;
 			goto check_and_cleanup;
 		} else { /* Assert on any unexpected bind error */
@@ -3075,6 +3176,325 @@ static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
 	xe_vm_destroy(fd, vm);
 }
 
+static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
+			   struct gem_bo *result_bo, int ints_to_add)
+{
+	int pos = 0;
+	uint64_t tmp_addr;
+
+	batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+	for (int i = 1; i < ints_to_add; i++) {
+		/* r1 = integers_bo[i] */
+		batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
+		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
+		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+		/* r0 = r0 + r1 */
+		batch_bo->ptr[pos++] = MI_MATH(4);
+		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
+		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
+		batch_bo->ptr[pos++] = MI_MATH_ADD;
+		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
+	}
+	/* result_bo[0] = r0 */
+	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+
+	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
+	while (pos % 4 != 0)
+		batch_bo->ptr[pos++] = MI_NOOP;
+	return pos;
+}
+
+static void create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx, struct mem_bind_sync *bind,
+			    uint32_t  placement, uint64_t *addr)
+{
+	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
+	uint32_t ret;
+
+	for (int i = 0; i < bind->n_bufs; i++) {
+		struct gem_bo *bo = &bind->bufs[i];
+
+		bo->size = GB(1);
+		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
+					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
+		if (ret) {
+			int saved_errno = errno; /* capture before anything can clobber it */
+
+			bind->n_bufs = i;
+			if (saved_errno == ENOMEM || saved_errno == ENOSPC)
+				igt_debug("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
+			else
+				igt_assert_f(false, "%s allocation failed at buffer %d: %s",
+					     mem_type, i, strerror(saved_errno));
+			break;
+		}
+		bo->ptr = NULL;
+		bo->addr = *addr;
+		*addr += bo->size;
+		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
+	}
+}
+
+static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
+{
+	uint32_t expected_result = 0;
+	char expr[256];
+	int len = 0;
+
+	for (int i = 0; i < ints_to_add; i++) {
+		int random_int = rand() % 8;
+
+		int_bo->ptr[i] = random_int;
+		expected_result += random_int;
+
+		len += snprintf(expr + len, sizeof(expr) - len, "%s%d",
+				i ? " + " : "", random_int);
+	}
+	igt_debug("%s = %u\n", expr, expected_result);
+	return expected_result;
+}
+
+static void cleanup_bo_resources(int fd, struct gem_bo *bo)
+{
+	if (bo->ptr) {
+		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
+		bo->ptr = NULL;
+	}
+	if (bo->handle)
+		gem_close(fd, bo->handle);
+}
+
+static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
+				   struct mem_bind_sync *sram_bind)
+{
+	for (int i = 0; i < vram_bind->n_bufs; i++)
+		gem_close(fd, vram_bind->bufs[i].handle);
+	for (int i = 0; i < sram_bind->n_bufs; i++)
+		gem_close(fd, sram_bind->bufs[i].handle);
+	free(vram_bind->bufs);
+	free(sram_bind->bufs);
+	if (vram_bind->n_bufs)
+		free(vram_bind->binds_ufence);
+	if (sram_bind->n_bufs)
+		free(sram_bind->binds_ufence);
+}
+
+/**
+ * SUBTEST: oversubscribe-concurrent-bind
+ * Description: Test for oversubscribing the VM with multiple processes
+ * doing binds at the same time, and ensure they all complete successfully.
+ * Functionality: This check is for a specific bug where if multiple processes
+ * oversubscribe the VM, some of the binds may fail with  ENOMEM due to
+ * deadlock in the bind code.
+ * Test category: stress test
+ */
+static void test_vm_oversubscribe_concurrent_bind(int fd)
+{
+	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
+	uint64_t max_by_mem;
+	uint64_t total_vram_demand = 0;
+	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
+	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
+	uint64_t target_vram = vram_size * 2;
+	uint64_t target_sram, total_vram_bufs, total_sram_bufs;
+	pthread_barrier_t *barrier;
+	pthread_barrierattr_t attr;
+	/*
+	 * Dynamically cap VRAM oversubscription so the overflow into system
+	 * RAM stays within 25% of available RAM. On small-VRAM platforms
+	 * (e.g. BMG) the 2x target fits within the cap and behavior is
+	 * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
+	 */
+	target_vram = min(target_vram, vram_size + sram_avail / 4);
+	target_sram = min_t(uint64_t, sram_avail * 50 / 100,
+			    MAX_SRAM_TEST_SIZE);
+
+	total_vram_bufs = target_vram / GB(1);
+	total_sram_bufs = target_sram / GB(1);
+
+	/* determine concurrency from memory pressure */
+
+	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
+			 total_sram_bufs / MIN_BUFS_PER_PROC);
+	n_proc = min_t(uint32_t, max_by_mem, MAX_PROCS);
+	igt_require_f(n_proc > 0, "Not enough VRAM/RAM for oversubscription test\n");
+
+	n_vram_bufs = max_t(int, 2, total_vram_bufs / n_proc);
+	n_sram_bufs = max_t(int, 2, total_sram_bufs / n_proc);
+	total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
+
+	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
+		  vram_size >> 20, sram_avail >> 20);
+
+	igt_debug(" n_proc = %d\n", n_proc);
+	igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
+	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
+		  total_vram_demand >> 20, (double)total_vram_demand / vram_size);
+	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
+		  n_vram_bufs, n_sram_bufs);
+
+	barrier = mmap(NULL, sizeof(pthread_barrier_t), PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(barrier != MAP_FAILED);
+	igt_assert_eq(pthread_barrierattr_init(&attr), 0);
+	igt_assert_eq(pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED), 0);
+	igt_assert_eq(pthread_barrier_init(barrier, &attr, n_proc), 0);
+
+	igt_fork(child, n_proc) {
+		struct xe_oversubscribe_ctx ctx = {0};
+		int rc, ret;
+		uint64_t addr = 0x40000000;
+		int expected_result = 0;
+		struct gem_bo integers_bo, result_bo, batch_bo, *vram_bufs, *sram_bufs;
+		int pos = 0;
+		struct mem_bind_sync vram_bind = {0};
+		struct mem_bind_sync sram_bind = {0};
+		struct drm_xe_sync batch_syncs[1];
+		struct drm_xe_exec exec;
+		struct gem_bo ufence_bo = {0};
+		int vram_bind_err = 0, sram_bind_err = 0;
+
+		vram_bufs = calloc(n_vram_bufs, sizeof(*vram_bufs));
+		sram_bufs = calloc(n_sram_bufs, sizeof(*sram_bufs));
+		srand(child);
+
+		igt_assert(vram_bufs && sram_bufs);
+
+		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+		create_exec_queue(fd, &ctx);
+		vram_bind.bufs = vram_bufs;
+		vram_bind.n_bufs = n_vram_bufs;
+		sram_bind.bufs = sram_bufs;
+		sram_bind.n_bufs = n_sram_bufs;
+
+		create_test_bos(fd, &ctx, &vram_bind, vram_memory(fd, 0), &addr);
+		create_test_bos(fd, &ctx, &sram_bind, system_memory(fd), &addr);
+
+		if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
+			igt_info("No BOs allocated; VRAM/SRAM unavailable, skipping\n");
+			goto cleanup;
+		}
+
+		ret = pthread_barrier_wait(barrier);
+		igt_assert(ret == 0 || ret == PTHREAD_BARRIER_SERIAL_THREAD);
+
+		if (vram_bind.n_bufs) {
+			vram_bind.binds_ufence =
+				vm_bind_bo_batch(fd, &ctx, vram_bufs,
+						 vram_bind.n_bufs, &vram_bind_err);
+			if (vram_bind_err) {
+				igt_assert_f(vram_bind_err == -ENOMEM || vram_bind_err == -ENOSPC,
+					     "Unexpected VRAM bind error: %d (%s)\n",
+					     vram_bind_err, strerror(-vram_bind_err));
+				igt_debug("VRAM bind failed with expected OOM (%s), skipping exec\n",
+					  strerror(-vram_bind_err));
+				goto cleanup;
+			}
+			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, TIMEOUT_NS);
+		}
+
+		if (sram_bind.n_bufs) {
+			sram_bind.binds_ufence =
+				vm_bind_bo_batch(fd, &ctx, sram_bufs,
+						 sram_bind.n_bufs, &sram_bind_err);
+			/* Assert if there is any bind error in SRAM */
+			if (sram_bind_err)
+				igt_assert_f(0, "Unexpected SRAM bind error: %d", sram_bind_err);
+			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, TIMEOUT_NS);
+		}
+
+		integers_bo.size = ALIGN(sizeof(int) * INT_ADD_CNT, 4096);
+		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
+		integers_bo.addr = 0x100000;
+
+		expected_result = fill_random_integers(&integers_bo, INT_ADD_CNT);
+		igt_debug("%d\n", expected_result);
+
+		result_bo.size = ALIGN(sizeof(int), 4096);
+		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
+							 system_memory(fd), 0,
+							 DRM_XE_GEM_CPU_CACHING_WC);
+		result_bo.ptr = NULL;
+		result_bo.addr = 0x200000;
+
+		batch_bo.size = 4096;
+		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
+						       system_memory(fd), 0,
+						       DRM_XE_GEM_CPU_CACHING_WC);
+
+		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle, batch_bo.size);
+		batch_bo.addr = 0x300000;
+
+		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, INT_ADD_CNT);
+
+		igt_assert(pos * sizeof(int) <= batch_bo.size);
+
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
+				   integers_bo.size, 0);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
+				   result_bo.size, 0);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
+				   batch_bo.size, 0);
+
+		ufence_bo.size = 4096;
+		ufence_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, ufence_bo.size,
+							system_memory(fd), 0,
+							DRM_XE_GEM_CPU_CACHING_WB);
+		ufence_bo.ptr = (int *)xe_bo_map(fd, ufence_bo.handle, ufence_bo.size);
+		ufence_bo.addr = 0x400000;
+		memset(ufence_bo.ptr, 0, ufence_bo.size);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
+				   ufence_bo.size, 0);
+
+		batch_syncs[0] = (struct drm_xe_sync){
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.addr = ufence_bo.addr,
+			.timeline_value = 1,
+		};
+
+		exec = (struct drm_xe_exec) {
+			.exec_queue_id = ctx.exec_queue_id,
+			.num_syncs = 1,
+			.syncs = (uintptr_t)batch_syncs,
+			.address = batch_bo.addr,
+			.num_batch_buffer = 1,
+		};
+
+		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+		igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
+			     strerror(errno), errno);
+		xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, 1, ctx.exec_queue_id, TIMEOUT_NS);
+		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
+		igt_assert(result_bo.ptr != MAP_FAILED);
+		igt_assert_eq(result_bo.ptr[0], expected_result);
+cleanup:
+		cleanup_bo_resources(fd, &ufence_bo);
+		cleanup_bo_resources(fd, &result_bo);
+		cleanup_bo_resources(fd, &batch_bo);
+		cleanup_bo_resources(fd, &integers_bo);
+		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
+		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
+		xe_vm_destroy(fd, ctx.vm_id);
+	}
+	igt_waitchildren();
+	igt_assert_eq(pthread_barrier_destroy(barrier), 0);
+	igt_assert_eq(pthread_barrierattr_destroy(&attr), 0);
+	igt_assert_eq(munmap(barrier, sizeof(pthread_barrier_t)), 0);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -3489,6 +3909,11 @@ int igt_main()
 		test_oom(fd);
 	}
 
+	igt_subtest("oversubscribe-concurrent-bind") {
+		igt_require(xe_has_vram(fd));
+		test_vm_oversubscribe_concurrent_bind(fd);
+	}
+
 	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
 		igt_subtest_f("vm-get-property-%s", f->name)
 			test_get_property(fd, f->test);
-- 
2.52.0

