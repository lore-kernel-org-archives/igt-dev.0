Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356EDCD343B
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 14:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E2810EDD6;
	Wed,  6 May 2026 14:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyiUpgZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A6910EDB9
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778076617; x=1809612617;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lDLvtYgYKPO7+3BIQqTTaA0YFFZX/mkNKR2UXwItHXY=;
 b=jyiUpgZADl8G7Vuq4tClJSVzjXUE5+BctqHUQ2CNI1u9h14G7YLHcipF
 SCSGvovnb79Ph+S4pzU88pSuKY2A7jYPZ05OH7w61AVDIIG8xPTEXRiGo
 u8uIwxl6wclb7iWRjNoMyXXIizI5rMfwxlzlkTfjFJvc0UZ4zbw9K6yO8
 ScnGuxhCCGbsMIWhybH9eNQott5I2ArTJKjWIWAe+OfWET5rdV9plDVgg
 gUw3Kx4aZJx+1/UfDN4Yksyp7dX0KviILtKyiLHKdgNFZ4dSyXAI/Gwrn
 WWuXfIAiInaI5lMGDiYwLnCt20rFiu/6pxp3PSgZSp0VeEzMu45NWbA1F Q==;
X-CSE-ConnectionGUID: NcS6G8tgTJu3O8msn81H7A==
X-CSE-MsgGUID: tLhx4Ta7TY6OHFa6C4miaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78856774"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78856774"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:10:16 -0700
X-CSE-ConnectionGUID: jur21NOqQkG2p+ujTaFyoQ==
X-CSE-MsgGUID: j/adNDnUTzKYOzmrUOSPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="229750403"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 07:10:16 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v6] test/intel/xe_vm:Add oversubscribe concurrent bind
 stress subtest
Date: Wed,  6 May 2026 14:10:09 +0000
Message-ID: <20260506141009.77375-1-sobin.thomas@intel.com>
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

Add test for oversubscribing VRAM in multi process environment that
creates VM, bind large BOs and submit workloads nearly simultaneously.

Previous coverage lacked a scenario combining multi-process bind
with VRAM oversubscription. This generates memory pressure with
multi-process VM Bind activity and concurrent submission, exercising
the bind pipeline under eviction pressure.

v2: Removed helper APIs usage clock_nanosleep and commented
code.(Nishit)

v3: Refactored code to smaller functions.
    Added check for available SRAM usage and keep the max process to 20.

v4: Remove explicit macros definition
    Replace Bind ioctl with library calls.(Thomas)
v5: Remove unused query_mem_info
    Fix xe_exec_with_retry (Thomas)
    Rename align_to_page_size with ALIGN macro (kamil/Thomas)
v6: Fix vm_bind_bo_batch: move igt_assert(ufence) before first dereference
    Fix create_test_bos: check errno instead of ret for ENOMEM/ENOSPC
    detection, since igt_ioctl returns -1 on failure. (Thomas)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 401 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 401 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 408bfdb71..fe4174458 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -21,6 +21,7 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
 
 enum overcommit_stage {
 	EXPECT_NONE,
@@ -29,6 +30,69 @@ enum overcommit_stage {
 	EXPECT_EXEC,
 };
 
+struct gem_bo {
+	uint32_t handle;
+	uint64_t size;
+	int *ptr;
+	uint64_t addr;
+};
+
+struct xe_test_ctx {
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
+static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci = { 0 };
+
+	/* Use first available engine */
+	xe_for_each_engine(fd, hwe) {
+		eci = *hwe;
+		break;
+	}
+	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, &eci, 0);
+}
+
+static uint64_t *
+vm_bind_bo_batch(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
+{
+	uint64_t *ufence;
+	struct drm_xe_sync bind_sync;
+	struct drm_xe_vm_bind_op binds[size];
+	int i;
+
+	ufence = calloc(1, sizeof(uint64_t));
+	igt_assert(ufence);
+	*ufence = 0;
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
+		.obj_offset = 0,
+			.range = bos[i].size,
+			.addr = bos[i].addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		};
+	}
+	xe_vm_bind_array(fd, ctx->vm_id, 0, binds, size, &bind_sync, 1);
+	return ufence;
+}
+
 static uint32_t
 addr_low(uint64_t addr)
 {
@@ -3073,6 +3137,338 @@ static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
 	xe_vm_destroy(fd, vm);
 }
 
