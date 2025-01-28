Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADF5C0218D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 10:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9D110E635;
	Tue, 28 Jan 2025 10:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKzmOclC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96B310E635
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738059924; x=1769595924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7I/UOM85YnHBWM0Ug5H2Sz3agbm1Qv0O1PiW6So4EbE=;
 b=PKzmOclC+oG4JdwAc1ReYAtvUgBGcIqCJbJJKeLqQcWLud/Ez7gZtn2N
 ja63NTi/e+FcVBwMDSOh8i/P5viOuY8MdcjBm660wjsjTS9oIAj5Ioi1f
 UoyJbae3eEkJ0rWG1v70kzv96dxKQYAQ5JMCDaVK2DXzGzbVnYrpNqCT8
 d8+80d795e8i/qlvwmjrZHj1mr371bwEInpd0a6IJN7djIwmmD1C/XZs6
 LRvvYzbplwEvgVwpxyYnzse434hkreZmHp/Mie8hAgExZqlvvIXBMpwJv
 /9GSDyPI5DjK/CokMmYnuzIAOvWhXQqKLCQpoKen9Rx2C05F5iIBwyx91 g==;
X-CSE-ConnectionGUID: UsqUXBcNQQGyYPY+7pO6ZQ==
X-CSE-MsgGUID: EyBcAMvHSoOkl5H4ttYnDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37787727"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="37787727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 02:25:23 -0800
X-CSE-ConnectionGUID: GW8+CH58Q0mRGy7/Ud5XAQ==
X-CSE-MsgGUID: Ut4HkE/tR9iMbqCwQ1bMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="108667725"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.101])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 02:25:23 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3] lib/intel_compute: Use LR mode for compute when using Xe
Date: Tue, 28 Jan 2025 11:25:03 +0100
Message-ID: <20250128102504.128723-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

When Xe is used, create the VM in LR mode as this is what the
compute UMD does to run compute kernels. This makes those tests
more representative of real world scenarios. A side effect is
that user fences must be used.

v2: Minimize changes, stick to xe_vm_bind_userptr_async()

v3: Also use user fences in preempt exec

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 145 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 120 insertions(+), 25 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index f1520aad4..52de3ebcc 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -27,6 +27,8 @@
 #define SIZE_BATCH			0x1000
 #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
 #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
+#define ADDR_SYNC			0x010000ULL
+#define ADDR_SYNC2			0x020000ULL
 #define ADDR_BATCH			0x100000ULL
 #define ADDR_INPUT			0x200000ULL
 #define ADDR_OUTPUT			0x300000ULL
@@ -43,6 +45,8 @@
 #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
 #define OFFSET_STATE_SIP			0xFFFF0000
 
