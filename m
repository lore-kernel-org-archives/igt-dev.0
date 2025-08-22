Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A09FCA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 08:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E87D10EA93;
	Fri, 22 Aug 2025 08:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ay3hu5ZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8A910EA93
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755851488; x=1787387488;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j1BHYhc3XhllS441OzHLgiDpA9WP/mYIgwwjNm/jTGA=;
 b=Ay3hu5ZTWwaWWM++Bo8IGcRR9BU4m4xrm3kn3C3DyFK51okhgv9dchG2
 RJ4xitlkCbuR3AD9rkKCIf+rb00WtrzyAIQCVfS01Ktz1GV/pQtKV4Ej/
 lZ/ME8OxKe5oK7J9PyoeINdofW+YvWl+b2UcogqqTEZbnlQbgGsGudz5N
 HAWGt74VPrIlRTtRUJ04BZWEaBfUmkHceRZCsMQJqurFf0a59Yux7zfuO
 PghfkFeY53aDZFw1Efm1OWcjDN4qEybCTr5RCgfZdMSYJyWnZOBWcadiJ
 Qp40WDgmvL7vblqKIxq285EBtliwB5NCN9EdeXiD9Hab21sVdIyGFQiL7 Q==;
X-CSE-ConnectionGUID: /ParQaUVRcijNv5nAWANbw==
X-CSE-MsgGUID: 6RaZMu5kSuqi1dsRfCbdGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61801513"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="61801513"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 01:31:28 -0700
X-CSE-ConnectionGUID: NcHRs/oTRViXUvNMgm+wGw==
X-CSE-MsgGUID: z61TEzTFTx6xmox4V4zYgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169478999"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa010.fm.intel.com with ESMTP; 22 Aug 2025 01:31:25 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Added
 preferred_loc_smem test
Date: Fri, 22 Aug 2025 08:31:17 +0000
Message-ID: <20250822083118.496366-5-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822083118.496366-1-nishit.sharma@intel.com>
References: <20250822083118.496366-1-nishit.sharma@intel.com>
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

Added preferred-loc-smem test which is called in combination with other
tests as well. In this test the buffer object preferred location is
system memory. MADVISE ioctl is called with preferred_loc attribute and
default_system system memory as preferred location.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 227 ++++++++++++++++++++-----
 1 file changed, 188 insertions(+), 39 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 007d9bdc0..28a3ba39b 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -138,7 +138,6 @@ static void signal_pdata(struct process_data *pdata)
 #define CPU_FAULT_THREADS	(0x1 << 2)
 #define CPU_FAULT_PROCESS	(0x1 << 3)
 #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
-
 static void process_check(void *ptr, uint64_t alloc_size, uint64_t stride,
 			  unsigned int flags)
 {
@@ -406,6 +405,39 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
 		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
 }
 
