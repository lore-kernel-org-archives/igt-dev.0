Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D21CCFA06
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CD510E320;
	Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFYhor8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107E10E30B
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cqgG8FK2d+1h9F30LLXZ6/R4B6JV7IacxSbCzsG3yfc=;
 b=NFYhor8sanSF3uzgn0hGcuuPF9i448w++gc8wLpO2GJ7OPh02nEv6u6f
 Tf//cDJtaTU0b6a8omf95cwBQCFMqybPCGFvulU+NllaYlLefPCk/2NP+
 1sC4Mbhd7wGHk0cicmvWp9CmA2kd8bCWfA7c8fTfd0NF/0KalAfQSLhz1
 Ro2IXJZbq2UmC4Ntkjt7B+jGbU7cScxEVf3LjGoa6ZtSRwXkmfjbCdZhB
 Kk8JY/5Ugo7DSQAxlY5o5TC1olmNXWjVItgE2hQtXOVvO2tORYAnkw0nR
 fcoCeBBRsb3bhsx96WidpIpnYkz+Hw0H1tLduKMz7PI1hAc0RAENdN6RZ A==;
X-CSE-ConnectionGUID: uNx3DuQiTFCelGOlKKRovg==
X-CSE-MsgGUID: vgT8DGfbQOyqwY017yLbnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144734"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144734"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: bljNUPu4Sm2hBfbSjvInvA==
X-CSE-MsgGUID: 9sF98tPjTEuoJ4m6pTd7qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650029"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 11/18] tests/xe_exec_multi_queue: Add userptr invalidation
 tests
Date: Fri, 31 Oct 2025 11:35:48 -0700
Message-ID: <20251031183555.1882721-12-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

Add validation support for userptr invalidation. For normal tests,
userptr invalidation will happen after all the gpu jobs using that
userptr are complete. For preempt mode tests, userptr invalidation
suspends the execution queue and resumes it after invalidation is
complete.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 95 +++++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 17 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 016979337..f819482ba 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -30,6 +30,7 @@
 #define CLOSE_FD		(0x1 << 2)
 #define PREEMPT_MODE		(0x1 << 3)
 #define DYN_PRIORITY		(0x1 << 4)
+#define INVALIDATE		(0x1 << 5)
 
 #define MAX_INSTANCE 9
 
@@ -245,9 +246,16 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
 
 	if (flags & USERPTR) {
-		data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
-		igt_assert(data);
-
+#define	MAP_ADDRESS	0x00007fadeadbe000
+		if (flags & INVALIDATE) {
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
+			igt_assert(data);
+		}
 		memset(data, 0, bo_size);
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
@@ -313,18 +321,40 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 						   XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2));
 
 		xe_exec(fd, &exec);
+
+		if (flags & INVALIDATE) {
+			/*
+			 * Wait for exec completion and check data as userptr will
+			 * likely change to different physical memory on next mmap
+			 * call triggering an invalidate.
+			 */
+			xe_wait_ufence(fd, &data[i].exec_sync,
+				       USER_FENCE_VALUE, exec_queues[e],
+				       fence_timeout);
+			igt_assert_eq(data[i].data, 0xc0ffee);
+
+			if (i) {
+				data = mmap((void *)MAP_ADDRESS, bo_size,
+					    PROT_READ | PROT_WRITE, MAP_SHARED |
+					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+				igt_assert(data != MAP_FAILED);
+			}
+
+		}
 	}
 
-	for (i = 0; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       exec_queues[i % n_exec_queues], fence_timeout);
+	if (!(flags & INVALIDATE))
+		for (i = 0; i < n_execs; i++)
+			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				       exec_queues[i % n_exec_queues], fence_timeout);
 
 	sync.addr = to_user_pointer(&vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
 	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
 
-	for (i = 0; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+	if (!(flags & INVALIDATE))
+		for (i = 0; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
 
 	if (!(flags & CLOSE_FD))
 		for (i = 0; i < n_exec_queues; i++)
@@ -333,7 +363,7 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
-	} else {
+	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
 
@@ -379,9 +409,16 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
 
 	if (flags & USERPTR) {
-		data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
-		igt_assert(data);
-
+#define	MAP_ADDRESS	0x00007fadeadbe000
+		if (flags & INVALIDATE) {
+			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+				    MAP_ANONYMOUS, -1, 0);
+			igt_assert(data != MAP_FAILED);
+		} else {
+			data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
+			igt_assert(data);
+		}
 		memset(data, 0, bo_size);
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
@@ -451,10 +488,29 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 						   XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2));
 
 		xe_exec(fd, &exec);
+
+		if (flags & INVALIDATE) {
+			/*
+			 * Wait for exec completion and check data as userptr will
+			 * likely change to different physical memory on next mmap
+			 * call triggering an invalidate.
+			 */
+			igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
+						INT64_MAX, 0, NULL));
+			igt_assert_eq(data[i].data, 0xc0ffee);
+
+			if (i) {
+				data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+					    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+					    MAP_ANONYMOUS, -1, 0);
+				igt_assert(data != MAP_FAILED);
+			}
+		}
 	}
 
-	for (i = 0; i < n_exec_queues && i < n_execs; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
+	if (!(flags & INVALIDATE))
+		for (i = 0; i < n_exec_queues && i < n_execs; i++)
+			igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
 
 	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
@@ -462,8 +518,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1,	INT64_MAX, 0, NULL));
 
-	for (i = 0; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+	if (!(flags & INVALIDATE))
+		for (i = 0; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
 
 	for (i = 0; i < n_exec_queues; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
@@ -474,7 +531,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
-	} else {
+	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
 
@@ -515,11 +572,13 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  *
  * @basic:					basic
  * @userptr:					userptr
+ * @userptr-invalidate:				userptr invalidate
  * @priority:					priority
  * @close-fd:					close fd without destroying exec queues
  * @dyn-priority:				dynamic priority
  * @preempt-mode-basic:				preempt-mode basic
  * @preempt-mode-userptr:			preempt-mode userptr
+ * @preempt-mode-userptr-invalidate:		preempt-mode userptr invalidate
  * @preempt-mode-priority:			preempt-mode priority
  * @preempt-mode-close-fd:			preempt-mode close fd without destroying exec queues
  * @preempt-mode-dyn-priority:			preempt-mode dynamic priority
@@ -569,11 +628,13 @@ igt_main
 	} sections[] = {
 		{ "basic", 0 },
 		{ "userptr", USERPTR },
+		{ "userptr-invalidate", USERPTR | INVALIDATE },
 		{ "priority", PRIORITY },
 		{ "close-fd", CLOSE_FD },
 		{ "dyn-priority", DYN_PRIORITY },
 		{ "preempt-mode-basic", PREEMPT_MODE },
 		{ "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
+		{ "preempt-mode-userptr-invalidate", PREEMPT_MODE | USERPTR | INVALIDATE },
 		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
 		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
 		{ "preempt-mode-dyn-priority", PREEMPT_MODE | DYN_PRIORITY },
-- 
2.43.0

