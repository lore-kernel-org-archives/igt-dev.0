Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CEAC3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 19:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6896F10ECB2;
	Fri, 19 Jul 2024 19:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+x4p+wG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4803410E144
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 19:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721416112; x=1752952112;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/AHdG/qfKc/VD1lrw4vSsn0cs0BUsNL29DWl7TyiW/4=;
 b=g+x4p+wG+JRNlEoV7r60fmmVHsh/oiyIyFM4ptHAFddTc5mJVfNeOr1r
 dxmMTUJ9+8iste/LTnXzwxoEZGD7uQSGlCcCQwLpAP1J2D3U/nxfszjAf
 N2xqQuL1KLYbxXEBxrA5a+RzZPppnRL74WPkIWjQWn2U0N4+X7NIhHjuq
 T5AHvKojHtS+UXRJ5iIufYjjd9cJ91sFzHBfX+ZLP+O+M7X2OOn+RbA/h
 HpfStwg4FxmSrhC4knY1NNRQAqdds78pogdBLPrrFQ6nySRK6DBODX0ki
 SWjmz1XdC13rP48ns7yUC5PZXcNiI0xtV16epLAkBh+O108/h2IQeATPI g==;
X-CSE-ConnectionGUID: WZc9E0v8SRiHMVGtn7/NPA==
X-CSE-MsgGUID: n0hqWp38S9SXxeSDf71feA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30204948"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="30204948"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:08:32 -0700
X-CSE-ConnectionGUID: LIY9HS+bQs2zFKhkxkjmbA==
X-CSE-MsgGUID: UMtmBNdwTf+cUG1vd1kwFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="50891327"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:08:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_exec_compute_mode: Add userptr free / munmap
 sections
Date: Fri, 19 Jul 2024 12:09:14 -0700
Message-Id: <20240719190914.1535721-1-matthew.brost@intel.com>
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
triggering a rebind which will faill pinning pages as the userptr is no
longer valid. This is allowed and should not corrupt the VM or future
submissions.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 43 +++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 389de7ca40..704d975178 100644
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
+			igt_assert(data != MAP_FAILED);
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

