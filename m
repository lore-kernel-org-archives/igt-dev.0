Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8B2CD8CA3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 16:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7413810E8CA;
	Thu, 13 Nov 2025 16:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaTc06Ul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F19410E8C3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051317; x=1794587317;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A7Cv6g2SsR9uDbYEGNR6vXTvCabWhigLhPEsNaIG6P0=;
 b=BaTc06UlZze3GJglFL/WlxxDAL+PWnzPxQP13U79jSVX3eqx+MnWd+xR
 6V0KrHmUxFcDOJUEtmskbJ2KtOZmsSWAUGa0rY940fWOJ3RrBduANHVD6
 X6Cu7usn9b9163BQ2Y5wy2pM/RQ9EwmuIZG6i1FiHC8pTm4rYCOmjtjAR
 kIJMp/okqDtxwVcrqBqeUaqUBPg7BfWx2OvFjdwp9NB/XIdnbDzlQmkiP
 7VYFjkxMwkgSReCwrLMYh4JO4UBA6w9PbefOaBKMflex/BYZljYLCPIRv
 FWRb4orET6ZM2SUij2QYdXUD2tdRCbLKyqGJv5VWA/qEfqyvGUe9iPJCQ Q==;
X-CSE-ConnectionGUID: xvSxnmS6QTWPXEEAb+U4yg==
X-CSE-MsgGUID: kL2ZyCpoSb+wIMskRuTsOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65074323"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65074323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:28:36 -0800
X-CSE-ConnectionGUID: maWyCbcTTyKlV6tuj4Jp4w==
X-CSE-MsgGUID: pFYxDwMwTL6+07hSBfQBQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193984001"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by orviesa004.jf.intel.com with ESMTP; 13 Nov 2025 08:28:36 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v7 03/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 cross-GPU memory access test
Date: Thu, 13 Nov 2025 16:28:28 +0000
Message-ID: <20251113162834.633575-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113162834.633575-1-nishit.sharma@intel.com>
References: <20251113162834.633575-1-nishit.sharma@intel.com>
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

