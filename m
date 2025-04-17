Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00931C369C9
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 19:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2B510E3AF;
	Thu, 17 Apr 2025 19:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJghayVO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883E010E3AF
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 19:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744918264; x=1776454264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PIe7XXa4p9tjQYDuYeqj/Ig6Kw9BjXq+SDiFBZfDBEw=;
 b=LJghayVOEOnTeiXHCqs0ljPcVjMKssPnBlXic+Spa++jGqZQdG4+N6I3
 Kia+GX/0jCDOAwtdBl1Sn7AZ6/c4BgApolSob9M3SzdXjoK2M6Fnnq45H
 czwUuOhxrRHwcq0sI8VCF/l4/7q6hWwC+j8Qs68DYCbSI1J3IlQo0YPLZ
 jw3REOaJ9x0OsbKTzJAZHQIhPG2GyvjImS8157B4fFenG1e3dMPTKEt7Q
 GQQHyyKGxNioGzU2kk6n6W8ni1LBOAxPmbge+ecihHvYxQPvG4XdTk9yv
 yrfvhrojbdYOt0Drke0Qmqq3kHYaOAv6m2tOogVLuKkkzzo6ExQp/Ggjh w==;
X-CSE-ConnectionGUID: 4d8ry+KWQHiM3fF0CF2Ndw==
X-CSE-MsgGUID: yUXXXCDDSquqoiQI947VYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46416419"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46416419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:31:04 -0700
X-CSE-ConnectionGUID: uyUa1UQXR/6aKYhXFlB9Yg==
X-CSE-MsgGUID: zRnxVIg+Te+XUlv3gw4u8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="130918773"
Received: from tuomaspe-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.246.2.135])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:31:03 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH RFC i-g-t] lib/xe/xe_legacy: Move test_legacy_mode to lib/
Date: Thu, 17 Apr 2025 21:30:31 +0200
Message-ID: <20250417193032.329-1-peter.senna@linux.intel.com>
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

DO NOT MERGE.

There were two similar implementations of test_legacy_mode(), located in
tests/intel/xe_exec_capture and tests/intel/xe_exec_reset.  This patch
consolidates them by moving the more complete version from xe_exec_reset
to lib/xe/xe_legacy, and updates call sites on both tests to use the
shared function.

The version from xe_exec_reset.c was chosen because it is more
feature-complete and flexible, offering the following advantages:
 - Supports CLOSE_FD
 - Supports GT reset
 - Waits for spinner start
 - Checks batch buffer result
 - Conditional bind call using xe_vm_bind_async() instead of
   __xe_vm_bind_assert()
 - Allows early return

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/meson.build               |   1 +
 lib/xe/xe_legacy.c            | 162 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_legacy.h            |  14 +++
 tests/intel/xe_exec_capture.c | 107 +---------------------
 tests/intel/xe_exec_reset.c   | 152 +++----------------------------
 5 files changed, 192 insertions(+), 244 deletions(-)
 create mode 100644 lib/xe/xe_legacy.c
 create mode 100644 lib/xe/xe_legacy.h

