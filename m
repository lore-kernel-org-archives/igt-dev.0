Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9366FCED240
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 05:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4A510E078;
	Tue, 18 Nov 2025 05:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vgh/7n64";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398DD10E078
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 05:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763443803; x=1794979803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R8oGtXpnfMIPZ3IYIhSn8wlEK9GyM9yDGiNh0TpTnvY=;
 b=Vgh/7n64qguRH1rP8svgq3eeP6B53SXXsOHjzR1lNrgRpSSMCmMDbYkX
 pK0mifDwBrmVEgxJENL7QWzNIF2x0Bd95he6CfB8LH8ggiBYnjA/Fdu1z
 9MmQfH/It6djAMPl3oEPE7BlPaUXLlD6K8MYYYRu56i5ymMTO0PJfxanG
 5HxSsvf3IU/qEEdxWBdkrhZ0cQlflZ5sEsH4Q2JTuc9GcWi2ZbAbpiUgL
 u0ifzrtDaXFB10+4EgQ8KLoTEDvnvgLvDvOpxm1n1BSQD6qhCwSgY3QHr
 9NIdSTOl55i1ANs9cJVB+Aq5iQtLRQ9zh+hhB6EEdINB5FnB5hBThDivu g==;
X-CSE-ConnectionGUID: E4BVtuBHST621OjxO11cww==
X-CSE-MsgGUID: 6DZKuCe4TeO0phG3spQc+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65338371"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65338371"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:30:03 -0800
X-CSE-ConnectionGUID: ovQXcBKjRd+NJbUHPvDcQQ==
X-CSE-MsgGUID: sd8yn8d9QtuTg5OJ7wQ/pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190824420"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:30:03 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Added 64k
 alignment support
Date: Tue, 18 Nov 2025 05:29:54 +0000
Message-ID: <20251118052954.7566-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

In this test only 4k alignment was there, so some tests fail
in some hardware like PVC there is need for 64k page alignment
So modified the test to support 64k page alignment

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 42 ++++++++++++++++----------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b88967e58..314836ef9 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -311,11 +311,11 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 	u64 *exec_ufence = NULL;
 	int64_t timeout = FIVE_SEC;
 
-	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
+	exec_ufence = mmap(NULL, SZ_64K, PROT_READ |
 			   PROT_WRITE, MAP_SHARED |
 			   MAP_ANONYMOUS, -1, 0);
 	igt_assert(exec_ufence != MAP_FAILED);
-	memset(exec_ufence, 5, SZ_4K);
+	memset(exec_ufence, 5, SZ_64K);
 	sync[0].addr = to_user_pointer(exec_ufence);
 
 	for (i = 0; i < n_writes; ++i, addr += stride) {
@@ -368,7 +368,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 		}
 		igt_assert_eq(ret, 0);
 	}
-	munmap(exec_ufence, SZ_4K);
+	munmap(exec_ufence, SZ_64K);
 }
 
 static int va_bits;
@@ -825,11 +825,11 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 	data[0].vm_sync = 0;
 
-	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
+	exec_ufence = mmap(NULL, SZ_64K, PROT_READ |
 			   PROT_WRITE, MAP_SHARED |
 			   MAP_ANONYMOUS, -1, 0);
 	igt_assert(exec_ufence != MAP_FAILED);
-	memset(exec_ufence, 5, SZ_4K);
+	memset(exec_ufence, 5, SZ_64K);
 
 	for (i = 0; i < 2; i++) {
 		uint64_t addr = to_user_pointer(data);
@@ -879,7 +879,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	}
 
 	xe_exec_queue_destroy(fd, exec_queue);
-	munmap(exec_ufence, SZ_4K);
+	munmap(exec_ufence, SZ_64K);
 	__aligned_free(&alloc);
 	if (new)
 		munmap(new, bo_size / 2);
@@ -1201,6 +1201,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 			    struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
 {
 	uint32_t bo_flags, bo = 0;
+	uint64_t split_addr, split_size;
 
 	if (flags & MADVISE_ATOMIC_DEVICE)
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
@@ -1252,16 +1253,22 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 
 	if (flags & MADVISE_SPLIT_VMA) {
 		if (bo_size)
-			bo_size = ALIGN(bo_size, SZ_4K);
+			bo_size = ALIGN(bo_size, SZ_64K);
+
+		split_addr = to_user_pointer(data) + bo_size/2;
+		split_addr = ALIGN(split_addr, SZ_64K);
+		split_size = bo_size / 2;
+		split_size = ALIGN(split_size, SZ_64K);
 
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
 				  bo_flags);
-		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size / 2,
-				 bo_size / 2, 0, 0);
 
-		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size / 2,
-				    bo_size / 2, DRM_XE_VM_BIND_OP_MAP,
+		xe_vm_bind_async(fd, vm, 0, bo, 0, split_addr,
+				 split_size, 0, 0);
+
+		__xe_vm_bind_assert(fd, vm, 0, 0, 0, split_addr,
+				    split_size, DRM_XE_VM_BIND_OP_MAP,
 				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
 				    1, 0, 0);
 		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
@@ -1269,7 +1276,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		gem_close(fd, bo);
 		bo = 0;
 
-		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
+		xe_vm_madvise_atomic_attr(fd, vm, split_addr, split_size,
 					  DRM_XE_ATOMIC_GLOBAL);
 	}
 
@@ -1509,6 +1516,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	}
 
+
 	for (i = 0; i < n_exec_queues; i++)
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 
@@ -1520,6 +1528,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	data[0].vm_sync = 0;
 
 	addr = to_user_pointer(data);
+	addr = ALIGN(addr, SZ_64K);
 
 	if (flags & MADVISE_OP)
 		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
@@ -1550,14 +1559,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(exec_ufence != MAP_FAILED);
 		memset(exec_ufence, 5, SZ_4K);
 	}
+	aligned_alloc_type = __aligned_alloc(SZ_64K, SZ_64K);
 
-	aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
 	bind_ufence = aligned_alloc_type.ptr;
 	igt_assert(bind_ufence);
 	__aligned_partial_free(&aligned_alloc_type);
-	bind_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
+
+	bind_sync = xe_bo_create(fd, vm, SZ_64K, system_memory(fd),
 				 bo_flags);
-	bind_ufence = xe_bo_map_fixed(fd, bind_sync, SZ_4K,
+	bind_ufence = xe_bo_map_fixed(fd, bind_sync, SZ_64K,
 				      to_user_pointer(bind_ufence));
 
 	if (!(flags & FAULT) && flags & PREFETCH) {
@@ -1580,7 +1590,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (exec_ufence) {
 			xe_vm_prefetch_async(fd, vm, 0, 0,
 					     to_user_pointer(exec_ufence),
-					     SZ_4K, sync, 1, 0);
+					     SZ_64K, sync, 1, 0);
 			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
 				       FIVE_SEC);
 			bind_ufence[0] = 0;
-- 
2.51.0

