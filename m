Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EF9E93813
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 04:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C96810E300;
	Mon, 13 Apr 2026 04:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Or9AkLEb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC64C10E300
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 04:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776054808; x=1807590808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0toSuDHDO6I14hNnI9/eQtw7E0TCaknT4kuEVz9M030=;
 b=Or9AkLEbr+QW45yGNk9v/ID+p3n2XnFGCFrhw71HLva2hQHKlPUQQ1a3
 UPo41rqb3wd0X1YVqau0teZsa0F9MuJzzOPUChyHkafgG2KBKihyiqt4m
 WDO9L/NaUnhOMjqDeqrBiy+1J/YmHt5s63A0vfpW3SPM2uCRow/4FR3LU
 6/YaAr2W3srqBLgAhRALGDNHPYmViXMa7hNQ+nhKdT2bnjEVxMWVsaNhC
 LhRqCxGRO6j2INmOV1ePjfWS2opFs30D/9eksrCs4c/aKE1I8VFBWzwmK
 SgUgKksuf+vq/QIxAVamsq5kYZ/H4bnSYiQNwbj3En5p3xUjIS1dZwexT g==;
X-CSE-ConnectionGUID: XVyaFBPBTHW4yTwQ0PyZgA==
X-CSE-MsgGUID: jbitXYxTRzmuKo2rcTNt/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="77097290"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="77097290"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:33:27 -0700
X-CSE-ConnectionGUID: kC6N2sawQo+3JHp1kdLtyA==
X-CSE-MsgGUID: IOgCLGqTTvKZEu4z+5A3Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="229585122"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:33:27 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v3 1/1] test/intel/xe_vm:Add oversubscribe concurrent
 bind stress subtest
Date: Mon, 13 Apr 2026 04:33:18 +0000
Message-ID: <20260413043318.17931-1-sobin.thomas@intel.com>
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

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 433 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 433 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index d75b0730d..42effbd48 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -19,8 +19,100 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include <inttypes.h>
 #include <string.h>
 
