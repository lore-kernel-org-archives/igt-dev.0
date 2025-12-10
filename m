Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3908DD3C520
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBFF10E654;
	Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCNV2DMJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F1D10E641
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327186; x=1796863186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AaB9o4IcS6lrVCGkRf3kg140iC+jFVavpYBhhwbDuzw=;
 b=XCNV2DMJVUgIa1auqbqGKAuWH0HazSl+uAVW5IcYxLy4TwJpvWVEUWS3
 rfAdUilcRKqGTVasvOsz4Wyp8j3TdFRXjGlkxp/pFI883NKhLD9I46nst
 3tO7Sp54c4Gy4nEjhG8CAE6Yhwo7o8zflEkYLxPej/bVs1snxNDd5KmDe
 0qr3TEcibCTVGNTgO76gg6eTsnN7dP2/LRYRQYPRAZi3wjUzseS6cFp3U
 3Qulabqq/stfBtYy0KOK9O8LfmsYyfTyE4w4zgEGgTqQPW334uIS0WRob
 BtpHMuCmz2j7pi4j7G+K1cnSCcsUKi/NXnxw/BBqWMP3qnkWp64Necx8q w==;
X-CSE-ConnectionGUID: EI7yTu+ZRryzKJ5/U2D0yg==
X-CSE-MsgGUID: oY2/sXjmQT6C+Jpn5PbAKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180405"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180405"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:45 -0800
X-CSE-ConnectionGUID: C1DXNF/3SCC8kNbHK5I9JA==
X-CSE-MsgGUID: pLBy7s1WQm2XjJkUHYfFEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421628"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:45 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v4 11/18] tests/intel/xe_exec_multi_queue: Add userptr
 invalidation tests
Date: Tue,  9 Dec 2025 16:39:46 -0800
Message-ID: <20251210003936.1613078-31-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
References: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
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

v3: Minor code refactor

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 95 +++++++++++++++++++++++++------
 1 file changed, 78 insertions(+), 17 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 459c44d31..235fa0594 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -30,6 +30,7 @@
 #define CLOSE_FD		(0x1 << 2)
 #define PREEMPT_MODE		(0x1 << 3)
 #define DYN_PRIORITY		(0x1 << 4)
+#define INVALIDATE		(0x1 << 5)
 
 #define MAX_INSTANCE 9
 
@@ -261,9 +262,16 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
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
@@ -328,18 +336,40 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
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
+				data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
+					    PROT_WRITE, MAP_SHARED | MAP_FIXED |
+					    MAP_ANONYMOUS, -1, 0);
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
@@ -348,7 +378,7 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
-	} else {
+	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
 
@@ -394,9 +424,16 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -466,10 +503,29 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -477,8 +533,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1,	INT64_MAX, 0, NULL));
 
-	for (i = 0; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+	if (!(flags & INVALIDATE))
+		for (i = 0; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
 
 	for (i = 0; i < n_exec_queues; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
@@ -489,7 +546,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
-	} else {
+	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
 
@@ -530,11 +587,13 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -582,11 +641,13 @@ int igt_main()
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

