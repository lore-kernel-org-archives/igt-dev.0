Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205B0CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 06:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E4110E631;
	Tue,  9 Sep 2025 06:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCjzkvKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D92310E631
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 06:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757400582; x=1788936582;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wD91ODOw2Q6+kxsLRxmbndE7BMRipB/X3VETwuggMsM=;
 b=jCjzkvKEM1pHzF14ETGKcV3kCfe8jBPIqzFr771iFQs650/NrCfyo1G/
 M9UEz9wuK0SONpeCG0TmCIAGrBWkHp6vzGTMKFpkoz81Gf15nITGiuExK
 39EUUaul+hsE9+0sxMenzFl6JnBkBuP+HFMZaUwd9YVPJ21HsoKExU2Su
 w6zHzdxxcZzXgbo+aibLuTLJB3/k8NWuAy4S2mUnXLxYbBEG8S54O0YNy
 941srsCiGtrwnEPb6FPGb90txTd6lSAk8jUJUwzol0r2R7tZlSEI9hQ9M
 GWV6cre3S0qTW5UT+g24OUECYz3QFuqXgi5SoYr0ZWJUtRH03VM4y7rRV w==;
X-CSE-ConnectionGUID: 56qic0J6SrS8p+wrJbQ8mw==
X-CSE-MsgGUID: 4ARAUqTJQW+FQPTENI0Z3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59532136"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59532136"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 23:49:42 -0700
X-CSE-ConnectionGUID: o3ywQVoDRXOOZQ9X+Nwjrw==
X-CSE-MsgGUID: NA91v4ltS6aMYNIdlprayg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="172578354"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by orviesa009.jf.intel.com with ESMTP; 08 Sep 2025 23:49:41 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v1 1/2] DO-NOT-REVIEW: tests/intel/xe_exec_system_allocator:
 Add atomic_batch test in IGT
Date: Tue,  9 Sep 2025 12:30:38 +0530
Message-Id: <20250909070039.1099371-2-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909070039.1099371-1-pravalika.gurram@intel.com>
References: <20250909070039.1099371-1-pravalika.gurram@intel.com>
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

ATOMIC_BATCH flag is introduced when true MI_ATOMIC | MI_ATOMIC_INC
operation will be called. This will avoid writing another function which
performs atomic increment operations. ATOMIC_BATCH flag is passed as
argument in write_dword() if true then value will be written on passed
address and incremented by ATOMIC_INC operation. For all memory
operations this flag will be used to verify if ATOMIC operation is
working or not.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 401 ++++++++++++++++++++++---
 1 file changed, 365 insertions(+), 36 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 88f4477c1..f61a4ebf4 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -17,6 +17,7 @@
 #include <time.h>
 
 #include "igt.h"
+#include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_compute.h"
 #include "lib/intel_reg.h"
@@ -31,6 +32,15 @@
 #define QUARTER_SEC		(NSEC_PER_SEC / 4)
 #define FIVE_SEC		(5LL * NSEC_PER_SEC)
 
+struct test_exec_data {
+	uint32_t batch[32];
+	uint64_t pad;
+	uint64_t vm_sync;
+	uint64_t exec_sync;
+	uint32_t data;
+	uint32_t expected_data;
+};
+
 struct batch_data {
 	uint32_t batch[16];
 	uint64_t pad;
@@ -38,6 +48,7 @@ struct batch_data {
 	uint32_t expected_data;
 };
 
+#define VAL_ATOMIC_EXPECTED  56
 #define WRITE_VALUE(data__, i__)	({			\
 	if (!(data__)->expected_data)				\
 		(data__)->expected_data = rand() << 12 | (i__);	\
@@ -54,10 +65,19 @@ static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
 	batch[(*idx)++] = wdata;
 }
 
