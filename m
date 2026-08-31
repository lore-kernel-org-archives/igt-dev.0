Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78603C61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 17:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE4910EA21;
	Mon, 31 Aug 2026 17:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOqLZJYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C30010E620
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788198926; x=1819734926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EUClVnD5UfOkEu+WOZnW7039aYX018qeHUVs6nSDLwg=;
 b=iOqLZJYgg9V5IUjIIkVMddWHmTBJXDgGAu2AlFQ93sD+GtmHpOpfluZ4
 PEsnB2RBZ4PbXNroA0N9nWrT6hwYNhWJnJCZUQ1JZqFHRlrVwueBKyR86
 ShDGabMZAiDfK+b6J3bhmpmcHdcdgYB7miycPmVR6A693WyEA0zpLTqaG
 UPLYgs+Fr0SReIzuV+KQzB5p6gChT6Cv6qK9X1LdZq8aiY8NZMfQRfBnO
 MvuD3WUgcwqTCtG+BHM2jZ0m0mT6ZNmt2hXYMouGz+oJuEcq07YLWxl8D
 NwlqhNzulX6EwHOtcmVHSlF58gx7lY8Zh15kB9bbr0p2bCQpmy2T+LRy0 Q==;
X-CSE-ConnectionGUID: GwcRhDYLSyiNT2nJ+ecCqA==
X-CSE-MsgGUID: BMF0bJ0WQ9yGZEuV9qb1+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99774493"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="99774493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:55:25 -0700
X-CSE-ConnectionGUID: 45iXx6tPRY+FG2MjT2CPhA==
X-CSE-MsgGUID: F+7cLPs1S7iLhlTYfN3Htw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="265146849"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:55:23 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/3] tests/intel/xe_exec_basic: Add timeline syncobj coverage
Date: Mon, 31 Aug 2026 19:55:10 +0200
Message-ID: <20260831175512.1379368-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831175512.1379368-1-jan.maslak@intel.com>
References: <20260831175512.1379368-1-jan.maslak@intel.com>
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

Xe accepts both binary and timeline drm syncobjs on the exec and vm bind
IOCTLs, but the tests here only exercised binary ones.

Add a syncobj mode dimension to the subtest matrix so every existing
setup and workload combination also runs with timeline syncobjs, using
the "-timeline" name suffix. In that mode the vm bind signals a timeline
point and the exec waits on it, so the bind to exec dependency is carried
by a timeline syncobj across both IOCTLs. Execution completion is
likewise signalled as a timeline point.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_exec_basic.c | 293 +++++++++++++++++++++++++++++-------
 1 file changed, 241 insertions(+), 52 deletions(-)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 33d4b6a779..a00f3dfb91 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -31,27 +31,63 @@
 #define DEFER_BIND		(0x1 << 6)
 #define SPARSE			(0x1 << 7)
 
