Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEAACAC5A0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 17:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820A710E061;
	Wed, 17 Sep 2025 17:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gU+jr1aY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEBC10E061
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758129588; x=1789665588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oAXadDgDMI8JEDClG4lScRJMpgJL8S+y9zXVEXrGj0A=;
 b=gU+jr1aYOh90N+DFRfXGYT8PkVvIx9qtm4tWo80tGxrbGY41Qqz2SZ1N
 J8QSbW6Y5io2nGuBk4AcbQpYxbFY4ZLYfAAUIfyFP1bhdyDcRR/cM8xp+
 QlX00sNsVQ6fttxpAOkIsEJC0PJaqiz5/diDfv6UVlloDpgt6D2pJEjhe
 DoH2S9ugYK3kjn/5yF0p+myRcl3dqLh7u7mxjLZkTvRAFEJEzYyL+HtVn
 4badvyn9epoxudYw6kFTAsz6MbvntNUmmPWzk+ZnH7CzfNb94iMwSX3zc
 21/P8TxodcRXG9Koc0RvH0q/cDjqKHV33Q8/BV/D4mlZVRAzOvexzRw1j Q==;
X-CSE-ConnectionGUID: DXTk4kxqTpSPzKnrbtdhDA==
X-CSE-MsgGUID: DMcscYwlQ4utXJ9QxLrm+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59487707"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="59487707"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 10:19:48 -0700
X-CSE-ConnectionGUID: 6ExFzpYRRfSP0VYpfs7WGA==
X-CSE-MsgGUID: a9RZ4gQHT9CcE4NfUXcURw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175745565"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.68])
 by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 10:19:45 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, pravalika.gurram@intel.com,
 nishit.sharma@intel.com
Cc: ashutosh.dixit@intel.com, himal.prasad.ghimiray@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH v8 1/1] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
Date: Wed, 17 Sep 2025 17:19:41 +0000
Message-ID: <20250917171941.3025392-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917171941.3025392-1-nishit.sharma@intel.com>
References: <20250917171941.3025392-1-nishit.sharma@intel.com>
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

From: Pravalika Gurram <pravalika.gurram@intel.com>

Add pat-index-madvise test to verify setting different
pat_index values for multiple VMAs. This test uses
madvise to set various pat_index values and
verifies that different PAT values can be assigned to multiple
VMAs as expected. Add skip for igpu.

v2:
  - Remove macro which is not needed and alignment (Nishit)
  - use existing struct by adding new member
  - Remove num_ranges to NULL assignment
v3:
  - checkpatch.pl (Nishit)
v4:
  - skip test based on platform (Ashutosh)

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Himal Prasad <himal.prasad.ghimiray@intel.com>
Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/xe/xe_ioctl.c                      |  29 ++--
 lib/xe/xe_ioctl.h                      |   4 +-
 tests/intel/xe_exec_system_allocator.c | 186 +++++++++++++++++++++----
 3 files changed, 178 insertions(+), 41 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index edd36db9d..39c4667a1 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -79,20 +79,23 @@ int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
 }
 
 /**
- * xe_vm_print_mem_attr_values_in_range:
+ * xe_vm_get_mem_attr_values_in_range:
  * @fd: xe device fd
  * @vm: vm_id of the virtual range
  * @start: start of the virtual address range
  * @range: size of the virtual address range
+ * @num_ranges: number of vma ranges
  *
  * Calls QUERY_MEM_RANGES_ATTRS ioctl to get memory attributes for different
- * memory ranges from KMD. prints memory attributes as returned by KMD for
+ * memory ranges from KMD. return memory attributes as returned by KMD for
  * atomic, prefrred loc and pat index types.
  *
- * Returns 0 for success or error for failure
+ * Returns struct drm_xe_mem_range_attr for success or error for failure
  */
 
-int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range)
+struct drm_xe_mem_range_attr
+*xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start,
+				    uint64_t range, uint32_t *num_ranges)
 {
 	void *ptr_start, *ptr;
 	int err;
@@ -113,22 +116,26 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
 		igt_warn("ioctl failed for xe_vm_number_vmas_in_range\n");
 		igt_debug("vmas_in_range err = %d query.num_mem_ranges = %u query.sizeof_mem_range_attr=%lld\n",
 			  err, query.num_mem_ranges, query.sizeof_mem_range_attr);
-		return err;
+		return NULL;
 	}
 
 	/* Allocate buffer for the memory region attributes */
 	ptr = malloc(query.num_mem_ranges * query.sizeof_mem_range_attr);
 	ptr_start = ptr;
 
-	if (!ptr)
-		return -ENOMEM;
+	if (!ptr) {
+		igt_debug("memory allocation failed\n");
+		return NULL;
+	}
 
 	err = xe_vm_vma_attrs(fd, &query, ptr);
 	if (err) {
 		igt_warn("ioctl failed for vma_attrs err = %d\n", err);
-		return err;
+		free(ptr_start);
+		return NULL;
 	}
 