-static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
-			int *idx)
+static void write_dword(struct test_exec_data *data, uint64_t sdi_addr, uint32_t wdata,
+			int *idx, bool atomic)
 {
-	__write_dword(batch, sdi_addr, wdata, idx);
+	uint32_t *batch = data->batch;
+
+	if (atomic) {
+		data->data = 55;
+		batch[(*idx)++] = MI_ATOMIC | MI_ATOMIC_INC;
+		batch[(*idx)++] = sdi_addr;
+		batch[(*idx)++] = sdi_addr >> 32;
+	} else
+		__write_dword(batch, sdi_addr, wdata, idx);
+
 	batch[(*idx)++] = MI_BATCH_BUFFER_END;
 }
 
@@ -304,7 +324,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 		uint64_t sdi_addr = addr + sdi_offset;
 		int b = 0;
 
-		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i), &b);
+		write_dword((struct test_exec_data *)data, sdi_addr, WRITE_VALUE(data, i), &b, false);
 		igt_assert(b <= ARRAY_SIZE(data->batch));
 	}
 
@@ -447,6 +467,54 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
  * SUBTEST: processes-evict-malloc-mix-bo
  * Description: multi-process trigger eviction of VRAM allocated via malloc and BO create
  * Test category: stress test
+ *
+ * SUBTEST: madvise-multi-vma
+ * Description: performs multiple madvise operations on multiple virtual memory area using atomic device attributes
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-split-vma
+ * Description: perform madvise operations on multiple type VMAs (BO and CPU VMAs)
+ * Test category: perform madvise operations on multiple type VMAs (BO and CPU VMAs)
+ *
+ * SUBTEST: madvise-atomic-vma
+ * Description: perform madvise atomic operations on BO in VRAM/SMEM if atomic ATTR global/device
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-split-vma-with-mapping
+ * Description: performs prefetch and page migration
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-preffered-loc-atomic-vram
+ * Description: performs both atomic and preferred loc madvise operations atomic device attributes set
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-preffered-loc-atomic-gl
+ * Description: performs both atomic and preferred loc madvise operations with atomic global attributes set
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-preffered-loc-atomic-cpu
+ * Description: performs both atomic and preferred loc madvise operations with atomic cpu attributes set
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-preffered-loc-sram-migrate-pages
+ * Description: performs preferred loc madvise operations and migrating all pages in smem
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-no-range-invalidate-same-attr
+ * Description: performs atomic global madvise operation, prefetch and again madvise operation with same atomic attribute
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-range-invalidate-change-attr
+ * Description: performs atomic global madvise operation, prefetch and again madvise operation with different atomic attribute
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-preffered-loc-atomic-und
+ * Description: Tests madvise with preferred location set for atomic operations, but with an undefined
+ * Test category: functionality test
+ *
+ * SUBTEST: madvise-atomic-inc
+ * Description: Tests madvise atomic operations
+ * Test category: functionality test
  */
 
 static void
@@ -701,7 +769,8 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 		uint64_t sdi_addr = addr + sdi_offset;
 		int b = 0;
 
-		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
+		write_dword((struct test_exec_data *)&data[i], sdi_addr, WRITE_VALUE(&data[i], i),
+			     &b, false);
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
 		if (!i)
@@ -778,6 +847,20 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define PREFETCH_BENCHMARK	(0x1 << 25)
 #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
 #define MADVISE_SWIZZLE			(0x1 << 27)
+#define MADVISE_OP			(0x1 << 28)
+#define ATOMIC_BATCH			(0x1 << 29)
+#define MIGRATE_ALL_PAGES		(0x1 << 30)
+#define PREFERRED_LOC_ATOMIC_DEVICE	(0x1ull << 31)
+#define PREFERRED_LOC_ATOMIC_GL		(0x1ull << 32)
+#define PREFERRED_LOC_ATOMIC_CPU	(0x1ull << 33)
+#define MADVISE_MULTI_VMA		(0x1ull << 34)
+#define MADVISE_SPLIT_VMA		(0x1ull << 35)
+#define MADVISE_ATOMIC_VMA		(0x1ull << 36)
+#define PREFETCH_SPLIT_VMA		(0x1ull << 37)
+#define PREFETCH_CHANGE_ATTR		(0x1ull << 38)
+#define PREFETCH_SAME_ATTR		(0x1ull << 39)
+#define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 40)
+#define MADVISE_ATOMIC_DEVICE		(0x1ull << 41)
 
 #define N_MULTI_FAULT		4
 
