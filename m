Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA69BD11707
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 15:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088F810E68C;
	Tue,  2 Dec 2025 15:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMi3HUkb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEED10E681
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 15:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691193; x=1796227193;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=FZJHn3QGuuEz6SRrqU9HGJexpt6mvJCiyL6YkjJXWjY=;
 b=iMi3HUkbZ2p1Vj5g3g8ZPragu1GU60OcGjVRM0egU6n8VIKmJ2Fm1tYS
 RRBvVrcTyFFLCjjfFZQcHfgza+ylqTLshSKjBjWmz+4ucqkKYgFuCh/62
 a3o39R7h21HD8OzmvJFFLZRDg5HqRpucdTuemUY/5uUi4kDWixTwK39fE
 v3lQFWfz8fOH1fp+CdHWXa8bdSfCQ6QGHcXMpoId+q5uhs4XJUKcLIPXw
 F26lPwcZ8MtxFz5SzI2zQxVJiOO6tAv2varQV990x089kgjlVespnGS0x
 8nqCTrIPuDZoF79FIVDn0jAwnQ16JM3DgQQbXDbG1N5V/n+jbDRvmrnVS A==;
X-CSE-ConnectionGUID: h4v3FdPiRtmyv2erB+zj4A==
X-CSE-MsgGUID: 0f6sheapRcStt8TJDGZcNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84059534"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="84059534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:59:52 -0800
X-CSE-ConnectionGUID: XJ/784gFT4ir/mphnzzRFw==
X-CSE-MsgGUID: GVE+SNAaTaKcunfJvMuTEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198600774"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 07:59:52 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH v10 03/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU xGPU
 memory access test
Date: Tue,  2 Dec 2025 15:59:44 +0000
Message-ID: <20251202155951.21369-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251202155951.21369-1-nishit.sharma@intel.com>
References: <20251202155951.21369-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Nishit Sharma <nishit.sharma@intel.com>

