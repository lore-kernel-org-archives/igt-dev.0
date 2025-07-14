Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E488C83F27
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 17:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF5B10E221;
	Mon, 14 Jul 2025 17:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUYNDWhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA97A10E02F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752512491; x=1784048491;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CeZ8M+VOmWlc8oqcb9wVr7qGeUsxH/Xo1RgrQi9jymk=;
 b=VUYNDWhGcHfNv7HTSbM8fMVoZJSCtTEdT2Nc9FuCE72kZ+3qynq8z0bj
 Q64Waqre4ES+9OG3lHPWhwdpRgaWdxbDecylEQKoAf393zoxmLOoCwBQT
 JCSKqOzMDM8Ef1//LPZ0ALE8mdj8pq0qnoFmPF7mz0eni0/QaMuVTJcFw
 qw/xTYDgIngvO3liW68Ssj0x8F6WdjaXyCXwk1Egwuy1cTsTxii8Tpg6T
 r1uZMYvUa8m1EIsJVqSnHusvn7KtCFrLOfgqujMLBsTChjNNgMiDHSIHi
 oXYSib2zB8jMpal2m6wG0+hjjmy72k0uqHLRV6hTlEsq3v06QjVegD8RV A==;
X-CSE-ConnectionGUID: 5UZzMBukSQmUQGGTYXrk3g==
X-CSE-MsgGUID: TU5bpKBTRsewZyQKgw0jQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54802187"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54802187"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:30 -0700
X-CSE-ConnectionGUID: 1IyPRqvEQEqdIhwVp+47ow==
X-CSE-MsgGUID: ITUCzbXrTGi8eim4M8AumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161306016"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 5/5] tests/intel/xe_exec_system_allocator: Add append memory
 copy tests
Date: Mon, 14 Jul 2025 10:03:09 -0700
Message-Id: <20250714170309.2949211-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714170309.2949211-1-matthew.brost@intel.com>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
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

Add an IGT test which mirrors a compute UMD append memory copy kernel.
The test performs memory copies from source to destination across all
SVM/BO combinations, using both random and identical addresses in each
iteration. It covers scenarios including KMD migration, user-space
migration, and compression.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 485 +++++++++++++++++++++++++
 1 file changed, 485 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index dd5303855d..f20c1442f1 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -18,6 +18,8 @@
 
 #include "igt.h"
 #include "lib/igt_syncobj.h"
+#include "lib/intel_mocs.h"
+#include "lib/intel_pat.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
@@ -350,6 +352,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 }
 
 static int va_bits;
+static int pat_index_compressed;
 
 #define bind_system_allocator(__sync, __num_sync)			\
 	__xe_vm_bind_assert(fd, vm, 0,					\
@@ -358,6 +361,30 @@ static int va_bits;
 			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
 			    (__sync), (__num_sync), 0, 0)
 
+#define bind_system_allocator_range(__sync, __start, __size, __num_sync)\
+	__xe_vm_bind_assert(fd, vm, 0,					\
+			    0, 0, (__start), (__size),			\
+			    DRM_XE_VM_BIND_OP_MAP,			\
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
+			    (__sync), (__num_sync), 0, 0)
+
+#define bind_system_allocator_compressed(__sync, __num_sync)		\
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0,				\
+				   0, 0, 0, 0x1ull << va_bits,		\
+				   DRM_XE_VM_BIND_OP_MAP,		\
+				   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
+				   (__sync), (__num_sync), 0,		\
+				   pat_index_compressed, 0), 0)
+
+#define bind_system_allocator_compressed_range(__sync, __start, __size,	\
+					       __num_sync)		\
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0,				\
+				   0, 0, (__start), (__size),		\
+				   DRM_XE_VM_BIND_OP_MAP,		\
+				   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
+				   (__sync), (__num_sync), 0,		\
+				   pat_index_compressed, 0), 0)
+
 #define unbind_system_allocator()				\
 	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,	\
 		     DRM_XE_VM_BIND_OP_UNMAP, 0,		\