@@ -989,16 +1072,6 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * Description: Create multiple threads with a faults on different hardware engines to same addresses, racing between CPU and GPU access
  * Test category: stress test
  */
-
-struct test_exec_data {
-	uint32_t batch[32];
-	uint64_t pad;
-	uint64_t vm_sync;
-	uint64_t exec_sync;
-	uint32_t data;
-	uint32_t expected_data;
-};
-
 static void igt_require_hugepages(void)
 {
 	igt_skip_on_f(!igt_get_meminfo("HugePages_Total"),
@@ -1024,11 +1097,184 @@ madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
 		      0);
 }
 
+static void
+xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
+		int pat_index)
+{
+	xe_vm_madvise(fd, vm, addr, range, 0,
+			DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
+}
+
+static void
+xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
+		int mem_attr)
+{
+	xe_vm_madvise(fd, vm, addr, range, 0,
+			DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+			mem_attr, 0);
+}
+
+static void
+xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
+{
+	xe_vm_madvise(fd, vm, addr, range, 0,
+			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
+			DRM_XE_MIGRATE_ALL_PAGES);
+}
+
+static void
+xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
+		size_t bo_size, struct drm_xe_engine_class_instance *eci,
+		uint64_t addr, unsigned long long flags,
+		struct drm_xe_sync *sync)
+{
+	uint32_t bo_flags, bo = 0;
+
+
+	if (flags & MADVISE_ATOMIC_DEVICE)
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+				DRM_XE_ATOMIC_DEVICE);
+
+	if (flags & PREFERRED_LOC_ATOMIC_UND) {
+		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+				DRM_XE_ATOMIC_UNDEFINED);
+	}
+
+	if (flags & PREFERRED_LOC_ATOMIC_DEVICE) {
+		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+				DRM_XE_ATOMIC_DEVICE);
+	}
+
+	if (flags & PREFERRED_LOC_ATOMIC_GL) {
+		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+				DRM_XE_ATOMIC_GLOBAL);
+	}
+
+	if (flags & PREFERRED_LOC_ATOMIC_CPU) {
+		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+				DRM_XE_ATOMIC_CPU);
+	}
+
+	if (flags & MADVISE_MULTI_VMA) {
+		if (bo_size)
+			bo_size = ALIGN(bo_size, SZ_4K);
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) + bo_size/2,
+				bo_size/2, DRM_XE_ATOMIC_DEVICE);
+
+		xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size/2, bo_size/2,
+				intel_get_pat_idx_wb(fd));
+
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) + bo_size,
+				bo_size, DRM_XE_ATOMIC_DEVICE);
+
+		xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
+				intel_get_pat_idx_wb(fd));
+	}
+
+	if (flags & MADVISE_SPLIT_VMA) {
+		if (bo_size)
+			bo_size = ALIGN(bo_size, SZ_4K);
+
+		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
+				bo_flags);
+		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size/2,
+				bo_size/2, 0, 0);
+
+		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size/2,
+				bo_size/2, DRM_XE_VM_BIND_OP_MAP,
+				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
+				1, 0, 0);
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+		data[0].vm_sync = 0;
+		gem_close(fd, bo);
+		bo = 0;
+
+
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
+				DRM_XE_ATOMIC_GLOBAL);
+	}
+}
+
+static void
+madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
+		unsigned long long flags, struct test_exec_data *data)
+{
+	uint32_t val;
+
+	if (flags & PREFETCH_SPLIT_VMA) {
+		bo_size = ALIGN(bo_size, SZ_4K);
+
+		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
+
+		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+
+		igt_debug("num_vmas before madvise = %d\n", val);
+
+		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
+
+		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+
+		igt_debug("num_vmas after madvise= %d\n", val);
+	} else if (flags & PREFETCH_SAME_ATTR) {
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+				DRM_XE_ATOMIC_GLOBAL);
+		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+
+		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
+				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
+				DRM_XE_ATOMIC_GLOBAL);
+	} else if (flags & PREFETCH_CHANGE_ATTR) {
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+				DRM_XE_ATOMIC_GLOBAL);
+
+		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+
+		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
+				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+				DRM_XE_ATOMIC_DEVICE);
+
+		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+	}
+}
+
+static void
+madvise_vma_addr_map(uint64_t addr, int i, int idx, size_t bo_size,
+		struct test_exec_data *data,
+		uint64_t *batch_offset,
+		uint64_t *batch_addr, uint64_t *sdi_offset,
+		uint64_t *sdi_addr,
+		unsigned long long flags,
+		uint64_t *split_vma_offset)
+{
+	if (flags & MADVISE_MULTI_VMA) {
+		addr = addr + i * bo_size;
+		data = from_user_pointer(addr);
+		*batch_offset = (size_t)((char *)&(data[idx].batch) - (char *)data);
+		*batch_addr = addr + *batch_offset;
+		*sdi_offset = (size_t)((char *)&(data[idx].data) - (char *)data);
+		*sdi_addr = addr + *sdi_offset;
+	}
+}
+
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, size_t bo_size,
 	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
