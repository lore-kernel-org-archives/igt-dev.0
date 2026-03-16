Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2E8F013C6
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 07:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB8310E30A;
	Mon, 16 Mar 2026 07:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wk9cXt6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8B10E1D2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 07:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773646947; x=1805182947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n4Jw0f0TaledQ4mzSfLf62kphoh1MYq54wcJDg9QHqs=;
 b=Wk9cXt6yiK684wmMwezbX//mHF3UTn9ff3OHFQUa/VkmnbM+lky0l4nS
 shPhIwRhYZCeXcMkJ/wSaxZGKV9UKh5XgmS9664l0DtkfjiI1e6kDQXf4
 cVnlK2RqI+bvowRBOYd6qtvXymAoETq6EyCkakppe2ItpJ/jEZ8fbwgIZ
 NsVa7EWV0Aoqjw0HnN7aLTolxSf0hsYarAOVhQBaep7JhKPQJFQnC9J9Y
 i9pRfg341Fhf78orjy59z411Uk3Rz3t1FsbaDlsqCTDMM7RduklvotVBJ
 24T/zvH1LzwQqbWmjcp4bYCBbRKXaZXCMKC04oiq0roTUPzywPoU3G43g Q==;
X-CSE-ConnectionGUID: IfMkHpDWSrittq1Pwu5+DA==
X-CSE-MsgGUID: sO1KAUueSDmSTeWejMA2NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74772346"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74772346"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:42:26 -0700
X-CSE-ConnectionGUID: TlLKediXRg+EwCnzUCKqvw==
X-CSE-MsgGUID: 0VUred/SRfOY5vzxqXf4lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="220878378"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:42:26 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 1/1] test/intel/xe_vm: Add oversubscribe concurrent
 bind stress subtest
Date: Mon, 16 Mar 2026 07:42:11 +0000
Message-ID: <20260316074211.2308188-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316074211.2308188-1-sobin.thomas@intel.com>
References: <20260316074211.2308188-1-sobin.thomas@intel.com>
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

v2: Removed helper APIs usage clock_nanosleep and commented code.

v3: Refactored code to smaller functions.
    Added check for available SRAM usage and keep the max process to 20.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 513 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 513 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ccff8f804..d9d0b46af 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -19,8 +19,170 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include <inttypes.h>
 #include <string.h>
 
+#define MI_BB_END		(0 << 29 | 0x0A << 23 |  0)
+#define MI_LOAD_REG_MEM		(0 << 29 | 0x29 << 23 | 0 << 22 | 0 << 21 | 1 << 19 | 2)
+#define MI_STORE_REG_MEM	(0 << 29 | 0x24 << 23 | 0 << 22 | 0 << 21 | 1 << 19 | 2)
+#define MI_MATH_R(length)		(0 << 29 | 0x1A << 23 | ((length) & 0xFF))
+#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
+#define ALU_LOAD(dst, src)	(0x080 << 20 | ((dst) << 10) | (src))
+#define ALU_STORE(dst, src)	(0x180 << 20 | (dst) << 10 | (src))
+#define ALU_ADD			(0x100 << 20)
+#define ALU_RX(x)		(x)
+#define ALU_SRCA		0x20
+#define ALU_SRCB		0x21
+#define ALU_ACCU		0x31
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
+	uint32_t binds_syncobj;
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
+static void vm_bind_single_bo(int fd, struct xe_test_ctx *ctx, struct gem_bo *bo)
+{
+	int rc;
+	uint64_t timeline_val = 1;
+	uint32_t syncobj_handle = syncobj_create(fd, 0);
+
+	struct drm_xe_sync bind_sync = {
+		.extensions = 0,
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_handle,
+		.timeline_value = timeline_val,
+	};
+	struct drm_xe_vm_bind vm_bind = {
+		.extensions = 0,
+		.vm_id = ctx->vm_id,
+		.exec_queue_id = 0,
+		.num_binds = 1,
+		.bind = {
+			.obj = bo->handle,
+			.obj_offset = 0,
+			.range = bo->size,
+			.addr = bo->addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		},
+		.num_syncs = 1,
+		.syncs = (uintptr_t)&bind_sync,
+	};
+	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);
+
+	igt_debug("Bind returned %d\n", rc);
+	igt_assert(rc == 0);
+
+	igt_assert(syncobj_timeline_wait(fd, &syncobj_handle, &timeline_val,
+					 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, syncobj_handle);
+}
+
+static uint32_t
+vm_bind_bo_batch(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
+{
+	int rc;
+	uint32_t syncobj_handle = syncobj_create(fd, 0);
+	uint64_t timeline_val = 1;
+	struct drm_xe_sync bind_sync = {
+		.extensions = 0,
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_handle,
+		.timeline_value = timeline_val,
+	};
+	struct drm_xe_vm_bind_op binds[size];
+	struct drm_xe_vm_bind vm_bind = {
+		.extensions = 0,
+		.vm_id = ctx->vm_id,
+		.exec_queue_id = 0,
+		.num_binds = size,
+		.vector_of_binds = (uintptr_t)binds,
+		.num_syncs = 1,
+		.syncs = (uintptr_t)&bind_sync,
+	};
+
+	for (int i = 0; i < size; i++) {
+		binds[i] = (struct drm_xe_vm_bind_op) {
+			.extensions = 0,
+			.obj = bos[i].handle,
+			.pat_index = 0,
+			.pad = 0,
+			.obj_offset = 0,
+			.range = bos[i].size,
+			.addr = bos[i].addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+			.prefetch_mem_region_instance = 0,
+			.pad2 = 0,
+		};
+	}
+	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);
+	igt_assert(rc == 0);
+
+	return syncobj_handle;
+}
+
+static void query_mem_info(int fd, struct xe_test_ctx *ctx)
+{
+	uint64_t vram_reg, sys_reg;
+	struct drm_xe_mem_region *region;
+
+	ctx->has_vram = xe_has_vram(fd);
+	if (ctx->has_vram) {
+		/* Get VRAM instance - vram_memory returns a bitmask,
+		 * so we extract the instance from it
+		 */
+		vram_reg = vram_memory(fd, 0);
+		region = xe_mem_region(fd, vram_reg);
+		ctx->vram_instance = region->instance;
+	}
+
+	/* Get SRAM instance */
+	sys_reg = system_memory(fd);
+	region = xe_mem_region(fd, sys_reg);
+	ctx->sram_instance = region->instance;
+	igt_debug("has_vram: %d\n", ctx->has_vram);
+}
+
 static uint32_t
 addr_low(uint64_t addr)
 {
@@ -2450,6 +2612,352 @@ static void test_oom(int fd)
 	}
 }
 