+enum syncobj_mode {
+	SYNC_MODE_BINARY = 1 << 0,
+	SYNC_MODE_TIMELINE = 1 << 1,
+};
+
+static void
+wait_syncobj(int fd, uint32_t handle, enum syncobj_mode mode, uint64_t point)
+{
+	if (mode == SYNC_MODE_TIMELINE)
+		igt_assert(syncobj_timeline_wait(fd, &handle, &point, 1,
+						 INT64_MAX, 0, NULL));
+	else
+		igt_assert(syncobj_wait(fd, &handle, 1, INT64_MAX, 0, NULL));
+}
+
 /**
  * SUBTEST: once-%s
  * Description: Run %arg[1] test only once
  * Test category: functionality test
  *
+ * SUBTEST: once-%s-timeline
+ * Description: Run %arg[1] test only once with timeline syncobjs
+ * Test category: functionality test
+ *
  * SUBTEST: many-%s
  * Description: Run %arg[1] test many times
  * Test category: stress test
  *
+ * SUBTEST: many-%s-timeline
+ * Description: Run %arg[1] test many times with timeline syncobjs
+ * Test category: stress test
+ *
  * SUBTEST: many-execqueues-%s
  * Description: Run %arg[1] test on many exec_queues
  * Test category: stress test
  *
+ * SUBTEST: many-execqueues-%s-timeline
+ * Description: Run %arg[1] test on many exec_queues with timeline syncobjs
+ * Test category: stress test
+ *
  * SUBTEST: many-execqueues-many-vm-%s
  * Description: Run %arg[1] test on many exec_queues and many VMs
  * Test category: stress test
  *
+ * SUBTEST: many-execqueues-many-vm-%s-timeline
+ * Description: Run %arg[1] test on many exec_queues and many VMs with timeline
+ *              syncobjs
+ * Test category: stress test
+ *
  * SUBTEST: twice-%s
  * Description: Run %arg[1] test twice
  * Test category: functionality test
  *
+ * SUBTEST: twice-%s-timeline
+ * Description: Run %arg[1] test twice with timeline syncobjs
+ * Test category: functionality test
+ *
  * SUBTEST: no-exec-%s
  * Description: Run no-exec %arg[1] test
  * Test category: functionality test
@@ -61,11 +97,23 @@
  * Mega feature: MultiGPU
  * Test category: functionality test
  *
+ * SUBTEST: multigpu-once-%s-timeline
+ * Description: Run %arg[1] test only once on multiGPU with timeline syncobjs
+ * Mega feature: MultiGPU
+ * Test category: functionality test
+ *
  * SUBTEST: multigpu-many-execqueues-many-vm-%s
  * Mega feature: MultiGPU
  * Description: Run %arg[1] test on many exec_queues and many VMs on multiGPU
  * Test category: stress test
  *
+ * SUBTEST: multigpu-many-execqueues-many-vm-%s-timeline
+ * Mega feature: MultiGPU
+ * Description: Run %arg[1] test on many exec_queues and many VMs on multiGPU
+ *              with timeline syncobjs
+ * Mega feature: MultiGPU
+ * Test category: stress test
+ *
  * SUBTEST: multigpu-no-exec-%s
  * Mega feature: MultiGPU
  * Description: Run no-exec %arg[1] test on multiGPU
@@ -90,29 +138,34 @@
  * @null:				null
  * @null-defer-mmap:			null defer mmap
  * @null-defer-bind:			null defer bind
- * @null-rebind:			null rebind
+ * @null-rebind:				null rebind
  */
 
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
-	  int n_exec_queues, int n_execs, int n_vm, unsigned int flags)
+	  int n_exec_queues, int n_execs, int n_vm, unsigned int flags,
+	  enum syncobj_mode sync_mode)
 {
-	struct drm_xe_sync sync[2] = {
-	    { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
-	    { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	const bool use_timeline = sync_mode == SYNC_MODE_TIMELINE;
+	struct drm_xe_sync bind_sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
+	struct drm_xe_sync exec_sync[2];
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
 		.num_syncs = 2,
-		.syncs = to_user_pointer(sync),
+		.syncs = to_user_pointer(exec_sync),
 	};
 	uint64_t addr[MAX_N_EXEC_QUEUES];
 	uint64_t sparse_addr[MAX_N_EXEC_QUEUES];
 	uint32_t vm[MAX_N_EXEC_QUEUES];
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
-	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
+	uint32_t exec_syncobjs[MAX_N_EXEC_QUEUES];
 	uint32_t bind_syncobjs[MAX_N_EXEC_QUEUES];
+	uint64_t bind_sync_points[MAX_N_EXEC_QUEUES] = {};
+	uint64_t exec_sync_points[MAX_N_EXEC_QUEUES] = {};
 	size_t bo_size;
 	uint32_t bo = 0;
 	struct {
@@ -171,25 +224,34 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 									__vm, 0);
 		else
 			bind_exec_queues[i] = 0;
-		syncobjs[i] = syncobj_create(fd, 0);
+		exec_syncobjs[i] = syncobj_create(fd, 0);
 		bind_syncobjs[i] = syncobj_create(fd, 0);
 	};
 
 	for (i = 0; i < n_vm; ++i) {
-		sync[0].handle = bind_syncobjs[i];
+		bind_sync = (struct drm_xe_sync) {
+			.type = use_timeline ? DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ :
+					      DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.handle = bind_syncobjs[i],
+			.timeline_value = use_timeline ? ++bind_sync_points[i] : 0,
+		};
 		if (bo)
 			xe_vm_bind_async(fd, vm[i], bind_exec_queues[i], bo, 0,
-					 addr[i], bo_size, sync, 1);
+					 addr[i], bo_size, &bind_sync, 1);
 		else
 			xe_vm_bind_userptr_async(fd, vm[i], bind_exec_queues[i],
 						 to_user_pointer(data), addr[i],
-						 bo_size, sync, 1);
-		if (flags & SPARSE)
+						 bo_size, &bind_sync, 1);
+		if (flags & SPARSE) {
+			if (use_timeline)
+				bind_sync.timeline_value = ++bind_sync_points[i];
 			__xe_vm_bind_assert(fd, vm[i], bind_exec_queues[i],
 					    0, 0, sparse_addr[i], bo_size,
 					    DRM_XE_VM_BIND_OP_MAP,
-					    DRM_XE_VM_BIND_FLAG_NULL, sync,
+					    DRM_XE_VM_BIND_FLAG_NULL, &bind_sync,
 					    1, 0, 0);
+		}
 	}
 
 	if (flags & DEFER_BIND)