-	  unsigned int flags)
+	  unsigned long long flags)
 {
 	uint64_t addr;
 	struct drm_xe_sync sync[1] = {
@@ -1041,7 +1287,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		.syncs = to_user_pointer(sync),
 	};
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
-	struct test_exec_data *data, *next_data = NULL;
+	struct test_exec_data *data, *next_data = NULL, *original_data = NULL;
 	uint32_t bo_flags;
 	uint32_t bo = 0, bind_sync = 0;
 	void **pending_free;
@@ -1159,6 +1405,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	addr = to_user_pointer(data);
 
+	if (flags & MADVISE_OP)
+		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
+
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		bo = xe_bo_create(fd, vm, bo_size,
@@ -1232,42 +1481,61 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
 		bool fault_injected = (FAULT & flags) && i > n_execs;
 
+		uint64_t split_vma_offset;
+
 		if (barrier)
 			pthread_barrier_wait(barrier);
 
 		if (flags & MADVISE_SWIZZLE)
 			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr, i);
 
+		if (flags & MADVISE_OP) {
+			if (flags & MADVISE_MULTI_VMA)
+				original_data = data;
+
+			madvise_vma_addr_map(addr, i, idx, bo_size, data, &batch_offset,
+					      &batch_addr, &sdi_offset, &sdi_addr, flags,
+					      &split_vma_offset);
+		}
+
 		if (flags & MULTI_FAULT) {
 			b = 0;
 			for (j = 0; j < N_MULTI_FAULT - 1; ++j)
 				__write_dword(data[idx].batch,
 					      sdi_addr + j * orig_size,
 					      WRITE_VALUE(&data[idx], idx), &b);
-			write_dword(data[idx].batch, sdi_addr + j * orig_size,
-				    WRITE_VALUE(&data[idx], idx), &b);
+			write_dword(&data[idx], sdi_addr + j * orig_size,
+				    WRITE_VALUE(&data[idx], idx), &b,
+				    flags & ATOMIC_BATCH ? true : false);
 			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
 		} else if (!(flags & EVERY_OTHER_CHECK)) {
 			b = 0;
-			write_dword(data[idx].batch, sdi_addr,
-				    WRITE_VALUE(&data[idx], idx), &b);
+			write_dword(&data[idx], sdi_addr,
+					WRITE_VALUE(&data[idx], idx), &b,
+					flags & ATOMIC_BATCH ? true : false);
 			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
+			if (flags & PREFETCH)
+				madvise_prefetch_op(fd, vm, addr, bo_size, flags, data);
 		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
 			b = 0;
-			write_dword(data[idx].batch, sdi_addr,
-				    WRITE_VALUE(&data[idx], idx), &b);
+			write_dword(&data[idx], sdi_addr,
+				    WRITE_VALUE(&data[idx], idx), &b,
+				    flags & ATOMIC_BATCH ? true : false);
 			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
 
 			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
 			next_data = aligned_alloc_type.ptr;
 			igt_assert(next_data);
+
+			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
 			__aligned_partial_free(&aligned_alloc_type);
 
 			b = 0;
-			write_dword(data[next_idx].batch,
+			write_dword(&data[next_idx],
 				    to_user_pointer(next_data) +
 				    (char *)&data[next_idx].data - (char *)data,
-				    WRITE_VALUE(&data[next_idx], next_idx), &b);
+				    WRITE_VALUE(&data[next_idx], next_idx), &b,
+				    flags & ATOMIC_BATCH ? true : false);
 			igt_assert(b <= ARRAY_SIZE(data[next_idx].batch));
 		}
 
@@ -1301,7 +1569,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			exec.address = batch_addr * 2;
 		else
 			exec.address = batch_addr;
-
 		if (fault_injected) {
 			err = __xe_exec(fd, &exec);
 			igt_assert(err == -ENOENT);
@@ -1321,9 +1588,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					       exec_queues[e], &timeout);
 			igt_assert(err == -ETIME || err == -EIO);
 		} else {
-			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
-				       &data[idx].exec_sync, USER_FENCE_VALUE,
-				       exec_queues[e], FIVE_SEC);
+			if (flags & PREFERRED_LOC_ATOMIC_CPU || flags & PREFERRED_LOC_ATOMIC_UND) {
+				int64_t timeout = QUARTER_SEC;
+
+				err = __xe_wait_ufence(fd, exec_ufence ? exec_ufence :
+						       &data[idx].exec_sync,
+						       USER_FENCE_VALUE,
+						       exec_queues[e], &timeout);
+				if (err)
+					goto cleanup;
+			} else
+				xe_wait_ufence(fd, exec_ufence ? exec_ufence :
+					       &data[idx].exec_sync, USER_FENCE_VALUE,
+					       exec_queues[e], FIVE_SEC);
 			if (flags & LOCK && !i)
 				munlock(data, bo_size);
 
