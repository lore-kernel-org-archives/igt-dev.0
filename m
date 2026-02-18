Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F57E9A047
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 16:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B01789BE8;
	Wed, 18 Feb 2026 16:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYXEwtNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C4289BE8
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771433082; x=1802969082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U48TwIAceoSDLykZeRnmuZDZfbOw/OQ8zBR0xONuFQk=;
 b=bYXEwtNapElJR3r7GjrUz5omHgaUcpFD/wBvZyH4M/9++sTTAlyKVSfu
 Nojy5T25n4nG9DKYVFt3KzjiRSft7Arfahq/KZ2dydpTK71kq52+bjqCk
 y/pY6cytN7Ody53wP8ZJx+YZF/d/MbBd0Pf0tSpdqnOdC4pKDLxyZBDXf
 NZJXy5eNgK9w05eaVqwjAmFCG1mfCsDkkvW4cmerD6gGqfefBaKo6+2p/
 s7yd84RH0hUjZVP8QswyWUPxDsZbk/437hrIQZwj8zwDthiichsjSGBCH
 GX5lYALDByccajaH80arwyWKNdypAS7zpj97wCvMm0AcaApoY9Ble9pOM A==;
X-CSE-ConnectionGUID: xIB9huSQT8iS50BhANFuvw==
X-CSE-MsgGUID: V7eDyaPNTaqG3uo3FiOWDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72555947"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72555947"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 08:44:42 -0800
X-CSE-ConnectionGUID: c9Le4lrvSg22c5vuGxiuIQ==
X-CSE-MsgGUID: A7zrjLg2SZesWEB7fqXEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="251936463"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 08:44:42 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] tests/xe_vm: Add oversubscribe concurrent bind
 stress test
Date: Wed, 18 Feb 2026 16:44:17 +0000
Message-ID: <20260218164417.856114-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218164417.856114-1-sobin.thomas@intel.com>
References: <20260218164417.856114-1-sobin.thomas@intel.com>
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

Add an xe_vm subtest that oversubscribes VRAM and issues
concurrent binds into a single VM (scratch-page mode) to
reproduce the dma-resv/bind race found under memory pressure.
Prior coverage lacked any case that combined multi-process bind
pressure with VRAM oversubscription, so bind/submit could
panic (NULL deref in xe_pt_stage_bind) instead of failing cleanly.
The new test expects successful completion or ENOMEM/EDEADLK.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 421 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 421 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ccff8f804..5c9d5ff0f 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -21,6 +21,176 @@
 #include "xe/xe_spin.h"
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
+
+	uint32_t exec_queue_id;
+
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
+static void vm_bind_gem_bo(int fd, struct xe_test_ctx *ctx, uint32_t handle, uint64_t addr, uint64_t size)
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
+	igt_info("Bind returned %d\n", rc);
+	igt_assert(rc == 0);
+
+	/* The right way to do this in the real world is to not wait for the
+	 * syncobj here - since it just makes everything synchronous -, but
+	 * instead pass the syncobj as a 'wait'-type object to thie execbuf
+	 * ioctl. We do it here just to make the example simpler.
+	 */
+	//wait_syncobj(fd,syncobj_handle, timeline_val);
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
@@ -2450,6 +2620,252 @@ static void test_oom(int fd)
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
+static void test_vm_oversubscribe_concurrent_bind(int fd, int n_vram_bufs,
+						  int n_sram_bufs, int n_proc)
+{
+	igt_fork(child, n_proc) {
+		struct xe_test_ctx ctx = {0};
+		int rc;
+		uint64_t addr = GB(1);
+		struct timespec start, end;
+		uint32_t vram_binds_syncobj, sram_binds_syncobj;
+		struct gem_bo vram_bufs[n_vram_bufs];
+		struct gem_bo sram_bufs[n_sram_bufs];
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
+			igt_info("vram buffer %d created at 0x%016lx\n",
+				 i, bo->addr);
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
+			igt_info("sram buffer %d created at 0x%016lx\n",
+				 i, bo->addr);
+		}
+		igt_info("\n Binding the buffers to the vm");
+
+		if (n_vram_bufs) {
+			igt_info("binding vram buffers");
+			vram_binds_syncobj = vm_bind_gem_bos(fd, &ctx, vram_bufs, n_vram_bufs);
+		}
+		if (n_sram_bufs) {
+			igt_info("binding sram buffers");
+			sram_binds_syncobj = vm_bind_gem_bos(fd, &ctx, sram_bufs, n_sram_bufs);
+		}
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
+			igt_info("%d", random_int);
+			if (i + 1 != ints_to_add)
+				igt_info(" + ");
+			else
+				igt_info(" = ");
+		}
+		igt_assert_eq(munmap(integers_bo.ptr, integers_bo.size), 0);
+		integers_bo.ptr = NULL;
+
+		igt_info("Creating the result buffer object");
+
+		result_bo.size = align_to_page_size(sizeof(int));
+		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
+							 system_memory(fd), 0,
+							 DRM_XE_GEM_CPU_CACHING_WC);
+		result_bo.ptr = NULL;
+		result_bo.addr = 0x200000;
+		/* batch_bo contains the commands the GPU will run. */
+
+		igt_info("Creating the batch buffer object");
+		batch_bo.size = 4096;
+		//batch_bo.handle = create_gem_bo_sram(fd, batch_bo.size);
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
+		/* Wait for the other threads to create their stuff too. */
+
+		end = start;
+		end.tv_sec += 5;
+		rc = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &end, NULL);
+		igt_assert_eq(rc, 0);
+
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
+
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
+			igt_info("!!!!!! succeeded after %d retries !!!!!!\n",
+				 retries);
+
+		/* We need to wait for the GPU to finish. */
+		igt_assert(syncobj_timeline_wait(fd, &batch_syncobj,
+						 &timeline_val, 1, INT64_MAX, 0, NULL));
+		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
+		gpu_result = result_bo.ptr[0];
+		igt_info("gpu_result = %d\n", gpu_result);
+		igt_info("expected_result = %d\n", expected_result);
+
+		igt_assert_eq(gpu_result, expected_result);
+		igt_assert_eq(munmap(result_bo.ptr, result_bo.size), 0);
+		result_bo.ptr = NULL;
+
+		end.tv_sec += 10;
+		rc = clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &end, NULL);
+		assert(rc == 0);
+		gem_close(fd, batch_bo.handle);
+		gem_close(fd, result_bo.handle);
+		gem_close(fd, integers_bo.handle);
+
+		xe_vm_destroy(fd, ctx.vm_id);
+		close(fd);
+	}
+	igt_waitchildren();
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2850,6 +3266,11 @@ int igt_main()
 		test_oom(fd);
 	}
 
+	igt_subtest("oversubscribe-concurrent-bind") {
+		igt_require(xe_has_vram(fd));
+		test_vm_oversubscribe_concurrent_bind(fd, 2, 4, 4);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.52.0