@@ -213,35 +275,78 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[0].handle = bind_syncobjs[cur_vm];
-		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].handle = syncobjs[e];
+		if (use_timeline) {
+			exec_sync[0] = (struct drm_xe_sync) {
+				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+				.flags = 0,
+				.handle = bind_syncobjs[cur_vm],
+				.timeline_value = bind_sync_points[cur_vm],
+			};
+			exec_sync[1] = (struct drm_xe_sync) {
+				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+				.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+				.handle = exec_syncobjs[e],
+				.timeline_value = ++exec_sync_points[e],
+			};
+		} else {
+			exec_sync[0] = (struct drm_xe_sync) {
+				.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+				.flags = 0,
+				.handle = bind_syncobjs[cur_vm],
+			};
+			exec_sync[1] = (struct drm_xe_sync) {
+				.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+				.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+				.handle = exec_syncobjs[e],
+			};
+		}
+		exec.num_syncs = ARRAY_SIZE(exec_sync);
 
 		exec.exec_queue_id = exec_queues[e];
 		exec.address = batch_addr;
-		if (e != i)
-			 syncobj_reset(fd, &syncobjs[e], 1);
+		if (!use_timeline && e != i)
+			syncobj_reset(fd, &exec_syncobjs[e], 1);
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			uint32_t __vm = vm[cur_vm];
-
-			sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+			struct drm_xe_sync unbind_sync;
+
+			if (use_timeline) {
+				unbind_sync = (struct drm_xe_sync) {
+					.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+					.flags = 0,
+					.handle = exec_syncobjs[e],
+					.timeline_value = exec_sync_points[e],
+				};
+			} else {
+				unbind_sync = (struct drm_xe_sync) {
+					.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+					.flags = 0,
+					.handle = exec_syncobjs[e],
+				};
+			}
 			xe_vm_unbind_async(fd, __vm, bind_exec_queues[e], 0,
-					   __addr, bo_size, sync + 1, 1);
-
-			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+					   __addr, bo_size, &unbind_sync, 1);
+
+			bind_sync = (struct drm_xe_sync) {
+				.type = use_timeline ? DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ :
+						      DRM_XE_SYNC_TYPE_SYNCOBJ,
+				.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+				.handle = bind_syncobjs[cur_vm],
+				.timeline_value = use_timeline ?
+						  ++bind_sync_points[cur_vm] : 0,
+			};
 			addr[i % n_vm] += bo_size;
 			__addr = addr[i % n_vm];
 			if (bo)
 				xe_vm_bind_async(fd, __vm, bind_exec_queues[e], bo,
-						 0, __addr, bo_size, sync, 1);
+						 0, __addr, bo_size, &bind_sync, 1);
 			else
 				xe_vm_bind_userptr_async(fd, __vm,
 							 bind_exec_queues[e],
 							 to_user_pointer(data),
-							 __addr, bo_size, sync,
+							 __addr, bo_size, &bind_sync,
 							 1);
 		}
 
@@ -253,8 +358,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 * physical memory on next mmap call triggering
 				 * an invalidate.
 				 */
-				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
-							INT64_MAX, 0, NULL));
+				wait_syncobj(fd, exec_syncobjs[e], sync_mode,
+					     exec_sync_points[e]);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -272,21 +377,39 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	}
 