+#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
+#define MAX_THREADS 20
+struct gem_bo {
+	uint32_t handle;
+	uint64_t size;
+	int *ptr;
+	uint64_t addr;
+};
+
+struct xe_test_ctx {
+	int fd;
+	uint32_t vm_id;
+	uint32_t exec_queue_id;
+	uint16_t sram_instance;
+	uint16_t vram_instance;
+	bool has_vram;
+};
+
+struct mem_bind_sync {
+	struct gem_bo *bufs;
+	int n_bufs;
+	uint64_t *binds_ufence;
+};
+
+static uint64_t align_to_page_size(uint64_t size)
+{
+	return (size + 4095UL) & ~4095UL;
+}
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
+	ufence = malloc(sizeof(uint64_t));
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
+static void query_mem_info(int fd, struct xe_test_ctx *ctx)
+{
+	uint64_t vram_reg, sys_reg;
+	struct drm_xe_mem_region *region;
+
+	ctx->has_vram = xe_has_vram(fd);
+	if (ctx->has_vram) {
+		vram_reg = vram_memory(fd, 0);
+		region = xe_mem_region(fd, vram_reg);
+		ctx->vram_instance = region->instance;
+	}
+
+	sys_reg = system_memory(fd);
+	region = xe_mem_region(fd, sys_reg);
+	ctx->sram_instance = region->instance;
+	igt_debug("has_vram: %d\n", ctx->has_vram);
+}
+
 static uint32_t
 addr_low(uint64_t addr)
 {
@@ -2696,6 +2788,342 @@ static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
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
+		int ret;
+
+		bo->size = GB(1);
+		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size,
+					     placement, 0,
+					     DRM_XE_GEM_CPU_CACHING_WC,
+					     &bo->handle);
+		if (ret == -ENOMEM || ret == -ENOSPC) {
+			bind->n_bufs = i;/* stop creating more */
+			igt_debug("%s allocation failed at buffer %d\n", mem_type, i);
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
+static uint32_t setup_batch_syncs(int fd, struct drm_xe_sync *batch_syncs, int *n_batch_syncs,
+				  uint64_t timeline_val, struct mem_bind_sync *vram_bind,
+				  struct mem_bind_sync *sram_bind)
+{
+	uint32_t batch_syncobj = syncobj_create(fd, 0);
+
+	batch_syncs[*n_batch_syncs] = (struct drm_xe_sync) {
+		.extensions = 0,
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = batch_syncobj,
+		.timeline_value = timeline_val,
+	};
+	(*n_batch_syncs)++;
+
+	return batch_syncobj;
+}
+
+/*
+ * In concurrent VM bind stress tests, multiple threads simultaneously bind
+ * buffers to GPU virtual address space and submit batch operations. This
+ * creates significant GPU memory pressure where the kernel may transiently
+ * fail batch submission with ENOMEM when:
+ *   - GPU page tables are being updated across multiple bindings
+ *   - GPU memory is fragmented across many concurrent buffer mappings
+ *   - Multiple processes compete for finite GPU resources
+ *
+ * Without retries, transient ENOMEM failures cause false test failures.
+ * Retrying ensures we distinguish temporary resource exhaustion from actual
+ * driver bugs. Non-ENOMEM errors still fail immediately and are properly
+ * reported with full errno context for debugging.
+ */
+static int xe_exec_with_retry(int fd, struct drm_xe_exec *exec, int max_retries)
+{
+	int rc = 0, retries = 0;
+
+	for (retries = 0; retries < max_retries; retries++) {
+		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec);
+
+		if (!(rc && errno == ENOMEM))
+			break;
+
+		usleep(100 * retries);
+		if (retries == 0)
+			igt_warn("got ENOMEM\n");
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
+	if (vram_bind->n_bufs)
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
+	n_proc = min_t(uint32_t, max_by_mem, MIN_BUFS_PER_PROC);
+	igt_assert(n_proc > 0);
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
+		uint32_t batch_syncobj;
+		struct gem_bo integers_bo, result_bo, batch_bo, *vram_bufs, *sram_bufs;
+		struct gem_bo bo_arr[] = {result_bo, batch_bo, integers_bo};
+		struct drm_xe_sync batch_syncs[3];
+		int n_batch_syncs = 0;
+		int pos = 0;
+		uint64_t timeline_val = 1;
+		struct drm_xe_exec exec;
+		struct mem_bind_sync vram_bind = {0};
+		struct mem_bind_sync sram_bind = {0};
+
+		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs, sizeof(struct gem_bo));
+		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs, sizeof(struct gem_bo));
+		srand(child);
+
+		igt_assert(vram_bufs && sram_bufs);
+
+		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+		query_mem_info(fd, &ctx);
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
+		if (n_vram_bufs)
+			vram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, vram_bufs,
+								  n_vram_bufs);
+
+		if (n_sram_bufs)
+			sram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, sram_bufs,
+								  n_sram_bufs);
+
+		integers_bo.size = align_to_page_size(sizeof(int) * ints_to_add);
+		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
+		integers_bo.addr = 0x100000;
+
+		expected_result = fill_random_integers(&integers_bo, ints_to_add);
+		igt_debug("%d\n", expected_result);
+
+		result_bo.size = align_to_page_size(sizeof(int));
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
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
+				   integers_bo.size, 0);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
+				   result_bo.size, 0);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
+				   batch_bo.size, 0);
+		batch_syncobj = setup_batch_syncs(fd, batch_syncs, &n_batch_syncs, timeline_val,
+						  &vram_bind, &sram_bind);
+
+		/* Wait for bind operations to complete on CPU */
+		if (vram_bind.n_bufs)
+			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, INT64_MAX);
+		if (sram_bind.n_bufs)
+			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, INT64_MAX);
+
+		exec = (struct drm_xe_exec) {
+			.exec_queue_id = ctx.exec_queue_id,
+			.num_syncs = n_batch_syncs,
+			.syncs = (uintptr_t)batch_syncs,
+			.address = batch_bo.addr,
+			.num_batch_buffer = 1,
+		};
+
+		rc = xe_exec_with_retry(fd, &exec, max_retries);
+		igt_assert_eq(rc, 0);
+
+		igt_assert(syncobj_timeline_wait(fd, &batch_syncobj,
+						 &timeline_val, 1, INT64_MAX, 0, NULL));
+		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
+		igt_assert_eq(result_bo.ptr[0], expected_result);
+		cleanup_bo_resources(fd, bo_arr);
+		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
+		syncobj_destroy(fd, batch_syncobj);
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
@@ -3088,6 +3516,11 @@ int igt_main()
 		igt_subtest_f("invalid-flag-%s", s->name)
 			invalid_flag(fd, s->flags);
 	}
+	igt_subtest("oversubscribe-concurrent-bind")
+	{
+	    igt_require(xe_has_vram(fd));
+	    test_vm_oversubscribe_concurrent_bind(fd);
+	}
 
 	igt_subtest("invalid-extensions")
 		invalid_extensions(fd);
-- 
2.52.0