This test allocates a buffer in SVM, writes data to it from src GPU,
and reads/verifies the data from dst GPU. Optionally, the CPU also
reads or modifies the buffer and both GPUs verify the results,
ensuring correct cross-GPU and CPU memory access in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_multigpu_svm.c | 397 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   3 +-
 2 files changed, 399 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_multigpu_svm.c

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
new file mode 100644
index 000000000..85fea72bb
--- /dev/null
+++ b/tests/intel/xe_multigpu_svm.c
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <unistd.h>
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_multigpu.h"
+
+#include "intel_blt.h"
+#include "intel_mocs.h"
+#include "intel_reg.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
+
+/**
+ * TEST: Multi-GPU SVM functional and performance tests
+ * Description: Validate multi-GPU Shared Virtual Memory (SVM) features,
+ *		including cross-GPU access, atomic operations, coherency
+ *
+ * Category: Multi-GPU
+ * Mega feature: SVM, GPU virtualization
+ * Sub-category: SVM, memory management, performance
+ * Functionality: Multi-GPU SVM, migration, coherency, atomic ops
+ * Test category: functional, performance, stress
+ *
+ * SUBTEST: mgpu-xgpu-access-basic
+ * Description:
+ *	Test basic cross-GPU memory access in multi-GPU SVM configuration
+ *
+ * SUBTEST: mgpu-xgpu-access-prefetch
+ * Description:
+ *	Test cross-GPU memory access with prefetch in multi-GPU SVM configuration
+ *
+ */
+
+#define MAX_XE_REGIONS	8
+#define MAX_XE_GPUS 8
+#define NUM_LOOPS 1
+#define BATCH_SIZE(_fd) ALIGN(SZ_8K, xe_get_default_alignment(_fd))
+#define BIND_SYNC_VAL 0x686868
+#define EXEC_SYNC_VAL 0x676767
+#define COPY_SIZE SZ_64M
+
+#define MULTIGPU_PREFETCH		BIT(1)
+#define MULTIGPU_XGPU_ACCESS		BIT(2)
+
+struct xe_svm_gpu_info {
+	bool supports_faults;
+	int vram_regions[MAX_XE_REGIONS];
+	unsigned int num_regions;
+	unsigned int va_bits;
+	int fd;
+};
+
+typedef void (*gpu_pair_fn)(struct xe_svm_gpu_info *src,
+			    struct xe_svm_gpu_info *dst,
+			    struct drm_xe_engine_class_instance *eci,
+			    unsigned int flags);
+
+static void for_each_gpu_pair(int num_gpus,
+			      struct xe_svm_gpu_info *gpus,
+			      struct drm_xe_engine_class_instance *eci,
+			      gpu_pair_fn fn,
+			      unsigned int flags);
+
+static void gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
+				   struct xe_svm_gpu_info *dst,
+				   struct drm_xe_engine_class_instance *eci,
+				   unsigned int flags);
+
+static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
+
+static void
+create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
+		    uint32_t *vm, uint32_t *exec_queue)
+{
+	*vm = xe_vm_create(gpu->fd,
+			   DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	*exec_queue = xe_exec_queue_create(gpu->fd, *vm, eci, 0);
+	xe_vm_bind_lr_sync(gpu->fd, *vm, 0, 0, 0, 1ull << gpu->va_bits,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+}
+
+static void
+setup_sync(struct drm_xe_sync *sync, uint64_t **sync_addr, uint64_t timeline_value)
+{
+	*sync_addr = malloc(sizeof(**sync_addr));
+	igt_assert(*sync_addr);
+	sync->flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync->type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync->addr = to_user_pointer((uint64_t *)*sync_addr);
+	sync->timeline_value = timeline_value;
+	**sync_addr = 0;
+}
+
+static void
+cleanup_vm_and_queue(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue)
+{
+	xe_vm_unbind_lr_sync(gpu->fd, vm, 0, 0, 1ull << gpu->va_bits);
+	xe_exec_queue_destroy(gpu->fd, exec_queue);
+	xe_vm_destroy(gpu->fd, vm);
+}
+
+static void xe_multigpu_madvise(int src_fd, uint32_t vm, uint64_t addr, uint64_t size,
+				uint64_t ext, uint32_t type, int dst_fd, uint16_t policy,
+				uint32_t instance, uint32_t exec_queue)
+{
+	int ret;
+
+	if (src_fd != dst_fd) {
+		ret = __xe_vm_madvise(src_fd, vm, addr, size, ext, type, dst_fd, policy, instance);
+		if (ret == -ENOLINK) {
+			igt_info("No fast interconnect between GPU0 and GPU1, falling back to local VRAM\n");
+			ret = __xe_vm_madvise(src_fd, vm, addr, size, ext, type,
+					      DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+					      policy, 0);
+			if (ret) {
+				igt_info("Local VRAM madvise failed, falling back to system memory\n");
+				xe_vm_madvise(src_fd, vm, addr, size, ext, type,
+					      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, policy,
+					      0);
+			}
+		} else {
+			igt_assert_eq(ret, 0);
+		}
+	} else {
+		xe_vm_madvise(src_fd, vm, addr, size, ext, type, dst_fd, policy, instance);
+	}
+}
+
+static void xe_multigpu_prefetch(int src_fd, uint32_t vm, uint64_t addr, uint64_t size,
+				 struct drm_xe_sync *sync, uint64_t *sync_addr,
+				 uint32_t exec_queue, unsigned int flags)
+{
+	if (flags & MULTIGPU_PREFETCH) {
+		xe_vm_prefetch_async(src_fd, vm, 0, 0, addr, size, sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != sync->timeline_value)
+			xe_wait_ufence(src_fd, (uint64_t *)sync_addr, sync->timeline_value,
+				       exec_queue, NSEC_PER_SEC * 10);
+	}
+}
+
+static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
+			      struct drm_xe_engine_class_instance *eci,
+			      gpu_pair_fn fn, unsigned int flags)
+{
+	for (int src = 0; src < num_gpus; src++) {
+		if (!gpus[src].supports_faults)
+			continue;
+
+		for (int dst = 0; dst < num_gpus; dst++) {
+			if (src == dst)
+				continue;
+			fn(&gpus[src], &gpus[dst], eci, flags);
+		}
+	}
+}
+
+static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
+		       uint64_t dst_addr, uint64_t copy_size,
+		       uint32_t *bo, uint64_t *addr)
+{
+	uint32_t width = copy_size / 256;
+	uint32_t height = 1;
+	uint32_t batch_bo_size = BATCH_SIZE(fd);
+	uint32_t batch_bo;
+	uint64_t batch_addr;
+	void *batch;
+	uint32_t *cmd;
+	uint32_t mocs_index = intel_get_uc_mocs_index(fd);
+	int i = 0;
+
+	batch_bo = xe_bo_create(fd, vm, batch_bo_size, vram_if_possible(fd, 0), 0);
+	batch = xe_bo_map(fd, batch_bo, batch_bo_size);
+	cmd = (uint32_t *)batch;
+	cmd[i++] = MEM_COPY_CMD | (1 << 19);
+	cmd[i++] = width - 1;
+	cmd[i++] = height - 1;
+	cmd[i++] = width - 1;
+	cmd[i++] = width - 1;
+	cmd[i++] = src_addr & ((1UL << 32) - 1);
+	cmd[i++] = src_addr >> 32;
+	cmd[i++] = dst_addr & ((1UL << 32) - 1);
+	cmd[i++] = dst_addr >> 32;
+	cmd[i++] = mocs_index << XE2_MEM_COPY_MOCS_SHIFT | mocs_index;
+	cmd[i++] = MI_BATCH_BUFFER_END;
+	cmd[i++] = MI_BATCH_BUFFER_END;
+
+	batch_addr = to_user_pointer(batch);
+	/* Punch a gap in the SVM map where we map the batch_bo */
+	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size, 0);
+	*bo = batch_bo;
+	*addr = batch_addr;
+}
+
+static void batch_fini(int fd, uint32_t vm, uint32_t bo, uint64_t addr)
+{
+	/* Unmap the batch bo by re-instating the SVM binding. */
+	xe_vm_bind_lr_sync(fd, vm, 0, 0, addr, BATCH_SIZE(fd),
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+	gem_close(fd, bo);
+}
+
+static void open_pagemaps(int fd, struct xe_svm_gpu_info *info)
+{
+	unsigned int count = 0;
+	uint64_t regions = all_memory_regions(fd);
+	uint32_t region;
+
+	xe_for_each_mem_region(fd, regions, region) {
+		if (XE_IS_VRAM_MEMORY_REGION(fd, region)) {
+			struct drm_xe_mem_region *mem_region =
+				xe_mem_region(fd, 1ull << (region - 1));
+			igt_assert(count < MAX_XE_REGIONS);
+			info->vram_regions[count++] = mem_region->instance;
+		}
+	}
+
+	info->num_regions = count;
+}
+
+static int get_device_info(struct xe_svm_gpu_info gpus[], int num_gpus)
+{
+	int cnt;
+	int xe;
+	int i;
+
+	for (i = 0, cnt = 0 && i < 128; cnt < num_gpus; i++) {
+		xe = __drm_open_driver_another(i, DRIVER_XE);
+		if (xe < 0)
+			break;
+
+		gpus[cnt].fd = xe;
+		cnt++;
+	}
+
+	return cnt;
+}
+
+static int
+mgpu_check_fault_support(struct xe_svm_gpu_info *gpu1,
+			 struct xe_svm_gpu_info *gpu2)
+{
+	int ret = 0;
+
+	if (!gpu1->supports_faults || !gpu2->supports_faults) {
+		igt_debug("GPU does not support page faults, skipping execution\n");
+		ret = 1;
+	}
+	return ret;
+}
+
+static void
+copy_src_dst(struct xe_svm_gpu_info *gpu1,
+	     struct xe_svm_gpu_info *gpu2,
+	     struct drm_xe_engine_class_instance *eci,
+	     unsigned int flags)
+{
+	uint32_t vm[1];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo;
+	void *copy_src, *copy_dst;
+	uint64_t batch_addr;
+	struct drm_xe_sync sync = {};
+	uint64_t *sync_addr;
+
+	/* Checking if GPU support page faults */
+	if (mgpu_check_fault_support(gpu1, gpu2))
+		return;
+
+	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
+
+	/* Allocate source and destination buffers */
+	copy_src = aligned_alloc(xe_get_default_alignment(gpu1->fd), SZ_64M);
+	igt_assert(copy_src);
+	copy_dst = aligned_alloc(xe_get_default_alignment(gpu2->fd), SZ_64M);
+	igt_assert(copy_dst);
+
+	batch_init(gpu1->fd, vm[0], to_user_pointer(copy_src), to_user_pointer(copy_dst),
+		   COPY_SIZE, &batch_bo, &batch_addr);
+
+	/* Fill the source with a pattern, clear the destination. */
+	memset(copy_src, 0x67, COPY_SIZE);
+	memset(copy_dst, 0x0, COPY_SIZE);
+
+	xe_multigpu_madvise(gpu1->fd, vm[0], to_user_pointer(copy_dst), COPY_SIZE,
+			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[0]);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu1->fd, vm[0], to_user_pointer(copy_dst), COPY_SIZE, &sync,
+			     sync_addr, exec_queue[0], flags);
+	free(sync_addr);
+
+	sync_addr = (void *)((char *)batch_addr + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	WRITE_ONCE(*sync_addr, 0);
+
+	/* Execute a GPU copy. */
+	xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr, &sync, 1);
+	if (READ_ONCE(*sync_addr) != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert(memcmp(copy_src, copy_dst, COPY_SIZE) == 0);
+
+	free(copy_dst);
+	free(copy_src);
+	munmap((void *)batch_addr, BATCH_SIZE(gpu1->fd));
+	batch_fini(gpu1->fd, vm[0], batch_bo, batch_addr);
+	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
+}
+
+static void
+gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
+		       struct xe_svm_gpu_info *dst,
+		       struct drm_xe_engine_class_instance *eci,
+		       unsigned int flags)
+{
+	igt_assert(src);
+	igt_assert(dst);
+
+	copy_src_dst(src, dst, eci, flags);
+}
+
+static void
+test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
+	       struct drm_xe_engine_class_instance *eci,
+	       unsigned int flags)
+{
+	if (flags & MULTIGPU_XGPU_ACCESS)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_mem_access_wrapper, flags);
+}
+
+struct section {
+	const char *name;
+	unsigned int flags;
+};
+
+IGT_TEST_DESCRIPTION("Validate multi-GPU SVM features including xGPU, atomic-ops");
+
+igt_main
+{
+	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
+	struct xe_device *xe;
+	int gpu, gpu_cnt;
+
+	struct drm_xe_engine_class_instance eci = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+
+	const struct section msections[] = {
+		{ "xgpu-access-basic", MULTIGPU_XGPU_ACCESS },
+		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_XGPU_ACCESS },
+		{ NULL },
+	};
+
+	igt_fixture {
+		gpu_cnt = get_device_info(gpus, ARRAY_SIZE(gpus));
+		igt_skip_on(gpu_cnt < 2);
+
+		for (gpu = 0; gpu < gpu_cnt; ++gpu) {
+			igt_assert(gpu < MAX_XE_GPUS);
+
+			open_pagemaps(gpus[gpu].fd, &gpus[gpu]);
+			/* NOTE! inverted return value. */
+			gpus[gpu].supports_faults = !xe_supports_faults(gpus[gpu].fd);
+			fprintf(stderr, "GPU %u has %u VRAM regions%s, and %s SVM VMs.\n",
+				gpu, gpus[gpu].num_regions,
+				gpus[gpu].num_regions != 1 ? "s" : "",
+				gpus[gpu].supports_faults ? "supports" : "doesn't support");
+
+			xe = xe_device_get(gpus[gpu].fd);
+			gpus[gpu].va_bits = xe->va_bits;
+		}
+	}
+
+	igt_describe("gpu-gpu write-read");
+	for (const struct section *s = msections; s->name; s++) {
+		igt_subtest_f("mgpu-%s", s->name)
+			test_mgpu_exec(gpu_cnt, gpus, &eci, s->flags);
+	}
+
+	igt_fixture {
+		int cnt;
+
+		for (cnt = 0; cnt < gpu_cnt; cnt++)
+			drm_close_driver(gpus[cnt].fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index c505ce5cc..68cbff48c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,7 +313,8 @@ intel_xe_progs = [
 	'xe_live_ktest',
 	'xe_media_fill',
 	'xe_mmap',
-	'xe_module_load',
+        'xe_module_load',
+        'xe_multigpu_svm',
 	'xe_noexec_ping_pong',
 	'xe_oa',
 	'xe_pat',
-- 
2.48.1

