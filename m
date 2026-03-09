Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C007EFCD9B
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 12:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A561810E035;
	Mon,  9 Mar 2026 12:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UGQWsihk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B535210E035
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 12:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773057816; x=1804593816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xyEBFctUNs4tkDVywwHJ/7Nn5uerkXVKv3K+Z0uUn6o=;
 b=UGQWsihkKGDdcQmKPWioOWFRpIH5Fo8fwMrmBCNC6TCREhRxQ2kTXCie
 tZGnfwBEAgj/2+3TyPN7JBbNlXPGNhnMSJnFq1gGvkVn4gNHWu2z4ByAq
 Zak8Igd1akHUhkdndN3+kZHsQqL7RGJoZonTeQmACSKwfueJdmgFqHxo6
 7cHSBJi2hIs4HMGCBAMvjuqSUtNLD2yYWAuXyruyFoSCr0WEoeQLcXxb6
 J4nnYga7l4bx5XFzeOufBixR9eacAUmYzQ5mP6gN6RLwQjQp1HOyhtypf
 m3J49wC1jMnmjSP4lp098d6t2h4jVXv0RuGtLFY1ZyAIlLAoztxVHEpDl A==;
X-CSE-ConnectionGUID: 44pcdwgYTaelg16ERon8nw==
X-CSE-MsgGUID: tIvUP+DESd2UZzsGhB+ENg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77956243"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77956243"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:54:37 -0700
X-CSE-ConnectionGUID: vZbbI+z8R/mRVsqGc4uCjQ==
X-CSE-MsgGUID: sM+zw8eBRAaInK7ChDASTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="219675875"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:54:37 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v2 i-g-t 1/1] test/intel/xe_vm: Add oversubscribe concurrent
 bind stress subtest