+	ptr = ptr_start; // Reset pointer for iteration
 	/* Iterate over the returned memory region attributes */
 	for (unsigned int i = 0; i < query.num_mem_ranges; ++i) {
 		struct drm_xe_mem_range_attr *mem_attrs = (struct drm_xe_mem_range_attr *)ptr;
@@ -144,8 +151,10 @@ int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, ui
 		ptr += query.sizeof_mem_range_attr;
 	}
 
-	free(ptr_start);
-	return 0;
+	if (num_ranges)
+		*num_ranges = query.num_mem_ranges;
+
+	return (struct drm_xe_mem_range_attr *)ptr_start;
 }
 
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index a1df810de..ae8a23a54 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -106,5 +106,7 @@ void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t
 int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
 int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
 		    struct drm_xe_mem_range_attr *mem_attr);
-int xe_vm_print_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start, uint64_t range);
+struct drm_xe_mem_range_attr
+*xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start,
+				    uint64_t range, uint32_t *num_ranges);
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 30012af4f..9ab8b43de 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -517,6 +517,46 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
  * SUBTEST: madvise-atomic-inc
  * Description: Tests madvise atomic operations
  * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-max-pat-index-multi-vma
+ * Description: Tests madvise max pat index multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-max-pat-index-single-vma
+ * Description: Test madvise with max pat index single operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-uc-comp-single-vma
+ * Description: Tests madvise with uc-comp single operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-uc-comp-multi-vma
+ * Description: Tests madvise with uc-comp multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-uc-multi-vma
+ * Description: Tests madvise with uc multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-uc-single-vma
+ * Description: Tests madvise with uc single operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-wb-multi-vma
+ * Description: Tests madvise with wb multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-wb-single-vma
+ * Description: Tests madvise with wb single operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-wt-multi-vma
+ * Description: Tests madvise with wt multi operations
+ * Test category: functionality test
+ *
+ * SUBTEST: pat-index-madvise-pat-idx-wt-single-vma
+ * Description: Tests madvise with wt single operations
+ * Test category: functionality test
  */
 
 static void
@@ -863,6 +903,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define PREFETCH_SAME_ATTR		(0x1ull << 39)
 #define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 40)
 #define MADVISE_ATOMIC_DEVICE		(0x1ull << 41)
+#define MADVISE_PAT_INDEX		(0x1ull << 42)
 
 #define N_MULTI_FAULT		4
 
@@ -1130,7 +1171,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 			    size_t bo_size,
 			    struct drm_xe_engine_class_instance *eci,
 			    uint64_t addr, unsigned long long flags,
-			    struct drm_xe_sync *sync)
+			    struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
 {
 	uint32_t bo_flags, bo = 0;
 
@@ -1204,32 +1245,74 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
 					  DRM_XE_ATOMIC_GLOBAL);
 	}
+
+	if (flags & MADVISE_PAT_INDEX) {
+		uint32_t num_ranges;
+		struct drm_xe_mem_range_attr *mem_attrs;
+
+		if (bo_size)
+			bo_size = ALIGN(bo_size, SZ_4K);
+
+		if (flags & MADVISE_MULTI_VMA) {
+			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size,
+					       bo_size / 2, pat_value(fd));
+			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
+					       pat_value(fd));
+			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size / 2,
+					       bo_size / 4, pat_value(fd));
+		} else {
+			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
+					       pat_value(fd));
+		}
+
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			igt_debug("Failed to get memory attributes\n");
+			return;
+		}
+
+		for (uint32_t i = 0; i < num_ranges; i++)
+			igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_value(fd));
+
+		free(mem_attrs);
+	}
 }
 
 static void
 madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		    unsigned long long flags, struct test_exec_data *data)
 {
-	uint32_t val;
+	struct drm_xe_mem_range_attr *mem_attrs;
+	uint32_t num_ranges;
 
 	if (flags & PREFETCH_SPLIT_VMA) {
 		bo_size = ALIGN(bo_size, SZ_4K);
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0, 0);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
-
-		igt_debug("num_vmas before madvise = %d\n", val);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			igt_info("Failed to get memory attributes\n");
+			return;
+		}
 
 		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size / 2);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			igt_info("Failed to get memory attributes\n");
+			return;
+		}
 
-		igt_debug("num_vmas after madvise= %d\n", val);
 	} else if (flags & PREFETCH_SAME_ATTR) {
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 					  DRM_XE_ATOMIC_GLOBAL);
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			igt_info("Failed to get memory attributes\n");
+			return;
+		}
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
 				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
@@ -1240,16 +1323,19 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 					  DRM_XE_ATOMIC_GLOBAL);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			igt_info("Failed to get memory attributes\n");
+			return;
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
 				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
 
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 					  DRM_XE_ATOMIC_DEVICE);
-
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		}
 	}
