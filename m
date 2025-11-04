Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07566CCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F36A10E61A;
	Tue,  4 Nov 2025 14:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqMHjL9u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBB610E61F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762266597; x=1793802597;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yfKNmYYL/rk4e8kgJ2m3RHM8vYjTymoMA4lJ4LrOJ4o=;
 b=VqMHjL9ufC7WXJxmi2FnqbIOlu0N0Hfg1Ow6fD6h0o+MZcLgeBNimrXw
 PcPGu7sAa6f5QL0LpRr8oTOVBOutlJbZd7W8lLcIWyiIZOIgC81Z0ydhp
 7KxAEVnba5zfF4y8H8sG0HzFRfOOMBAwZOP6H2fbd62Gr2MjLTP8UrHpl
 UDaW+lZwmCp8FWUQSdn/2O3ySDItH0TAeV+uWfs9pwFVx+YlOTp+CP2Bq
 LCEXMPfiG1bhTYl3V0h5nJVrowxXuaBH3xMoqsNww5eZ56oNqwte+yT09
 BT0mKPADwek4yGS9vomRLuQQx84CSpGfxVoZZnisczx/Nki7syrl2R1l2 w==;
X-CSE-ConnectionGUID: +UWe2wMDR9+4SToXw/YN8w==
X-CSE-MsgGUID: HtYcahv2SkeysSzX/MBbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74966178"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74966178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:29:56 -0800
X-CSE-ConnectionGUID: h7S0IP6bSWyzzeM5NA2mYA==
X-CSE-MsgGUID: lI3YIKrlSo634nROW/F1Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192339876"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 06:29:54 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v1 4/7] tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU
 performance test
Date: Tue,  4 Nov 2025 14:29:41 +0000
Message-ID: <20251104142947.51744-5-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104142947.51744-1-nishit.sharma@intel.com>
References: <20251104142947.51744-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This test measures latency and bandwidth for buffer access from each GPU
and the CPU in a multi-GPU SVM environment. It compares performance for
local versus remote access using madvise and prefetch to control buffer
placement

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 444 ++++++++++++++++++++++++++++++++++
 1 file changed, 444 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 2c64de209..aa79c71bd 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -13,6 +13,8 @@
 #include "intel_mocs.h"
 #include "intel_reg.h"
 
+#include "time.h"
+
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -41,6 +43,17 @@
  * Description:
  * 	This test checks coherency in multi-gpu by writing from GPU0
  * 	reading from GPU1 and verify and repeating with CPU and both GPUs
+ *
+ * SUBTEST: conflicting-madvise-gpu
+ * Description:
+ * 	This test checks conflicting madvise by allocating shared buffer
+ * 	prefetches from both and checks for migration conflicts
+ * 	This test checks conflicting madvise
+ *
+ * SUBTEST: latency-multi-gpu
+ * Description:
+ * 	This test measures and compares latency and bandwidth for buffer access
+ * 	from CPU, local GPU, and remote GPU
  */
 
 #define MAX_XE_REGIONS	8
@@ -72,6 +85,11 @@ struct test_exec_data {
 
 static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
 
+static double time_diff(struct timespec *start, struct timespec *end)
+{
+    return (end->tv_sec - start->tv_sec) + (end->tv_nsec - start->tv_nsec) / 1e9;
+}
+
 static void
 atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		  uint32_t *bo, uint64_t *addr)
@@ -465,6 +483,399 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu0,
         xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+static void