@@ -1373,17 +1650,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				if (flags & FORK_READ) {
 					igt_fork(child, 1)
 						igt_assert_eq(data[idx].data,
-							      READ_VALUE(&data[idx]));
+							      flags & ATOMIC_BATCH
+							      ? VAL_ATOMIC_EXPECTED
+							      : READ_VALUE(&data[idx]));
 					if (!(flags & FORK_READ_AFTER))
 						igt_assert_eq(data[idx].data,
-							      READ_VALUE(&data[idx]));
+							      flags & ATOMIC_BATCH
+							      ? VAL_ATOMIC_EXPECTED
+							      : READ_VALUE(&data[idx]));
 					igt_waitchildren();
 					if (flags & FORK_READ_AFTER)
 						igt_assert_eq(data[idx].data,
-							      READ_VALUE(&data[idx]));
+							      flags & ATOMIC_BATCH
+							      ? VAL_ATOMIC_EXPECTED
+							      : READ_VALUE(&data[idx]));
 				} else {
 					igt_assert_eq(data[idx].data,
-						      READ_VALUE(&data[idx]));
+						      flags & ATOMIC_BATCH
+						      ? VAL_ATOMIC_EXPECTED
+						      : READ_VALUE(&data[idx]));
 					if (flags & PREFETCH_SYS_BENCHMARK) {
 						struct timespec tv = {};
 						u64 start, end;
@@ -1410,13 +1695,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 								((void *)data) + j * orig_size;
 
 							igt_assert_eq(__data[idx].data,
-								      READ_VALUE(&data[idx]));
+								      flags & ATOMIC_BATCH
+								      ? VAL_ATOMIC_EXPECTED
+								      : READ_VALUE(&data[idx]));
 						}
 					}
 				}
 				if (flags & EVERY_OTHER_CHECK)
 					igt_assert_eq(data[prev_idx].data,
-						      READ_VALUE(&data[prev_idx]));
+						      flags & ATOMIC_BATCH
+						      ? VAL_ATOMIC_EXPECTED
+						      : READ_VALUE(&data[prev_idx]));
 			}
 		}
 