+	free(mem_attrs);
 }
 
 static void
@@ -1275,7 +1361,7 @@ static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, size_t bo_size,
 	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
-	  unsigned long long flags)
+	  unsigned long long flags, uint8_t (*pat_value)(int))
 {
 	uint64_t addr;
 	struct drm_xe_sync sync[1] = {
@@ -1407,7 +1493,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	addr = to_user_pointer(data);
 
 	if (flags & MADVISE_OP)
-		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
+		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
+					    pat_value);
 
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
@@ -1528,7 +1615,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			next_data = aligned_alloc_type.ptr;
 			igt_assert(next_data);
 
-			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
+			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
+						    pat_value);
 			__aligned_partial_free(&aligned_alloc_type);
 
 			b = 0;
@@ -1895,7 +1983,7 @@ static void *thread(void *data)
 
 	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
 		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
-		  t->flags | THREADS);
+		  t->flags | THREADS, NULL);
 
 	return NULL;
 }
@@ -2013,7 +2101,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
 
 	fd = drm_open_driver(DRIVER_XE);
 	test_exec(fd, hwe, n_exec_queues, n_execs,
-		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
+		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES, NULL);
 	drm_close_driver(fd);
 
 	close(map_fd);
@@ -2108,6 +2196,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 struct section {
 	const char *name;
 	unsigned long long flags;
+	uint8_t (*fn)(int pat);
 };
 
 igt_main
@@ -2240,6 +2329,31 @@ igt_main
 		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
 		{ NULL },
 	};
+
+	const struct section intel_get_pat_idx_functions[] = {
+		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
+		  intel_get_pat_idx_wb },
+		{ "madvise-pat-idx-wb-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
+		  MADVISE_MULTI_VMA, intel_get_pat_idx_wb },
+		{ "madvise-pat-idx-wt-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
+		  intel_get_pat_idx_wt },
+		{ "madvise-pat-idx-wt-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
+		   MADVISE_MULTI_VMA, intel_get_pat_idx_wt },
+		{ "madvise-pat-idx-uc-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
+		  intel_get_pat_idx_uc },
+		{ "madvise-pat-idx-uc-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
+		   MADVISE_MULTI_VMA, intel_get_pat_idx_uc },
+		{ "madvise-pat-idx-uc-comp-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
+		  intel_get_pat_idx_uc_comp },
+		{ "madvise-pat-idx-uc-comp-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
+		  MADVISE_MULTI_VMA, intel_get_pat_idx_uc_comp },
+		{ "madvise-max-pat-index-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
+		  intel_get_max_pat_index },
+		{ "madvise-max-pat-index-multi-vma", MADVISE_OP | MADVISE_PAT_INDEX |
+		  MADVISE_MULTI_VMA, intel_get_max_pat_index },
+		{ NULL },
+	};
+
 	int fd;
 
 	igt_fixture {
@@ -2257,52 +2371,52 @@ igt_main
 		igt_subtest_f("once-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("once-large-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_2M, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("twice-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, 0, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("twice-large-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, SZ_2M, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("many-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 128, 0, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("many-stride-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 128, 0, 256, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("many-execqueues-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16, 128, 0, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("many-large-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("many-64k-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("many-large-execqueues-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 
 		igt_subtest_f("threads-many-%s", s->name)
 			threads(fd, 1, 128, 0, 0, s->flags, false);
@@ -2353,13 +2467,13 @@ igt_main
 	igt_subtest_f("prefetch-benchmark")
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
-				  NULL, PREFETCH | PREFETCH_BENCHMARK);
+				  NULL, PREFETCH | PREFETCH_BENCHMARK, NULL);
 
 	igt_subtest_f("prefetch-sys-benchmark")
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
 				  NULL, PREFETCH | PREFETCH_BENCHMARK |
-				  PREFETCH_SYS_BENCHMARK);
+				  PREFETCH_SYS_BENCHMARK, NULL);
 
 	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
 		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
@@ -2379,7 +2493,7 @@ igt_main
 	igt_subtest_f("fault")
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
-				  FAULT);
+				  FAULT, NULL);
 
 	for (const struct section *s = psections; s->name; s++) {
 		igt_subtest_f("partial-%s", s->name)
@@ -2440,7 +2554,19 @@ igt_main
 		igt_subtest_f("madvise-%s", s->name) {
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
+		}
+	}
+
+	for (const struct section *s = intel_get_pat_idx_functions; s->name; s++) {
+		igt_subtest_f("pat-index-%s", s->name) {
+			if ((strstr(s->name, "madvise-pat-idx-wt-") ||
+			     strstr(s->name, "madvise-pat-idx-uc-comp-")) &&
+			     !xe_has_vram(fd)) {
+				igt_skip("Skipping compression-related PAT index\n");
+			}
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
 	}
 
-- 
2.43.0