-	for (i = 0; i < n_exec_queues && n_execs; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
-					NULL));
+	for (i = 0; i < n_exec_queues; i++) {
+		if ((use_timeline && !exec_sync_points[i]) ||
+		    (!use_timeline && !n_execs))
+			continue;
 
-	for (i = 0; i < n_vm; i++)
-		igt_assert(syncobj_wait(fd, &bind_syncobjs[i], 1, INT64_MAX, 0,
-					NULL));
+		wait_syncobj(fd, exec_syncobjs[i], sync_mode,
+			     exec_sync_points[i]);
+	}
 
-	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	for (i = 0; i < n_vm; ++i) {
-		syncobj_reset(fd, &sync[0].handle, 1);
-		xe_vm_unbind_async(fd, vm[i], bind_exec_queues[i], 0, addr[i],
-				   bo_size, sync, 1);
-		igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
-					INT64_MAX, 0, NULL));
+	for (i = 0; i < n_vm; i++)
+		wait_syncobj(fd, bind_syncobjs[i], sync_mode, bind_sync_points[i]);
+
+	if (use_timeline) {
+		for (i = 0; i < n_vm; ++i) {
+			bind_sync = (struct drm_xe_sync) {
+				.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+				.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+				.handle = bind_syncobjs[i],
+				.timeline_value = ++bind_sync_points[i],
+			};
+			xe_vm_unbind_async(fd, vm[i], bind_exec_queues[i], 0,
+					   addr[i], bo_size, &bind_sync, 1);
+			wait_syncobj(fd, bind_syncobjs[i], sync_mode,
+				     bind_sync_points[i]);
+		}
+	} else {
+		for (i = 0; i < n_vm; ++i) {
+			syncobj_reset(fd, &bind_sync.handle, 1);
+			xe_vm_unbind_async(fd, vm[i], bind_exec_queues[i], 0,
+					   addr[i], bo_size, &bind_sync, 1);
+			igt_assert(syncobj_wait(fd, &bind_sync.handle, 1,
+						INT64_MAX, 0, NULL));
+		}
 	}
 
 	if (!(flags & SPARSE)) {
@@ -296,7 +419,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	for (i = 0; i < n_exec_queues; i++) {
-		syncobj_destroy(fd, syncobjs[i]);
+		syncobj_destroy(fd, exec_syncobjs[i]);
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 		if (bind_exec_queues[i])
 			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
@@ -335,7 +458,8 @@ static const struct exec_setup_variant exec_setup_variants[] = {
 	{ "bindexecqueue", BIND_EXEC_QUEUE },
 	{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
 	{ "bindexecqueue-rebind", BIND_EXEC_QUEUE | REBIND },
-	{ "bindexecqueue-userptr-rebind", BIND_EXEC_QUEUE | USERPTR | REBIND },
+	{ "bindexecqueue-userptr-rebind",
+		BIND_EXEC_QUEUE | USERPTR | REBIND },
 	{ "bindexecqueue-userptr-invalidate",
 		BIND_EXEC_QUEUE | USERPTR | INVALIDATE },
 	{ "bindexecqueue-userptr-invalidate-race",
@@ -368,6 +492,17 @@ static const struct workload_variant multigpu_workload_variants[] = {
 	{ NULL },
 };
 
+struct sync_mode_variant {
+	const char *suffix;
+	enum syncobj_mode mode;
+};
+
+static const struct sync_mode_variant sync_mode_variants[] = {
+	{ "", SYNC_MODE_BINARY },
+	{ "-timeline", SYNC_MODE_TIMELINE },
+	{ NULL, 0 },
+};
+
 static int workload_variant_n_execs(const struct workload_variant *workload,
 				    unsigned int flags)
 {
@@ -377,13 +512,50 @@ static int workload_variant_n_execs(const struct workload_variant *workload,
 	return workload->n_execs;
 }
 
+static void require_syncobj_mode(int fd, enum syncobj_mode mode)
+{
+	int ret;
+
+	if (mode != SYNC_MODE_TIMELINE)
+		return;
+
+	ret = igt_has_drm_cap(fd, DRM_CAP_SYNCOBJ_TIMELINE);
+	igt_require_f(ret >= 0,
+		      "Failed to query timeline syncobj capability\n");
+	igt_require_f(ret > 0, "Timeline syncobjs are not supported\n");
+}
+
+static void require_multigpu_syncobj_mode(enum syncobj_mode mode)
+{
+	bool supported = true;
+	bool query_failed = false;
+
+	if (mode == SYNC_MODE_TIMELINE)
+		igt_foreach_gpu(gpu_fd, DRIVER_XE) {
+			int ret = igt_has_drm_cap(gpu_fd,
+						  DRM_CAP_SYNCOBJ_TIMELINE);
+
+			if (ret < 0)
+				query_failed = true;
+			else if (ret == 0)
+				supported = false;
+		}
+
+	igt_require_f(!query_failed,
+		      "Failed to query timeline syncobj capability\n");
+	igt_require_f(supported, "Timeline syncobjs are not supported\n");
+}
+
 static void
 register_exec_subtest(int fd, const struct exec_setup_variant *setup,
-		      const struct workload_variant *workload)
+		      const struct workload_variant *workload,
+		      const struct sync_mode_variant *sync_mode)
 {
 	struct drm_xe_engine_class_instance *hwe;
 
-	igt_subtest_with_dynamic_f("%s-%s", workload->name, setup->name) {
+	igt_subtest_with_dynamic_f("%s-%s%s", workload->name, setup->name,
+				   sync_mode->suffix) {
+		require_syncobj_mode(fd, sync_mode->mode);
 		xe_for_each_engine(fd, hwe)
 			igt_dynamic_f("%s%d",
 				      xe_engine_class_short_string(hwe->engine_class),
@@ -391,24 +563,30 @@ register_exec_subtest(int fd, const struct exec_setup_variant *setup,
 				test_exec(fd, hwe, workload->n_exec_queues,
 					  workload_variant_n_execs(workload,
 								   setup->flags),
-					  workload->n_vm, setup->flags);
+					  workload->n_vm, setup->flags,
+					  sync_mode->mode);
 	}
 }
 
 static void
 register_multigpu_exec_subtest(const struct exec_setup_variant *setup,
-			       const struct workload_variant *workload)
+			       const struct workload_variant *workload,
+			       const struct sync_mode_variant *sync_mode)
 {
 	struct drm_xe_engine_class_instance *hwe;
 
-	igt_subtest_f("multigpu-%s-%s", workload->name, setup->name) {
-		igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE)
+	igt_subtest_f("multigpu-%s-%s%s", workload->name, setup->name,
+		      sync_mode->suffix) {
+		require_multigpu_syncobj_mode(sync_mode->mode);
+		igt_multi_fork_foreach_multigpu(gpu_fd, gpu_idx, DRIVER_XE) {
 			xe_for_each_engine(gpu_fd, hwe)
 				test_exec(gpu_fd, hwe,
 					  workload->n_exec_queues,
 					  workload_variant_n_execs(workload,
 								   setup->flags),
-					  workload->n_vm, setup->flags);
+					  workload->n_vm, setup->flags,
+					  sync_mode->mode);
+		}
 		igt_waitchildren();
 	}
 }
@@ -424,7 +602,12 @@ int igt_main()
 	     setup->name; setup++)
 		for (const struct workload_variant *workload = workload_variants;
 		     workload->name; workload++)
-			register_exec_subtest(fd, setup, workload);
+			for (const struct sync_mode_variant *sync = sync_mode_variants;
+			     sync->suffix; sync++)
+				if (sync->mode != SYNC_MODE_TIMELINE ||
+				    workload->n_execs)
+					register_exec_subtest(fd, setup, workload,
+							      sync);
 
 	igt_fixture()
 		drm_close_driver(fd);
@@ -433,5 +616,11 @@ int igt_main()
 	     setup->name; setup++)
 		for (const struct workload_variant *workload = multigpu_workload_variants;
 		     workload->name; workload++)
-			register_multigpu_exec_subtest(setup, workload);
+			for (const struct sync_mode_variant *sync = sync_mode_variants;
+			     sync->suffix; sync++)
+				if (sync->mode != SYNC_MODE_TIMELINE ||
+				    workload->n_execs)
+					register_multigpu_exec_subtest(setup,
+								       workload,
+								       sync);
 }
-- 
2.43.0