@@ -1437,6 +1726,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			gem_close(fd, bo);
 		}
 
+		if (flags & MADVISE_MULTI_VMA) {
+			data = original_data;
+			original_data = NULL;
+		}
+
 		if (flags & NEW) {
 			if (flags & MMAP) {
 				if (flags & FREE)
@@ -1515,6 +1809,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 pf_count, pf_count_after);
 	}
 
+cleanup:
 	if (bo) {
 		sync[0].addr = to_user_pointer(bind_ufence);
 		__xe_vm_bind_assert(fd, vm, 0,
@@ -1810,7 +2105,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 
 struct section {
 	const char *name;
-	unsigned int flags;
+	unsigned long long flags;
 };
 
 igt_main
@@ -1917,6 +2212,32 @@ igt_main
 		{ "malloc-mix-bo", MIX_BO_ALLOC },
 		{ NULL },
 	};
+	const struct section msections[] = {
+		{ "atomic-inc", MADVISE_OP | MADVISE_ATOMIC_DEVICE | ATOMIC_BATCH },
+		{ "preffered-loc-sram-migrate-pages",
+		  MADVISE_OP | MADVISE_SWIZZLE | MIGRATE_ALL_PAGES | ATOMIC_BATCH },
+		{ "preffered-loc-atomic-vram",
+		  MADVISE_OP | PREFERRED_LOC_ATOMIC_DEVICE | ATOMIC_BATCH },
+		{ "preffered-loc-atomic-gl",
+		  MADVISE_OP | PREFERRED_LOC_ATOMIC_GL | ATOMIC_BATCH },
+		{ "preffered-loc-atomic-cpu",
+		  MADVISE_OP | PREFERRED_LOC_ATOMIC_CPU | ATOMIC_BATCH },
+		{ "preffered-loc-atomic-und",
+		  MADVISE_OP | PREFERRED_LOC_ATOMIC_UND | ATOMIC_BATCH },
+		{ "multi-vma",
+		  MADVISE_OP | MADVISE_MULTI_VMA | ATOMIC_BATCH },
+		{ "split-vma",
+		  MADVISE_OP | MADVISE_SPLIT_VMA | ATOMIC_BATCH },
+		{ "atomic-vma",
+		  MADVISE_OP | MADVISE_ATOMIC_VMA | ATOMIC_BATCH },
+		{ "split-vma-with-mapping",
+		  MADVISE_OP | PREFETCH | PREFETCH_SPLIT_VMA | ATOMIC_BATCH },
+		{ "range-invalidate-change-attr",
+		  MADVISE_OP | PREFETCH | PREFETCH_CHANGE_ATTR | ATOMIC_BATCH },
+		{ "no-range-invalidate-same-attr",
+		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
+		{ NULL },
+	};
 	int fd;
 
 	igt_fixture {
@@ -2113,6 +2434,14 @@ igt_main
 			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
 	}
 
+	for (const struct section *s = msections; s->name; s++) {
+		igt_subtest_f("madvise-%s", s->name) {
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
+					  NULL, s->flags);
+		}
+	}
+
 	igt_subtest("compute")
 		xe_for_each_engine(fd, hwe)
 			test_compute(fd, hwe, SZ_2M);
-- 
2.34.1