This test allocates a buffer in SVM, writes data to it from src GPU , and reads/verifies
the data from dst GPU. Optionally, the CPU also reads or modifies the buffer and both
GPUs verify the results, ensuring correct cross-GPU and CPU memory access in a
multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 373 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 374 insertions(+)
 create mode 100644 tests/intel/xe_multi_gpusvm.c

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
new file mode 100644
index 000000000..6614ea3d1
--- /dev/null
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
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
+ * TEST: Basic multi-gpu SVM testing
+ * Category: SVM
+ * Mega feature: Compute
+ * Sub-category: Compute tests
+ * Functionality: SVM p2p access, madvise and prefetch.
+ * Test category: functionality test
+ *
+ * SUBTEST: cross-gpu-mem-access
+ * Description:
+ *      This test creates two malloced regions, places the destination
+ *      region both remotely and locally and copies to it. Reads back to
+ *      system memory and checks the result.
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
+struct xe_svm_gpu_info {
+	bool supports_faults;
+	int vram_regions[MAX_XE_REGIONS];
+	unsigned int num_regions;
+	unsigned int va_bits;
+	int fd;
+};
+
+struct multigpu_ops_args {
+	bool prefetch_req;
+	bool op_mod;
+};
+
+typedef void (*gpu_pair_fn) (
+		struct xe_svm_gpu_info *src,
+		struct xe_svm_gpu_info *dst,
+		struct drm_xe_engine_class_instance *eci,
+		void *extra_args
+);
+
+static void for_each_gpu_pair(int num_gpus,
+			      struct xe_svm_gpu_info *gpus,
+			      struct drm_xe_engine_class_instance *eci,
+			      gpu_pair_fn fn,
+			      void *extra_args);
+
+static void gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
+				   struct xe_svm_gpu_info *dst,
+				   struct drm_xe_engine_class_instance *eci,
+				   void *extra_args);
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
+setup_sync(struct drm_xe_sync *sync, volatile uint64_t **sync_addr, uint64_t timeline_value)
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
+				uint16_t instance, uint32_t exec_queue, int local_fd,
+				uint16_t local_vram)
+{
+	int ret;
+
+#define SYSTEM_MEMORY	0
+	if (src_fd != dst_fd) {
+		ret = xe_vm_madvise(src_fd, vm, addr, size, ext, type, dst_fd, policy, instance);
+		if (ret == -ENOLINK) {
+			igt_info("No fast interconnect between GPU0 and GPU1, falling back to local VRAM\n");
+			ret = xe_vm_madvise(src_fd, vm, addr, size, ext, type, local_fd,
+					    policy, local_vram);
+			if (ret) {
+				igt_info("Local VRAM madvise failed, falling back to system memory\n");
+				ret = xe_vm_madvise(src_fd, vm, addr, size, ext, type,
+						    SYSTEM_MEMORY, policy, SYSTEM_MEMORY);
+				igt_assert_eq(ret, 0);
+			}
+		} else {
+			igt_assert_eq(ret, 0);
+		}
+	} else {
+		ret = xe_vm_madvise(src_fd, vm, addr, size, ext, type, dst_fd, policy, instance);
+		igt_assert_eq(ret, 0);
+
+	}
+
+}
+
+static void xe_multigpu_prefetch(int src_fd, uint32_t vm, uint64_t addr, uint64_t size,
+				 struct drm_xe_sync *sync, volatile uint64_t *sync_addr,
+				 uint32_t exec_queue, bool prefetch_req)
+{
+	if (prefetch_req) {
+		xe_vm_prefetch_async(src_fd, vm, 0, 0, addr, size, sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != sync->timeline_value)
+			xe_wait_ufence(src_fd, (uint64_t *)sync_addr, sync->timeline_value,
+				       exec_queue, NSEC_PER_SEC * 10);
+	}
+	free((void *)sync_addr);
+}
+
+static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
+			      struct drm_xe_engine_class_instance *eci,
+			      gpu_pair_fn fn, void *extra_args)
+{
+	for (int src = 0; src < num_gpus; src++) {
+		if(!gpus[src].supports_faults)
+			continue;
+
+		for (int dst = 0; dst < num_gpus; dst++) {
+			if (src == dst)
+				continue;
+			fn(&gpus[src], &gpus[dst], eci, extra_args);
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
+	cmd = (uint32_t *) batch;
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
+        /* Unmap the batch bo by re-instating the SVM binding. */
+        xe_vm_bind_lr_sync(fd, vm, 0, 0, addr, BATCH_SIZE(fd),
+                           DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+        gem_close(fd, bo);
+}
+
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
+static void
+copy_src_dst(struct xe_svm_gpu_info *gpu0,
+	     struct xe_svm_gpu_info *gpu1,
+	     struct drm_xe_engine_class_instance *eci,
+	     bool prefetch_req)
+{
+	uint32_t vm[1];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo;
+	void *copy_src, *copy_dst;
+	uint64_t batch_addr;
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+	int local_fd = gpu0->fd;
+	uint16_t local_vram = gpu0->vram_regions[0];
+
+	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
+
+	/* Allocate source and destination buffers */
+	copy_src = aligned_alloc(xe_get_default_alignment(gpu0->fd), SZ_64M);
+	igt_assert(copy_src);
+	copy_dst = aligned_alloc(xe_get_default_alignment(gpu1->fd), SZ_64M);
+	igt_assert(copy_dst);
+
+	/*
+	 * Initialize, map and bind the batch bo. Note that Xe doesn't seem to enjoy
+	 * batch buffer memory accessed over PCIe p2p.
+	 */
+	batch_init(gpu0->fd, vm[0], to_user_pointer(copy_src), to_user_pointer(copy_dst),
+		   COPY_SIZE, &batch_bo, &batch_addr);
+
+	/* Fill the source with a pattern, clear the destination. */
+	memset(copy_src, 0x67, COPY_SIZE);
+	memset(copy_dst, 0x0, COPY_SIZE);
+
+	xe_multigpu_madvise(gpu0->fd, vm[0], to_user_pointer(copy_dst), COPY_SIZE,
+			     0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			     gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0],
+			     local_fd, local_vram);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu0->fd, vm[0], to_user_pointer(copy_dst), COPY_SIZE, &sync,
+			     sync_addr, exec_queue[0], prefetch_req);
+
+	sync_addr = (void *)((char *)batch_addr + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* Execute a GPU copy. */
+	xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert(memcmp(copy_src, copy_dst, COPY_SIZE) == 0);
+
+	free(copy_dst);
+	free(copy_src);
+	munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+	batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
+}
+
+static void
+gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
+		       struct xe_svm_gpu_info *dst,
+		       struct drm_xe_engine_class_instance *eci,
+		       void *extra_args)
+{
+	struct multigpu_ops_args *args = (struct multigpu_ops_args *)extra_args;
+	igt_assert(src);
+	igt_assert(dst);
+
+	copy_src_dst(src, dst, eci, args->prefetch_req);
+}
+
+igt_main
+{
+	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
+	struct xe_device *xe;
+	int gpu, gpu_cnt;
+
+	struct drm_xe_engine_class_instance eci = {
+                .engine_class = DRM_XE_ENGINE_CLASS_COPY,
+        };
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
+	igt_subtest("cross-gpu-mem-access") {
+		struct multigpu_ops_args op_args;
+		op_args.prefetch_req = 1;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_mem_access_wrapper, &op_args);
+		op_args.prefetch_req = 0;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_mem_access_wrapper, &op_args);
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
index 9736f2338..1209f84a4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,6 +313,7 @@ intel_xe_progs = [
 	'xe_media_fill',
 	'xe_mmap',
 	'xe_module_load',
+        'xe_multi_gpusvm',
 	'xe_noexec_ping_pong',
 	'xe_oa',
 	'xe_pat',
-- 
2.48.1