+static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
+			   struct gem_bo *result_bo, int ints_to_add)
+{
+	int pos = 0;
+	uint64_t tmp_addr;
+	#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
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
+static void create_test_bos(int fd, struct xe_test_ctx *ctx, struct mem_bind_sync *bind,
+			    uint32_t  placement, uint64_t *addr)
+{
+	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
+
+	for (int i = 0; i < bind->n_bufs; i++) {
+		struct gem_bo *bo = &bind->bufs[i];
+
+		bo->size = GB(1);
+		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
+					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
+		if (ret) {
+			if (errno == ENOMEM || errno == ENOSPC) {
+				bind->n_bufs = i;
+				igt_debug("%s allocation failed at buffer %d\n", mem_type, i);
+				break;
+			}
+			igt_assert_eq(ret, 0);
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
+
+	for (int i = 0; i < ints_to_add; i++) {
+		int random_int = rand() % 8;
+
+		int_bo->ptr[i] = random_int;
+		expected_result += random_int;
+
+		igt_debug("%d", random_int);
+		if (i + 1 != ints_to_add)
+			igt_debug(" + ");
+		else
+			igt_debug(" = ");
+	}
+	igt_debug("%d\n", expected_result);
+	return expected_result;
+}
+
+/*
+ * In concurrent VM bind stress tests, multiple threads simultaneously bind
+ * buffers to GPU virtual address space and submit batch operations. This
+ * creates significant GPU memory pressure where the kernel may transiently
+ * fail batch submission when:
+ *   - GPU page tables are being updated across multiple bindings
+ *   - GPU memory is fragmented across many concurrent buffer mappings
+ *   - Multiple processes compete for finite GPU resources
+ *
+ * Without retries, transient ENOMEM/ENOSPC failures cause false test failures.
+ * Retrying lets us distinguish temporary resource exhaustion from actual
+ * driver bugs. Non ENOMEM/ENOSPC errors still fail immediately and are properly
+ * reported with full errno context for debugging.
+ */
+static int xe_exec_with_retry(int fd, struct drm_xe_exec *exec, int max_retries)
+{
+	int rc = 0, retries = 0;
+
+	for (retries = 0; retries < max_retries; retries++) {
+		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec);
+
+		if (!(rc && (errno == ENOMEM || errno == ENOSPC)))
+			break;
+
+		usleep(100 * retries);
+		if (retries == 0)
+			igt_warn("got %s, retrying\n", strerror(errno));
+	}
+
+	if (retries == max_retries)
+		igt_warn("gave up after %d retries\n", retries);
+
+	if (rc)
+		igt_warn("errno: %d (%s)\n", errno, strerror(errno));
+
+	return rc;
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
+	#define MIN_BUFS_PER_PROC 2
+	#define MAX_THREADS 20
+	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
+	uint32_t max_by_mem;
+	uint64_t total_vram_demand = 0;
+	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
+	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
+	uint64_t target_vram = vram_size * 2;      /* 2 of VRAM */
+	uint64_t target_sram = sram_avail * 50 / 100;  /* 50% system RAM */
+
+	int total_vram_bufs = target_vram / GB(1);
+	int total_sram_bufs = target_sram / GB(1);
+
+	/* determine concurrency from memory pressure */
+
+	pthread_barrier_t *barrier;
+	pthread_barrierattr_t attr;
+
+	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
+			 total_sram_bufs / MIN_BUFS_PER_PROC);
+	igt_info("\n max_by_mem = %d", max_by_mem);
+	n_proc = min_t(uint32_t, max_by_mem, MAX_THREADS);
+	igt_require_f(n_proc > 0, "Not enough VRAM/RAM for oversubscription test\n");
+
+	n_vram_bufs = max(2, total_vram_bufs / n_proc);
+	n_sram_bufs = max(2, total_sram_bufs / n_proc);
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
+	barrier = mmap(NULL, sizeof(pthread_barrier_t),
+		       PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(barrier != MAP_FAILED);
+	pthread_barrierattr_init(&attr);
+	pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
+	pthread_barrier_init(barrier, &attr, n_proc);
+
+	igt_fork(child, n_proc) {
+		struct xe_test_ctx ctx = {0};
+		int rc;
+		uint64_t addr = 0x40000000;
+		int expected_result = 0, ints_to_add = 4;
+		int max_retries = 1024;
+		struct gem_bo integers_bo, result_bo, batch_bo, *vram_bufs, *sram_bufs;
+		int pos = 0;
+		struct mem_bind_sync vram_bind = {0};
+		struct mem_bind_sync sram_bind = {0};
+		struct drm_xe_sync batch_syncs[1];
+		struct drm_xe_exec exec;
+		struct gem_bo ufence_bo = {0};
+
+		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs, sizeof(struct gem_bo));
+		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs, sizeof(struct gem_bo));
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
+		pthread_barrier_wait(barrier);
+
+		if (vram_bind.n_bufs)
+			vram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, vram_bufs,
+								  vram_bind.n_bufs);
+
+		if (sram_bind.n_bufs)
+			sram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, sram_bufs,
+								  sram_bind.n_bufs);
+
+		integers_bo.size = ALIGN(sizeof(int) * ints_to_add, 4096);
+		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
+		integers_bo.addr = 0x100000;
+
+		expected_result = fill_random_integers(&integers_bo, ints_to_add);
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
+		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, ints_to_add);
+
+		igt_assert(pos * sizeof(int) <= batch_bo.size);
+
+		/* Wait for large bind operations to complete before binding small BOs */
+		if (vram_bind.n_bufs)
+			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, INT64_MAX);
+		if (sram_bind.n_bufs)
+			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, INT64_MAX);
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
+		rc = xe_exec_with_retry(fd, &exec, max_retries);
+		igt_assert_eq(rc, 0);
+		xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, 1, ctx.exec_queue_id, INT64_MAX);
+		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
+		igt_assert_eq(result_bo.ptr[0], expected_result);
+		cleanup_bo_resources(fd, &ufence_bo);
+		cleanup_bo_resources(fd, &result_bo);
+		cleanup_bo_resources(fd, &batch_bo);
+		cleanup_bo_resources(fd, &integers_bo);
+		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
+		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
+		xe_vm_destroy(fd, ctx.vm_id);
+		close(fd);
+	}
+	igt_waitchildren();
+	pthread_barrier_destroy(barrier);
+	pthread_barrierattr_destroy(&attr);
+	igt_assert_eq(munmap(barrier, sizeof(pthread_barrier_t)), 0);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -3486,6 +3882,11 @@ int igt_main()
 		igt_assert(xe_visible_vram_size(fd, 0));
 		test_oom(fd);
 	}
+	igt_subtest("oversubscribe-concurrent-bind")
+	{
+		igt_require(xe_has_vram(fd));
+		test_vm_oversubscribe_concurrent_bind(fd);
+	}
 
 	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
 		igt_subtest_f("vm-get-property-%s", f->name)
-- 
2.52.0

