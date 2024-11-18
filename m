Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E12D591B3
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 20:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7746F10E33B;
	Mon, 18 Nov 2024 20:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiYRJi6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A1510E33B
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731963522; x=1763499522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LbKaEnx/CzWN1fCJsSUAjLdJziNo+pDvnUwGFJ/UOlI=;
 b=aiYRJi6WFQTH/2/MgnwNPVlXrATb6ii5BayuRCN4rNA/JljFfd8WkkKs
 fW6KiBF7XVGSqIMuO9hMLW21tNHgj8/LywdNprdmKuCcdXJ5ItIPhdNjD
 eDj9WgGcbxKODqu9tx3qN2wYRlcO3UKEmhE4YDPhNdiToYN6BkTWZb4U1
 +07TfWR4OfsTlDUf6rJ8K/yGrN/mAkLjmm3GLAYK+uJlMHcl723rZup/R
 O85sUXI6EQ15R2jJSLUgp/pxBq57H/YryzO38gNHDv4+NurFRZPQSFZcc
 7diFFaUowzXVm+Zzq80XGlG4wPhaX8OLJQT+cqZFnSCWSlKuIeyxX/hbR w==;
X-CSE-ConnectionGUID: 7/Sn+InmRNWiWtMyac1VcA==
X-CSE-MsgGUID: QPQB2ML6RpuXr5CSXNThSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31877928"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31877928"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 12:58:41 -0800
X-CSE-ConnectionGUID: O3Qe3pwOSsqS3GGDiO+TOw==
X-CSE-MsgGUID: HRh5n101QzWX/hmWKKqh3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="94277882"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 12:58:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] tests/xe: Add usermap test
Date: Mon, 18 Nov 2024 12:59:14 -0800
Message-Id: <20241118205914.2339782-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118205914.2339782-1-matthew.brost@intel.com>
References: <20241118205914.2339782-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add usermap test for experimental UMD direction submission in the KMD.
Being sent as public checkpoint. Do not review.

Basic submission, dynamic memory (userptr invalidation, eviction),
endless batches, and user sync to kernel syncs tested. Single batch,
many batch, and threaded sections exists.

Should be expanded to test cross process sync before upstreaming UMD
submission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_ioctl.c             |  29 ++
 lib/xe/xe_ioctl.h             |   3 +
 tests/intel/xe_exec_usermap.c | 800 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 4 files changed, 833 insertions(+)
 create mode 100644 tests/intel/xe_exec_usermap.c

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 6d83889188..e9ccf388a3 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -226,6 +226,23 @@ void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 	__xe_vm_bind_sync(fd, vm, bo, offset, addr, size, DRM_XE_VM_BIND_OP_MAP);
 }
 
+void xe_vm_bind_uc_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			uint64_t addr, uint64_t size)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, offset, addr, size,
+				   DRM_XE_VM_BIND_OP_MAP, 0, &sync, 1, 0,
+				   intel_get_pat_idx_uc(fd), 0), 0);
+
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync.handle);
+}
+
 void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
 		       uint64_t addr, uint64_t size)
 {
@@ -436,6 +453,18 @@ void *xe_bo_map(int fd, uint32_t bo, size_t size)
 	return __xe_bo_map(fd, bo, size, PROT_WRITE);
 }
 
+void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
+{
+	uint64_t mmo;
+	void *map;
+
+	mmo = xe_bo_mmap_offset(fd, bo);
+	map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
+	igt_assert(map != MAP_FAILED);
+
+	return map;
+}
+
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
 {
 	return __xe_bo_map(fd, bo, size, prot);
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 18cc2b72b2..7e332b00c4 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -56,6 +56,8 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
 			struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 		     uint64_t addr, uint64_t size);
+void xe_vm_bind_uc_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
+			uint64_t addr, uint64_t size);
 void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
 		       uint64_t addr, uint64_t size);
 void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
@@ -86,6 +88,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
 void *xe_bo_map(int fd, uint32_t bo, size_t size);
+void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
 int __xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec(int fd, struct drm_xe_exec *exec);
