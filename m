Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA37CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 14:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA7C10EBF2;
	Fri, 29 Aug 2025 14:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WizDH50E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF8F10EBF2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756479277; x=1788015277;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aXWCwBHHlpKjj169AlglgIKDimtEgT78QSAxs46SKVY=;
 b=WizDH50E4pwjFJhASM+4XBJeko8cTlewnS6MK5N/cDSyxH671eeNRO9k
 ldr9wMMLdgxjt5gy8lYp4eo3ITLhT4hEftGwRN+4i0O2yxOJJFkHWodx2
 256dVvB95QLVftU1HzVi/RBhaBAWlBnLuNRA0kiFQqxQzFq0se7ELaxT6
 3D7L87Jqlca1MFhAk5GTKImNSQhSknCmCb7Mag9Oxrze6EsErDjSCK8hV
 ERSZx556pDQA2IB3ltwlvU5dzquHA79EJyVweuRUW5H8ehelfYgexHHKZ
 TqPTOAhAF08Wxfme7rGxV0FTcgiOl4BqnXKI6gsz8i/LWZlBfZcp9/9Ou Q==;
X-CSE-ConnectionGUID: UzBP8c8aRz6ged0za90MuA==
X-CSE-MsgGUID: jvLwuJefSuKQ1Xo6oGDtXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="76364638"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76364638"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:54:37 -0700
X-CSE-ConnectionGUID: mPwEWebsSbSkITgOQwPSPA==
X-CSE-MsgGUID: olIfLOi/QPG0KiVDWuX/Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="175694460"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by orviesa005.jf.intel.com with ESMTP; 29 Aug 2025 07:54:35 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 5/5] tests/intel/xe_exec_system_allocator: Add
 atomic_batch test in IGT
Date: Fri, 29 Aug 2025 14:54:22 +0000
Message-ID: <20250829145422.559494-6-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829145422.559494-1-nishit.sharma@intel.com>
References: <20250829145422.559494-1-nishit.sharma@intel.com>
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
 lib/xe/xe_ioctl.c                      |   3 +-
 tests/intel/xe_exec_system_allocator.c | 623 +++++++++++++++++++------
 2 files changed, 482 insertions(+), 144 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index f393aaf92..b4274f3db 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -732,6 +732,5 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
 {
-	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy), 0);
-	return 0;
+	return __xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy);
 }
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 70ca5fc2e..80cf730d1 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -21,6 +21,7 @@
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
+#include "intel_pat.h"
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -29,6 +30,14 @@
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
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
 
 struct batch_data {
 	uint32_t batch[16];
@@ -37,6 +46,7 @@ struct batch_data {
 	uint32_t expected_data;
 };
 
+#define VAL_ATOMIC_EXPECTED  56
 #define WRITE_VALUE(data__, i__)	({			\
 	if (!(data__)->expected_data)				\
 		(data__)->expected_data = rand() << 12 | (i__);	\
@@ -53,10 +63,19 @@ static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
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
+	} else {
+		__write_dword(batch, sdi_addr, wdata, idx);
+	}
 	batch[(*idx)++] = MI_BATCH_BUFFER_END;
 }
 
@@ -302,7 +321,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 		uint64_t sdi_addr = addr + sdi_offset;
 		int b = 0;
 
-		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i), &b);
+		write_dword((struct test_exec_data *)data, sdi_addr, WRITE_VALUE(data, i), &b, false);
 		igt_assert(b <= ARRAY_SIZE(data->batch));
 	}
 
@@ -405,39 +424,6 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
 		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
 }
 
