Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AA6EF0702
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C03510E5CE;
	Tue, 10 Feb 2026 16:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzPQYhGb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A94010E5CE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770740457; x=1802276457;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=No9/MJHbyTdzsUN/KrJDKOuLPJA3kdcNI06+EFZmGFo=;
 b=hzPQYhGbAqB3bZp3cxR/aKujV5r3V/r16UNtu4oVUYNmz/sqJ7Pk10SO
 GTQ+jL7oiNq6yFaOQIGUFZlMe4ebB8jOVHTEDl4LsiAd3OY5kaI9r4wpB
 FVTDbKnNQueRDUla3ZdJEs6+bptYqVsdt485U2lvD9vi2lP3XEUPAZi3g
 mYz7kT1U/iqT+5dCJ2KknIL9WPnLo/rWg/B8NlpiIeARs2iKpGSNyzrNv
 W/gVzRt8q7EFtKPiZUm4X2DefyAWSrljiL6TvshPbxpEkszYyTHqwkIy+
 bT16AxcxNm0NkUeuO0u19ThhJHa71IsCmIuSZd0NAeaz6S+rKB18uihCg Q==;
X-CSE-ConnectionGUID: 0KqONDZETMmdquROydj7Rw==
X-CSE-MsgGUID: V296mpQDTHWowo/tzfri4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75497379"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75497379"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:20:56 -0800
X-CSE-ConnectionGUID: Xt1oDQnwQ4mdp9gJeQHTXQ==
X-CSE-MsgGUID: paVDsiMPRcmvBOv8inOzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242588138"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 08:20:56 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_svm_usrptr_madvise: Add SVM to userptr
 copy test with madvise
Date: Tue, 10 Feb 2026 16:20:55 +0000
Message-ID: <20260210162055.834077-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

This test validates GPU memory copy operations between SVM-allocated memory
and userptr memory with explicit madvise and preferred location hints.
This test helps ensure correct SVM, userptr, and madvise handling.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_svm_usrptr_madvise.c | 248 ++++++++++++++++++++++++++++
 tests/meson.build                   |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 tests/intel/xe_svm_usrptr_madvise.c