diff --git a/tests/intel/xe_exec_usermap.c b/tests/intel/xe_exec_usermap.c
new file mode 100644
index 0000000000..289489f763
--- /dev/null
+++ b/tests/intel/xe_exec_usermap.c
@@ -0,0 +1,800 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ *
+ * Authors:
+ *    Matthew Brost <matthew.brost@intel.com>
+ */
+
+/**
+ * TEST: Basic tests for exec usermap functionality
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: exec_queues
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+#include <string.h>
+
+#define odd(__i)	(__i & 1)
+
+#define MAX_USERMAP	256
+#define DB_RING_VALID	0xacedbeef
+#define BARRIER_VALUE	0xdeadbeef
+#define TAIL_REG	5
+
+#define TRIES_PER_SEC		1000
+#define TRY_SLEEP_ONE_MS	1000
+
+static void ring_doorbell(uint32_t *db)
+{
+	igt_assert(READ_ONCE(*db) == DB_RING_VALID);
+}
+
+#define HARDWARE_SEQNO_OFFSET		0x800
+#define WRITEBACK_SEQNO_OFFSET		0x840
+#define SPIN_OFFSET			0xc00
+
+struct usermap {
+	struct drm_xe_exec_queue_ext_usermap ext;
+	struct drm_xe_engine_class_instance *hwe;
+	uint32_t exec_queue_id;
+	uint32_t vm;
+	uint32_t syncobj;
+	uint32_t ring_bo;
+	void *ring;
+	void *indirect;
+	void *doorbell;
+	uint64_t seqno_size;
+	uint32_t seqno_handle;
+	void *seqno_map;
+	uint64_t bo_size;
+	uint32_t bo;
+	void *bo_map;
+	uint32_t *db;
+	uint32_t tail;
+	uint64_t spin_addr;
+	uint64_t hardware_seqno_addr;
+	uint64_t *hardware_seqno;
+	uint64_t *writeback_seqno;
+	uint32_t *barrier;
+	uint32_t *spin;
+	uint32_t *tail_ptr;
+	uint64_t seqno_value;
+	void *userptr;
+	int fd;
+};
+
+#define USERPTR_SIZE	(SZ_4K * 2)
+
+static void open_usermap(int fd, struct usermap *usermap,
+			 struct drm_xe_engine_class_instance *hwe, uint32_t vm,
+			 uint64_t bo_size)
+{
+	struct drm_xe_gem_mmap_offset mmo = {
+		.handle = 0, // must be set to 0
+		.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
+	};
+	u64 ext = to_user_pointer(&usermap->ext);
+	uint32_t bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+
+	usermap->ext.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_USERMAP,
+	usermap->ext.version = DRM_XE_EXEC_QUEUE_USERMAP_VERSION_XE2_REV0;
+
+	usermap->ring_bo = xe_bo_create(fd, vm, SZ_32K,
+					vram_if_possible(fd, hwe->gt_id),
+					bo_flags);
+	usermap->ring = aligned_alloc(SZ_32K, SZ_32K);
+	usermap->ring = xe_bo_map_fixed(fd, usermap->ring_bo, SZ_16K,
+					(uint64_t)usermap->ring);
+	xe_vm_bind_uc_sync(fd, vm, usermap->ring_bo, 0,
+			   (uint64_t)usermap->ring, SZ_32K);
+
+	usermap->ext.ring_addr = (uint64_t)usermap->ring;
+	usermap->ext.ring_size = SZ_16K;
+
+	usermap->syncobj = syncobj_create(fd, 0);
+	usermap->exec_queue_id = xe_exec_queue_create(fd, vm, hwe, ext);
+
+	usermap->indirect = mmap(NULL, SZ_4K, PROT_WRITE, MAP_SHARED,
+				 fd, usermap->ext.indirect_ring_state_offset);
+	igt_assert(usermap->indirect != MAP_FAILED);
+
+	usermap->doorbell = mmap(NULL, SZ_4K, PROT_WRITE, MAP_SHARED,
+				 fd, usermap->ext.doorbell_offset);
+	igt_assert(usermap->doorbell != MAP_FAILED);
+
+	usermap->db = usermap->doorbell + usermap->ext.doorbell_page_offset;
+	ring_doorbell(usermap->db);
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
+	usermap->barrier = mmap(NULL, SZ_4K, PROT_WRITE, MAP_SHARED, fd,
+				mmo.offset);
+	igt_assert(usermap->barrier != MAP_FAILED);
+
+	usermap->userptr = mmap(NULL, USERPTR_SIZE, PROT_READ |
+				PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(usermap->userptr != MAP_FAILED);
+	xe_vm_bind_userptr_async(fd, vm, 0, (uint64_t)usermap->userptr,
+				 (uint64_t)usermap->userptr, USERPTR_SIZE,
+				 NULL, 0);
+
+	usermap->seqno_size = SZ_4K;
+	usermap->seqno_map = usermap->indirect;
+	usermap->seqno_handle = usermap->ext.indirect_ring_state_handle;
+	xe_vm_bind_sync(fd, vm, usermap->seqno_handle, 0,
+			(uint64_t)usermap->seqno_map, usermap->seqno_size);
+
+	usermap->hwe = hwe;
+	usermap->vm = vm;
+	usermap->fd = fd;
+	usermap->hardware_seqno_addr = (u64)usermap->seqno_map +
+		HARDWARE_SEQNO_OFFSET;
+	usermap->hardware_seqno = usermap->seqno_map + HARDWARE_SEQNO_OFFSET;
+	usermap->writeback_seqno = usermap->seqno_map + WRITEBACK_SEQNO_OFFSET;
+	usermap->spin_addr = (u64)usermap->seqno_map + SPIN_OFFSET;
+	usermap->spin = usermap->seqno_map + SPIN_OFFSET;
+	usermap->tail_ptr = usermap->indirect + TAIL_REG * sizeof(uint32_t);
+
+	if (bo_size) {
+		usermap->bo_size = bo_size;
+		usermap->bo_map = aligned_alloc(SZ_2M, bo_size);
+		usermap->bo = xe_bo_create(fd, vm, bo_size,
+					   vram_if_possible(fd, hwe->gt_id),
+					   bo_flags);
+		usermap->bo_map = xe_bo_map_fixed(fd, usermap->bo, bo_size,
+						  (uint64_t)usermap->bo_map);
+		xe_vm_bind_sync(fd, vm, usermap->bo, 0,
+				(uint64_t)usermap->bo_map, bo_size);
+	}
+}
+
+static void close_usermap(struct usermap *usermap, bool hang)
+{
+	if (!hang) {
+		xe_vm_unbind_sync(usermap->fd, usermap->vm, 0,
+				  (uint64_t)usermap->userptr, USERPTR_SIZE);
+		xe_vm_unbind_sync(usermap->fd, usermap->vm, 0,
+				  (uint64_t)usermap->seqno_map,
+				  usermap->seqno_size);
+	}
+
+	if (usermap->bo) {
+		if (!hang)
+			xe_vm_unbind_sync(usermap->fd, usermap->vm, 0,
+					  (uint64_t)usermap->bo_map,
+					  usermap->bo_size);
+		munmap(usermap->bo_map, usermap->bo_size);
+		gem_close(usermap->fd, usermap->bo);
+	}
+
+	munmap(usermap->indirect, SZ_4K);
+	gem_close(usermap->fd, usermap->ext.indirect_ring_state_handle);
+
+	if (!hang)
+		xe_vm_unbind_sync(usermap->fd, usermap->vm, 0,
+				  (uint64_t)usermap->ring,
+				  SZ_32K);
+	munmap(usermap->ring, usermap->ext.ring_size);
+	gem_close(usermap->fd, usermap->ring_bo);
+
+	munmap(usermap->doorbell, SZ_4K);
+
+	munmap(usermap->barrier, SZ_4K);
+
+	munmap(usermap->userptr, USERPTR_SIZE);
+
+	syncobj_destroy(usermap->fd, usermap->syncobj);
+	xe_exec_queue_destroy(usermap->fd, usermap->exec_queue_id);
+}
+
+static void write_dw_instr_usermap(struct usermap *usermap, uint32_t instr)
+{
+	uint32_t *p_instr = usermap->ring + usermap->tail;
+
+	*p_instr = instr;
+	usermap->tail = (usermap->tail + sizeof(uint32_t)) %
+		usermap->ext.ring_size;
+}
+
+#define MS_TO_NS(v)	(v * 1000000)
+#define MI_BATCH_BUFFER_START_PPGTT	(0x31 << 23 | 0x1 << 8 | 1)
+
+static void emit_spin_userptr_bo_usermap(struct usermap *usermap,
+					 uint64_t offset, bool long_spin,
+					 bool use_bo)
+{
+	uint64_t addr = (use_bo ? (uint64_t)usermap->bo_map :
+		(uint64_t)usermap->userptr) + offset;
+	struct xe_spin_opts opts = {
+		.addr = addr,
+		.ctx_ticks = duration_to_ctx_ticks(usermap->fd,
+						   usermap->hwe->gt_id,
+						   long_spin ?
+						   MS_TO_NS(500) :
+						   MS_TO_NS(2)),
+		.preempt = long_spin,
+	};
+	struct xe_spin *spin = (struct xe_spin *)addr;
+
+	xe_spin_init(spin, &opts);
+
+	write_dw_instr_usermap(usermap, MI_BATCH_BUFFER_START_PPGTT);
+	write_dw_instr_usermap(usermap, addr);
+	write_dw_instr_usermap(usermap, addr >> 32);
+	write_dw_instr_usermap(usermap, MI_NOOP);
+}
+
+#define SPIN_VALUE	0xdeadbeaf
+
+static void emit_spin_usermap(struct usermap *usermap)
+{
+	write_dw_instr_usermap(usermap, MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL |
+			       MI_SEMAPHORE_SAD_EQ_SDD);
+	write_dw_instr_usermap(usermap, SPIN_VALUE);
+	write_dw_instr_usermap(usermap, usermap->spin_addr);
+	write_dw_instr_usermap(usermap, usermap->spin_addr >> 32);
+}
+
+static void release_spin_usermap(struct usermap *usermap)
+{
+	uint32_t spin_value = SPIN_VALUE;
+
+	__atomic_store(usermap->spin, &spin_value, __ATOMIC_SEQ_CST);
+}
+
+#define MI_FLUSH_QW	(0x26 << 23 | 0x1 << 14 | 3)
+
+static void emit_hardware_seqno_usermap(struct usermap *usermap)
+{
+	if (usermap->hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+	    usermap->hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+		write_dw_instr_usermap(usermap, GFX_OP_PIPE_CONTROL(6));
+		write_dw_instr_usermap(usermap, PIPE_CONTROL_CS_STALL |
+				       PIPE_CONTROL_QW_WRITE |
+				       PIPE_CONTROL_FLUSH_ENABLE);
+		write_dw_instr_usermap(usermap, usermap->hardware_seqno_addr);
+		write_dw_instr_usermap(usermap, usermap->hardware_seqno_addr >> 32);
+		write_dw_instr_usermap(usermap, usermap->seqno_value);
+		write_dw_instr_usermap(usermap, usermap->seqno_value >> 32);
+	} else {
+		write_dw_instr_usermap(usermap, MI_FLUSH_QW);
+		write_dw_instr_usermap(usermap, usermap->hardware_seqno_addr);
+		write_dw_instr_usermap(usermap, usermap->hardware_seqno_addr >> 32);
+		write_dw_instr_usermap(usermap, usermap->seqno_value);
+		write_dw_instr_usermap(usermap, usermap->seqno_value >> 32);
+		write_dw_instr_usermap(usermap, MI_NOOP);
+	}
+
+	write_dw_instr_usermap(usermap, MI_USER_INTERRUPT);
+	write_dw_instr_usermap(usermap, MI_ARB_ON_OFF | MI_ARB_ENABLE);
+	write_dw_instr_usermap(usermap, MI_ARB_CHECK);
+	write_dw_instr_usermap(usermap, MI_NOOP);
+}
+
+static void barrier_usermap(struct usermap *usermap)
+{
+	igt_assert(READ_ONCE(*usermap->barrier) == BARRIER_VALUE);
+}
+
+static uint64_t read_hardware_seqno_usermap(struct usermap *usermap)
+{
+	return READ_ONCE(*usermap->hardware_seqno);
+}
+
+static uint64_t read_writeback_seqno_usermap(struct usermap *usermap)
+{
+	return READ_ONCE(*usermap->writeback_seqno);
+}
+
+static uint32_t read_tail_seqno_usermap(struct usermap *usermap)
+{
+	return READ_ONCE(*usermap->tail_ptr);
+}
+
+static int
+__xe_vm_convert_fence(int fd, struct drm_xe_vm_convert_fence *convert_fence)
+{
+	int err = 0;
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_CONVERT_FENCE, convert_fence)) {
+		err = -errno;
+		igt_assume(err != 0);
+	}
+	errno = 0;
+	return err;
+}
+
+static void
+xe_vm_convert_fence(int fd, struct drm_xe_vm_convert_fence *convert_fence)
+{
+	igt_assert_eq(__xe_vm_convert_fence(fd, convert_fence), 0);
+}
+
+#define MAX_INFLIGHT_JOB	128
+
+static void submit_usermap(struct usermap *usermap, bool use_syncobj)
+{
+	usermap->seqno_value++;
+
+	/* TODO: Ring flow control */
+
+	emit_hardware_seqno_usermap(usermap);
+	barrier_usermap(usermap);
+
+	igt_assert(!(usermap->tail % 8));
+	WRITE_ONCE(*usermap->tail_ptr, usermap->tail);
+	ring_doorbell(usermap->db);
+
+	if (use_syncobj) {
+		struct drm_xe_semaphore semaphore = {
+			.handle = usermap->seqno_handle,
+			.offset = HARDWARE_SEQNO_OFFSET,
+			.seqno = usermap->seqno_value,
+		};
+		struct drm_xe_sync sync = {
+			.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.handle = usermap->syncobj,
+			.timeline_value = usermap->seqno_value,
+		};
+		struct drm_xe_vm_convert_fence convert_fence = {
+			.vm_id = usermap->vm,
+			.num_syncs = 1,
+			.syncs = to_user_pointer(&sync),
+			.semaphores = to_user_pointer(&semaphore),
+		};
+
+		xe_vm_convert_fence(usermap->fd, &convert_fence);
+	}
+}
+
+static void wait_tail_usermap(struct usermap *usermap, int tries)
+{
+	while (tries-- && read_tail_seqno_usermap(usermap) != usermap->tail)
+		usleep(TRY_SLEEP_ONE_MS);
+
+	igt_assert(read_tail_seqno_usermap(usermap) == usermap->tail);
+}
+
+static void wait_hardware_seqno_usermap(struct usermap *usermap, int tries)
+{
+	while (tries-- && read_hardware_seqno_usermap(usermap) !=
+	       usermap->seqno_value)
+		usleep(TRY_SLEEP_ONE_MS);
+
+	igt_assert(read_hardware_seqno_usermap(usermap) ==
+		   usermap->seqno_value);
+
+	wait_tail_usermap(usermap, tries);
+}
+
+static void wait_writeback_seqno_usermap(struct usermap *usermap, int tries)
+{
+	while (tries-- && read_writeback_seqno_usermap(usermap) !=
+	       usermap->seqno_value)
+		usleep(TRY_SLEEP_ONE_MS);
+
+	igt_assert(read_writeback_seqno_usermap(usermap) ==
+		   usermap->seqno_value);
+}
+
+static void writeback_syncobj_usermap(struct usermap *usermap)
+{
+	struct drm_xe_semaphore semaphore = {
+		.handle = usermap->seqno_handle,
+		.offset = WRITEBACK_SEQNO_OFFSET,
+		.seqno = usermap->seqno_value,
+	};
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.handle = usermap->syncobj,
+		.timeline_value = usermap->seqno_value,
+	};
+	struct drm_xe_vm_convert_fence convert_fence = {
+		.vm_id = usermap->vm,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+		.semaphores = to_user_pointer(&semaphore),
+	};
+
+	xe_vm_convert_fence(usermap->fd, &convert_fence);
+	wait_writeback_seqno_usermap(usermap, TRIES_PER_SEC * 5);
+}
+
+static void wait_syncobj_usermap(struct usermap *usermap, bool all_points)
+{
+	uint64_t point = all_points ? 1 : usermap->seqno_value;
+
+	for (; point <= usermap->seqno_value; ++point)
+		igt_assert(syncobj_timeline_wait(usermap->fd,
+						 &usermap->syncobj,
+						 &point, 1, INT64_MAX, 0,
+						 NULL));
+}
+
+static void assert_unsignaled_syncobj_usermap(struct usermap *usermap)
+{
+	uint64_t point = usermap->seqno_value;
+
+	igt_assert(syncobj_timeline_wait_err(usermap->fd,
+					     &usermap->syncobj,
+					     &point, 1, MS_TO_NS(1), 0) == -ETIME);
+}
+
+static void assert_seqno_neq_usermap(struct usermap *usermap)
+{
+	igt_assert(read_hardware_seqno_usermap(usermap) !=
+		   usermap->seqno_value);
+}
+
+static void invalidate_userptr_usermap(struct usermap *usermap)
+{
+	usermap->userptr = mmap(usermap->userptr, USERPTR_SIZE, PROT_READ |
+				PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS |
+				MAP_FIXED, -1, 0);
+	igt_assert(usermap->userptr != MAP_FAILED);
+}
+
+/**
+ * SUBTEST: spin-twice
+ * Description: Submit twice, insert spin in first batch
+ * Test category: functionality test
+ *
+ * SUBTEST: spin-hang
+ * Description: Hang on spinning batch
+ * Test category: functionality test
+ *
+ * SUBTEST: invalidate-long-spin
+ * Description: Invalidate long spinning preemptable batch
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: submit-%s-once
+ * Description: Run %arg[1] test only once
+ * Test category: functionality test
+ *
+ * SUBTEST: submit-%s-twice
+ * Description: Run %arg[1] test twice
+ * Test category: functionality test
+ *
+ * SUBTEST: submit-%s-many
+ * Description: Run %arg[1] test many times
+ * Test category: stress test
+ *
+ * SUBTEST: submit-%s-execqueue-many
+ * Description: Run %arg[1] test many times to many execqueues
+ * Test category: stress test
+ *
+ * SUBTEST: threads-%s-many
+ * Description: Run %arg[1] test many times with thread per harware engine
+ * Test category: stress test
+ *
+ * SUBTEST: threads-%s-execqueue-many
+ * Description: Run %arg[1] test many times to many execqueues with thread per harware engine
+ * Test category: stress test
+ *
+ * SUBTEST: threads-shared-vm-%s-many
+ * Description: Run %arg[1] test many times with thread per harware engine and a shared vm
+ * Test category: stress test
+ *
+ * SUBTEST: threads-shared-vm-%s-execqueue-many
+ * Description: Run %arg[1] test many times to many execqueues with thread perharware engine and a shared vm
+ * Test category: stress test
+ *
+ * arg[1]:
+ *
+ * @basic:				basic submit
+ * @syncobj:				submit with syncobj
+ * @no-wait:				submit no waiting until end
+ * @spin-userptr-invalidate:		timed spinning batch on userptr which is invalidated
+ */
+
+/**
+ * SUBTEST: threads-evict-execqueue-many
+ * Description: threads with BO allocations that evict
+ * Test category: stress test
+ *
+ * SUBTEST: threads-evict-spin-execqueue-many
+ * Description: threads with BO allocations that evict and a spinner on the BO
+ * Test category: stress test
+ */
+
+#define SIMPLE_SUBMIT_FLAG_SPIN				(0x1 << 0)
+#define SIMPLE_SUBMIT_FLAG_NO_WAIT			(0x1 << 1)
+#define SIMPLE_SUBMIT_FLAG_INVALIDATE			(0x1 << 2)
+#define SIMPLE_SUBMIT_FLAG_SHARED_VM			(0x1 << 3)
+#define SIMPLE_SUBMIT_FLAG_SPIN_USERPTR_BO		(0x1 << 4)
+#define SIMPLE_SUBMIT_FLAG_LONG_SPIN_USERPTR_BO		(0x1 << 5)
+#define SIMPLE_SUBMIT_FLAG_EVICT			(0x1 << 6)
+#define SIMPLE_SUBMIT_FLAG_SYNCOBJ			(0x1 << 7)
+#define SIMPLE_SUBMIT_FLAG_SPIN_HANG			(0x1 << 8)
+
+static void simple_submit(int fd, struct drm_xe_engine_class_instance *hwe,
+			  uint32_t vm, uint64_t vram_size, int n_exec_queue,
+			  int n_exec, unsigned int flags,
+			  pthread_barrier_t *barrier)
+{
+	struct usermap *__usermaps;
+	uint64_t bo_size = !vram_size ? 0 :
+		ALIGN(vram_size / n_exec_queue, SZ_2M);
+	void *ptr;
+	int i;
+	bool has_vm = !!vm;
+	bool use_syncobj = flags & SIMPLE_SUBMIT_FLAG_SYNCOBJ;
+
+	__usermaps = malloc(sizeof(*__usermaps) * n_exec_queue);
+	igt_assert(__usermaps);
+	memset(__usermaps, 0, sizeof(*__usermaps) * n_exec_queue);
+
+	if (!has_vm)
+		vm = xe_vm_create(fd, 0, 0);
+
+	for (i = 0; i < n_exec_queue; ++i)
+		open_usermap(fd, __usermaps + i, hwe, vm, bo_size);
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+
+	for (i = 0; i < n_exec; ++i) {
+		struct usermap *usermap = __usermaps + (i % n_exec_queue);
+		bool ls = flags & SIMPLE_SUBMIT_FLAG_LONG_SPIN_USERPTR_BO;
+		bool evict = flags & SIMPLE_SUBMIT_FLAG_EVICT;
+		uint64_t offset = evict ? i * SZ_2K : odd(i) * SZ_2K;
+
+		if (flags & SIMPLE_SUBMIT_FLAG_SPIN)
+			emit_spin_usermap(usermap);
+
+		if (flags & SIMPLE_SUBMIT_FLAG_SPIN_USERPTR_BO)
+			emit_spin_userptr_bo_usermap(usermap, offset,
+						     ls, evict);
+
+		submit_usermap(usermap, use_syncobj);
+
+		if (flags & SIMPLE_SUBMIT_FLAG_SPIN) {
+			assert_seqno_neq_usermap(usermap);
+			if (use_syncobj)
+				assert_unsignaled_syncobj_usermap(usermap);
+
+			if (flags & SIMPLE_SUBMIT_FLAG_SPIN_HANG) {
+				wait_syncobj_usermap(usermap, false);
+				assert_seqno_neq_usermap(usermap);
+				break;
+			}
+
+			release_spin_usermap(usermap);
+		}
+
+		if (!(flags & SIMPLE_SUBMIT_FLAG_NO_WAIT)) {
+			wait_hardware_seqno_usermap(usermap, TRIES_PER_SEC);
+			if (use_syncobj)
+				wait_syncobj_usermap(usermap, false);
+		}
+
+		if (flags & SIMPLE_SUBMIT_FLAG_INVALIDATE && odd(i))
+			invalidate_userptr_usermap(usermap);
+		else if (flags & SIMPLE_SUBMIT_FLAG_SPIN_USERPTR_BO &&
+			 flags & SIMPLE_SUBMIT_FLAG_INVALIDATE && !odd(i))
+			wait_hardware_seqno_usermap(usermap, TRIES_PER_SEC);
+	}
+
+	for (i = 0; i < n_exec_queue; ++i) {
+		if (use_syncobj && !(flags & SIMPLE_SUBMIT_FLAG_SPIN_HANG))
+			writeback_syncobj_usermap(__usermaps + i);
+
+		if (flags & SIMPLE_SUBMIT_FLAG_NO_WAIT) {
+			wait_hardware_seqno_usermap(__usermaps + i,
+						    TRIES_PER_SEC);
+			if (use_syncobj)
+				wait_syncobj_usermap(__usermaps + i, true);
+		}
+	}
+
+	for (i = 0; i < n_exec_queue; ++i)
+		close_usermap(__usermaps + i,
+			      flags & SIMPLE_SUBMIT_FLAG_SPIN_HANG);
+
+	if (!has_vm)
+		xe_vm_destroy(fd, vm);
+
+	free(__usermaps);
+	free(ptr);
+}
+
+struct thread_data {
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	pthread_barrier_t *barrier;
+	uint32_t vm;
+	uint64_t vram_size;
+	int fd;
+	struct drm_xe_engine_class_instance *hwe;
+	int n_exec_queues;
+	int n_execs;
+	unsigned int flags;
+	bool *go;
+};
+
+static void *thread(void *data)
+{
+	struct thread_data *t = data;
+
+	pthread_mutex_lock(t->mutex);
+	while (!*t->go)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	simple_submit(t->fd, t->hwe, t->vm, t->vram_size, t->n_exec_queues,
+		      t->n_execs, t->flags, t->barrier);
+
+	return NULL;
+}
+
+#define oversubscribe(vram_size, n_engines) \
+	ALIGN(((8 * vram_size) / 7) / n_engines, SZ_2M)
+
+static void
+threads(int fd, int n_exec_queues, int n_execs, unsigned int flags)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct thread_data *threads_data;
+	int n_engines = 0, i = 0;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	pthread_barrier_t barrier;
+	uint32_t vm = 0;
+	uint64_t vram_size = 0;
+	bool go = false;
+
+	if (flags & SIMPLE_SUBMIT_FLAG_SHARED_VM)
+		vm = xe_vm_create(fd, 0, 0);
+
+	xe_for_each_engine(fd, hwe)
+		++n_engines;
+
+	if (flags & SIMPLE_SUBMIT_FLAG_EVICT)
+		vram_size = oversubscribe(xe_visible_vram_size(fd, 0),
+					  n_engines);
+
+	threads_data = calloc(n_engines, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+	pthread_barrier_init(&barrier, 0, n_engines);
+
+	xe_for_each_engine(fd, hwe) {
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		threads_data[i].barrier = &barrier;
+		threads_data[i].vm = vm;
+		threads_data[i].vram_size = vram_size;
+		threads_data[i].fd = fd;
+		threads_data[i].hwe= hwe;
+		threads_data[i].n_exec_queues = n_exec_queues;
+		threads_data[i].n_execs = n_execs;
+		threads_data[i].flags = flags;
+		threads_data[i].go = &go;
+		pthread_create(&threads_data[i].thread, 0, thread,
+			       &threads_data[i]);
+		++i;
+	}
+
+	pthread_mutex_lock(&mutex);
+	go = true;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (i = 0; i < n_engines; ++i)
+		pthread_join(threads_data[i].thread, NULL);
+
+	if (flags & SIMPLE_SUBMIT_FLAG_SHARED_VM)
+		xe_vm_destroy(fd, vm);
+	free(threads_data);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "basic", 0 },
+		{ "syncobj", SIMPLE_SUBMIT_FLAG_SYNCOBJ },
+		{ "no-wait", SIMPLE_SUBMIT_FLAG_NO_WAIT },
+		{ "spin-userptr-invalidate", SIMPLE_SUBMIT_FLAG_INVALIDATE |
+			SIMPLE_SUBMIT_FLAG_SPIN_USERPTR_BO |
+			SIMPLE_SUBMIT_FLAG_NO_WAIT |
+			SIMPLE_SUBMIT_FLAG_SYNCOBJ },
+		{ NULL },
+	};
+	int fd;
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_XE);
+
+	igt_subtest("spin-twice")
+		xe_for_each_engine(fd, hwe)
+			simple_submit(fd, hwe, 0, 0, 2, 2,
+				      SIMPLE_SUBMIT_FLAG_SPIN,
+				      NULL);
+
+	igt_subtest("spin-hang")
+		xe_for_each_engine(fd, hwe)
+			simple_submit(fd, hwe, 0, 0, 1, 1,
+				      SIMPLE_SUBMIT_FLAG_SPIN |
+				      SIMPLE_SUBMIT_FLAG_SPIN_HANG |
+				      SIMPLE_SUBMIT_FLAG_SYNCOBJ,
+				      NULL);
+
+	igt_subtest("invalidate-long-spin")
+		xe_for_each_engine(fd, hwe)
+			simple_submit(fd, hwe, 0, 0, 1, 2,
+				      SIMPLE_SUBMIT_FLAG_NO_WAIT |
+				      SIMPLE_SUBMIT_FLAG_SYNCOBJ |
+				      SIMPLE_SUBMIT_FLAG_INVALIDATE |
+				      SIMPLE_SUBMIT_FLAG_SPIN_USERPTR_BO |
+				      SIMPLE_SUBMIT_FLAG_LONG_SPIN_USERPTR_BO,
+				      NULL);
+
+	for (const struct section *s = sections; s->name; s++) {
+		igt_subtest_f("submit-%s-once", s->name)
+			xe_for_each_engine(fd, hwe)
+				simple_submit(fd, hwe, 0, 0, 1, 1, s->flags,
+					      NULL);
+
+		igt_subtest_f("submit-%s-twice", s->name)
+			xe_for_each_engine(fd, hwe)
+				simple_submit(fd, hwe, 0, 0, 1, 2, s->flags,
+					      NULL);
+
+		igt_subtest_f("submit-%s-many", s->name)
+			xe_for_each_engine(fd, hwe)
+				simple_submit(fd, hwe, 0, 0, 1, 512, s->flags,
+					      NULL);
+
+		igt_subtest_f("submit-%s-execqueue-many", s->name)
+			xe_for_each_engine(fd, hwe)
+				simple_submit(fd, hwe, 0, 0, 32, 512, s->flags,
+					      NULL);
+
+		igt_subtest_f("threads-%s-many", s->name)
+			threads(fd, 2, 512, s->flags);
+
+		igt_subtest_f("threads-%s-execqueue-many", s->name)
+			threads(fd, 32, 512, s->flags);
+
+		igt_subtest_f("threads-shared-vm-%s-many", s->name)
+			threads(fd, 2, 512, s->flags |
+				SIMPLE_SUBMIT_FLAG_SHARED_VM);
+
+		igt_subtest_f("threads-shared-vm-%s-execqueue-many", s->name)
+			threads(fd, 32, 512, s->flags |
+				SIMPLE_SUBMIT_FLAG_SHARED_VM);
+	}
+
+	igt_subtest("threads-evict-execqueue-many")
+		threads(fd, 16, 64, SIMPLE_SUBMIT_FLAG_SYNCOBJ |
+			SIMPLE_SUBMIT_FLAG_NO_WAIT |
+			SIMPLE_SUBMIT_FLAG_EVICT);
+
+	igt_subtest("threads-evict-spin-execqueue-many")
+		threads(fd, 16, 64, SIMPLE_SUBMIT_FLAG_SYNCOBJ |
+			SIMPLE_SUBMIT_FLAG_NO_WAIT |
+			SIMPLE_SUBMIT_FLAG_SPIN_USERPTR_BO |
+			SIMPLE_SUBMIT_FLAG_EVICT);
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a6..376323338f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -293,6 +293,7 @@ intel_xe_progs = [
 	'xe_exec_sip',
 	'xe_exec_store',
 	'xe_exec_threads',
+	'xe_exec_usermap',
 	'xe_exercise_blt',
 	'xe_fault_injection',
 	'xe_gpgpu_fill',
-- 
2.34.1

