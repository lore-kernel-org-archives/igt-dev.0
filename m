Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3885FCCFA19
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 14:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B912D10E792;
	Wed,  5 Nov 2025 14:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KykhJXdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C671310E78F
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762354392; x=1793890392;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aMDRW4G3+p1tEO5AZdEyRjuwMg7LO76wJbQseu8Bn84=;
 b=KykhJXdhO24dqrF7PH+Jn2o7mQBwp8T1hxaIwNVDQJd2zxXpgSRgET/W
 Eue6SeZ69NnIRD60c7gGTcrky4jJ9VgiVn9jI7oDmjX2So1e0fwjulc1Y
 shIU8oiS8axYB2yyColpEaCPwZ7blTplO4TWEFP3tQ8n7a52vSeLV6LkH
 Y8OcKS4m0xNN5uBXztdAuUbS2EMw8KNJy/xHN+9wIUDFdT2/190rSmZZ+
 NbjhEpD3qAp/xAG6khjRGV7inn7gb0QbacgryQ3Tr9rq7pm3YHJbi3ChU
 AAzDVfTO6x0d/f50Wa90HAT1v1RxWfQ631LObv34dZ0uoxZInZyf9Ri/Y g==;
X-CSE-ConnectionGUID: JL1N8+m3RQ2iCz5FAq8+Tw==
X-CSE-MsgGUID: +0+Ml0VaTsS2KIozOUSJsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64165784"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="64165784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 06:53:12 -0800
X-CSE-ConnectionGUID: 9+refpotRMqujX/mq66bYw==
X-CSE-MsgGUID: nKu6H45LRkWDvWBRUdPJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187167719"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 06:53:12 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v4 1/7] tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU
 cross-GPU memory access test
Date: Wed,  5 Nov 2025 14:53:05 +0000
Message-ID: <20251105145311.32403-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251105145311.32403-1-nishit.sharma@intel.com>
References: <20251105145311.32403-1-nishit.sharma@intel.com>
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

This test allocates a buffer in SVM, writes data to it from GPU 1, and reads/verifies
the data from GPU 2. Optionally, the CPU also reads or modifies the buffer and both
GPUs verify the results, ensuring correct cross-GPU and CPU memory access in a
multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/xe/xe_ioctl.c             |  40 +++++
 lib/xe/xe_ioctl.h             |   5 +
 tests/intel/xe_multi_gpusvm.c | 265 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 4 files changed, 311 insertions(+)
 create mode 100644 tests/intel/xe_multi_gpusvm.c

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 60c972407..52ac6f1b7 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -746,3 +746,43 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy,
 				      instance), 0);
 }
+
+#define	BIND_SYNC_VAL	0x686868
+void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			uint64_t addr, uint64_t size, uint32_t flags)
+{
+	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.addr = to_user_pointer((uint64_t *)sync_addr),
+		.timeline_value = BIND_SYNC_VAL,
+	};
+
+	igt_assert(!!sync_addr);
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, size, &sync, 1, flags);
+	if (*sync_addr != BIND_SYNC_VAL)
+		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
+	/* Only free if the wait succeeds */
+	free((void *)sync_addr);
+}
+
+void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
+			  uint64_t addr, uint64_t size)
+{
+	volatile uint64_t *sync_addr = malloc(sizeof(*sync_addr));
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.addr = to_user_pointer((uint64_t *)sync_addr),
+		.timeline_value = BIND_SYNC_VAL,
+	};
+
+	igt_assert(!!sync_addr);
+	*sync_addr = 0;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, size, &sync, 1);
+	if (*sync_addr != BIND_SYNC_VAL)
+		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
+	free((void *)sync_addr);
+}
+
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 5413b504e..4c90c5165 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -109,4 +109,9 @@ int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
 struct drm_xe_mem_range_attr
 *xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start,
 				    uint64_t range, uint32_t *num_ranges);
+void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
+			uint64_t offset, uint64_t addr,
+			uint64_t size, uint32_t flags);
+void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
+			  uint64_t addr, uint64_t size);
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
new file mode 100644
index 000000000..a88b46323
--- /dev/null
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -0,0 +1,265 @@
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
+        bool supports_faults;
+	int vram_regions[MAX_XE_REGIONS];
+	unsigned int num_regions;
+	unsigned int va_bits;
+	int fd;
+};
+
+static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
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
+	     struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm[1];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo;
+	void *copy_src, *copy_dst;
+	uint64_t batch_addr;
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+
+	vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+	xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
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
+			COPY_SIZE, &batch_bo, &batch_addr);
+
+	/* Fill the source with a pattern, clear the destination. */
+	memset(copy_src, 0x67, COPY_SIZE);
+	memset(copy_dst, 0x0, COPY_SIZE);
+
+	/* Place destination in an optionally remote location to test */
+	xe_vm_madvise(gpu0->fd, vm[0], to_user_pointer(copy_dst), COPY_SIZE, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+	sync_addr = malloc(sizeof(*sync_addr));
+	igt_assert(!!sync_addr);
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = BIND_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* Prefetch half of destination */
+	xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, to_user_pointer(copy_dst),
+			     COPY_SIZE / 2, &sync, 1,
+			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+	if (*sync_addr != BIND_SYNC_VAL)
+		xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[0],
+				NSEC_PER_SEC * 10);
+	free((void *)sync_addr);
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
+	xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
+	xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
+	xe_vm_destroy(gpu0->fd, vm[0]);
+}
+
+static void
+gpu_mem_access(struct xe_svm_gpu_info *src_gpu,
+	       struct xe_svm_gpu_info *dst_gpu,
+	       struct drm_xe_engine_class_instance *eci)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+	copy_src_dst(src_gpu, dst_gpu, eci);
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
+		 for (gpu = 0; gpu < gpu_cnt; ++gpu) {
+			 igt_assert(gpu < MAX_XE_GPUS);
+
+			 open_pagemaps(gpus[gpu].fd, &gpus[gpu]);
+			 /* NOTE! inverted return value. */
+			 gpus[gpu].supports_faults = !xe_supports_faults(gpus[gpu].fd);
+			 fprintf(stderr, "GPU %u has %u VRAM regions%s, and %s SVM VMs.\n",
+				 gpu, gpus[gpu].num_regions,
+				 gpus[gpu].num_regions != 1 ? "s" : "",
+				 gpus[gpu].supports_faults ? "supports" : "doesn't support");
+
+			 xe = xe_device_get(gpus[gpu].fd);
+			 gpus[gpu].va_bits = xe->va_bits;
+		 }
+	}
+
+	igt_describe("gpu-gpu write-read");
+	igt_subtest("cross-gpu-mem-access")
+		gpu_mem_access(&gpus[0], &gpus[1], &eci);
+
+	igt_fixture {
+		int cnt;
+
+		for (cnt = 0; cnt < gpu_cnt; cnt++)
+			drm_close_driver(gpus[cnt].fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 530d33d05..fc386c3be 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,6 +313,7 @@ intel_xe_progs = [
 	'xe_mmap',
 	'xe_module_load',
 	'xe_multisvm',
+        'xe_multi_gpusvm',
 	'xe_noexec_ping_pong',
 	'xe_oa',
 	'xe_pat',
-- 
2.48.1