diff --git a/lib/meson.build b/lib/meson.build
index 8517cd540..454dcd244 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -114,6 +114,7 @@ lib_sources = [
 	'igt_hook.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
+	'xe/xe_legacy.c',
 	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
new file mode 100644
index 000000000..2d400aeea
--- /dev/null
+++ b/lib/xe/xe_legacy.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "lib/igt_syncobj.h"
+#include "linux_scaffold.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_legacy.h"
+#include "xe/xe_spin.h"
+
+#define CAT_ERROR			(0x1 << 5)
+#define CLOSE_EXEC_QUEUES		(0x1 << 2)
+#define CLOSE_FD			(0x1 << 1)
+/* Batch buffer element count, in number of dwords(u32) */
+#define GT_RESET			(0x1 << 0)
+#define MAX_N_EXECQUEUES		16
+
+/**
+ * xe_legacy_test_mode:
+ * @fd: file descriptor for the device
+ * @eci: engine class instance
+ * @n_exec_queues: number of exec queues
+ * @n_execs: number of execs
+ * @flags: flags for the test
+ * @addr: address for the test
+ *
+ * This function tests the legacy mode of the Xe driver by creating
+ * exec queues and executing a series of commands on them. It also
+ * binds and unbinds memory to/from the exec queues.
+ *
+ * Returns: void
+ */
+void
+xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
+		    int n_exec_queues, int n_execs, unsigned int flags,
+		    uint64_t addr)
+{
+	uint32_t vm;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queues[MAX_N_EXECQUEUES];
+	uint32_t syncobjs[MAX_N_EXECQUEUES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
+	int i, b;
+
+	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
+
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = xe_bb_size(fd, bo_size);
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t base_addr = flags & CAT_ERROR && !i ?
+			addr + bo_size * 128 : addr;
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = base_addr + batch_offset;
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = base_addr + sdi_offset;
+		uint64_t exec_addr;
+		int e = i % n_exec_queues;
+
+		if (!i) {
+			spin_opts.addr = base_addr + spin_offset;
+			xe_spin_init(&data[i].spin, &spin_opts);
+			exec_addr = spin_opts.addr;
+		} else {
+			b = 0;
+			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			data[i].batch[b++] = sdi_addr;
+			data[i].batch[b++] = sdi_addr >> 32;
+			data[i].batch[b++] = 0xc0ffee;
+			data[i].batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			exec_addr = batch_addr;
+		}
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = exec_addr;
+		if (e != i)
+			syncobj_reset(fd, &syncobjs[e], 1);
+		xe_exec(fd, &exec);
+
+		if (!i && !(flags & CAT_ERROR))
+			xe_spin_wait_started(&data[i].spin);
+	}
+
+	if (flags & GT_RESET)
+		xe_force_gt_reset_async(fd, eci->gt_id);
+
+	if (flags & CLOSE_FD) {
+		if (flags & CLOSE_EXEC_QUEUES) {
+			for (i = 0; i < n_exec_queues; i++)
+				xe_exec_queue_destroy(fd, exec_queues[i]);
+		}
+		drm_close_driver(fd);
+		/* FIXME: wait for idle */
+		usleep(150000);
+		return;
+	}
+
+	for (i = 0; i < n_exec_queues && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	if (!(flags & GT_RESET)) {
+		for (i = 1; i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
+	}
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_exec_queues; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
diff --git a/lib/xe/xe_legacy.h b/lib/xe/xe_legacy.h
new file mode 100644
index 000000000..f5dc99886
--- /dev/null
+++ b/lib/xe/xe_legacy.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef XE_LEGACY_H
+#define XE_LEGACY_H
+
+#include "linux_scaffold.h"
+
+void xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
+			 int n_exec_queues, int n_execs, unsigned int flags,
+			 uint64_t addr);
+
+#endif /* XE_LEGACY_H */
diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index fe1ae677e..7b36e66c0 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -27,6 +27,7 @@
 #include "linux_scaffold.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_legacy.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
 
@@ -135,110 +136,6 @@ static const char *xe_engine_class_name(u32 engine_class)
 	}
 }
 
