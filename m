Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AFA10ED64A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 11:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4A510EDB7;
	Fri, 27 Mar 2026 11:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuxSGcBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBAA10EDC4
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774611440; x=1806147440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GLHlCzBeOgEMken+hXX2LIrGL+7AFQ5aDmpkWSzv+GQ=;
 b=OuxSGcBSustKWvm+U2vMnBImKFC/wCGXqr5zbxtf9hqh7I83etTR8DIQ
 dIWNfsxXmT89FF/THaA6OZ6wzblgaEbIIGxd0Wbn76LDnh7mkHnmrA26G
 p7WCx+OP2h8W8XrB8AVCWtp/BeoC9lXfcIwI2fObmpo1rw6SGmy+9GJKt
 oUrWG60PLv6Y1IKKqNlxiGU7hluo7MSRHHXmqS5P451yzQgWIMb24kLGx
 FRu72i4cyXG2LUfhKAvdyvRlzu4adQbw4Uo4+LWnA+DgP0eSoj6idoLZq
 qoZPA8QM0IpZ4wYNuvP1UE93cd5u0ME1yh6jQBQISlEWombf+HnTLnjdM g==;
X-CSE-ConnectionGUID: XstsZ5ZaQXGF+l6jw2nDnw==
X-CSE-MsgGUID: uaev/dw6RCeDo2lZRexVcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74713665"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="74713665"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:37:20 -0700
X-CSE-ConnectionGUID: sYcGD+tuRmiLEWkrwCBl+g==
X-CSE-MsgGUID: VY/+Xq5SRICTPadKn61L3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="221962691"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:37:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t] [DO_NOT_REVIEW] tests/xe_mempage_offline: Add Tests for
 memory page offline feature
Date: Fri, 27 Mar 2026 17:06:48 +0530
Message-ID: <20260327113651.2677665-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add below tests for memory page offlining feature on CRI.
./build/tests/xe_mempage_offline --l
unallocated
user-allocated
user-ggtt-allocated
user-ppgtt-allocated
critical-allocated
reserved

Note: These tests are going to be fit in RASs IGT tests later, so marked as do not review.
This is more towards supporting reviews and general testing of feature on CRI.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mempage_offline.c | 229 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 230 insertions(+)
 create mode 100644 tests/intel/xe_mempage_offline.c

