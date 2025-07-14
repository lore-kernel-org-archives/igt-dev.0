Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC37C83F21
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 17:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10C910E02F;
	Mon, 14 Jul 2025 17:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POlKUYoH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9793410E02F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752512490; x=1784048490;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Pf8E3Vbm66BkkzKtTn3n6ty4tYCT9/zAp5l0VMT4SoQ=;
 b=POlKUYoHc6aaK4f0MhEsc8UgGtUAejwsHsMazltoY+QGCQpdoZLuvmN2
 YgyT5lNWdJ8RcIBUD62rllNUTN5TG7VmZrrv0RQYxLOt1C827PkB12m3s
 xeACGWWm/eXUWoU+mBESF1Pp+N8titu+L24VLOqmesk5I533mQ8EDJbxx
 w6n4MLyNP8Q+xanKQLNX+X0prMAHmv2HHlgqz39HjGGDL3c/GwoNFRB+0
 2EpYRWRyAtFzRXfySzmWrm7F9SbScjcutOUiQpvEsQaUzzQ5DIyQiNfNN
 7Gu0eKLvkF700nCm3z1QEM8J0Mpn+dOwCitqll/lD5YFc2fpHWyBgTUKB Q==;
X-CSE-ConnectionGUID: tLx7REdIQnO2dFluknzyqA==
X-CSE-MsgGUID: fJFh18/TTXS2Ov84iDm4Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54802185"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54802185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:30 -0700
X-CSE-ConnectionGUID: 4w3W0VetTaqcn9MDmIqhuQ==
X-CSE-MsgGUID: eifDuLoWRXWG7DeXgW7JjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161306014"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 3/5] tests/intel/xe_exec_system_allocator: Wait on mapping
 BO's to mirror
Date: Mon, 14 Jul 2025 10:03:07 -0700
Message-Id: <20250714170309.2949211-4-matthew.brost@intel.com>
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

Mapping a BO to the mirror is a non-zero time operation, especially
since TLB invalidations can take a while to complete. Without a wait in
the test, this can race, leading to possible data mismatches, job
timeouts, and other issues.

Make mapping to the mirror a synchronized operation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 57 ++++++++++++++------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index f8d144328e..006a3dc920 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1012,9 +1012,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	struct test_exec_data *data, *next_data = NULL;
 	uint32_t bo_flags;
-	uint32_t bo = 0, prefetch_sync = 0;
+	uint32_t bo = 0, bind_sync = 0;
 	void **pending_free;
-	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
+	u64 *exec_ufence = NULL, *bind_ufence = NULL;
 	int i, j, b, file_fd = -1, prev_idx, pf_count;
 	bool free_vm = false;
 	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
@@ -1154,20 +1154,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		memset(exec_ufence, 0, SZ_4K);
 	}
 
+	aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
+	bind_ufence = aligned_alloc_type.ptr;
+	igt_assert(bind_ufence);
+	__aligned_partial_free(&aligned_alloc_type);
+	bind_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
+				 bo_flags);
+	bind_ufence = xe_bo_map_fixed(fd, bind_sync, SZ_4K,
+				      to_user_pointer(bind_ufence));
+
 	if (!(flags & FAULT) && flags & PREFETCH) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
-		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
-		prefetch_ufence = aligned_alloc_type.ptr;
-		igt_assert(prefetch_ufence);
-		__aligned_partial_free(&aligned_alloc_type);
-
-		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
-					     bo_flags);
-		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
-						  to_user_pointer(prefetch_ufence));
-
-		sync[0].addr = to_user_pointer(prefetch_ufence);
+		sync[0].addr = to_user_pointer(bind_ufence);
 
 		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);
 
@@ -1176,18 +1175,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			region = 0;
 			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
 					     1, region);
-			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
+			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
 				       FIVE_SEC);
-			prefetch_ufence[0] = 0;
+			bind_ufence[0] = 0;
 		}
 
 		if (exec_ufence) {
 			xe_vm_prefetch_async(fd, vm, 0, 0,
 					     to_user_pointer(exec_ufence),
 					     SZ_4K, sync, 1, 0);
-			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
+			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
 				       FIVE_SEC);
-			prefetch_ufence[0] = 0;
+			bind_ufence[0] = 0;
 		}
 	}
 
@@ -1246,16 +1245,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			struct timespec tv = {};
 			u64 start, end;
 
-			sync[0].addr = to_user_pointer(prefetch_ufence);
+			sync[0].addr = to_user_pointer(bind_ufence);
 
 			start = igt_nsec_elapsed(&tv);
 			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
 					     1, region);
 			end = igt_nsec_elapsed(&tv);
 
-			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
+			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
 				       FIVE_SEC);
-			prefetch_ufence[0] = 0;
+			bind_ufence[0] = 0;
 
 			prefetch_ns += (end - start);
 		}
@@ -1374,11 +1373,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			exec_ufence[0] = 0;
 
 		if (bo) {
+			sync[0].addr = to_user_pointer(bind_ufence);
 			__xe_vm_bind_assert(fd, vm, 0,
 					    0, 0, addr, bo_size,
 					    DRM_XE_VM_BIND_OP_MAP,
 					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
-					    NULL, 0, 0, 0);
+					    sync, 1, 0, 0);
+			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
+				       FIVE_SEC);
+			bind_ufence[0] = 0;
 			munmap(data, bo_size);
 			gem_close(fd, bo);
 		}
@@ -1456,20 +1459,22 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	if (bo) {
+		sync[0].addr = to_user_pointer(bind_ufence);
 		__xe_vm_bind_assert(fd, vm, 0,
 				    0, 0, addr, bo_size,
 				    DRM_XE_VM_BIND_OP_MAP,
 				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
-				    NULL, 0, 0, 0);
+				    sync, 1, 0, 0);
+		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
+			       FIVE_SEC);
+		bind_ufence[0] = 0;
 		munmap(data, bo_size);
 		data = NULL;
 		gem_close(fd, bo);
 	}
 
-	if (prefetch_sync) {
-		munmap(prefetch_ufence, SZ_4K);
-		gem_close(fd, prefetch_sync);
-	}
+	munmap(bind_ufence, SZ_4K);
+	gem_close(fd, bind_sync);
 
 	if (flags & BUSY)
 		igt_assert_eq(unbind_system_allocator(), -EBUSY);
-- 
2.34.1