-static void
-test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_queues, int n_execs,
-		 unsigned int flags, u64 addr)
-{
-	u32 vm;
-	struct drm_xe_sync sync[2] = {
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
-	};
-	struct drm_xe_exec exec = {
-		.num_batch_buffer = 1,
-		.num_syncs = 2,
-		.syncs = to_user_pointer(sync),
-	};
-	u32 exec_queues[MAX_N_EXECQUEUES];
-	u32 syncobjs[MAX_N_EXECQUEUES];
-	size_t bo_size;
-	u32 bo = 0;
-	struct {
-		struct xe_spin spin;
-		u32 batch[BATCH_DW_COUNT];
-		u64 pad;
-		u32 data;
-	} *data;
-	struct xe_spin_opts spin_opts = { .preempt = false };
-	int i, b;
-
-	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
-
-	vm = xe_vm_create(fd, 0, 0);
-	bo_size = sizeof(*data) * n_execs;
-	bo_size = xe_bb_size(fd, bo_size);
-
-	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	data = xe_bo_map(fd, bo, bo_size);
-
-	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-		syncobjs[i] = syncobj_create(fd, 0);
-	};
-
-	sync[0].handle = syncobj_create(fd, 0);
-	__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
-			    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
-
-	for (i = 0; i < n_execs; i++) {
-		u64 base_addr = addr;
-		u64 batch_offset = (char *)&data[i].batch - (char *)data;
-		u64 batch_addr = base_addr + batch_offset;
-		u64 spin_offset = (char *)&data[i].spin - (char *)data;
-		u64 sdi_offset = (char *)&data[i].data - (char *)data;
-		u64 sdi_addr = base_addr + sdi_offset;
-		u64 exec_addr;
-		int e = i % n_exec_queues;
-
-		if (!i) {
-			spin_opts.addr = base_addr + spin_offset;
-			xe_spin_init(&data[i].spin, &spin_opts);
-			exec_addr = spin_opts.addr;
-		} else {
-			b = 0;
-			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-			data[i].batch[b++] = sdi_addr;
-			data[i].batch[b++] = sdi_addr >> 32;
-			data[i].batch[b++] = 0xc0ffee;
-			data[i].batch[b++] = MI_BATCH_BUFFER_END;
-			igt_assert(b <= ARRAY_SIZE(data[i].batch));
-
-			exec_addr = batch_addr;
-		}
-
-		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].handle = syncobjs[e];
-
-		exec.exec_queue_id = exec_queues[e];
-		exec.address = exec_addr;
-		if (e != i)
-			syncobj_reset(fd, &syncobjs[e], 1);
-		xe_exec(fd, &exec);
-	}
-
-	for (i = 0; i < n_exec_queues && n_execs; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
-					NULL));
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	syncobj_destroy(fd, sync[0].handle);
-	for (i = 0; i < n_exec_queues; i++) {
-		syncobj_destroy(fd, syncobjs[i]);
-		xe_exec_queue_destroy(fd, exec_queues[i]);
-	}
-
-	munmap(data, bo_size);
-	gem_close(fd, bo);
-	xe_vm_destroy(fd, vm);
-}
-
 static char **alloc_lines_buffer(void)
 {
 	int i;
@@ -460,7 +357,7 @@ static void test_card(int fd)
 		igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
 			  hwe->engine_instance);
 
-		test_legacy_mode(fd, hwe, 1, 1, DRM_XE_VM_BIND_FLAG_DUMPABLE, addr);
+		xe_legacy_test_mode(fd, hwe, 1, 1, DRM_XE_VM_BIND_FLAG_DUMPABLE, addr);
 		/* Wait 1 sec for devcoredump complete */
 		sleep(1);
 
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index e2557f345..56eb56a29 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -20,12 +20,14 @@
 #include "xe_drm.h"
 
 #include "xe/xe_ioctl.h"
+#include "xe/xe_legacy.h"
 #include "xe/xe_query.h"
 #include "xe/xe_gt.h"
 #include "xe/xe_spin.h"
 #include <string.h>
 
 #define SYNC_OBJ_SIGNALED	(0x1 << 0)