+latency_test_multigpu(struct xe_svm_gpu_info *gpu0,
+		      struct xe_svm_gpu_info *gpu1,
+		      struct drm_xe_engine_class_instance *eci,
+		      bool remote_copy,
+		      bool prefetch_req)
+{
+        uint64_t addr;
+        uint32_t vm[2];
+        uint32_t exec_queue[2];
+        uint32_t batch_bo;
+        uint8_t *copy_dst;
+        uint64_t batch_addr;
+        struct drm_xe_sync sync = {};
+        volatile uint64_t *sync_addr;
+        int value = 60;
+        int shared_val[4];
+        struct test_exec_data *data;
+	struct timespec t_start, t_end;
+	double cpu_latency, gpu1_latency, gpu2_latency;
+	double cpu_bw, gpu1_bw, gpu2_bw;
+
+
+        vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+        xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+        xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        data = aligned_alloc(SZ_2M, SZ_4K);
+        igt_assert(data);
+        data[0].vm_sync = 0;
+        addr = to_user_pointer(data);
+
+        copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+        igt_assert(copy_dst);
+
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr, value);
+
+	/* Measure GPU0 access latency/bandwidth */
+	clock_gettime(CLOCK_MONOTONIC, &t_start);
+
+        /* GPU0 access */
+        xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+                      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+                      gpu0->fd, 0, gpu0->vram_regions[0]);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr, SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[0],
+				       NSEC_PER_SEC * 10);
+	}
+        free((void *)sync_addr);
+
+	clock_gettime(CLOCK_MONOTONIC, &t_end);
+	gpu1_latency = time_diff(&t_start, &t_end);
+	gpu1_bw = COPY_SIZE / gpu1_latency / (1024 * 1024); // MB/s
+
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute STORE command on GPU0 */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+								 
+        memcpy(shared_val, (void *)addr, 4);
+        igt_assert_eq(shared_val[0], value);
+
+        /* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+        memset((void *)(uintptr_t)addr, 10, sizeof(int));
+        memcpy(shared_val, (void *)(uintptr_t)addr, sizeof(shared_val));
+        igt_assert_eq(shared_val[0], 0x0A0A0A0A);
+
+	*(uint64_t *)addr = 50;
+
+	if(remote_copy) {
+		igt_info("creating batch for COPY_CMD on GPU1\n");
+		batch_init(gpu1->fd, vm[1], addr, to_user_pointer(copy_dst),
+			   SZ_4K, &batch_bo, &batch_addr);
+	}
+	else {
+		igt_info("creating batch for STORE_CMD on GPU1\n");
+		store_dword_batch_init(gpu1->fd, vm[1], addr, &batch_bo, &batch_addr, value + 10);
+	}
+
+	/* Measure GPU1 access latency/bandwidth */
+	clock_gettime(CLOCK_MONOTONIC, &t_start);
+
+        /* GPU1 access */
+        xe_vm_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+                      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+                      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+				     SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[1],
+				       NSEC_PER_SEC * 10);
+	}
+        free((void *)sync_addr);
+
+	clock_gettime(CLOCK_MONOTONIC, &t_end);
+	gpu2_latency = time_diff(&t_start, &t_end);
+	gpu2_bw = COPY_SIZE / gpu2_latency / (1024 * 1024); // MB/s
+
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute COPY/STORE command on GPU1 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+	
+	if (!remote_copy)
+        	igt_assert_eq(*(uint64_t *)addr, value + 10);
+	else
+		igt_assert_eq(*(uint64_t *)copy_dst, 50);
+
+        /* CPU writes 11, memset set bytes no integer hence memset fills 4 bytes with 0x0B */
+	/* Measure CPU access latency/bandwidth */
+	clock_gettime(CLOCK_MONOTONIC, &t_start);
+        memset((void *)(uintptr_t)addr, 11, sizeof(int));
+        memcpy(shared_val, (void *)(uintptr_t)addr, sizeof(shared_val));
+	clock_gettime(CLOCK_MONOTONIC, &t_end);
+	cpu_latency = time_diff(&t_start, &t_end);
+	cpu_bw = COPY_SIZE / cpu_latency / (1024 * 1024); // MB/s
+
+        igt_assert_eq(shared_val[0], 0x0B0B0B0B);
+
+	/* Print results */
+	igt_info("CPU: Latency %.6f s, Bandwidth %.2f MB/s\n", cpu_latency, cpu_bw);
+	igt_info("GPU1: Latency %.6f s, Bandwidth %.2f MB/s\n", gpu1_latency, gpu1_bw);
+	igt_info("GPU2: Latency %.6f s, Bandwidth %.2f MB/s\n", gpu2_latency, gpu2_bw);
+
+        munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+        batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+        batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
+        free(data);
+        free(copy_dst);
+
+        xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
+        xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
+        xe_vm_destroy(gpu0->fd, vm[0]);
+
+        xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
+        xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
+        xe_vm_destroy(gpu1->fd, vm[1]);
+}
+
+int mem_region(int fd)
+{
+	uint64_t regions = all_memory_regions(fd);
+        uint64_t region = -1;
+
+	xe_for_each_mem_region(fd, regions, region) {
+                if (XE_IS_SYSMEM_MEMORY_REGION(fd, region)) {
+                        struct drm_xe_mem_region *mem_region =
+                                xe_mem_region(fd, 1ull << (region));
+                        region = mem_region->instance;
+			printf("region instance :%d region name :%s\n", region, xe_region_name(region));
+			break;
+                }
+        }
+
+	printf("returning region :%d\n", region);
+	return region;
+}
+
+#define	XE_BO_FLAG_SYSTEM	BIT(1)
+#define XE_BO_FLAG_CPU_ADDR_MIRROR      BIT(24)
+
+static void
+conflicting_madvise(struct xe_svm_gpu_info *gpu0,
+		    struct xe_svm_gpu_info *gpu1,
+		    struct drm_xe_engine_class_instance *eci)
+{
+
+	uint32_t vm[3];
+	uint32_t exec_queue[3];
+	uint32_t batch_bo[3];
+	uint64_t batch_addr[3], svm_addr;
+	struct test_exec_data *data;
+	volatile uint64_t sync_val1 = 0;
+	volatile uint64_t sync_val2 = 0;
+
+	// Define sync structures
+	struct drm_xe_sync sync1 = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.addr = (uint64_t)(uintptr_t)&sync_val1, // user-space address
+		.timeline_value = USER_FENCE_VALUE, // or desired fence value
+	};
+
+	struct drm_xe_sync sync2 = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.addr = (uint64_t)(uintptr_t)&sync_val2,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+
+#define QUARTER_SEC             (NSEC_PER_SEC / 4)
+	int64_t timeout = QUARTER_SEC;
+	data = aligned_alloc(SZ_64M, SZ_64M);
+	igt_assert(data);
+
+	vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+	xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+	xe_vm_bind_lr_sync(gpu1->fd, vm[0], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	svm_addr = to_user_pointer(data);
+
+	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, COPY_SIZE, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
+
+	*(uint64_t *)svm_addr = 50;
+
+	atomic_batch_init(gpu0->fd, vm[0], svm_addr, &batch_bo[0], &batch_addr[0]);
+	atomic_batch_init(gpu1->fd, vm[1], svm_addr, &batch_bo[1], &batch_addr[1]);
+
+#if 0
+	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, COPY_SIZE, 0,
+			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
+	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, COPY_SIZE, 0,
+			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
+#endif
+
+#if 1
+	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, BATCH_SIZE(gpu0->fd), 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu0->fd, 0, gpu0->vram_regions[0]);
+#endif
+
+	xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, svm_addr,
+			     BATCH_SIZE(gpu0->fd), &sync1, 1,
+			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+	xe_vm_prefetch_async(gpu1->fd, vm[0], 0, 0, svm_addr,
+			     BATCH_SIZE(gpu1->fd), &sync2, 1,
+			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+	if (sync_val1 != BIND_SYNC_VAL)
+		__xe_wait_ufence(gpu0->fd, (uint64_t *)&sync1, BIND_SYNC_VAL, exec_queue[0],
+				&timeout);
+	if (sync_val2 != BIND_SYNC_VAL)
+		__xe_wait_ufence(gpu1->fd, (uint64_t *)&sync2, BIND_SYNC_VAL, exec_queue[1],
+				&timeout);
+
+        /* Executing ATOMIC_INC on GPU0. */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr[0], &sync1, 1);
+        if (sync_val1 != EXEC_SYNC_VAL)
+                __xe_wait_ufence(gpu0->fd, (uint64_t *)sync_val1, EXEC_SYNC_VAL, exec_queue[0],
+                               &timeout);
+
+
+}
+
+static void
+conflict_test_multigpu(struct xe_svm_gpu_info *gpu0,
+		       struct xe_svm_gpu_info *gpu1,
+		       struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo, batch1_bo;
+	void *copy_src, *copy_dst;
+	uint64_t batch_addr, svm_addr;
+	int region;
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+	void *batch, *cpu_ptr;
+	struct xe_svm_gpu_info gpu_mem[1];
+
+#if 1
+	vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+	xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+	xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	region = mem_region(gpu0->fd);
+	int render_fd;
+	render_fd = drm_open_driver(DRIVER_XE);
+	printf("render_fd :%d gpu0->fd :%d gpu1->fd :%d\n",
+			render_fd, gpu0->fd, gpu0->fd);
+//	printf("region is :%d\n", region);
+	//batch_bo = xe_bo_create(render_fd, 0, BATCH_SIZE(render_fd), system_memory(render_fd), XE_BO_FLAG_SYSTEM);
+	batch_bo = xe_bo_create(gpu0->fd, vm[0], BATCH_SIZE(gpu0->fd), region, XE_BO_FLAG_SYSTEM);
+	batch = xe_bo_map(gpu0->fd, batch_bo, BATCH_SIZE(gpu0->fd));
+	//batch = xe_bo_map(render_fd, batch_bo, BATCH_SIZE(render_fd));
+	render_fd = open("/dev/dri/card0", O_RDWR);
+	if (render_fd <= 0) {
+	    perror("open error for card0");
+    // handle error
+	}
+	//render_fd = drm_open_driver(DRIVER_XE);
+	printf("render_fd :%d gpu0->fd :%d gpu1->fd :%d\n",
+			render_fd, gpu0->fd, gpu1->fd);
+	printf("region is :%d\n", region);
+	//batch_bo = xe_bo_create(render_fd, 0, COPY_SIZE, region, XE_BO_FLAG_SYSTEM);
+	batch_bo = xe_bo_create(gpu0->fd, 0, BATCH_SIZE(gpu0->fd), region, XE_BO_FLAG_SYSTEM);
+	batch = xe_bo_map(gpu0->fd, batch_bo, BATCH_SIZE(gpu0->fd));
+	//batch = xe_bo_map(render_fd, batch_bo, COPY_SIZE);
+	igt_assert(batch);
+
+	svm_addr = to_user_pointer(batch);
+
+	igt_info("Calling first bind\n");
+	xe_vm_bind_lr_sync(gpu0->fd, vm[0], batch_bo, 0, svm_addr, BATCH_SIZE(gpu0->fd), 0);
+	igt_info("Calling second bind\n");
+	//xe_vm_bind_lr_sync(gpu1->fd, vm[1], batch_bo, 0, svm_addr, BATCH_SIZE(gpu1->fd), 0);
+	//xe_vm_bind_lr_sync(gpu1->fd, vm[0], batch_bo, 0, svm_addr, BATCH_SIZE(gpu1->fd), 0);
+
+	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, BATCH_SIZE(gpu0->fd), 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu0->fd, 0, gpu0->vram_regions[0]);
+
+	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+#if 0
+	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+#endif
+
+	printf("1st Prefetch calling\n");
+	xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, svm_addr,
+			     BATCH_SIZE(gpu0->fd), &sync, 1,
+			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+	printf("2nd Prefetch calling\n");
+	xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, svm_addr,
+			     BATCH_SIZE(gpu1->fd), &sync, 1,
+			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+	munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+	batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+	xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
+	xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
+	xe_vm_destroy(gpu0->fd, vm[0]);
+
+	batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
+	xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
+	xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
+	xe_vm_destroy(gpu1->fd, vm[1]);
+	drm_close_driver(render_fd);
+#endif
+}
+
 static void
 atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	      struct xe_svm_gpu_info *gpu1,
