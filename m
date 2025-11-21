Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4DECFA470
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7199B10E7FA;
	Fri, 21 Nov 2025 03:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItrHMF97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3BE10E7F8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697448; x=1795233448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/mF7XBmHSE7ZILpW9+1kx02rGRRnvV6GaLcuSrOSOc=;
 b=ItrHMF97iynZwBSSbXLu3Y5LFsGwaFqEG6VpCGG8yz0cXn6Udx0eQerZ
 ioIIzaiz7SgHhK6OZ9bzXTyGmiqCGLS2Wtq1Ui4SfNJvQgccSd1UJdBn+
 rr1Fedf0s4HSWZ0I3xmarbb2lWeDP2kIf7rdE0HdBWOz0wZuDzMfoPT8e
 TeXgGdzCyEb+nOfBLJkD/46z+YUzJJsDEiTPKbPRlQP8MEE2V74GGr4X8
 /cBGm95MyNUQ7l5sD3+GZ0uHvljHgS57+GFp1sE0UlObErX0ez4r1M1RW
 e/heKQHZE4AqZU2+tpkyGLChQKgHXD9G37iQLnqrJUNsBRCw9BQES9tgf w==;
X-CSE-ConnectionGUID: xEgGQS0gRNeTvPv25sxKKQ==
X-CSE-MsgGUID: 514ZfODMTa6VZ+SYdwmI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484673"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:27 -0800
X-CSE-ConnectionGUID: YFES7Ma3RyGmPeryk4UEvQ==
X-CSE-MsgGUID: qq5hehwtSwul5V0pCu+AoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433494"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 11/19] tests/intel/xe_exec_multi_queue: Add userptr
 invalidation tests
Date: Thu, 20 Nov 2025 19:57:23 -0800
Message-ID: <20251121035715.767226-32-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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
index 5d3a209e5..aa86f8a38 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -30,6 +30,7 @@
 #define CLOSE_FD		(0x1 << 2)
 #define PREEMPT_MODE		(0x1 << 3)
 #define DYN_PRIORITY		(0x1 << 4)
+#define INVALIDATE		(0x1 << 5)
 
 #define MAX_INSTANCE 9
 
@@ -247,9 +248,16 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
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
@@ -314,18 +322,40 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
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
@@ -334,7 +364,7 @@ test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_plac
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
-	} else {
+	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
 
@@ -380,9 +410,16 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -452,10 +489,29 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -463,8 +519,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1,	INT64_MAX, 0, NULL));
 
-	for (i = 0; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+	if (!(flags & INVALIDATE))
+		for (i = 0; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
 
 	for (i = 0; i < n_exec_queues; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
@@ -475,7 +532,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
-	} else {
+	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
 
@@ -516,11 +573,13 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -568,11 +627,13 @@ igt_main
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