+#define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
+
 /*
  * TGP  - ThreadGroup Preemption
  * WMTP - Walker Mid Thread Preemption
@@ -58,6 +62,10 @@ struct bo_dict_entry {
 	uint32_t handle;
 };
 
+struct bo_sync {
+	uint64_t sync;
+};
+
 struct bo_execenv {
 	int fd;
 	enum intel_driver driver;
@@ -81,7 +89,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 	execenv->driver = get_intel_driver(fd);
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
-		execenv->vm = xe_vm_create(fd, 0, 0);
+		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 
 		if (eci) {
 			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
@@ -107,8 +115,8 @@ static void bo_execenv_destroy(struct bo_execenv *execenv)
 	igt_assert(execenv);
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
-		xe_vm_destroy(execenv->fd, execenv->vm);
 		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
+		xe_vm_destroy(execenv->fd, execenv->vm);
 	}
 }
 
@@ -119,18 +127,30 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
 		uint32_t vm = execenv->vm;
+		uint32_t exec_queue = execenv->exec_queue;
 		uint64_t alignment = xe_get_default_alignment(fd);
-		struct drm_xe_sync sync = { 0 };
-
-		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
-		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
-		sync.handle = syncobj_create(fd, 0);
+		struct bo_sync *bo_sync;
+		size_t bo_size = sizeof(*bo_sync);
+		uint32_t bo = 0;
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+		};
+
+		bo_size = xe_bb_size(fd, bo_size);
+		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		bo_sync = xe_bo_map(fd, bo, bo_size);
+		sync.addr = to_user_pointer(&bo_sync->sync);
 
 		for (int i = 0; i < entries; i++) {
+			bo_sync->sync = 0;
 			bo_dict[i].data = aligned_alloc(alignment, bo_dict[i].size);
 			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data),
 						 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
-			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
+				       NSEC_PER_SEC);
 			memset(bo_dict[i].data, 0, bo_dict[i].size);
 
 			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
@@ -139,7 +159,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 				  (long long)bo_dict[i].size);
 		}
 
-		syncobj_destroy(fd, sync.handle);
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
 		struct drm_i915_gem_exec_object2 *obj;
@@ -177,19 +198,32 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
 		uint32_t vm = execenv->vm;
-		struct drm_xe_sync sync = { 0 };
-
-		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
-		sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
-		sync.handle = syncobj_create(fd, 0);
+		uint32_t exec_queue = execenv->exec_queue;
+		struct bo_sync *bo_sync;
+		size_t bo_size = sizeof(*bo_sync);
+		uint32_t bo = 0;
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+		};
+
+		bo_size = xe_bb_size(fd, bo_size);
+		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		bo_sync = xe_bo_map(fd, bo, bo_size);
+		sync.addr = to_user_pointer(&bo_sync->sync);
 
 		for (int i = 0; i < entries; i++) {
+			bo_sync->sync = 0;
 			xe_vm_unbind_async(fd, vm, 0, 0, bo_dict[i].addr, bo_dict[i].size, &sync, 1);
-			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
+				       NSEC_PER_SEC);
 			free(bo_dict[i].data);
 		}
 
-		syncobj_destroy(fd, sync.handle);
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		for (int i = 0; i < entries; i++) {
 			gem_close(fd, bo_dict[i].handle);
@@ -204,7 +238,32 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
 	int fd = execenv->fd;
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
-		xe_exec_wait(fd, execenv->exec_queue, start_addr);
+		uint32_t exec_queue = execenv->exec_queue;
+		struct bo_sync *bo_sync;
+		size_t bo_size = sizeof(*bo_sync);
+		uint32_t bo = 0;
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+		};
+
+		bo_size = xe_bb_size(fd, bo_size);
+		bo = xe_bo_create(fd, execenv->vm, bo_size, vram_if_possible(fd, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		bo_sync = xe_bo_map(fd, bo, bo_size);
+		sync.addr = to_user_pointer(&bo_sync->sync);
+		xe_vm_bind_async(fd, execenv->vm, 0, bo, 0, ADDR_SYNC, bo_size, &sync, 1);
+		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, NSEC_PER_SEC);
+
+		sync.addr = ADDR_SYNC;
+		bo_sync->sync = 0;
+
+		xe_exec_sync(fd, exec_queue, start_addr, &sync, 1);
+		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, NSEC_PER_SEC);
+
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
 		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
@@ -1803,15 +1862,21 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	float *dinput;
 	unsigned int long_kernel_loop_count;
 	struct drm_xe_sync sync_long = {
-		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
-		.handle = syncobj_create(fd, 0),
+		.timeline_value = USER_FENCE_VALUE,
 	};
+	struct bo_sync *bo_sync_long;
+	size_t bo_size_long = sizeof(*bo_sync_long);
+	uint32_t bo_long = 0;
 	struct drm_xe_sync sync_short = {
-		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
-		.handle = syncobj_create(fd, 0),
+		.timeline_value = USER_FENCE_VALUE,
 	};
+	struct bo_sync *bo_sync_short;
+	size_t bo_size_short = sizeof(*bo_sync_short);
+	uint32_t bo_short = 0;
 
 	if (threadgroup_preemption)
 		long_kernel_loop_count = TGP_long_kernel_loop_count;
@@ -1824,6 +1889,32 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	bo_execenv_create(fd, &execenv_short, eci);
 	bo_execenv_create(fd, &execenv_long, eci);
 
+	/* Prepare sync object for long */
+	bo_size_long = xe_bb_size(fd, bo_size_long);
+	bo_long = xe_bo_create(fd, execenv_long.vm, bo_size_long, vram_if_possible(fd, 0),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bo_sync_long = xe_bo_map(fd, bo_long, bo_size_long);
+	sync_long.addr = to_user_pointer(&bo_sync_long->sync);
+	xe_vm_bind_async(fd, execenv_long.vm, 0, bo_long, 0, ADDR_SYNC, bo_size_long,
+			 &sync_long, 1);
+	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
+		       NSEC_PER_SEC);
+	bo_sync_long->sync = 0;
+	sync_long.addr = ADDR_SYNC;
+
+	/* Prepare sync object for short */
+	bo_size_short = xe_bb_size(fd, bo_size_short);
+	bo_short = xe_bo_create(fd, execenv_short.vm, bo_size_short, vram_if_possible(fd, 0),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bo_sync_short = xe_bo_map(fd, bo_short, bo_size_short);
+	sync_short.addr = to_user_pointer(&bo_sync_short->sync);
+	xe_vm_bind_async(fd, execenv_short.vm, 0, bo_short, 0, ADDR_SYNC2, bo_size_short,
+			 &sync_short, 1);
+	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
+		       NSEC_PER_SEC);
+	bo_sync_short->sync = 0;
+	sync_short.addr = ADDR_SYNC2;
+
 	bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
 	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
 
@@ -1872,14 +1963,18 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
 
 	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
+	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
+		       NSEC_PER_SEC);
 
 	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
+	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
+		       NSEC_PER_SEC);
 
-	igt_assert(syncobj_wait(fd, &sync_short.handle, 1, INT64_MAX, 0, NULL));
-	syncobj_destroy(fd, sync_short.handle);
+	munmap(bo_sync_long, bo_size_long);
+	gem_close(fd, bo_long);
 
-	igt_assert(syncobj_wait(fd, &sync_long.handle, 1, INT64_MAX, 0, NULL));
-	syncobj_destroy(fd, sync_long.handle);
+	munmap(bo_sync_short, bo_size_short);
+	gem_close(fd, bo_short);
 
 	for (int i = 0; i < SIZE_DATA; i++) {
 		float f1, f2;
-- 
2.43.0