@@ -616,6 +1027,31 @@ gpu_coherecy_test(struct xe_svm_gpu_info *src_gpu,
         coherency_test_multigpu(src_gpu, dst_gpu, eci, coh_fail, prefetch_req);
 }
 
+static void
+gpu_conflict_madvise_test(struct xe_svm_gpu_info *src_gpu,
+                          struct xe_svm_gpu_info *dst_gpu,
+			  struct drm_xe_engine_class_instance *eci)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+        //conflict_test_multigpu(src_gpu, dst_gpu, eci);
+        conflicting_madvise(src_gpu, dst_gpu, eci);
+}
+
+static void
+gpu_latency_test(struct xe_svm_gpu_info *src_gpu,
+		 struct xe_svm_gpu_info *dst_gpu,
+		 struct drm_xe_engine_class_instance *eci,
+		 bool remote_copy,
+		 bool prefetch_req)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+        latency_test_multigpu(src_gpu, dst_gpu, eci, remote_copy, prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -660,6 +1096,14 @@ igt_main
 		gpu_coherecy_test(&gpus[0], &gpus[1], &eci, 1, 0);
 	}
 
+	igt_subtest("conflicting-madvise-gpu")
+		gpu_conflict_madvise_test(&gpus[0], &gpus[1], &eci);
+
+	igt_subtest("latency-multi-gpu") {
+		gpu_latency_test(&gpus[0], &gpus[1], &eci, 1, 1);
+		gpu_latency_test(&gpus[0], &gpus[1], &eci, 0, 0);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