diff --git a/tests/intel/xe_svm_usrptr_madvise.c b/tests/intel/xe_svm_usrptr_madvise.c
new file mode 100644
index 000000000..bfa5864e4
--- /dev/null
+++ b/tests/intel/xe_svm_usrptr_madvise.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Authors:
+ *	Nishit Sharma <nishit.sharma@intel.com>
+ */
+
+#include <fcntl.h>
+#include <linux/mman.h>
+#include <string.h>
+#include <time.h>
+
+#include "igt.h"
+#include "intel_blt.h"
+#include "intel_mocs.h"
+#include "intel_pat.h"
+
+#include "xe/xe_gt.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe_drm.h"
+
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define QUARTER_SEC             (NSEC_PER_SEC / 4)
+#define FIVE_SEC                (5LL * NSEC_PER_SEC)
+
+#define BATCH_SIZE(_fd) ALIGN(SZ_8K, xe_get_default_alignment(_fd))
+#define BIND_SYNC_VAL 0x686868
+#define EXEC_SYNC_VAL 0x676767
+
+#define SVM_VA_BASE 0x1000000
+#define USERPTR_VA_BASE 0x2000000
+#define BO_VA_BASE 0x3000000
+
+/**
+ * TEST: SVM functional and performance tests
+ * Description: Validate GPU copy from SVM memory to userptr and then to a buffer object
+ *		using madvise to set device memory preference and verifying data integrity
+ *
+ * Category: Core
+ * Mega feature: USM
+ * Sub-category: System allocator, SVM, userptr
+ * Functionality: fault mode, system allocator, SVM-userptr copy, madvise
+ * Test category: functional
+ *
+ * SUBTEST: svm-userptr-copy-madvise
+ * Description:
+ *		Test GPU copy from SVM memory to userptr, then from userptr to buffer object,
+ *		with madvise to device memory and data validation
+ *
+ */
+
+IGT_TEST_DESCRIPTION("SVM memory to userptr copy with madvise");
+
+static int va_bits;
+
+static void batch_fini(int fd, uint32_t vm, uint32_t bo, uint64_t addr)
+{
+	/* Unmap the batch bo by re-instating the SVM binding. */
+	xe_vm_bind_lr_sync(fd, vm, 0, 0, addr, BATCH_SIZE(fd),
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+	gem_close(fd, bo);
+}
+
+static void
+create_vm_and_queue(int fd, struct drm_xe_engine_class_instance *eci,
+		    uint32_t *vm, uint32_t *exec_queue)
+{
+	struct xe_device *xe;
+
+	xe = xe_device_get(fd);
+	va_bits = xe->va_bits;
+	*vm = xe_vm_create(fd,
+			   DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	*exec_queue = xe_exec_queue_create(fd, *vm, eci, 0);
+	xe_vm_bind_lr_sync(fd, *vm, 0, 0, 0, 1ull << xe->va_bits,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+}
+
+static void
+setup_sync(struct drm_xe_sync *sync, uint64_t **sync_addr,
+	   uint64_t timeline_value)
+{
+	*sync_addr = malloc(sizeof(**sync_addr));
+	igt_assert(*sync_addr);
+	sync->flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync->type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync->addr = to_user_pointer((uint64_t *)*sync_addr);
+	sync->timeline_value = timeline_value;
+	**sync_addr = 0;
+}
+
+static void
+gpu_batch_init(int fd, uint32_t vm, uint64_t src_addr,
+	       uint64_t dst_addr, uint64_t copy_size,
+	       uint32_t *bo, uint64_t *addr)
+{
+	uint32_t width = copy_size / 256;
+	uint32_t height = 1;
+	uint32_t batch_bo_size = BATCH_SIZE(fd);
+	uint32_t batch_bo;
+	uint64_t batch_addr;
+	void *batch;
+	uint32_t *cmd;
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint32_t mocs_index = intel_get_uc_mocs_index(fd);
+	int i = 0;
+
+	batch_bo = xe_bo_create(fd, vm, batch_bo_size, vram_if_possible(fd, 0), 0);
+	batch = xe_bo_map(fd, batch_bo, batch_bo_size);
+	cmd = (uint32_t *)batch;
+	cmd[i++] = MEM_COPY_CMD | (1 << 19);
+	cmd[i++] = width - 1;
+	cmd[i++] = height - 1;
+	cmd[i++] = width - 1;
+	cmd[i++] = width - 1;
+	cmd[i++] = lower_32_bits(src_addr);
+	cmd[i++] = upper_32_bits(src_addr);
+	cmd[i++] = lower_32_bits(dst_addr);
+	cmd[i++] = upper_32_bits(dst_addr);
+	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0))
+		cmd[i++] = mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs_index;
+	else
+		cmd[i++] = mocs_index << GEN12_MEM_COPY_MOCS_SHIFT | mocs_index;
+
+	cmd[i++] = MI_BATCH_BUFFER_END;
+	cmd[i++] = MI_BATCH_BUFFER_END;
+
+	batch_addr = to_user_pointer(batch);
+
+	/* Punch a gap in the SVM map where we map the batch_bo */
+	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size, 0);
+	*bo = batch_bo;
+	*addr = batch_addr;
+}
+
+static void
+gpu_copy_batch_create(int fd, uint32_t vm, uint32_t exec_queue,
+		      uint64_t src_addr, uint64_t dst_addr,
+		      uint32_t *batch_bo, uint64_t *batch_addr)
+{
+	gpu_batch_init(fd, vm, src_addr, dst_addr, SZ_4K, batch_bo, batch_addr);
+}
+
+static void
+gpu_exec_sync(int fd, uint32_t vm, uint32_t exec_queue,
+	      uint64_t *batch_addr)
+{
+	struct drm_xe_sync sync = {};
+	uint64_t *sync_addr;
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+
+	sync_addr = (uint64_t *)((char *)from_user_pointer(*batch_addr) + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	WRITE_ONCE(*sync_addr, 0);
+
+	xe_exec_sync(fd, exec_queue, *batch_addr, &sync, 1);
+	if (READ_ONCE(*sync_addr) != EXEC_SYNC_VAL)
+		xe_wait_ufence(fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue,
+			       NSEC_PER_SEC * 10);
+}
+
+static void test_svm_userptr_copy(int fd)
+{
+	const size_t size = 4096 * 4;
+	uint8_t *svm_ptr, *userptr_ptr, *bo_map;
+	uint32_t bo, batch_bo;
+	uint64_t bo_gpu_va, userptr_gpu_va, batch_addr;
+
+	struct drm_xe_engine_class_instance eci = { .engine_class = DRM_XE_ENGINE_CLASS_COPY };
+	uint32_t vm, exec_queue;
+
+	create_vm_and_queue(fd, &eci, &vm, &exec_queue);
+
+	xe_vm_bind_lr_sync(fd, vm, 0, 0, 0, 1ull << va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	svm_ptr = aligned_alloc(SZ_4K, size);
+	igt_assert(svm_ptr);
+
+	userptr_ptr = aligned_alloc(SZ_4K, size);
+	igt_assert(userptr_ptr);
+
+	bo = xe_bo_create(fd, vm, size, system_memory(fd), 0);
+	bo_gpu_va = BO_VA_BASE;
+	xe_vm_bind_async(fd, vm, 0, bo, 0, bo_gpu_va, size, 0, 0);
+
+	userptr_gpu_va = USERPTR_VA_BASE;
+	xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(userptr_ptr),
+				 userptr_gpu_va, size, NULL, 0);
+
+	for (size_t i = 0; i < size; i++)
+		svm_ptr[i] = rand() & 0xFF;
+
+	xe_vm_madvise(fd, vm, to_user_pointer(svm_ptr), size, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE, 0, 0);
+	xe_vm_madvise(fd, vm, to_user_pointer(userptr_ptr), size, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE, 0, 0);
+
+	gpu_copy_batch_create(fd, vm, exec_queue, to_user_pointer(svm_ptr),
+			      to_user_pointer(userptr_ptr), &batch_bo, &batch_addr);
+	gpu_exec_sync(fd, vm, exec_queue, &batch_addr);
+
+	gpu_copy_batch_create(fd, vm, exec_queue, userptr_gpu_va, bo_gpu_va,
+			      &batch_bo, &batch_addr);
+	gpu_exec_sync(fd, vm, exec_queue, &batch_addr);
+
+	igt_assert(memcmp(svm_ptr, userptr_ptr, SZ_4K) == 0);
+
+	bo_map = xe_bo_map(fd, bo, size);
+	igt_assert(memcmp(bo_map, svm_ptr, SZ_4K) == 0);
+
+	xe_vm_bind_lr_sync(fd, vm, 0, 0, batch_addr, BATCH_SIZE(fd),
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	batch_fini(fd, vm, batch_bo, batch_addr);
+
+	free(svm_ptr);
+	free(userptr_ptr);
+
+	xe_vm_unbind_lr_sync(fd, vm, 0, bo_gpu_va, size);
+	xe_vm_unbind_lr_sync(fd, vm, 0, userptr_gpu_va, size);
+
+	gem_close(fd, bo);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
+int igt_main()
+{
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("svm-userptr-copy-madvise")
+		test_svm_userptr_copy(fd);
+
+	igt_fixture() {
+		drm_close_driver(fd);
+	}
+}
+
diff --git a/tests/meson.build b/tests/meson.build
index ef4edaa0d..7f356de9b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -337,6 +337,7 @@ intel_xe_progs = [
 	'xe_sriov_scheduling',
         'xe_survivability',
 	'xe_sriov_vram',
+        'xe_svm_usrptr_madvise',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
-- 
2.34.1