@@ -406,6 +433,19 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
 		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
 }
 
+static void *__aligned_alloc_ptr(size_t alignment, size_t size)
+{
+	struct aligned_alloc_type aligned_alloc_type;
+	void *ptr;
+
+	aligned_alloc_type = __aligned_alloc(alignment, size);
+	ptr = aligned_alloc_type.ptr;
+	igt_assert(ptr);
+	__aligned_partial_free(&aligned_alloc_type);
+
+	return ptr;
+}
+
 /**
  * SUBTEST: unaligned-alloc
  * Description: allocate unaligned sizes of memory
@@ -1700,6 +1740,413 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	munmap(pdata, sizeof(*pdata));
 }
 
+#define AMC_RAND_ADDR			(0x1 << 0)
+#define AMC_SAME_ADDR			(0x1 << 1)
+#define AMC_KMD_MIGRATE			(0x1 << 2)
+#define AMC_USER_MIGRATE_UNMAPPABLE	(0x1 << 3)
+#define AMC_COMPRESSED			(0x1 << 4)
+#define AMC_BO_SRC			(0x1 << 5)
+#define AMC_BO_DST			(0x1 << 6)
+#define AMC_MMAP_SRC			(0x1 << 7)
+#define AMC_MMAP_DST			(0x1 << 8)
+
+#define ALLOC_COPY_MEMORY_BO		(0x1 << 0)
+
+static void *alloc_copy_memory(int fd, int gt_id, uint32_t vm, uint64_t addr,
+			       size_t size, uint64_t *bind_ufence,
+			       unsigned int flags)
+{
+	void *ptr;
+
+	ptr = mmap((void *)addr, size, PROT_READ | PROT_WRITE,
+		   MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(ptr != MAP_FAILED);
+
+	if (flags & ALLOC_COPY_MEMORY_BO) {
+		struct drm_xe_sync sync[1] = {
+			{
+				.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+				.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+				.timeline_value = USER_FENCE_VALUE,
+				.addr = to_user_pointer(bind_ufence),
+			},
+		};
+		uint32_t bo;
+
+		bo = xe_bo_create(fd, vm, size, vram_if_possible(fd, gt_id) |
+				  system_memory(fd),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		ptr = xe_bo_map_fixed(fd, bo, size, addr);
+
+		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, size,
+				    DRM_XE_VM_BIND_OP_MAP,
+				    DRM_XE_VM_BIND_FLAG_IMMEDIATE, sync,
+				    1, 0, 0);
+		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+		*bind_ufence = 0;
+
+		gem_close(fd, bo);
+	}
+
+	return ptr;
+}
+
+#define XY_FAST_COPY_BLT_CMD			(2 << 29 | 0x42 << 22)
+#define   XY_FAST_COPY_BLT_DEPTH_32		(3 << 24)
+#define   XE2_XY_FAST_COPY_BLT_MOCS_INDEX_SHIFT (20)
+
+static void issue_copy(int fd, uint32_t exec_queue, uint32_t *batch,
+		       uint64_t *exec_ufence, uint64_t src_addr,
+		       uint64_t dst_addr, size_t size)
+{
+	struct drm_xe_sync sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+			.addr = to_user_pointer(exec_ufence),
+		},
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.exec_queue_id = exec_queue,
+		.syncs = to_user_pointer(&sync),
+		.address = to_user_pointer(batch),
+	};
+	uint32_t pitch = SZ_4K,
+		 tile_y = XY_FAST_COPY_BLT_D1_SRC_TILE4 |
+			XY_FAST_COPY_BLT_D1_DST_TILE4,
+		 mocs = intel_get_uc_mocs_index(fd) <<
+			 XE2_XY_FAST_COPY_BLT_MOCS_INDEX_SHIFT;
+	int b = 0;
+	int devfd;
+
+	devfd = intel_get_drm_devid(fd);
+	if (intel_gen(devfd < 20))
+		tile_y = 0;
+
+	batch[b++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
+	batch[b++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch | tile_y | mocs;
+	batch[b++] = 0;
+	batch[b++] = (size / pitch) << 16 | pitch / 4;
+	batch[b++] = lower_32_bits(dst_addr);
+	batch[b++] = upper_32_bits(dst_addr);
+	batch[b++] = 0;
+	batch[b++] = pitch | mocs;
+	batch[b++] = lower_32_bits(src_addr);
+	batch[b++] = upper_32_bits(src_addr);
+
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	xe_exec(fd, &exec);
+	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queue, FIVE_SEC);
+	*exec_ufence = 0;
+}
+
+static void
+alloc_src_dst_addr(uint64_t *src_addr, uint64_t *dst_addr, size_t size)
+{
+	size_t rand_size = rand() & ~0xfffull;
+	void *rand = __aligned_alloc_ptr(SZ_4K, rand_size);
+	void *src = __aligned_alloc_ptr(SZ_2M, size);
+	void *dst = __aligned_alloc_ptr(SZ_2M, size);
+
+	*src_addr = to_user_pointer(src);
+	*dst_addr = to_user_pointer(dst);
+
+	munmap(src, size);
+	munmap(dst, size);
+	munmap(rand, rand_size);
+}
+
+static void
+__append_memory_copy(int fd, int gt_id, uint32_t vm, uint32_t exec_queue,
+		     uint32_t *batch, uint64_t *bind_ufence,
+		     uint64_t *exec_ufence, uint64_t src_addr,
+		     uint64_t dst_addr, size_t size, unsigned int flags)
+{
+	struct drm_xe_sync sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+			.addr = to_user_pointer(bind_ufence),
+		},
+	};
+	uint64_t src_cmp_addr, dst_cmp_addr, src_cmp_gpu_addr, dst_cmp_gpu_addr;
+	void *src, *dst, *cmp_src, *cmp_dst, *__cmp_src, *__cmp_dst;
+	uint8_t src_value = rand(), dst_value = rand();
+
+	igt_info("copy %u, src(%3u,%s) 0x%016lx -> dst(%3u,%s) 0x%016lx\n",
+		 (int)size, src_value, flags & AMC_BO_SRC ? " bo" : "svm",
+		 src_addr, dst_value, flags & AMC_BO_DST ? " bo" : "svm",
+		 dst_addr);
+
+	src = alloc_copy_memory(fd, gt_id, vm, src_addr, size, bind_ufence,
+				flags & AMC_BO_SRC ? ALLOC_COPY_MEMORY_BO : 0);
+	memset(src, src_value, size);
+	cmp_src = src;
+
+	dst = alloc_copy_memory(fd, gt_id, vm, dst_addr, size, bind_ufence,
+				flags & AMC_BO_DST ? ALLOC_COPY_MEMORY_BO : 0);
+	memset(dst, dst_value, size);
+	cmp_dst = dst;
+
+	if (!(AMC_KMD_MIGRATE & flags) && (AMC_BO_SRC | AMC_BO_DST) & flags) {
+		alloc_src_dst_addr(&src_cmp_addr, &dst_cmp_addr, size);
+
+		if (AMC_USER_MIGRATE_UNMAPPABLE & flags) {
+			src_cmp_gpu_addr = 0x1ull << 42;
+			dst_cmp_gpu_addr = src_cmp_gpu_addr + size;
+		} else {
+			src_cmp_gpu_addr = src_cmp_addr;
+			dst_cmp_gpu_addr = dst_cmp_addr;
+		}
+
+		__cmp_src = alloc_copy_memory(fd, gt_id, vm, src_cmp_addr,
+					      size, bind_ufence, 0);
+		xe_vm_bind_userptr_async_flags(fd, vm, 0, src_cmp_addr,
+					       src_cmp_gpu_addr, size, sync, 1,
+					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
+		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+		*bind_ufence = 0;
+
+		__cmp_dst = alloc_copy_memory(fd, gt_id, vm, dst_cmp_addr,
+					      size, bind_ufence, 0);
+		xe_vm_bind_userptr_async_flags(fd, vm, 0, dst_cmp_addr,
+					       dst_cmp_gpu_addr, size, sync, 1,
+					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
+		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+		*bind_ufence = 0;
+	}
+
+	issue_copy(fd, exec_queue, batch, exec_ufence, src_addr,
+		   dst_addr, size);
+
+	if (AMC_BO_SRC & flags) {
+		if (AMC_KMD_MIGRATE & flags) {
+			xe_vm_prefetch_async(fd, vm, 0, 0, src_addr, size,
+					     sync, 1, 0);
+			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
+				       FIVE_SEC);
+			*bind_ufence = 0;
+		} else {
+			issue_copy(fd, exec_queue, batch, exec_ufence, src_addr,
+				   src_cmp_gpu_addr, size);
+			cmp_src = __cmp_src;
+		}
+	}
+
+	if (AMC_BO_DST & flags) {
+		if (AMC_KMD_MIGRATE & flags) {
+			xe_vm_prefetch_async(fd, vm, 0, 0, dst_addr, size,
+					     sync, 1, 0);
+			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
+				       FIVE_SEC);
+			*bind_ufence = 0;
+		} else {
+			issue_copy(fd, exec_queue, batch, exec_ufence, dst_addr,
+				   dst_cmp_gpu_addr, size);
+			cmp_dst = __cmp_dst;
+		}
+	}
+
+	igt_assert(!memcmp(cmp_src, cmp_dst, size));
+
+	if (AMC_BO_SRC & flags) {
+		if (AMC_COMPRESSED & flags)
+			bind_system_allocator_compressed_range(sync, src_addr,
+							       size, 1);
+		else
+			bind_system_allocator_range(sync, src_addr, size, 1);
+		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+		*bind_ufence = 0;
+	}
+
+	if (AMC_BO_DST & flags) {
+		if (AMC_COMPRESSED & flags)
+			bind_system_allocator_compressed_range(sync, dst_addr,
+							       size, 1);
+		else
+			bind_system_allocator_range(sync, dst_addr, size, 1);
+		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+		*bind_ufence = 0;
+	}
+
+	if (!(AMC_KMD_MIGRATE & flags) && (AMC_BO_SRC | AMC_BO_DST) & flags) {
+		if (AMC_COMPRESSED & flags)
+			bind_system_allocator_compressed_range(sync,
+							       src_cmp_gpu_addr,
+							       size, 1);
+		else
+			bind_system_allocator_range(sync, src_cmp_gpu_addr,
+						    size, 1);
+		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+		*bind_ufence = 0;
+		munmap(__cmp_src, size);
+
+		if (AMC_COMPRESSED & flags)
+			bind_system_allocator_compressed_range(sync,
+							       dst_cmp_gpu_addr,
+							       size, 1);
+		else
+			bind_system_allocator_range(sync, dst_cmp_gpu_addr,
+						    size, 1);
+		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+		*bind_ufence = 0;
+		munmap(__cmp_dst, size);
+	}
+
+	munmap(src, size);
+	munmap(dst, size);
+}
+
+/**
+ * SUBTEST: append-memory-copy-rand-addr-32M
+ * Description: Issue 32M copies from src to dst, swizzle all BO and SVM combos, random addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-same-addr-32M
+ * Description: Issue 32M copies from src to dst, swizzle all BO and SVM combos, same addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-rand-addr-user-migrate-32M
+ * Description: Issue 32M copies from src to dst, swizzle all BO and SVM combos, user migrate before compare, random addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-same-addr-user-migrate-32M
+ * Description: Issue 32M copies from src to dst, swizzle all BO and SVM combos, user migrate before compare, same addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-rand-addr-user-unmappable-migrate-32M
+ * Description: Issue 32M copies from src to dst, swizzle all BO and SVM combos, user unmappable migrate before compare, random addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-same-addr-user-unmappable-migrate-32M
+ * Description: Issue 32M copies from src to dst, swizzle all BO and SVM combos, user unmappled migrate before compare, same addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-compressed-rand-addr-32M
+ * Description: Issue 32M copies, with compression, from src to dst, swizzle all BO and SVM combos, random addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-compressed-same-addr-32M
+ * Description: Issue 32M copies, with compression, from src to dst, swizzle all BO and SVM combos, same addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-compressed-rand-addr-user-migrate-32M
+ * Description: Issue 32M copies, with compression, from src to dst, swizzle all BO and SVM combos, user migrate before compare, random addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-compressed-same-addr-user-migrate-32M
+ * Description: Issue 32M copies, with compression, from src to dst, swizzle all BO and SVM combos, user migrate before compare, same addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-compressed-rand-addr-user-unmappable-migrate-32M
+ * Description: Issue 32M copies, with compression, from src to dst, swizzle all BO and SVM combos, user unmappable migrate before compare, random addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: append-memory-copy-compressed-same-addr-user-unmappable-migrate-32M
+ * Description: Issue 32M copies, with compression, from src to dst, swizzle all BO and SVM combos, user unmappled migrate before compare, same addresses
+ * Test category: functionality test
+ */
+static void
+append_memory_copy(int fd, struct drm_xe_engine_class_instance *eci,
+		   size_t size, int loop_count, unsigned int flags)
+{
+	struct drm_xe_sync sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+		},
+	};
+	uint64_t *bind_ufence = NULL, *exec_ufence;
+	uint32_t *batch;
+	uint32_t vm, exec_queue, bo;
+	uint64_t src_addr, dst_addr;
+	int i;
+
+	if (AMC_COMPRESSED & flags)
+		igt_skip_on_f(!xe_visible_vram_size(fd, eci->gt_id),
+			      "compressed sections require VRAM\n");
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	if (AMC_COMPRESSED & flags)
+		bind_system_allocator_compressed(NULL, 0);
+	else
+		bind_system_allocator(NULL, 0);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	bind_ufence = __aligned_alloc_ptr(SZ_4K, SZ_4K);
+	bo = xe_bo_create(fd, vm, SZ_4K, vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bind_ufence = xe_bo_map_fixed(fd, bo, SZ_4K,
+				      to_user_pointer(bind_ufence));
+
+	sync[0].addr = to_user_pointer(bind_ufence);
+	__xe_vm_bind_assert(fd, vm, 0, bo, 0, to_user_pointer(bind_ufence),
+			    SZ_4K, DRM_XE_VM_BIND_OP_MAP,
+			    DRM_XE_VM_BIND_FLAG_IMMEDIATE, sync,
+			    1, 0, 0);
+	xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+	*bind_ufence = 0;
+
+	exec_ufence = bind_ufence + 8;
+	batch = (uint32_t *)(exec_ufence + 8);
+
+	alloc_src_dst_addr(&src_addr, &dst_addr, size);
+
+	for (i = 0; i < loop_count; ++i) {
+		/* BO -> BO */
+		__append_memory_copy(fd, eci->gt_id, vm, exec_queue, batch,
+				     bind_ufence, exec_ufence, src_addr,
+				     dst_addr, size,
+				     flags | AMC_BO_SRC | AMC_BO_DST);
+		if (flags & AMC_RAND_ADDR)
+			alloc_src_dst_addr(&src_addr, &dst_addr, size);
+
+		/* SVM -> SVM */
+		__append_memory_copy(fd, eci->gt_id, vm, exec_queue, batch,
+				     bind_ufence, exec_ufence, src_addr,
+				     dst_addr, size,
+				     flags | AMC_MMAP_SRC | AMC_MMAP_DST);
+		if (flags & AMC_RAND_ADDR)
+			alloc_src_dst_addr(&src_addr, &dst_addr, size);
+
+		/* BO -> SVM */
+		__append_memory_copy(fd, eci->gt_id, vm, exec_queue, batch,
+				     bind_ufence, exec_ufence, src_addr,
+				     dst_addr, size,
+				     flags | AMC_BO_SRC | AMC_MMAP_DST);
+		if (flags & AMC_RAND_ADDR)
+			alloc_src_dst_addr(&src_addr, &dst_addr, size);
+
+		/* SVM -> BO */
+		__append_memory_copy(fd, eci->gt_id, vm, exec_queue, batch,
+				     bind_ufence, exec_ufence, src_addr,
+				     dst_addr, size,
+				     flags | AMC_MMAP_SRC | AMC_BO_DST);
+		if (flags & AMC_RAND_ADDR)
+			alloc_src_dst_addr(&src_addr, &dst_addr, size);
+	}
+
+	unbind_system_allocator();
+
+	sync[0].addr = to_user_pointer(bind_ufence);
+	bind_system_allocator(sync, 1);
+	xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0, FIVE_SEC);
+	*bind_ufence = 0;
+
+	munmap(bind_ufence, SZ_4K);
+	gem_close(fd, bo);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 struct section {
 	const char *name;
 	unsigned int flags;
@@ -1802,6 +2249,31 @@ igt_main
 		{ "malloc-mix-bo", MIX_BO_ALLOC },
 		{ NULL },
 	};
