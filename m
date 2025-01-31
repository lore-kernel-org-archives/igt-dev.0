Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC589C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 12:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8CB10EA9C;
	Fri, 31 Jan 2025 12:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDfoyjIX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F0510EA9C
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738327928; x=1769863928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pZKUd3EeRrcMsMyERSqU6GD9ESndXOyCy9L2ftBE0RU=;
 b=aDfoyjIXUPk3TkEp7yXr04kj/7mzxs1txPXkmJ/TdsMrM2MSbktQkiOu
 wQW2WeR+nd18v18e43e+YdD/5VxGGpQ3fHLyIQqm4sGZkt12kyIyJdx4Z
 +tIkAIaxhNeO2Y5eePexTOYTF5CNpNr+lyR3W9/V97fSYkdGxbjNJHnLS
 y0tEVG3BnfH1XwHZr2cyvm4l8Nig1plyLhHAhUIB8UCYm/c2LhNOFdZ3f
 l1L4UftCKAIn7BFBQ8OLGVtVcY1rRjBd/4ryozrH4UvC/2kI5WxiiyQap
 N6g8PMz3EGjJUWNf2uFXTo5Os5hyhrjD22Xf6g4IFZ+iEh0mgobNS1yJl w==;
X-CSE-ConnectionGUID: RFSBFVsDSUaMS59oArnxAg==
X-CSE-MsgGUID: cqgPCWKWRUWgw85wuNcPAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38599614"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="38599614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 04:52:08 -0800
X-CSE-ConnectionGUID: vyfaV8Q5RfSIudTixyZdXQ==
X-CSE-MsgGUID: iLOH3Z0STz+EcZG+a9FKmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110500323"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.151])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 04:52:06 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v4] lib/intel_compute: Use LR mode for compute when using Xe
Date: Fri, 31 Jan 2025 13:51:56 +0100
Message-ID: <20250131125156.577530-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v4: Do not rely on user pointers due to atomics use in sip,
    Fix waiting times and order in preempt exec (Zbigniew)

CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 164 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 133 insertions(+), 31 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index f1520aad4..3defe92e5 100644
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
 
@@ -119,18 +127,32 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
 		uint32_t vm = execenv->vm;
-		uint64_t alignment = xe_get_default_alignment(fd);
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
-			bo_dict[i].data = aligned_alloc(alignment, bo_dict[i].size);
-			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data),
-						 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
-			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+			bo_sync->sync = 0;
+			bo_dict[i].handle = xe_bo_create(fd, execenv->vm, bo_dict[i].size,
+							 vram_if_possible(fd, 0),
+							 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			bo_dict[i].data = xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
+			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0, bo_dict[i].addr,
+					 bo_dict[i].size, &sync, 1);
+			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
+				       INT64_MAX);
 			memset(bo_dict[i].data, 0, bo_dict[i].size);
 
 			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
@@ -139,7 +161,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 				  (long long)bo_dict[i].size);
 		}
 
-		syncobj_destroy(fd, sync.handle);
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
 		struct drm_i915_gem_exec_object2 *obj;
@@ -177,19 +200,33 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 
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
-			free(bo_dict[i].data);
+			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
+				       INT64_MAX);
+			munmap(bo_dict[i].data, bo_dict[i].size);
+			gem_close(fd, bo_dict[i].handle);
 		}
 
-		syncobj_destroy(fd, sync.handle);
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		for (int i = 0; i < entries; i++) {
 			gem_close(fd, bo_dict[i].handle);
@@ -204,7 +241,32 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
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
+		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, INT64_MAX);
+
+		sync.addr = ADDR_SYNC;
+		bo_sync->sync = 0;
+
+		xe_exec_sync(fd, exec_queue, start_addr, &sync, 1);
+		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, INT64_MAX);
+
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
 		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
@@ -1803,15 +1865,22 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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
+	int64_t timeout_short = 1;
 
 	if (threadgroup_preemption)
 		long_kernel_loop_count = TGP_long_kernel_loop_count;
@@ -1824,6 +1893,32 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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
+		       INT64_MAX);
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
+		       INT64_MAX);
+	bo_sync_short->sync = 0;
+	sync_short.addr = ADDR_SYNC2;
+
 	bo_dict_long[0].size = ALIGN(long_kernel_size, 0x1000);
 	bo_dict_short[0].size = ALIGN(short_kernel_size, 0x1000);
 
@@ -1872,14 +1967,21 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP, false);
 
 	xe_exec_sync(fd, execenv_long.exec_queue, ADDR_BATCH, &sync_long, 1);
-
 	xe_exec_sync(fd, execenv_short.exec_queue, ADDR_BATCH, &sync_short, 1);
 
-	igt_assert(syncobj_wait(fd, &sync_short.handle, 1, INT64_MAX, 0, NULL));
-	syncobj_destroy(fd, sync_short.handle);
+	xe_wait_ufence(fd, &bo_sync_short->sync, USER_FENCE_VALUE, execenv_short.exec_queue,
+		       INT64_MAX);
+	/* Check that the long kernel has not completed yet */
+	igt_assert_neq(0, __xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE,
+					   execenv_long.exec_queue, &timeout_short));
+	xe_wait_ufence(fd, &bo_sync_long->sync, USER_FENCE_VALUE, execenv_long.exec_queue,
+		       INT64_MAX);
+
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

