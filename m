Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF17C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 19:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA2110E3F2;
	Thu, 23 Jan 2025 19:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVP4mRlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA6110E085
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 19:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737660663; x=1769196663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZfcxNOpKDt5FjD0gheVs9sIld/RPxhm4eNifpZsX8jU=;
 b=eVP4mRlRZbMWmxNT4pTBtwI7P1FvffHn4uhtG+lFE0ia4NrnpZxRXO/7
 Frtx+uPr4reKYw2L0fj1duP5m5l4fGneLmN3jGPgY0ClO7vpCzm0Va9Fr
 f+0kH3AoBx7eqvzhJZVeMsIQN7lvpJzKY1niQazQwFFGMTai3QnAXWJZI
 f3aoUIduCo1D/styMa/lrTED4cN/7x/gMNgXGHdIRrsQR7g41wB6/ony+
 D9fo1HOY3/QM60JRYgoQIDTfZWI+cWYZjW+CjKNroHpyH7rbllzzO603p
 jma1xDy5Jx58/4rODk9QBfj/2e4ZU5ZdXim3TztiyQfx9r7Is8+EQO/vy A==;
X-CSE-ConnectionGUID: kGRyZP3jQliKUT6Or/wHJQ==
X-CSE-MsgGUID: w+zI5jLHT/u2HQbogLfcNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48681060"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="48681060"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 11:31:02 -0800
X-CSE-ConnectionGUID: z+FKwA7eR32lzDg2tktxfQ==
X-CSE-MsgGUID: SbUyUHMIQh6xblnBcotSjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138424527"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.79])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 11:31:00 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: Use LR mode for compute when using Xe
Date: Thu, 23 Jan 2025 20:30:50 +0100
Message-ID: <20250123193050.2433439-1-francois.dugast@intel.com>
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

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 110 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 90 insertions(+), 20 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index f1520aad4..b56cf67ce 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -27,6 +27,7 @@
 #define SIZE_BATCH			0x1000
 #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
 #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
+#define ADDR_SYNC			0x001000ULL
 #define ADDR_BATCH			0x100000ULL
 #define ADDR_INPUT			0x200000ULL
 #define ADDR_OUTPUT			0x300000ULL
@@ -43,6 +44,8 @@
 #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
 #define OFFSET_STATE_SIP			0xFFFF0000
 
+#define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
+
 /*
  * TGP  - ThreadGroup Preemption
  * WMTP - Walker Mid Thread Preemption
@@ -58,6 +61,10 @@ struct bo_dict_entry {
 	uint32_t handle;
 };
 
+struct bo_sync {
+	uint64_t sync;
+};
+
 struct bo_execenv {
 	int fd;
 	enum intel_driver driver;
@@ -81,7 +88,7 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 	execenv->driver = get_intel_driver(fd);
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
-		execenv->vm = xe_vm_create(fd, 0, 0);
+		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 
 		if (eci) {
 			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
@@ -107,8 +114,8 @@ static void bo_execenv_destroy(struct bo_execenv *execenv)
 	igt_assert(execenv);
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
-		xe_vm_destroy(execenv->fd, execenv->vm);
 		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
+		xe_vm_destroy(execenv->fd, execenv->vm);
 	}
 }
 
@@ -119,18 +126,35 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 
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
 			bo_dict[i].data = aligned_alloc(alignment, bo_dict[i].size);
-			xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(bo_dict[i].data),
-						 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
-			syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL);
+			bo_dict[i].handle =
+				xe_bo_create(fd, vm, bo_dict[i].size, vram_if_possible(fd, 0),
+					     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			bo_dict[i].data =
+				xe_bo_map(fd, bo_dict[i].handle, bo_dict[i].size);
+			bo_sync->sync = 0;
+			xe_vm_bind_async(fd, vm, 0, bo_dict[i].handle, 0,
+					 bo_dict[i].addr, bo_dict[i].size, &sync, 1);
+			xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue,
+				       NSEC_PER_SEC);
 			memset(bo_dict[i].data, 0, bo_dict[i].size);
 
 			igt_debug("[i: %2d name: %20s] data: %p, addr: %16llx, size: %llx\n",
@@ -139,7 +163,8 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 				  (long long)bo_dict[i].size);
 		}
 
-		syncobj_destroy(fd, sync.handle);
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
 		struct drm_i915_gem_exec_object2 *obj;
@@ -177,19 +202,33 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 
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
+				       NSEC_PER_SEC);
+			munmap(bo_dict[i].data, bo_dict[i].size);
+			gem_close(fd, bo_dict[i].handle);
 		}
 
-		syncobj_destroy(fd, sync.handle);
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		for (int i = 0; i < entries; i++) {
 			gem_close(fd, bo_dict[i].handle);
@@ -204,7 +243,38 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
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
+		struct drm_xe_exec exec = {
+			.num_batch_buffer = 1,
+			.num_syncs = 1,
+			.syncs = to_user_pointer(&sync),
+			.exec_queue_id = exec_queue,
+			.address = start_addr,
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
+		xe_exec(fd, &exec);
+		xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, exec_queue, NSEC_PER_SEC);
+
+		munmap(bo_sync, bo_size);
+		gem_close(fd, bo);
 	} else {
 		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
 		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
-- 
2.43.0

