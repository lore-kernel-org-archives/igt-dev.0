Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A9C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 17:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F7910E0B7;
	Thu, 25 Jul 2024 17:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QD8wfpdf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BECE10E0B7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721929235; x=1753465235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TSaoTOU2WmpyjjhazKrbNDPiDc0OV8aXFqtAL4e/eIk=;
 b=QD8wfpdfyWTZJXERFTodKu1gBqjx7WUMoLUU4wKHxiGKDfAT0AyfFjzC
 kqjvzjSzkymhV9P/xKOcezaCwoMsUjAw1vWiHSDCUSOL8WFH+c3P3mi+J
 0GIDjNicDY0mdvDR4kEzmcK4IigZNU42Cmud8upF06WE/35IpztnrI4PF
 FFs2+AsG4+X2BGJf0KX7CUVefE1VTM4SB9K2fontn9IOAFQNxnwZHgZ8m
 mqOhYZ44S2XgrsZkH7TbCjo4/P8tPTlPnsDcslyKRAVfdgMq9A05/CIdP
 xUOg3POXy0KTHhvFT8AyIiyYUR6Owj4rnrDOHhVe+ZYiqNh+cijDXkWeW A==;
X-CSE-ConnectionGUID: OFOcO+lsSdKTODfnacMNtQ==
X-CSE-MsgGUID: h8n7oWaCRjqp8RxjibgEjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19647359"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19647359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:40:35 -0700
X-CSE-ConnectionGUID: gqE+87SIQEG8zIz2PwyXAQ==
X-CSE-MsgGUID: q5wbhITvRK2bdnnnrUhJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="53775718"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:40:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: janga.rahul.kumar@intel.com
Subject: [PATCH v3] tests/intel/xe_exec_compute_mode: Add userptr free /
 munmap sections
Date: Thu, 25 Jul 2024 10:41:23 -0700
Message-Id: <20240725174123.1931566-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add userptr free / munmap sections which does the aforementioned while
the userptr still has a mapping. The userptr will be invalidated
triggering a rebind which will fail pinning pages as the userptr is no
longer valid. This is allowed and should not corrupt the VM or future
submissions.

v2:
 - s/faill/fail (Janga)
 - check dummy for mapped failed (Janga)
v3:
 - Include local changes

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 43 +++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 389de7ca40..d5c9d12d1a 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -29,9 +29,11 @@
 #define REBIND				(0x1 << 1)
 #define INVALIDATE			(0x1 << 2)
 #define RACE				(0x1 << 3)
-#define BIND_EXECQUEUE		(0x1 << 4)
+#define BIND_EXECQUEUE			(0x1 << 4)
 #define VM_FOR_BO			(0x1 << 5)
-#define EXEC_QUEUE_EARLY	(0x1 << 6)
+#define EXEC_QUEUE_EARLY		(0x1 << 6)
+#define FREE_MAPPPING			(0x1 << 7)
+#define UNMAP_MAPPPING			(0x1 << 8)
 
 /**
  * SUBTEST: twice-%s
@@ -51,6 +53,8 @@
  * @basic:				basic
  * @preempt-fence-early:		preempt fence early
  * @userptr:				userptr
+ * @userptr-free:			userptr free
+ * @userptr-unmap:			userptr unmap
  * @rebind:				rebind
  * @userptr-rebind:			userptr rebind
  * @userptr-invalidate:			userptr invalidate
@@ -74,6 +78,8 @@
  * @basic:				basic
  * @preempt-fence-early:		preempt fence early
  * @userptr:				userptr
+ * @userptr-free:			userptr free
+ * @userptr-unmap:			userptr unmap
  * @rebind:				rebind
  * @userptr-rebind:			userptr rebind
  * @userptr-invalidate:			userptr invalidate
@@ -88,7 +94,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
-	uint64_t addr = 0x1a0000;
+	uint64_t addr = 0x1a0000, dummy_addr = 0x10001a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -114,6 +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	int i, j, b;
 	int map_fd = -1;
 	int64_t fence_timeout;
+	void *dummy;
 
 	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
 
@@ -142,6 +149,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					     bo_size);
 			igt_assert(data);
 		}
+		if (flags & UNMAP_MAPPPING) {
+			dummy = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				     PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				     MAP_ANONYMOUS, -1, 0);
+			igt_assert(dummy != MAP_FAILED);
+		}
+		if (flags & FREE_MAPPPING) {
+			dummy = aligned_alloc(xe_get_default_alignment(fd),
+					      bo_size);
+			igt_assert(dummy);
+		}
 	} else {
 		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
 				  bo_size, vram_if_possible(fd, eci->gt_id),
@@ -157,16 +175,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_bind_exec_queue_create(fd, vm, 0);
 		else
 			bind_exec_queues[i] = 0;
-	};
+	}
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
-	if (bo)
+	if (bo) {
 		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
 				 bo_size, sync, 1);
-	else
+	} else {
+		if (flags & (FREE_MAPPPING | UNMAP_MAPPPING))
+			xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
+						 to_user_pointer(dummy),
+						 dummy_addr, bo_size, 0, 0);
 		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr,
 					 bo_size, sync, 1);
+	}
 #define ONE_SEC	MS_TO_NS(1000)
 #define HUNDRED_SEC	MS_TO_NS(100000)
 
@@ -197,6 +220,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		exec.address = batch_addr;
 		xe_exec(fd, &exec);
 
+		if (flags & FREE_MAPPPING && !i)
+			free(dummy);
+
+		if (flags & UNMAP_MAPPPING && !i)
+			munmap(dummy, bo_size);
+
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 				       exec_queues[e], fence_timeout);
@@ -489,6 +518,8 @@ igt_main
 		{ "basic", 0 },
 		{ "preempt-fence-early", VM_FOR_BO | EXEC_QUEUE_EARLY },
 		{ "userptr", USERPTR },
+		{ "userptr-free", USERPTR | FREE_MAPPPING },
+		{ "userptr-unmap", USERPTR | UNMAP_MAPPPING },
 		{ "rebind", REBIND },
 		{ "userptr-rebind", USERPTR | REBIND },
 		{ "userptr-invalidate", USERPTR | INVALIDATE },
-- 
2.34.1