+#define XE_LEGACY_ADDR		0x1a0000
 
 /**
  * SUBTEST: spin
@@ -304,139 +306,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  *
  * SUBTEST: close-execqueues-close-fd
  * Description: Test close exec_queues close fd
- */
-
-static void
-test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
-		 int n_exec_queues, int n_execs, unsigned int flags)
-{
-	uint32_t vm;
-	uint64_t addr = 0x1a0000;
-	struct drm_xe_sync sync[2] = {
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
-	};
-	struct drm_xe_exec exec = {
-		.num_batch_buffer = 1,
-		.num_syncs = 2,
-		.syncs = to_user_pointer(sync),
-	};
-	uint32_t exec_queues[MAX_N_EXECQUEUES];
-	uint32_t syncobjs[MAX_N_EXECQUEUES];
-	size_t bo_size;
-	uint32_t bo = 0;
-	struct {
-		struct xe_spin spin;
-		uint32_t batch[16];
-		uint64_t pad;
-		uint32_t data;
-	} *data;
-	struct xe_spin_opts spin_opts = { .preempt = false };
-	int i, b;
-
-	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
-
-	if (flags & CLOSE_FD)
-		fd = drm_open_driver(DRIVER_XE);
-
-	vm = xe_vm_create(fd, 0, 0);
-	bo_size = sizeof(*data) * n_execs;
-	bo_size = xe_bb_size(fd, bo_size);
-
-	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	data = xe_bo_map(fd, bo, bo_size);
-
-	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-		syncobjs[i] = syncobj_create(fd, 0);
-	};
-
-	sync[0].handle = syncobj_create(fd, 0);
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
-
-	for (i = 0; i < n_execs; i++) {
-		uint64_t base_addr = flags & CAT_ERROR && !i ?
-			addr + bo_size * 128 : addr;
-		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
-		uint64_t batch_addr = base_addr + batch_offset;
-		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = base_addr + sdi_offset;
-		uint64_t exec_addr;
-		int e = i % n_exec_queues;
-
-		if (!i) {
-			spin_opts.addr = base_addr + spin_offset;
-			xe_spin_init(&data[i].spin, &spin_opts);
-			exec_addr = spin_opts.addr;
-		} else {
-			b = 0;
-			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-			data[i].batch[b++] = sdi_addr;
-			data[i].batch[b++] = sdi_addr >> 32;
-			data[i].batch[b++] = 0xc0ffee;
-			data[i].batch[b++] = MI_BATCH_BUFFER_END;
-			igt_assert(b <= ARRAY_SIZE(data[i].batch));
-
-			exec_addr = batch_addr;
-		}
-
-		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].handle = syncobjs[e];
-
-		exec.exec_queue_id = exec_queues[e];
-		exec.address = exec_addr;
-		if (e != i)
-			 syncobj_reset(fd, &syncobjs[e], 1);
-		xe_exec(fd, &exec);
-
-		if (!i && !(flags & CAT_ERROR))
-			xe_spin_wait_started(&data[i].spin);
-	}
-
-	if (flags & GT_RESET)
-		xe_force_gt_reset_async(fd, eci->gt_id);
-
-	if (flags & CLOSE_FD) {
-		if (flags & CLOSE_EXEC_QUEUES) {
-			for (i = 0; i < n_exec_queues; i++)
-				xe_exec_queue_destroy(fd, exec_queues[i]);
-		}
-		drm_close_driver(fd);
-		/* FIXME: wait for idle */
-		usleep(150000);
-		return;
-	}
-
-	for (i = 0; i < n_exec_queues && n_execs; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
-					NULL));
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-
-	if (!(flags & GT_RESET)) {
-		for (i = 1; i < n_execs; i++)
-			igt_assert_eq(data[i].data, 0xc0ffee);
-	}
-
-	syncobj_destroy(fd, sync[0].handle);
-	for (i = 0; i < n_exec_queues; i++) {
-		syncobj_destroy(fd, syncobjs[i]);
-		xe_exec_queue_destroy(fd, exec_queues[i]);
-	}
-
-	munmap(data, bo_size);
-	gem_close(fd, bo);
-	xe_vm_destroy(fd, vm);
-}
-
-/**
+ *
  * SUBTEST: cm-cat-error
  * Description: Test compute mode cat-error
  *
@@ -783,24 +653,28 @@ igt_main
 
 	igt_subtest("cat-error")
 		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
+			xe_legacy_test_mode(fd, hwe, 2, 2, CAT_ERROR,
+					    XE_LEGACY_ADDR);
 
 	igt_subtest("gt-reset")
 		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
+			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
+					    XE_LEGACY_ADDR);
 
 	igt_subtest("close-fd-no-exec")
 		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(-1, hwe, 16, 0, CLOSE_FD);
+			xe_legacy_test_mode(-1, hwe, 16, 0, CLOSE_FD,
+					    XE_LEGACY_ADDR);
 
 	igt_subtest("close-fd")
 		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD);
+			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD,
+					    XE_LEGACY_ADDR);
 
 	igt_subtest("close-execqueues-close-fd")
 		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD |
-					 CLOSE_EXEC_QUEUES);
+			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD |
+					    CLOSE_EXEC_QUEUES, XE_LEGACY_ADDR);
 
 	igt_subtest("cm-cat-error")
 		xe_for_each_engine(fd, hwe)
-- 
2.43.0