+	const struct section asections[] = {
+		{ "rand-addr-32M", AMC_RAND_ADDR | AMC_KMD_MIGRATE },
+		{ "same-addr-32M", AMC_SAME_ADDR | AMC_KMD_MIGRATE },
+		{ "rand-addr-user-migrate-32M", AMC_RAND_ADDR },
+		{ "same-addr-user-migrate-32M", AMC_SAME_ADDR },
+		{ "rand-addr-user-unmappable-migrate-32M", AMC_RAND_ADDR |
+		       AMC_USER_MIGRATE_UNMAPPABLE },
+		{ "same-addr-user-unmappable-migrate-32M", AMC_SAME_ADDR |
+		       AMC_USER_MIGRATE_UNMAPPABLE },
+		{ "compressed-rand-addr-32M", AMC_RAND_ADDR | AMC_KMD_MIGRATE |
+			AMC_COMPRESSED },
+		{ "compressed-same-addr-32M", AMC_SAME_ADDR | AMC_KMD_MIGRATE |
+			AMC_COMPRESSED },
+		{ "compressed-rand-addr-user-migrate-32M", AMC_RAND_ADDR |
+			AMC_COMPRESSED },
+		{ "compressed-same-addr-user-migrate-32M", AMC_SAME_ADDR |
+			AMC_COMPRESSED },
+		{ "compressed-rand-addr-user-unmappable-migrate-32M",
+			AMC_RAND_ADDR | AMC_USER_MIGRATE_UNMAPPABLE |
+				AMC_COMPRESSED},
+		{ "compressed-same-addr-user-unmappable-migrate-32M",
+			AMC_SAME_ADDR | AMC_USER_MIGRATE_UNMAPPABLE |
+				AMC_COMPRESSED},
+		{ NULL },
+	};
 	int fd;
 
 	igt_fixture {
@@ -1812,6 +2284,7 @@ igt_main
 
 		xe = xe_device_get(fd);
 		va_bits = xe->va_bits;
+		pat_index_compressed = intel_get_pat_idx_uc_comp(fd);
 		open_sync_file();
 	}
 
@@ -1992,6 +2465,18 @@ igt_main
 			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
 	}
 
+	for (const struct section *s = asections; s->name; s++) {
+		igt_subtest_f("append-memory-copy-%s", s->name)
+			xe_for_each_engine(fd, hwe) {
+				if (hwe->engine_class !=
+				    DRM_XE_ENGINE_CLASS_COPY)
+					continue;
+
+				append_memory_copy(fd, hwe, SZ_32M, 4,
+						   s->flags);
+			}
+	}
+
 	igt_fixture {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.34.1

