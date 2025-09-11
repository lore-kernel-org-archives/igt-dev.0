Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06AECAC58D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 12:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9871810EAFD;
	Thu, 11 Sep 2025 12:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDzQkZvM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F7110EAFD
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757593877; x=1789129877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GFD24aD6j4FZDTjtOzEO/qhAtWaq617fpfZ5z6owDEE=;
 b=NDzQkZvM1K7ezGktHxgDq9kTmWqdgu6S/9eBqGN8ua0eHYOiUe5b329C
 8On+pyWBoUWNXoz7F+y4/f6SkayUYdhiiV1kJyDXffpeH1W7JTXL6ndYz
 3L0iLzh3WVi/pae5NbTHbwQbyMobqQS+38lqshMdC/pbU5H8pNBIIme09
 fOzTrbHtawGvHque3+t1Gt/7PmKIIw5FO1gfuTng3G3tZDPF24zmyG9sY
 9mA3YazB/Xzxbtmbqk1iEbMte8fjMQ9oO6GOG/WyNKQpri5I1sfL5pZs3
 +Ut00CHVz3/FmwIkUVaW4kSrVFgWX5+CGelDlhY/seywoFjdcBsCckXsp w==;
X-CSE-ConnectionGUID: +Pt1mcB4R3yw3sa5alv7Aw==
X-CSE-MsgGUID: EYvDlNY0Sie2cprjIc6fMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63752179"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="63752179"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 05:31:17 -0700
X-CSE-ConnectionGUID: PCTbg9xKS+e8LsIaZDheVg==
X-CSE-MsgGUID: qVrfwjgITPWSi77YkJwOtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="174475378"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2025 05:31:16 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v3 2/2] tests/intel/xe_exec_system_allocator: Add
 pat-index-madvise
Date: Thu, 11 Sep 2025 18:12:08 +0530
Message-Id: <20250911124208.1159281-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911124208.1159281-1-pravalika.gurram@intel.com>
References: <20250911124208.1159281-1-pravalika.gurram@intel.com>
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
verifies that different PAT values can be assigned to multiple VMAs as expected.

v2:
  - Remove macro which is not needed and alignment (Nishit)
  - use existing struct by adding new member
  - Remove num_ranges to NULL assignment
v3:
  - checkpatch.pl (Nishit)

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 lib/xe/xe_ioctl.c                      |  29 ++--
 lib/xe/xe_ioctl.h                      |   4 +-
 tests/intel/xe_exec_system_allocator.c | 190 +++++++++++++++++++++----
 3 files changed, 182 insertions(+), 41 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 62e9fe9eb..090180f37 100644
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
index f61a4ebf4..ba8ae8d47 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -515,6 +515,46 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
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
@@ -861,6 +901,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define PREFETCH_SAME_ATTR		(0x1ull << 39)
 #define PREFERRED_LOC_ATOMIC_UND	(0x1ull << 40)
 #define MADVISE_ATOMIC_DEVICE		(0x1ull << 41)
+#define MADVISE_PAT_INDEX		(0x1ull << 42)
 
 #define N_MULTI_FAULT		4
 
@@ -1127,11 +1168,10 @@ static void
 xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		size_t bo_size, struct drm_xe_engine_class_instance *eci,
 		uint64_t addr, unsigned long long flags,
-		struct drm_xe_sync *sync)
+		struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
 {
 	uint32_t bo_flags, bo = 0;
 
-
 	if (flags & MADVISE_ATOMIC_DEVICE)
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 				DRM_XE_ATOMIC_DEVICE);
@@ -1203,32 +1243,79 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size/2,
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
+					       bo_size/2, pat_value(fd));
+			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
+					       pat_value(fd));
+			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size/2,
+					       bo_size/4, pat_value(fd));
+		} else
+			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
+					       pat_value(fd));
+
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			igt_debug("Failed to get memory attributes\n");
+			return;
+		}
+
+		for (uint32_t i = 0; i < num_ranges; i++) {
+			igt_debug("Processing mem_attr[%d]: start=0x%llx,
+				   end=0x%llx pat_index = %d\n", i,
+				   mem_attrs[i].start, mem_attrs[i].end,
+				   mem_attrs[i].pat_index.val);
+			igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_value(fd));
+		}
+
+		free(mem_attrs);
+	}
+
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
+			printf("Failed to get memory attributes\n");
+			return;
+		}
 
 		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size/2);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			printf("Failed to get memory attributes\n");
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
+			printf("Failed to get memory attributes\n");
+			return;
+		}
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
 				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
@@ -1239,7 +1326,11 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 				DRM_XE_ATOMIC_GLOBAL);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			printf("Failed to get memory attributes\n");
+			return;
+		}
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
 				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
@@ -1247,8 +1338,13 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 				DRM_XE_ATOMIC_DEVICE);
 
-		val = xe_vm_print_mem_attr_values_in_range(fd, vm, addr,  bo_size);
+		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
+		if (!mem_attrs) {
+			printf("Failed to get memory attributes\n");
+			return;
+		}
 	}
+	free(mem_attrs);
 }
 
 static void
@@ -1274,7 +1370,7 @@ static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, size_t bo_size,
 	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
-	  unsigned long long flags)
+	  unsigned long long flags, uint8_t (*pat_value)(int))
 {
 	uint64_t addr;
 	struct drm_xe_sync sync[1] = {
@@ -1406,7 +1502,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	addr = to_user_pointer(data);
 
 	if (flags & MADVISE_OP)
-		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
+		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
+					    pat_value);
 
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
@@ -1527,7 +1624,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			next_data = aligned_alloc_type.ptr;
 			igt_assert(next_data);
 
-			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync);
+			xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
+						    pat_value);
 			__aligned_partial_free(&aligned_alloc_type);
 
 			b = 0;
@@ -1893,7 +1991,7 @@ static void *thread(void *data)
 
 	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
 		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
-		  t->flags | THREADS);
+		  t->flags | THREADS, NULL);
 
 	return NULL;
 }
@@ -2011,7 +2109,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
 
 	fd = drm_open_driver(DRIVER_XE);
 	test_exec(fd, hwe, n_exec_queues, n_execs,
-		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
+		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES, NULL);
 	drm_close_driver(fd);
 
 	close(map_fd);
@@ -2106,6 +2204,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
 struct section {
 	const char *name;
 	unsigned long long flags;
+	uint8_t (*fn)(int pat);
 };
 
 igt_main
@@ -2238,6 +2337,31 @@ igt_main
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
@@ -2255,52 +2379,52 @@ igt_main
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
@@ -2351,13 +2475,13 @@ igt_main
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
@@ -2377,7 +2501,7 @@ igt_main
 	igt_subtest_f("fault")
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
-				  FAULT);
+				  FAULT, NULL);
 
 	for (const struct section *s = psections; s->name; s++) {
 		igt_subtest_f("partial-%s", s->name)
@@ -2438,10 +2562,16 @@ igt_main
 		igt_subtest_f("madvise-%s", s->name) {
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_64K, 0, 0, NULL,
-					  NULL, s->flags);
+					  NULL, s->flags, NULL);
 		}
 	}
 
+	for (const struct section *s = intel_get_pat_idx_functions; s->name; s++) {
+		igt_subtest_f("pat-index-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
+	}
+
 	igt_subtest("compute")
 		xe_for_each_engine(fd, hwe)
 			test_compute(fd, hwe, SZ_2M);
-- 
2.34.1