+#define MAX_N_EXEC_QUEUES       16
+
+#define MMAP                    (0x1 << 0)
+#define NEW                     (0x1 << 1)
+#define BO_UNMAP                (0x1 << 2)
+#define FREE                    (0x1 << 3)
+#define BUSY                    (0x1 << 4)
+#define BO_MAP                  (0x1 << 5)
+#define RACE                    (0x1 << 6)
+#define SKIP_MEMSET             (0x1 << 7)
+#define FAULT                   (0x1 << 8)
+#define FILE_BACKED             (0x1 << 9)
+#define LOCK                    (0x1 << 10)
+#define MMAP_SHARED             (0x1 << 11)
+#define HUGE_PAGE               (0x1 << 12)
+#define SHARED_ALLOC            (0x1 << 13)
+#define FORK_READ               (0x1 << 14)
+#define FORK_READ_AFTER         (0x1 << 15)
+#define MREMAP                  (0x1 << 16)
+#define DONTUNMAP               (0x1 << 17)
+#define READ_ONLY_REMAP         (0x1 << 18)
+#define SYNC_EXEC               (0x1 << 19)
+#define EVERY_OTHER_CHECK       (0x1 << 20)
+#define MULTI_FAULT             (0x1 << 21)
+#define PREFETCH                (0x1 << 22)
+#define THREADS                 (0x1 << 23)
+#define PROCESSES               (0x1 << 24)
+#define PREFETCH_BENCHMARK      (0x1 << 25)
+#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
+#define PREFERRED_LOC_SMEM      (0x1 << 27)
+
+#define N_MULTI_FAULT           4
+
 /**
  * SUBTEST: unaligned-alloc
  * Description: allocate unaligned sizes of memory
@@ -460,7 +492,7 @@ many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t *bos = NULL;
 	struct timespec tv = {};
 	uint64_t submit, read, elapsed;
-	int i;
+	int i, err;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
@@ -500,6 +532,15 @@ many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
 			alloc.ptr = aligned_alloc(SZ_2M, alloc_size);
 			igt_assert(alloc.ptr);
 		}
+
+		if (flags & PREFERRED_LOC_SMEM) {
+			err = xe_vm_madvise(fd, vm, to_user_pointer(alloc.ptr), alloc_size, 0,
+					    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+					    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
+				if (err)
+					igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size =%"PRIu64"\n",
+						  strerror(errno), vm, to_user_pointer(alloc.ptr), alloc_size);
+		}
 		allocs[i] = alloc;
 
 		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
@@ -662,7 +703,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	size_t bo_size = SZ_2M, unmap_offset = 0;
 	uint32_t vm, exec_queue;
 	u64 *exec_ufence = NULL;
-	int i;
+	int i, err;
 	void *old, *new = NULL;
 	struct aligned_alloc_type alloc;
 
@@ -688,6 +729,15 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 	data[0].vm_sync = 0;
 
+	if (flags & PREFERRED_LOC_SMEM) {
+		err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
+				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+				    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
+		if (err)
+			igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
+				  strerror(errno), vm, to_user_pointer(data), bo_size);
+	}
+
 	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
 			   PROT_WRITE, MAP_SHARED |
 			   MAP_ANONYMOUS, -1, 0);
@@ -747,38 +797,6 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	xe_vm_destroy(fd, vm);
 }
 
-#define MAX_N_EXEC_QUEUES	16
-
-#define MMAP			(0x1 << 0)
-#define NEW			(0x1 << 1)
-#define BO_UNMAP		(0x1 << 2)
-#define FREE			(0x1 << 3)
-#define BUSY			(0x1 << 4)
-#define BO_MAP			(0x1 << 5)
-#define RACE			(0x1 << 6)
-#define SKIP_MEMSET		(0x1 << 7)
-#define FAULT			(0x1 << 8)
-#define FILE_BACKED		(0x1 << 9)
-#define LOCK			(0x1 << 10)
-#define MMAP_SHARED		(0x1 << 11)
-#define HUGE_PAGE		(0x1 << 12)
-#define SHARED_ALLOC		(0x1 << 13)
-#define FORK_READ		(0x1 << 14)
-#define FORK_READ_AFTER		(0x1 << 15)
-#define MREMAP			(0x1 << 16)
-#define DONTUNMAP		(0x1 << 17)
-#define READ_ONLY_REMAP		(0x1 << 18)
-#define SYNC_EXEC		(0x1 << 19)
-#define EVERY_OTHER_CHECK	(0x1 << 20)
-#define MULTI_FAULT		(0x1 << 21)
-#define PREFETCH		(0x1 << 22)
-#define THREADS			(0x1 << 23)
-#define PROCESSES		(0x1 << 24)
-#define PREFETCH_BENCHMARK	(0x1 << 25)
-#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
-
-#define N_MULTI_FAULT		4
-
 /**
  * SUBTEST: once-%s
  * Description: Run %arg[1] system allocator test only once
@@ -951,6 +969,80 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap-new-nomemset:			mmap a new buffer for each exec, skip memset of buffers
  * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
  * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
+ * @free-nomemset-preferred-loc-smem:	malloc and free buffer for each exec and perform preferred loc madvise operation
+ * @free-preferred-loc-smem:		free buffer for each exec and perform preferred loc madvise operation
+ * @free-race-nomemset-preferred-loc-smem:	free buffer for each exec with race between cpu and gpu access and perform madvise operation skipping memset
+ * @free-race-preferred-loc-smem:	free buffer for each exec with race between cpu and gpu access and perform madvise operation
+ * @malloc-bo-unmap-nomemset-preferred-loc-smem:	malloc single buffer for all execs, bind and unbind a BO to same address, skip memset and perform madvise operation
+ * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer for all execs, try to unbind while buffer valid, skip memset of buffers and perform madvise operation
+ * @malloc-busy-preferred-loc-smem:	malloc single buffer for all execs, try to unbind while buffer valid and perform madvise operation
+ * @malloc-fork-read-after-preferred-loc-smem:	malloc single buffer for all execs, fork a process to read test output, perform madvise operation
+ * @malloc-fork-read-preferred-loc-smem:	malloc single buffer for all execs, fork a process to read test output, perform madvise operation
+ * @malloc-mlock-nomemset-preferred-loc-smem:	malloc and mlock single buffer for all execs, skip memset of buffers, perform madvise operation
+ * @malloc-mlock-preferred-loc-smem:	malloc and mlock single buffer for all execs, perform madvise operation
+ * @malloc-multi-fault-preferred-loc-smem:	malloc single buffer for all execs and perform madvise operation
+ * @malloc-nomemset-preferred-loc-smem:	malloc single buffer for all execs, skip memset of buffers and perform madvise operation
+ * @malloc-preferred-loc-smem:	malloc single buffer for all execs, issue a command which will trigger multiple faults, perform madvise operation
+ * @malloc-prefetch-preferred-loc-smem:	malloc single buffer for all execs, prefetch buffer before each exec, perform madvise operation
+ * @malloc-prefetch-race-preferred-loc-smem:	malloc single buffer for all execs, prefetch buffer before each exec, perform madvise operation
+ * @malloc-race-nomemset-preferred-loc-smem:	malloc single buffer for all execs with race between cpu and gpu access, perform madvise operation
+ * @malloc-race-preferred-loc-smem:	malloc single buffer for all execs with race between cpu and gpu access, perform madvise operation
+ * @free-race-nomemset-preferred-loc-smem: malloc and free buffer for each exec with race between cpu and gpu access, perform madvise operation
+ * @free-race-preferred-loc-smem:	malloc and free buffer for each exec with race between cpu and gpu access, perform madvise operation
+ * @malloc-bo-unmap-nomemset-preferred-loc-smem: malloc single buffer for all execs, bind and unbind a BO to same address before execs, perform madvise operation
+ * @malloc-bo-unmap-preferred-loc-smem:	malloc single buffer for all execs and perform madvise operation
+ * @malloc-busy-nomemset-preferred-loc-smem:	malloc single buffer for all execs and perform madvise operation
+ * @malloc-busy-preferred-loc-smem:	malloc single buffer for all execs and perform madvise
+ * @mmap-file-mlock-nomemset-preferred-loc-smem:	 mmap and mlock single buffer, with file backing, perform madvise
+ * @mmap-file-mlock-preferred-loc-smem:	mmap and mlock single buffer, with file backing, perform madvise
+ * @mmap-file-nomemset-preferred-loc-smem:	mmap single buffer, with file backing and perform madvise
+ * @mmap-file-preferred-loc-smem:	mmap single buffer, with file backing and perform madvise
+ * @mmap-free-huge-nomemset-preferred-loc-smem:	mmap huge page and free buffer for each exec and perform madvise
+ * @mmap-free-huge-preferred-loc-smem:	mmap huge page and free buffer for each exec and perform madvise
+ * @mmap-free-nomemset-preferred-loc-smem:	mmap and free buffer for each exec and perform madvise
+ * @mmap-free-preferred-loc-smem:	mmap and free buffer for each exec and perform madvise
+ * @mmap-free-race-nomemset-preferred-loc-smem:
+ * @mmap-free-race-preferred-loc-smem:
+ * @mmap-huge-nomemset-preferred-loc-smem:
+ * @mmap-huge-preferred-loc-smem:
+ * @mmap-mlock-nomemset-preferred-loc-smem:
+ * @mmap-mlock-preferred-loc-smem:
+ * @mmap-new-huge-nomemset-preferred-loc-smem:
+ * @mmap-new-huge-preferred-loc-smem:
+ * @mmap-new-nomemset-preferred-loc-smem:
+ * @mmap-new-preferred-loc-smem:
+ * @mmap-new-race-nomemset-preferred-loc-smem:
+ * @mmap-new-race-preferred-loc-smem:
+ * @mmap-nomemset-preferred-loc-smem:
+ * @mmap-preferred-loc-smem:
+ * @mmap-prefetch-preferred-loc-smem:
+ * @mmap-prefetch-shared-preferred-loc-smem:
+ * @mmap-race-nomemset-preferred-loc-smem:
+ * @mmap-race-preferred-loc-smem:
+ * @mmap-remap-dontunmap-eocheck-preferred-loc-smem:
+ * @mmap-remap-dontunmap-preferred-loc-smem:
+ * @mmap-remap-eocheck-preferred-loc-smem:
+ * @mmap-remap-preferred-loc-smem:
+ * @mmap-remap-ro-dontunmap-eocheck-preferred-loc-smem:
+ * @mmap-remap-ro-dontunmap-preferred-loc-smem:
+ * @mmap-remap-ro-eocheck-preferred-loc-smem:
+ * @mmap-remap-ro-preferred-loc-smem:
+ * @mmap-shared-nomemset-preferred-loc-smem:
+ * @mmap-shared-preferred-loc-smem:
+ * @mmap-shared-remap-dontunmap-eocheck-preferred-loc-smem:
+ * @mmap-shared-remap-dontunmap-preferred-loc-smem:
+ * @mmap-shared-remap-eocheck-preferred-loc-smem:
+ * @mmap-shared-remap-preferred-loc-smem:
+ * @new-bo-map-nomemset-preferred-loc-smem:
+ * @new-bo-map-preferred-loc-smem:
+ * @new-busy-nomemset-preferred-loc-smem:
+ * @new-busy-preferred-loc-smem:
+ * @new-nomemset-preferred-loc-smem:
+ * @new-preferred-loc-smem:
+ * @new-prefetch-preferred-loc-smem:
+ * @new-race-nomemset-preferred-loc-smem:
+ * @new-race-preferred-loc-smem:
+ * @prefetch-benchmark:
  *
  * SUBTEST: prefetch-benchmark
  * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
@@ -1020,14 +1112,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t bo = 0, bind_sync = 0;
 	void **pending_free;
 	u64 *exec_ufence = NULL, *bind_ufence = NULL;
-	int i, j, b, file_fd = -1, prev_idx, pf_count;
+	int i, j, b, file_fd = -1, prev_idx, pf_count, err;
 	bool free_vm = false;
 	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
 	size_t orig_size = bo_size;
 	struct aligned_alloc_type aligned_alloc_type;
 	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
 	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
-	uint64_t prefetch_ns = 0, prefetch_sys_ns = 0;
+	uint64_t prefetch_ns = 0;
 	const char *pf_count_stat = "svm_pagefault_count";
 
 	if (flags & MULTI_FAULT) {
@@ -1133,6 +1225,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	addr = to_user_pointer(data);
 
+	if (flags & PREFERRED_LOC_SMEM) {
+		err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
+				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+				    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
+		if (err)
+			igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
+				 strerror(errno), vm, to_user_pointer(data), bo_size);
+	}
+
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		bo = xe_bo_create(fd, vm, bo_size,
@@ -1202,7 +1303,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t batch_addr = addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[idx].data - (char *)data;
 		uint64_t sdi_addr = addr + sdi_offset;
-		int e = i % n_exec_queues, err;
+		int e = i % n_exec_queues;
 		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
 		bool fault_injected = (FAULT & flags) && i > n_execs;
 
@@ -1232,6 +1333,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
 			next_data = aligned_alloc_type.ptr;
 			igt_assert(next_data);
+
+			if (flags & PREFERRED_LOC_SMEM) {
+				err = xe_vm_madvise(fd, vm, to_user_pointer(next_data), bo_size, 0,
+							DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+							DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
+				if (err)
+					igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
+						  strerror(errno), vm, to_user_pointer(next_data), bo_size);
+			}
+
 			__aligned_partial_free(&aligned_alloc_type);
 
 			b = 0;
@@ -1253,6 +1364,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			sync[0].addr = to_user_pointer(bind_ufence);
 
 			start = igt_nsec_elapsed(&tv);
+
 			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
 					     1, region);
 			end = igt_nsec_elapsed(&tv);
@@ -1355,6 +1467,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				} else {
 					igt_assert_eq(data[idx].data,
 						      READ_VALUE(&data[idx]));
+
 					if (flags & PREFETCH_SYS_BENCHMARK) {
 						struct timespec tv = {};
 						u64 start, end;
@@ -1429,6 +1542,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
 				data = aligned_alloc_type.ptr;
 				igt_assert(data);
+
 				__aligned_partial_free(&aligned_alloc_type);
 
 				bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
@@ -1450,6 +1564,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				}
 				bo = 0;
 				data = aligned_alloc(aligned_size, bo_size);
+
 				igt_assert(data);
 			}
 			addr = to_user_pointer(data);
@@ -1460,6 +1575,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		prev_idx = idx;
 	}
 
+	if (flags & PREFERRED_LOC_SMEM) {
+		err = xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
+				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+				    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
+		if (err)
+			igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
+				 strerror(errno), vm, to_user_pointer(data), bo_size);
+	}
+
 	if (flags & PREFETCH_BENCHMARK) {
 		igt_info("Prefetch VRAM execution took %.3fms, %.1f5 GB/s\n",
 			 1e-6 * prefetch_ns,
@@ -1587,6 +1711,7 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	uint32_t vm = 0;
 	bool go = false;
 	void *alloc = NULL;
+	int err;
 
 	if ((FILE_BACKED | FORK_READ) & flags)
 		return;
@@ -1614,6 +1739,15 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 		alloc = aligned_alloc(SZ_2M, alloc_size);
 		igt_assert(alloc);
 
+		if (flags & PREFERRED_LOC_SMEM) {
+			err = xe_vm_madvise(fd, vm, to_user_pointer(alloc), alloc_size, 0,
+					    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+					    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0);
+			if (err)
+				igt_warn("MADVISE_FAILURE err = %s, vm =%u data=%"PRIu64" alloc_size = %zu\n",
+					  strerror(errno), vm, to_user_pointer(alloc), alloc_size);
+		}
+
 		memset(alloc, 5, alloc_size);
 		flags &= ~SHARED_ALLOC;
 	}
@@ -1831,6 +1965,7 @@ igt_main
 		{ NULL },
 	};
 	int fd;
+	int num_sections;
 
 	igt_fixture {
 		struct xe_device *xe;
@@ -1843,7 +1978,21 @@ igt_main
 		open_sync_file();
 	}
 
-	for (const struct section *s = sections; s->name; s++) {
+
+	num_sections = 0;
+	for (const struct section *s = sections; s[num_sections].name; num_sections++)
+		;
+
+	for (int i = 0; i < num_sections * 2; i++) {
+		struct section *s = &sections[i % num_sections];
+
+		if (i/num_sections == 0) {
+			static char modified_name[256];
+			snprintf(modified_name, sizeof(modified_name), "%s-preferred-loc-smem", s->name);
+			s->name = modified_name;
+			s->flags |= PREFERRED_LOC_SMEM;
+		}
+
 		igt_subtest_f("once-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
-- 
2.43.0