Date: Mon,  9 Mar 2026 11:54:16 +0000
Message-ID: <20260309115416.1704717-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260309115416.1704717-1-sobin.thomas@intel.com>
References: <20260309115416.1704717-1-sobin.thomas@intel.com>
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
multi-process VM Bind activity and concurrent submission, excercising
the bind pipeline under eviction pressure.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 438 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 438 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ccff8f804..ed46f4bee 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -19,8 +19,176 @@
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
+
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
+static uint64_t align_to_page_size(uint64_t size)
+{
+	return (size + 4095UL) & ~4095UL;
+}
+
+static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance eci = {
+		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+	};
+
+	/* Find first render engine */
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
+			eci = *hwe;
+			break;
+		}
+	}
+	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, &eci, 0);
+}
+
+static void vm_bind_gem_bo(int fd, struct xe_test_ctx *ctx, uint32_t handle,
+			   uint64_t addr, uint64_t size)
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
+			.obj = handle,
+			.obj_offset = 0,
+			.range = size,
+			.addr = addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		},
+		.num_syncs = 1,
+		.syncs = (uintptr_t)&bind_sync,
+	};
+	rc = igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &vm_bind);
+
+	igt_assert(rc == 0);
+
+	/* The right way to do this in the real world is to not wait for the
+	 * syncobj here - since it just makes everything synchronous -, but
+	 * instead pass the syncobj as a 'wait'-type object to thie execbuf
+	 * ioctl. We do it here just to make the example simpler.
+	 */
+	igt_assert(syncobj_timeline_wait(fd, &syncobj_handle, &timeline_val,
+					 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, syncobj_handle);
+}
+
+static uint32_t
+vm_bind_gem_bos(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
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
+	/* Need to call the ioctl differently when size is 1. */
+	igt_assert(size != 1);
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
@@ -2450,6 +2618,271 @@ static void test_oom(int fd)
 	}
 }
 
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
+	uint64_t vram_size = xe_visible_vram_size(fd, 0);
+	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
+	const uint64_t buf_size = GB(1);
+	uint64_t target_vram = vram_size * 2;      /* 2 of VRAM */
+	uint64_t target_sram = sram_avail * 60 / 100;  /* 60% system RAM */
+
+	int total_vram_bufs = target_vram / buf_size;
+	int total_sram_bufs = target_sram / buf_size;
+
+	/* determine concurrency from memory pressure */
+	int max_proc_vram = total_vram_bufs / 2;
+	int max_proc_sram = total_sram_bufs;
+	int n_proc = min(max_proc_vram, max_proc_sram);
+	int n_vram_bufs = max(2, total_vram_bufs / n_proc);
+	int n_sram_bufs = max(2, total_sram_bufs / n_proc);
+	uint64_t total_vram_demand = (uint64_t)n_proc * n_vram_bufs * buf_size;
+	pthread_barrier_t *barrier;
+	pthread_barrierattr_t attr;
+
+	igt_debug("VRAM demand: %" PRIu64 "GB (%.2fx oversubscription)\n",
+		  total_vram_demand >> 30, (double)total_vram_demand / vram_size);
+	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
+		  n_vram_bufs, n_sram_bufs);
+
+	/* Create shared memory barrier for process synchronization */
+	barrier = mmap(NULL, sizeof(pthread_barrier_t), PROT_READ | PROT_WRITE,
+		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(barrier != MAP_FAILED);
+	pthread_barrierattr_init(&attr);
+	pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
+	pthread_barrier_init(barrier, &attr, n_proc);
+	igt_fork(child, n_proc) {
+		struct xe_test_ctx ctx = {0};
+		int rc;
+		uint64_t addr = GB(1);
+		struct timespec start;
+		uint32_t vram_binds_syncobj, sram_binds_syncobj;
+		struct gem_bo *vram_bufs;
+		struct gem_bo *sram_bufs;
+		int expected_result = 0;
+		int ints_to_add = 4;
+		int gpu_result;
+		int retries;
+		int max_retries = 1024;
+		uint32_t batch_syncobj;
+		/* integers_bo contains the integers we're going to add. */
+		struct gem_bo integers_bo, result_bo, batch_bo;
+		uint64_t tmp_addr;
+		struct drm_xe_sync batch_syncs[3];
+		int n_batch_syncs = 0;
+		int pos = 0;
+		uint64_t timeline_val = 1;
+		struct drm_xe_exec exec;
+
+		if (n_vram_bufs == 0 && n_sram_bufs == 0)
+			return;
+
+		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs, sizeof(struct gem_bo));
+		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs, sizeof(struct gem_bo));
+
+		if (!vram_bufs || !sram_bufs)
+			igt_assert_f(0, "Failed to allocate memory for buffer objects\n");
+
+		rc = clock_gettime(CLOCK_MONOTONIC, &start);
+		igt_assert(rc == 0);
+		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+		query_mem_info(fd, &ctx);
+		create_exec_queue(fd, &ctx);
+		for (int i = 0; i < n_vram_bufs; i++) {
+			struct gem_bo *bo = &vram_bufs[i];
+
+			bo->size = GB(1);
+			bo->handle = xe_bo_create_caching(fd, ctx.vm_id, vram_bufs[i].size,
+							  vram_memory(fd, 0), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+			bo->ptr = NULL;
+			bo->addr = addr;
+			addr += bo->size;
+			igt_debug("vram buffer %d created at 0x%016lx\n",
+				  i, bo->addr);
+		}
+		for (int i = 0; i < n_sram_bufs; i++) {
+			struct gem_bo *bo = &sram_bufs[i];
+
+			bo->size = GB(1);
+			bo->handle = xe_bo_create_caching(fd, ctx.vm_id, sram_bufs[i].size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+			bo->ptr = NULL;
+			bo->addr = addr;
+			addr += bo->size;
+			igt_debug("sram buffer %d created at 0x%016lx\n", i, bo->addr);
+		}
+		pthread_barrier_wait(barrier);
+
+		if (n_vram_bufs)
+			vram_binds_syncobj = vm_bind_gem_bos(fd, &ctx, vram_bufs, n_vram_bufs);
+
+		if (n_sram_bufs)
+			sram_binds_syncobj = vm_bind_gem_bos(fd, &ctx, sram_bufs, n_sram_bufs);
+
+		integers_bo.size = align_to_page_size(sizeof(int) * ints_to_add);
+		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
+
+		integers_bo.addr = 0x100000;
+
+		for (int i = 0; i < ints_to_add; i++) {
+			int random_int = rand() % 8;
+
+			integers_bo.ptr[i] = random_int;
+			expected_result += random_int;
+
+		}
+		igt_assert_eq(munmap(integers_bo.ptr, integers_bo.size), 0);
+		integers_bo.ptr = NULL;
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
+		/* r0 = integers_bo[0] */
+		batch_bo.ptr[pos++] = MI_LOAD_REG_MEM;
+		batch_bo.ptr[pos++] = GPR_RX_ADDR(0);
+		tmp_addr = integers_bo.addr + 0 * sizeof(uint32_t);
+		batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+		batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+		for (int i = 1; i < ints_to_add; i++) {
+			/* r1 = integers_bo[i] */
+			batch_bo.ptr[pos++] = MI_LOAD_REG_MEM;
+			batch_bo.ptr[pos++] = GPR_RX_ADDR(1);
+			tmp_addr = integers_bo.addr + i * sizeof(uint32_t);
+			batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+			batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+			/* r0 = r0 + r1 */
+			batch_bo.ptr[pos++] = MI_MATH_R(3);
+			batch_bo.ptr[pos++] = ALU_LOAD(ALU_SRCA, ALU_RX(0));
+			batch_bo.ptr[pos++] = ALU_LOAD(ALU_SRCB, ALU_RX(1));
+			batch_bo.ptr[pos++] = ALU_ADD;
+			batch_bo.ptr[pos++] = ALU_STORE(ALU_RX(0), ALU_ACCU);
+		}
+		/* result_bo[0] = r0 */
+		batch_bo.ptr[pos++] = MI_STORE_REG_MEM;
+		batch_bo.ptr[pos++] = GPR_RX_ADDR(0);
+		tmp_addr = result_bo.addr + 0 * sizeof(uint32_t);
+		batch_bo.ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+		batch_bo.ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+
+		batch_bo.ptr[pos++] = MI_BB_END;
+		while (pos % 4 != 0)
+			batch_bo.ptr[pos++] = MI_NOOP;
+
+		igt_assert(pos * sizeof(int) <= batch_bo.size);
+
+		vm_bind_gem_bo(fd, &ctx, integers_bo.handle, integers_bo.addr, integers_bo.size);
+		vm_bind_gem_bo(fd, &ctx, result_bo.handle, result_bo.addr, result_bo.size);
+		vm_bind_gem_bo(fd, &ctx, batch_bo.handle, batch_bo.addr, batch_bo.size);
+
+		/* Now we do the actual batch submission to the GPU. */
+		batch_syncobj = syncobj_create(fd, 0);
+
+		igt_assert_eq(rc, 0);
+		batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
+			.extensions = 0,
+			.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.handle = batch_syncobj,
+			.timeline_value = timeline_val,
+		};
+		if (n_vram_bufs) {
+			batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
+				.extensions = 0,
+				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+				.flags = 0, /* wait */
+				.handle = vram_binds_syncobj,
+				.timeline_value = 1,
+			};
+		}
+		if (n_sram_bufs) {
+			batch_syncs[n_batch_syncs++] = (struct drm_xe_sync) {
+				.extensions = 0,
+				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+				.flags = 0, /* wait */
+				.handle = sram_binds_syncobj,
+				.timeline_value = 1,
+			};
+		}
+		exec = (struct drm_xe_exec) {
+			.exec_queue_id = ctx.exec_queue_id,
+			.num_syncs = n_batch_syncs,
+			.syncs = (uintptr_t)batch_syncs,
+			.address = batch_bo.addr,
+			.num_batch_buffer = 1,
+		};
+		for (retries = 0; retries < max_retries; retries++) {
+			rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+			if (!(rc && errno == ENOMEM))
+				break;
+
+			usleep(100 * retries);
+			if (retries == 0)
+				igt_warn("got ENOMEM\n");
+		}
+		if (retries == max_retries)
+			igt_warn("gave up after %d retries\n", retries);
+
+		if (rc) {
+			igt_warn("errno: %d (%s)\n", errno, strerror(errno));
+			perror(__func__);
+		}
+		igt_assert_eq(rc, 0);
+
+		if (retries)
+			igt_debug("!!!!!! succeeded after %d retries !!!!!!\n",
+				  retries);
+
+		/* We need to wait for the GPU to finish. */
+		igt_assert(syncobj_timeline_wait(fd, &batch_syncobj,
+						 &timeline_val, 1, INT64_MAX, 0, NULL));
+		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
+		gpu_result = result_bo.ptr[0];
+		igt_debug("gpu_result = %d\n", gpu_result);
+		igt_debug("expected_result = %d\n", expected_result);
+
+		igt_assert_eq(gpu_result, expected_result);
+		igt_assert_eq(munmap(result_bo.ptr, result_bo.size), 0);
+		result_bo.ptr = NULL;
+
+		gem_close(fd, batch_bo.handle);
+		gem_close(fd, result_bo.handle);
+		gem_close(fd, integers_bo.handle);
+
+		xe_vm_destroy(fd, ctx.vm_id);
+		close(fd);
+	}
+	igt_waitchildren();
+	pthread_barrier_destroy(barrier);
+	munmap(barrier, sizeof(pthread_barrier_t));
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2849,6 +3282,11 @@ int igt_main()
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
2.43.0