diff --git a/tests/intel/xe_mempage_offline.c b/tests/intel/xe_mempage_offline.c
new file mode 100644
index 000000000..4e7a6106e
--- /dev/null
+++ b/tests/intel/xe_mempage_offline.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: cause specific category phy address error and check if it got offlined
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: driver
+ * Functionality: memory page offline
+ * Test category: functionality test
+ */
+
+#include <limits.h>
+#include <dirent.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_sriov_device.h"
+#include "igt_syncobj.h"
+#include "igt_sysfs.h"
+
+#include "xe_drm.h"
+#include "xe/xe_gt.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+
+/**
+ * SUBTEST: unallocated
+ * Description: Test if device is able to offline unallocated phy address error
+ */
+/**
+ * SUBTEST: user-allocated
+ * Description: Test if device is able to offline user-allocated phy address error
+ */
+/**
+ * SUBTEST: user-ggtt-allocated
+ * Description: Test if device is able to offline ggtt phy address error
+ */
+/**
+ * SUBTEST: user-ppgtt-allocated
+ * Description: Test if device is able to offline ppgtt phy address error
+ */
+/**
+ * SUBTEST: critical-allocated
+ * Description: Test if device is able to offline critical-allocated phy address error
+ */
+/**
+ * SUBTEST: reserved
+ * Description: Test if device is able to handle stolen phy address error
+ */
+	static void
+create_noncritical_bo_with_exec(int fd, uint32_t *bo, size_t bo_size, uint32_t *vm,
+				uint32_t *exec_queue, struct drm_xe_engine_class_instance *inst,
+				uint64_t addr, struct drm_xe_sync *sync, uint32_t placement,
+				struct drm_xe_exec *exec, uint32_t flags)
+{
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	uint64_t batch_offset;
+	uint64_t batch_addr;
+	uint64_t sdi_offset;
+	uint64_t sdi_addr;
+	int b = 0;
+
+	*vm = xe_vm_create(fd, 0, 0);
+
+	igt_require_f(placement, "Device doesn't support such memory region\n");
+
+	*bo = xe_bo_create(fd, 0, bo_size, placement, flags);
+	data = xe_bo_map(fd, *bo, bo_size);
+	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, bo_size, sync, 1);
+	memset(data, 0, bo_size);
+
+	*exec_queue = xe_exec_queue_create(fd, *vm, inst, 0);
+	batch_offset = (char *)&data[0].batch - (char *)data;
+	batch_addr = addr + batch_offset;
+	sdi_offset = (char *)&data[0].data - (char *)data;
+	sdi_addr = addr + sdi_offset;
+
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = sdi_addr;
+	data[0].batch[b++] = sdi_addr >> 32;
+	data[0].batch[b++] = 0xc0ffee;
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+
+	sync->flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+
+	exec->exec_queue_id = *exec_queue;
+	exec->address = batch_addr;
+}
+
+	static void
+create_noncritical_user_bo(int fd, uint32_t *bo, size_t bo_size, uint32_t placement,
+			   void *map, uint32_t flags)
+{
+
+	igt_require_f(placement, "Device doesn't support such memory region\n");
+
+	*bo = xe_bo_create(fd, 0, bo_size, placement, flags);
+
+	map = xe_bo_map(fd, *bo, bo_size);
+	strcpy(map, "Write some data to the BO!");
+}
+
+igt_main
+{
+	int fd;
+	int dir, ret;
+#define MODE_SIZE	2
+	char mode[MODE_SIZE];
+	uint16_t devid;
+	enum mempage_offline_mode {
+		MEMPAGE_OFFLINE_UNALLOCATED = 0,
+		MEMPAGE_OFFLINE_USER_ALLOCATED = 1,
+		MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED = 2,
+		MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED = 3,
+		MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED = 4,
+		MEMPAGE_OFFLINE_RESERVED = 5,
+	};
+
+	igt_fixture {
+
+		fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(fd);
+		igt_require(intel_get_device_info(devid)->is_crescentisland);
+		igt_require(igt_debugfs_exists(fd, "invalid_addr_vram0", O_RDWR));
+		dir = igt_debugfs_dir(fd);
+	}
+
+	igt_subtest("unallocated") {
+		snprintf(mode, sizeof(mode), "%d", MEMPAGE_OFFLINE_UNALLOCATED);
+		ret = igt_sysfs_write(dir, "invalid_addr_vram0", mode, sizeof(mode));
+		igt_assert_f(ret == MODE_SIZE, "Test failed with err:%d\n", ret);
+	}
+	igt_subtest("user-allocated") {
+		uint32_t bo;
+		void *map;
+		size_t bo_size = xe_get_default_alignment(fd);
+		create_noncritical_user_bo(fd, &bo, bo_size, vram_memory(fd, 0), map,
+					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		snprintf(mode, sizeof(mode), "%d", MEMPAGE_OFFLINE_USER_ALLOCATED);
+		ret = igt_sysfs_write(dir, "invalid_addr_vram0", mode, sizeof(mode));
+		igt_assert_f(ret == MODE_SIZE, "Test failed with err:%d\n", ret);
+		munmap(map, bo_size);
+		gem_close(fd, bo);
+	}
+	igt_subtest("user-ggtt-allocated") {
+		uint32_t bo, vm, exec_queue;
+		struct drm_xe_sync sync = {
+			.handle = syncobj_create(fd, 0),
+			.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		};
+
+		struct drm_xe_exec exec = {
+			.num_batch_buffer = 1,
+			.num_syncs = 1,
+			.syncs = to_user_pointer(&sync),
+		};
+
+		struct drm_xe_engine_class_instance inst = {
+			.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+		};
+		uint64_t addr = 0x1a0000;
+		size_t bo_size = xe_get_default_alignment(fd);
+		create_noncritical_bo_with_exec(fd, &bo, bo_size, &vm, &exec_queue, &inst,
+						addr, &sync, vram_memory(fd, 0), &exec,
+						DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		snprintf(mode, sizeof(mode), "%d", MEMPAGE_OFFLINE_KERNEL_USER_GGTT_ALLOCATED);
+		igt_assert_eq(__xe_exec(fd, &exec), 0);
+		ret = igt_sysfs_write(dir, "invalid_addr_vram0", mode, sizeof(mode));
+		igt_assert_neq(__xe_exec(fd, &exec), 0);
+		xe_exec_queue_destroy(fd, exec_queue);
+		xe_vm_destroy(fd, vm);
+		gem_close(fd, bo);
+		igt_assert_f(ret == MODE_SIZE, "Test failed with err:%d\n", ret);
+	}
+	igt_subtest("user-ppgtt-allocated") {
+		uint32_t bo, vm, exec_queue;
+		struct drm_xe_sync sync = {
+			.handle = syncobj_create(fd, 0),
+			.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		};
+		struct drm_xe_exec exec = {
+			.num_batch_buffer = 1,
+			.num_syncs = 1,
+			.syncs = to_user_pointer(&sync),
+		};
+
+		struct drm_xe_engine_class_instance inst = {
+			.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+		};
+		uint64_t addr = 0x1a0000;
+		size_t bo_size = xe_get_default_alignment(fd);
+		create_noncritical_bo_with_exec(fd, &bo, bo_size, &vm, &exec_queue, &inst,
+						addr, &sync, vram_memory(fd, 0), &exec,
+						DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		igt_assert_eq(__xe_exec(fd, &exec), 0);
+		snprintf(mode, sizeof(mode), "%d", MEMPAGE_OFFLINE_KERNEL_USER_PPGTT_ALLOCATED);
+		ret = igt_sysfs_write(dir, "invalid_addr_vram0", mode, sizeof(mode));
+		igt_assert_neq(__xe_exec(fd, &exec), 0);
+		xe_exec_queue_destroy(fd, exec_queue);
+		xe_vm_destroy(fd, vm);
+		gem_close(fd, bo);
+		igt_assert_f(ret == MODE_SIZE, "Test failed with err:%d\n", ret);
+	}
+	igt_subtest("critical-allocated") {
+		snprintf(mode, sizeof(mode), "%d", MEMPAGE_OFFLINE_KERNEL_CRITICAL_ALLOCATED);
+		ret = igt_sysfs_write(dir, "invalid_addr_vram0", mode, sizeof(mode));
+		igt_assert_f(ret == MODE_SIZE, "Test failed with err:%d\n", ret);
+	}
+	igt_subtest("reserved") {
+		snprintf(mode, sizeof(mode), "%d", MEMPAGE_OFFLINE_RESERVED);
+		ret = igt_sysfs_write(dir, "invalid_addr_vram0", mode, sizeof(mode));
+		igt_assert_f(ret == MODE_SIZE, "Test failed with err:%d\n", ret);
+	}
+	igt_fixture {
+		close(dir);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae..f38f5a88b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -169,6 +169,7 @@ intel_i915_progs = [
 	'gem_lut_handle',
 	'gem_madvise',
 	'gem_media_fill',
+	'xe_mempage_offline',
 	'gem_media_vme',
 	'gem_mmap',
 	'gem_mmap_gtt',
-- 
2.52.0