+static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
+			   struct gem_bo *result_bo, int ints_to_add)
+{
+	int pos = 0;
+	uint64_t tmp_addr;
+
+	batch_bo->ptr[pos++] = MI_LOAD_REG_MEM;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+	for (int i = 1; i < ints_to_add; i++) {
+		/* r1 = integers_bo[i] */
+		batch_bo->ptr[pos++] = MI_LOAD_REG_MEM;
+		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
+		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
+		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+		/* r0 = r0 + r1 */
+		batch_bo->ptr[pos++] = MI_MATH_R(3);
+		batch_bo->ptr[pos++] = ALU_LOAD(ALU_SRCA, ALU_RX(0));
+		batch_bo->ptr[pos++] = ALU_LOAD(ALU_SRCB, ALU_RX(1));
+		batch_bo->ptr[pos++] = ALU_ADD;
+		batch_bo->ptr[pos++] = ALU_STORE(ALU_RX(0), ALU_ACCU);
+	}
+	/* result_bo[0] = r0 */
+	batch_bo->ptr[pos++] = MI_STORE_REG_MEM;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+
+	batch_bo->ptr[pos++] = MI_BB_END;
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
+	if (vram_bind->n_bufs) {
+		batch_syncs[*n_batch_syncs] = (struct drm_xe_sync) {
+			.extensions = 0,
+			.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+			.flags = 0, /* wait */
+			.handle = vram_bind->binds_syncobj,
+			.timeline_value = 1,
+		};
+		(*n_batch_syncs)++;
+	}
+
+	if (sram_bind->n_bufs) {
+		batch_syncs[*n_batch_syncs] = (struct drm_xe_sync) {
+			.extensions = 0,
+			.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+			.flags = 0, /* wait */
+			.handle = sram_bind->binds_syncobj,
+			.timeline_value = 1,
+		};
+		(*n_batch_syncs)++;
+	}
+	return batch_syncobj;
+}
+
+static int xe_exec_with_retry(int fd, struct drm_xe_exec *exec, int max_retries)
+{
+	int rc, retries = 0;
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
+	if (rc) {
+		igt_warn("errno: %d (%s)\n", errno, strerror(errno));
+		perror(__func__);
+	}
+
+	if (retries && !rc)
+		igt_debug("!!!!!! succeeded after %d retries !!!!!!\n", retries);
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
+		syncobj_destroy(fd, vram_bind->binds_syncobj);
+	if (vram_bind->n_bufs)
+		syncobj_destroy(fd, sram_bind->binds_syncobj);
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
+	/* Create shared memory barrier for process synchronization */
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
+		/* integers_bo contains the integers we're going to add. */
+		struct gem_bo integers_bo, result_bo, batch_bo, *vram_bufs,
+			       *sram_bufs;
+		struct gem_bo bo_arr[] = {result_bo, batch_bo, integers_bo};
+		struct drm_xe_sync batch_syncs[3];
+		int n_batch_syncs = 0;
+		int pos = 0;
+		uint64_t timeline_val = 1;
+		struct drm_xe_exec exec;
+
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
+			vram_bind.binds_syncobj = vm_bind_bo_batch(fd, &ctx, vram_bufs,
+								   n_vram_bufs);
+
+		if (n_sram_bufs)
+			sram_bind.binds_syncobj = vm_bind_bo_batch(fd, &ctx, sram_bufs,
+								   n_sram_bufs);
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
+		igt_debug("Creating the result buffer object\n");
+
+		result_bo.size = align_to_page_size(sizeof(int));
+		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
+							 system_memory(fd), 0,
+							 DRM_XE_GEM_CPU_CACHING_WC);
+		result_bo.ptr = NULL;
+		result_bo.addr = 0x200000;
+		/* batch_bo contains the commands the GPU will run. */
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
+		vm_bind_single_bo(fd, &ctx, &integers_bo);
+		vm_bind_single_bo(fd, &ctx, &result_bo);
+		vm_bind_single_bo(fd, &ctx, &batch_bo);
+		batch_syncobj = setup_batch_syncs(fd, batch_syncs, &n_batch_syncs, timeline_val,
+						  &vram_bind, &sram_bind);
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
+		/* We need to wait for the GPU to finish. */
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
@@ -2849,6 +3357,11 @@ int igt_main()
 		igt_assert(xe_visible_vram_size(fd, 0));
 		test_oom(fd);
 	}
+	igt_subtest("oversubscribe-concurrent-bind")
+	{
+	    igt_require(xe_has_vram(fd));
+	    test_vm_oversubscribe_concurrent_bind(fd);
+	}
 
 	igt_fixture()
 		drm_close_driver(fd);
-- 
2.52.0