-#define MAX_N_EXEC_QUEUES       16
-
-#define MMAP                    (0x1 << 0)
-#define NEW                     (0x1 << 1)
-#define BO_UNMAP                (0x1 << 2)
-#define FREE                    (0x1 << 3)
-#define BUSY                    (0x1 << 4)
-#define BO_MAP                  (0x1 << 5)
-#define RACE                    (0x1 << 6)
-#define SKIP_MEMSET             (0x1 << 7)
-#define FAULT                   (0x1 << 8)
-#define FILE_BACKED             (0x1 << 9)
-#define LOCK                    (0x1 << 10)
-#define MMAP_SHARED             (0x1 << 11)
-#define HUGE_PAGE               (0x1 << 12)
-#define SHARED_ALLOC            (0x1 << 13)
-#define FORK_READ               (0x1 << 14)
-#define FORK_READ_AFTER         (0x1 << 15)
-#define MREMAP                  (0x1 << 16)
-#define DONTUNMAP               (0x1 << 17)
-#define READ_ONLY_REMAP         (0x1 << 18)
-#define SYNC_EXEC               (0x1 << 19)
-#define EVERY_OTHER_CHECK       (0x1 << 20)
-#define MULTI_FAULT             (0x1 << 21)
-#define PREFETCH                (0x1 << 22)
-#define THREADS                 (0x1 << 23)
-#define PROCESSES               (0x1 << 24)
-#define PREFETCH_BENCHMARK      (0x1 << 25)
-#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
-#define PREFERRED_LOC_SMEM      (0x1 << 27)
-
-#define N_MULTI_FAULT           4
-
 /**
  * SUBTEST: unaligned-alloc
  * Description: allocate unaligned sizes of memory
@@ -478,6 +464,54 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
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
@@ -492,7 +526,7 @@ many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t *bos = NULL;
 	struct timespec tv = {};
 	uint64_t submit, read, elapsed;
-	int i, err;
+	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
@@ -533,14 +567,6 @@ many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
 			igt_assert(alloc.ptr);
 		}
 
-		if (flags & PREFERRED_LOC_SMEM) {
-			err = xe_vm_madvise(fd, vm, to_user_pointer(alloc.ptr), alloc_size, 0,
-					    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-					    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
-				if (err)
-					igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size =%"PRIu64"\n",
-						  strerror(errno), vm, to_user_pointer(alloc.ptr), alloc_size);
-		}
 		allocs[i] = alloc;
 
 		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
@@ -703,7 +729,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	size_t bo_size = SZ_2M, unmap_offset = 0;
 	uint32_t vm, exec_queue;
 	u64 *exec_ufence = NULL;
-	int i, err;
+	int i;
 	void *old, *new = NULL;
 	struct aligned_alloc_type alloc;
 
@@ -729,15 +755,6 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 	data[0].vm_sync = 0;
 
-	if (flags & PREFERRED_LOC_SMEM) {
-		err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
-				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-				    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
-		if (err)
-			igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
-				  strerror(errno), vm, to_user_pointer(data), bo_size);
-	}
-
 	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
 			   PROT_WRITE, MAP_SHARED |
 			   MAP_ANONYMOUS, -1, 0);
@@ -750,7 +767,8 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 		uint64_t sdi_addr = addr + sdi_offset;
 		int b = 0;
 
-		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
+		write_dword((struct test_exec_data *)&data[i], sdi_addr, WRITE_VALUE(&data[i], i),
+			     &b, false);
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
 		if (!i)
@@ -773,7 +791,8 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
 			       exec_queue, FIVE_SEC);
 		if (i || (flags & CPU_FAULT))
-			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
+			igt_assert_eq(data[i].data,
+				      READ_VALUE(&data[i]));
 		exec_ufence[0] = 0;
 
 		if (!i) {
@@ -797,6 +816,52 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	xe_vm_destroy(fd, vm);
 }
 
+#define MAX_N_EXEC_QUEUES       16
+
+#define MMAP				(0x1 << 0)
+#define NEW				(0x1 << 1)
+#define BO_UNMAP			(0x1 << 2)
+#define FREE				(0x1 << 3)
+#define BUSY				(0x1 << 4)
+#define BO_MAP				(0x1 << 5)
+#define RACE				(0x1 << 6)
+#define SKIP_MEMSET			(0x1 << 7)
+#define FAULT				(0x1 << 8)
+#define FILE_BACKED			(0x1 << 9)
+#define LOCK				(0x1 << 10)
+#define MMAP_SHARED			(0x1 << 11)
+#define HUGE_PAGE			(0x1 << 12)
+#define SHARED_ALLOC			(0x1 << 13)
+#define FORK_READ			(0x1 << 14)
+#define FORK_READ_AFTER			(0x1 << 15)
+#define MREMAP				(0x1 << 16)
+#define DONTUNMAP			(0x1 << 17)
+#define READ_ONLY_REMAP			(0x1 << 18)
+#define SYNC_EXEC			(0x1 << 19)
+#define EVERY_OTHER_CHECK		(0x1 << 20)
+#define MULTI_FAULT			(0x1 << 21)
+#define PREFETCH			(0x1 << 22)
+#define THREADS				(0x1 << 23)
+#define PROCESSES			(0x1 << 24)
+#define PREFETCH_BENCHMARK		(0x1 << 25)
+#define PREFETCH_SYS_BENCHMARK		(0x1 << 26)
+#define PREFERRED_LOC_SMEM		(0x1 << 27)
+#define ATOMIC_BATCH			(0x1 << 28)
+#define MIGRATE_ALL_PAGES		(0x1 << 29)
+#define PREFERRED_LOC_ATOMIC_DEVICE	(0x1 << 30)
+#define PREFERRED_LOC_ATOMIC_GL		(0x1ull << 31)
+#define PREFERRED_LOC_ATOMIC_CPU	(0x1ull << 32)
+#define MADVISE_MULTI_VMA		(0x1ull << 33)
+#define MADVISE_SPLIT_VMA		(0x1ull << 34)
+#define MADVISE_ATOMIC_VMA		(0x1ull << 35)
+#define PREFETCH_SPLIT_VMA		(0x1ull << 36)
+#define PREFETCH_CHANGE_ATTR		(0x1ull << 37)
+#define PREFETCH_SAME_ATTR		(0x1ull << 38)
+#define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 39)
+#define MADVISE_ATOMIC_INC		(0x1ull << 40)
+
+#define N_MULTI_FAULT           4
+
 /**
  * SUBTEST: once-%s
  * Description: Run %arg[1] system allocator test only once
@@ -1001,48 +1066,48 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap-free-huge-preferred-loc-smem:	mmap huge page and free buffer for each exec and perform madvise
  * @mmap-free-nomemset-preferred-loc-smem:	mmap and free buffer for each exec and perform madvise
  * @mmap-free-preferred-loc-smem:	mmap and free buffer for each exec and perform madvise
- * @mmap-free-race-nomemset-preferred-loc-smem:
- * @mmap-free-race-preferred-loc-smem:
- * @mmap-huge-nomemset-preferred-loc-smem:
- * @mmap-huge-preferred-loc-smem:
- * @mmap-mlock-nomemset-preferred-loc-smem:
- * @mmap-mlock-preferred-loc-smem:
- * @mmap-new-huge-nomemset-preferred-loc-smem:
- * @mmap-new-huge-preferred-loc-smem:
- * @mmap-new-nomemset-preferred-loc-smem:
- * @mmap-new-preferred-loc-smem:
- * @mmap-new-race-nomemset-preferred-loc-smem:
- * @mmap-new-race-preferred-loc-smem:
- * @mmap-nomemset-preferred-loc-smem:
- * @mmap-preferred-loc-smem:
- * @mmap-prefetch-preferred-loc-smem:
- * @mmap-prefetch-shared-preferred-loc-smem:
- * @mmap-race-nomemset-preferred-loc-smem:
- * @mmap-race-preferred-loc-smem:
- * @mmap-remap-dontunmap-eocheck-preferred-loc-smem:
- * @mmap-remap-dontunmap-preferred-loc-smem:
- * @mmap-remap-eocheck-preferred-loc-smem:
- * @mmap-remap-preferred-loc-smem:
- * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem:
- * @mmap-remap-ro-dontunmap-preferred-loc-smem:
- * @mmap-remap-ro-eocheck-preferred-loc-smem:
- * @mmap-remap-ro-preferred-loc-smem:
- * @mmap-shared-nomemset-preferred-loc-smem:
- * @mmap-shared-preferred-loc-smem:
- * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem:
- * @mmap-shared-remap-dontunmap-preferred-loc-smem:
- * @mmap-shared-remap-eocheck-preferred-loc-smem:
- * @mmap-shared-remap-preferred-loc-smem:
- * @new-bo-map-nomemset-preferred-loc-smem:
- * @new-bo-map-preferred-loc-smem:
- * @new-busy-nomemset-preferred-loc-smem:
- * @new-busy-preferred-loc-smem:
- * @new-nomemset-preferred-loc-smem:
- * @new-preferred-loc-smem:
- * @new-prefetch-preferred-loc-smem:
- * @new-race-nomemset-preferred-loc-smem:
- * @new-race-preferred-loc-smem:
- * @prefetch-benchmark:
+ * @mmap-free-race-nomemset-preferred-loc-smem: mmap and free buffer for each exec with race between cpu and gpu access, perform madvise operation
+ * @mmap-free-race-preferred-loc-smem: mmap and free buffer for each exec with race between cpu and gpu access, perform madvise operation
+ * @mmap-huge-nomemset-preferred-loc-smem: mmap huge page single buffer for all execs, skips memset and perform madvise operation
+ * @mmap-huge-preferred-loc-smem: mmap huge page single buffer for all execs, perform madvise operation
+ * @mmap-mlock-nomemset-preferred-loc-smem: mmap and mlock of a buffer with preferred location set to system memory, skipping memset
+ * @mmap-mlock-preferred-loc-smem: mmap and mlock of a buffer with preferred location set to system memory
+ * @mmap-new-huge-nomemset-preferred-loc-smem: mmap of a newly allocated buffer using huge pages, with preferred location set to system memory and skipping memset
+ * @mmap-new-huge-preferred-loc-smem: mmap of a newly allocated buffer using huge pages, with preferred location set to system memory
+ * @mmap-new-nomemset-preferred-loc-smem: mmap of a newly allocated buffer with preferred location set to system memory and skipping memset
+ * @mmap-new-preferred-loc-smem: mmap of a newly allocated buffer with preferred location set to system memory
+ * @mmap-new-race-nomemset-preferred-loc-smem: mmap of a newly allocated buffer with preferred location set to system memory and skipping memset
+ * @mmap-new-race-preferred-loc-smem: mmap of a newly allocated buffer with preferred location set to system memory
+ * @mmap-nomemset-preferred-loc-smem: mmap of a buffer with preferred location set to system memory, skipping memset
+ * @mmap-preferred-loc-smem: mmap of a buffer with preferred location set to system memory
+ * @mmap-prefetch-preferred-loc-smem: prefetching mmap buffer with preferred location set to system memory
+ * @mmap-prefetch-shared-preferred-loc-smem: mmap of a shared buffer with prefetch and preferred location set to system memory
+ * @mmap-race-nomemset-preferred-loc-smem: Tests mmap of a buffer with preferred location set to system memory, skipping memset
+ * @mmap-race-preferred-loc-smem: mmap buffer with race between GPU and CPU access with preferred location set to system memory
+ * @mmap-remap-dontunmap-eocheck-preferred-loc-smem: mmap and remap of a buffer with preferred location set to system memory, does not unmap after use
+ * @mmap-remap-dontunmap-preferred-loc-smem: mmap and remap of a buffer with preferred location set to system memory, does not unmap after use
+ * @mmap-remap-eocheck-preferred-loc-smem: mmap and remap of a buffer with preferred location set to system memory
+ * @mmap-remap-preferred-loc-smem: mmap and remap of a buffer with preferred location set to system memory
+ * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem: mmap and remap of a read-only buffer with preferred location set to system memory, does not unmap after use
+ * @mmap-remap-ro-dontunmap-preferred-loc-smem: mmap and remap of a read-only buffer with preferred location set to system memory, does not unmap after use
+ * @mmap-remap-ro-eocheck-preferred-loc-smem: mmap and remap of a read-only buffer with preferred location set to system memory
+ * @mmap-remap-ro-preferred-loc-smem: mmap and remap of a read-only buffer with preferred location set to system memory
+ * @mmap-shared-nomemset-preferred-loc-smem: mmap of a shared buffer with preferred location set to system memory, skipping memset
+ * @mmap-shared-preferred-loc-smem: mmap of a shared buffer with preferred location set to system memory
+ * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem: mmap and remap of a shared buffer with preferred location set to system memory, does not unmap after use
+ * @mmap-shared-remap-dontunmap-preferred-loc-smem: mmap and remap of a shared buffer with preferred location set to system memory
+ * @mmap-shared-remap-eocheck-preferred-loc-smem: mmap and remap of a shared buffer with preferred location set to system memory with end of check validation
+ * @mmap-shared-remap-preferred-loc-smem: mmap and remap of a shared buffer with preferred location set to system memory without end of check validation
+ * @new-bo-map-nomemset-preferred-loc-smem: Tests allocation and mapping of a new buffer object with preferred location set to system memory, skipping memset
+ * @new-bo-map-preferred-loc-smem: ests allocation and mapping of a new buffer object with preferred location set to system memory
+ * @new-busy-nomemset-preferred-loc-smem: Tests allocation and usage of a new busy buffer object with preferred location set to system memory, skipping memset
+ * @new-busy-preferred-loc-smem: ests allocation and usage of a new busy buffer object with preferred location set to system memory
+ * @new-nomemset-preferred-loc-smem: Tests allocation of a new buffer object with preferred location set to system memory, skipping memset
+ * @new-preferred-loc-smem: Tests allocation of a new buffer object with preferred location set to system memory
+ * @new-prefetch-preferred-loc-smem: Tests allocation and prefetching of a new buffer object with preferred location set to system memory
+ * @new-race-nomemset-preferred-loc-smem: Tests allocation of a new buffer object with preferred location set to system memory, skipping memset
+ * @new-race-preferred-loc-smem: tests allocation of a new buffer object with preferred location set to system memory
+ *
  *
  * SUBTEST: prefetch-benchmark
  * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
@@ -1072,16 +1137,6 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
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
@@ -1090,11 +1145,37 @@ static void igt_require_hugepages(void)
 		      "No huge pages available!\n");
 }
 
+static int
+xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
+			int pat_index)
+{
+	return	xe_vm_madvise(fd, vm, addr, range, 0,
+			      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
+}
+
+static int
+xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
+			  int mem_attr)
+{
+	return	xe_vm_madvise(fd, vm, addr, range, 0,
+			      DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+			      mem_attr, 0);
+}
+
+static int
+xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
+{
+	return	xe_vm_madvise(fd, vm, addr, range, 0,
+			      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
+			      DRM_XE_MIGRATE_ALL_PAGES);
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
@@ -1107,9 +1188,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		.syncs = to_user_pointer(sync),
 	};
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
-	struct test_exec_data *data, *next_data = NULL;
+	struct test_exec_data *data, *next_data = NULL, *org_data;
 	uint32_t bo_flags;
 	uint32_t bo = 0, bind_sync = 0;
+	uint32_t val;
 	void **pending_free;
 	u64 *exec_ufence = NULL, *bind_ufence = NULL;
 	int i, j, b, file_fd = -1, prev_idx, pf_count, err;
@@ -1234,6 +1316,151 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 strerror(errno), vm, to_user_pointer(data), bo_size);
 	}
 
+	if (flags & MADVISE_ATOMIC_INC) {
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+						DRM_XE_ATOMIC_DEVICE);
+		if (err)
+			igt_warn("failure in atomic device attr err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+	}
+
+	if (flags & PREFERRED_LOC_SMEM) {
+		if (flags & MIGRATE_ALL_PAGES) {
+			err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+			if (err)
+				igt_warn("failure in page migration err = %s, vm =%u, data=%"PRIu64"\n",
+					 strerror(errno), vm, to_user_pointer(data));
+		} else {
+			err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
+					    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+					    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, -1);
+		}
+	}
+
+	if (flags & PREFERRED_LOC_ATOMIC_UND) {
+		err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+		if (err)
+			igt_warn("failure in page migration err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+						DRM_XE_ATOMIC_UNDEFINED);
+		if (err)
+			igt_warn("failure in atomic device attr err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+	}
+
+	if (flags & PREFERRED_LOC_ATOMIC_DEVICE) {
+		err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+		if (err)
+			igt_warn("failure in page migration err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+						DRM_XE_ATOMIC_DEVICE);
+		if (err)
+			igt_warn("failure in atomic device attr err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+	}
+	if (flags & PREFERRED_LOC_ATOMIC_GL) {
+		err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+		if (err)
+			igt_warn("failure in page migration err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+						DRM_XE_ATOMIC_GLOBAL);
+		if (err)
+			igt_warn("failure in atomic global attr err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+	}
+	if (flags & PREFERRED_LOC_ATOMIC_CPU) {
+		err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size);
+		if (err)
+			igt_warn("failure in page migration err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+						DRM_XE_ATOMIC_CPU);
+		if (err)
+			igt_warn("failure in atomic cpu attr err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+	}
+	if (flags & MADVISE_MULTI_VMA) {
+		if (bo_size)
+			bo_size = ALIGN(bo_size, SZ_4K);
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) + bo_size/2,
+						bo_size/2, DRM_XE_ATOMIC_DEVICE);
+		if (err)
+			igt_warn("failure in atomic device attr err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+
+		err = xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size/2, bo_size/2,
+					     intel_get_pat_idx_wb(fd));
+		if (err)
+			igt_warn("failure in pat attr index 8 err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data) + bo_size,
+						bo_size, DRM_XE_ATOMIC_DEVICE);
+		if (err)
+			igt_warn("failure in atomic multi_vma err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+
+		err = xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size, intel_get_pat_idx_wb(fd));
+		if (err)
+			igt_warn("failure in pat attr index 4 err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+
+	}
+	if (flags & MADVISE_SPLIT_VMA) {
+		if (bo_size)
+			bo_size = ALIGN(bo_size, SZ_4K);
+
+		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+		bo = xe_bo_create(fd, vm, bo_size,
+				  vram_if_possible(fd, eci->gt_id), bo_flags);
+		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size/2,
+				 bo_size/2, 0, 0);
+
+		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size/2,
+				    bo_size/2, DRM_XE_VM_BIND_OP_MAP,
+				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
+				    1, 0, 0);
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+		data[0].vm_sync = 0;
+		gem_close(fd, bo);
+		bo = 0;
+
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data),
+						bo_size/2, DRM_XE_ATOMIC_DEVICE);
+		if (err)
+			igt_warn("failure in split atomic device attr err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+	}
+	if (flags & MADVISE_ATOMIC_VMA) {
+		if (bo_size)
+			bo_size = ALIGN(bo_size, SZ_4K);
+
+		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), bo_flags);
+		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data), bo_size, 0, 0);
+
+		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data), bo_size,
+				    DRM_XE_VM_BIND_OP_MAP,
+				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
+				    1, 0, 0);
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+		data[0].vm_sync = 0;
+		gem_close(fd, bo);
+		bo = 0;
+
+		err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
+						DRM_XE_ATOMIC_GLOBAL);
+		if (err)
+			igt_warn("failure in atomic vma err = %s, vm =%u data=%"PRIu64"\n",
+				 strerror(errno), vm, to_user_pointer(data));
+	}
+
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		bo = xe_bo_create(fd, vm, bo_size,
@@ -1307,6 +1534,39 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
 		bool fault_injected = (FAULT & flags) && i > n_execs;
 
+		if (flags & MADVISE_MULTI_VMA) {
+			addr = addr + i * bo_size;
+			org_data = data;
+			data = from_user_pointer(addr);
+			batch_offset = (char *)&(data[idx].batch) - (char *)data;
+			batch_addr = addr + batch_offset;
+			sdi_offset = (char *)&(data[idx].data) - (char *)data;
+			sdi_addr = addr + sdi_offset;
+		}
+
+		if (flags & MADVISE_SPLIT_VMA) {
+			// Write to first half of split VMA
+			uint64_t first_half_addr, sdi_addr_1;
+			uint64_t second_half_addr, sdi_addr_2;
+			sdi_offset = (char *)&data[idx].data - (char *)data;
+			sdi_addr_1 = first_half_addr + sdi_offset;
+			first_half_addr = addr;
+			b = 0;
+			write_dword(&data[idx], sdi_addr_1,
+					WRITE_VALUE(&data[idx], idx), &b,
+					flags & ATOMIC_BATCH ? true : false);
+			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
+
+			// Write to second half of split VMA
+			second_half_addr = addr + bo_size/2;
+			sdi_addr_2 = second_half_addr + sdi_offset;
+			b = 0;
+			write_dword(&data[idx], sdi_addr_2,
+					WRITE_VALUE(&data[idx], idx), &b,
+					flags & ATOMIC_BATCH ? true : false);
+			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
+		}
+
 		if (barrier)
 			pthread_barrier_wait(barrier);
 
@@ -1316,18 +1576,68 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
+				    WRITE_VALUE(&data[idx], idx), &b,
+				    flags & ATOMIC_BATCH ? true : false);
 			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
+			if (flags & PREFETCH) {
+				if (flags & PREFETCH_SPLIT_VMA) {
+					bo_size = ALIGN(bo_size, SZ_4K);
+
+					xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
+
+					igt_debug("num_vmas before madvise = %d \n", val);
+
+					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+
+					err = xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
+					if (err)
+						igt_warn("failure in prefetch split vma err = %s, vm =%u data=%"PRIu64"\n",
+								strerror(errno), vm, to_user_pointer(data));
+					igt_debug("num_vmas after madvise= %d \n", val);
+					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+				} else if (flags & PREFETCH_SAME_ATTR) {
+					err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+							DRM_XE_ATOMIC_GLOBAL);
+					if (err)
+						igt_warn("failure in prefetch same attr err = %s, vm =%u data=%"PRIu64"\n",
+								strerror(errno), vm, to_user_pointer(data));
+					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+					xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+					err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
+							DRM_XE_ATOMIC_GLOBAL);
+					if (err)
+						igt_warn("failure in prefetch atomic attr err = %s, vm =%u data=%"PRIu64"\n",
+								strerror(errno), vm, to_user_pointer(data));
+				} else if (flags & PREFETCH_CHANGE_ATTR) {
+					err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+							DRM_XE_ATOMIC_GLOBAL);
+					if (err)
+						igt_warn("failure in prefetch atomic attr err = %s, vm =%u data=%"PRIu64"\n",
+								strerror(errno), vm, to_user_pointer(data));
+					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+
+					xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+					err = xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
+							DRM_XE_ATOMIC_DEVICE);
+					if (err)
+						igt_warn("failure in prefetch change attr err = %s, vm =%u data=%"PRIu64"\n",
+								strerror(errno), vm, to_user_pointer(data));
+					val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+					}
+				}
 		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
 			b = 0;
-			write_dword(data[idx].batch, sdi_addr,
-				    WRITE_VALUE(&data[idx], idx), &b);
+			write_dword(&data[idx], sdi_addr,
+				    WRITE_VALUE(&data[idx], idx), &b,
+				    flags & ATOMIC_BATCH ? true : false);
 			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
 
 			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
@@ -1346,10 +1656,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
 
@@ -1404,9 +1715,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					       exec_queues[e], &timeout);
 			igt_assert(err == -ETIME || err == -EIO);
 		} else {
-			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
-				       &data[idx].exec_sync, USER_FENCE_VALUE,
-				       exec_queues[e], FIVE_SEC);
+			if (flags & PREFERRED_LOC_ATOMIC_CPU || flags & PREFERRED_LOC_ATOMIC_UND) {
+				int64_t timeout = QUARTER_SEC;
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
 
@@ -1456,17 +1776,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				if (flags & FORK_READ) {
 					igt_fork(child, 1)
 						igt_assert_eq(data[idx].data,
-							      READ_VALUE(&data[idx]));
+							      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
 					if (!(flags & FORK_READ_AFTER))
 						igt_assert_eq(data[idx].data,
-							      READ_VALUE(&data[idx]));
+							      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
 					igt_waitchildren();
 					if (flags & FORK_READ_AFTER)
 						igt_assert_eq(data[idx].data,
-							      READ_VALUE(&data[idx]));
+							      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
 				} else {
 					igt_assert_eq(data[idx].data,
-						      READ_VALUE(&data[idx]));
+						      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
 
 					if (flags & PREFETCH_SYS_BENCHMARK) {
 						struct timespec tv = {};
@@ -1494,13 +1814,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 								((void *)data) + j * orig_size;
 
 							igt_assert_eq(__data[idx].data,
-								      READ_VALUE(&data[idx]));
+								      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[idx]));
 						}
 					}
 				}
 				if (flags & EVERY_OTHER_CHECK)
 					igt_assert_eq(data[prev_idx].data,
-						      READ_VALUE(&data[prev_idx]));
+						      flags & ATOMIC_BATCH ? VAL_ATOMIC_EXPECTED : READ_VALUE(&data[prev_idx]));
 			}
 		}
 
@@ -1521,6 +1841,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			gem_close(fd, bo);
 		}
 
+		if (flags & MADVISE_MULTI_VMA)
+			data = org_data;
+
 		if (flags & NEW) {
 			if (flags & MMAP) {
 				if (flags & FREE)
@@ -1575,15 +1898,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		prev_idx = idx;
 	}
 
-	if (flags & PREFERRED_LOC_SMEM) {
-		err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
-				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-				    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
-		if (err)
-			igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
-				 strerror(errno), vm, to_user_pointer(data), bo_size);
-	}
-
 	if (flags & PREFETCH_BENCHMARK) {
 		igt_info("Prefetch VRAM execution took %.3fms, %.1f5 GB/s\n",
 			 1e-6 * prefetch_ns,
@@ -1610,6 +1924,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 pf_count, pf_count_after);
 	}
 
+cleanup:
 	if (bo) {
 		sync[0].addr = to_user_pointer(bind_ufence);
 		__xe_vm_bind_assert(fd, vm, 0,
@@ -1864,7 +2179,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 
 struct section {
 	const char *name;
-	unsigned int flags;
+	unsigned long long flags;
 };
 
 igt_main
@@ -1964,6 +2279,21 @@ igt_main
 		{ "malloc-mix-bo", MIX_BO_ALLOC },
 		{ NULL },
 	};
+	const struct section msections[] = {
+		{ "atomic-inc", MADVISE_ATOMIC_INC | ATOMIC_BATCH },
+		{ "preffered-loc-sram-migrate-pages", PREFERRED_LOC_SMEM | MIGRATE_ALL_PAGES | ATOMIC_BATCH },
+		{ "preffered-loc-atomic-vram", PREFERRED_LOC_ATOMIC_DEVICE | ATOMIC_BATCH },
+		{ "preffered-loc-atomic-gl", PREFERRED_LOC_ATOMIC_GL | ATOMIC_BATCH },
+		{ "preffered-loc-atomic-cpu", PREFERRED_LOC_ATOMIC_CPU | ATOMIC_BATCH },
+		{ "preffered-loc-atomic-und", PREFERRED_LOC_ATOMIC_UND | ATOMIC_BATCH },
+		{ "multi-vma", MADVISE_MULTI_VMA | ATOMIC_BATCH },
+		{ "split-vma", MADVISE_SPLIT_VMA | ATOMIC_BATCH },
+		{ "atomic-vma", MADVISE_ATOMIC_VMA | ATOMIC_BATCH },
+		{ "split-vma-with-mapping", PREFETCH | PREFETCH_SPLIT_VMA | ATOMIC_BATCH },
+		{ "range-invalidate-change-attr", PREFETCH | PREFETCH_CHANGE_ATTR | ATOMIC_BATCH },
+		{ "no-range-invalidate-same-attr", PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
+		{ NULL },
+	};
 	int fd;
 	int num_sections;
 
@@ -1983,10 +2313,11 @@ igt_main
 	for (const struct section *s = sections; s[num_sections].name; num_sections++)
 		;
 
-	for (int i = 0; i < num_sections * 2; i++) {
-		struct section *s = &sections[i % num_sections];
+	for (int i = 0; i < num_sections * 3; i++) {
+		struct section p = sections[i % num_sections];
+		struct section *s = &p;
 
-		if (i/num_sections == 0) {
+		if (i/num_sections == 1) {
 			static char modified_name[256];
 			snprintf(modified_name, sizeof(modified_name), "%s-preferred-loc-smem", s->name);
 			s->name = modified_name;
@@ -2175,6 +2506,14 @@ igt_main
 			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
 	}
 
+	for (const struct section *s = msections; s->name; s++) {
+		igt_subtest_f("madvise-%s", s->name) {
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
+						NULL, s->flags);
+		}
+	}
+
 	igt_fixture {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

