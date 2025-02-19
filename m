Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCE6C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F0010E7C4;
	Wed, 19 Feb 2025 10:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/NkO+sO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32D010E7D7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739960739; x=1771496739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AFmYjpnJ+q9ejI6hOkDKmW3qXuqBT7cDLUNY7F4jN4=;
 b=N/NkO+sOQ7k6KTlz0ozv7l+OAbXWie+KHpY/1DHbrwA6vNthrBL64BiH
 LNNL6quofTHbWwkund87SBJVFt8IPFsaaHosQUGKwimhxofhCHYb9AnVN
 UVAIXMEvmhLOjbbl8weMPKvizIdkPqWIt40Wgs66U5g0pg+yDMH0qtVzG
 1CgMzW1GsITrVympa9FbQbEe6LxfWZfjX0hbiZtHLyAK7m8OIKeHQs45p
 f7TD5u4CqeG07zdxtrx8e6Pbyl/WJZKbJJvUdjsd9/qKlzle5GVZLhm3t
 a5c4COfd8AJEE4LvWBW5nYc7ZI/qcfu/rsuCSu1p/LCVzFUuyzsGNyP/2 Q==;
X-CSE-ConnectionGUID: VshBF6AkR1yallvR1dsFuA==
X-CSE-MsgGUID: 3QfxU2vGQtCUHuoGkLtkUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40613321"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40613321"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:25:38 -0800
X-CSE-ConnectionGUID: 0ekA2clIRhKS5V/yIVxizA==
X-CSE-MsgGUID: nJcTGEbTRGGc0U9ipFpc0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137921469"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:25:36 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tomasz.lis@intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com, satyanarayana.k.v.p@intel.com
Subject: [PATCH i-g-t 2/2] tests/xe_sriov_migration: VF fake migration
 validation
Date: Wed, 19 Feb 2025 11:25:34 +0100
Message-Id: <20250219102534.2630181-3-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250219102534.2630181-1-adam.miszczak@linux.intel.com>
References: <20250219102534.2630181-1-adam.miszczak@linux.intel.com>
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

Introduce validatation of simplified VF migration scenarios
(a.k.a. fake migration). Test exercise possiblity to restore
previously saved GuC state that is reset by VF FLR.
Post-restore health is verified by running simple workload on VF.

Multiple scenario's variants are supported:
- auto or manual VF provisioning
- with and without VF GTTT address change (relocation)

The test doesn't require neither running VM, nor VFIO driver's
migration support.

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 tests/intel/xe_sriov_migration.c | 297 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 298 insertions(+)
 create mode 100644 tests/intel/xe_sriov_migration.c

diff --git a/tests/intel/xe_sriov_migration.c b/tests/intel/xe_sriov_migration.c
new file mode 100644
index 000000000..946deca22
--- /dev/null
+++ b/tests/intel/xe_sriov_migration.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2025 Intel Corporation. All rights reserved.
+ */
+
+#include "igt.h"
+#include "igt_sriov_device.h"
+#include "igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_sriov_debugfs.h"
+#include "xe/xe_sriov_provisioning.h"
+
+/**
+ * TEST: xe_sriov_migration
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: Reset tests
+ * Functionality: VF migration
+ * Description: Examine behavior of SR-IOV VF save-restore (migration)
+ *
+ * SUBTEST: vf-fake-save-restore-auto-1vf
+ * Run type: FULL
+ * Description:
+ *   Verifies VF fake migration: GuC, GGTT and LMEM data is properly restored after FLR.
+ *   1xVF is auto provisioned. VF's GGTT address does not change.
+ *
+ * SUBTEST: vf-fake-save-restore-manual-2vf
+ * Run type: FULL
+ * Description:
+ *   Verifies VF fake migration: GuC, GGTT and LMEM data is properly restored after FLR.
+ *   2xVFs are manually provisioned. VF's GGTT address does not change.
+ *
+ * SUBTEST: vf-fake-save-restore-relocate-manual-1vf
+ * Run type: FULL
+ * Description:
+ *   Verifies VF fake migration: GuC, GGTT and LMEM data is properly restored after FLR.
+ *   1xVF is manually provisioned. VF GGTT is relocated - address changes.
+ *
+ * SUBTEST: vf-fake-save-restore-relocate-auto-2vf
+ * Run type: FULL
+ * Description:
+ *   Verifies VF fake migration: GuC, GGTT and LMEM data is properly restored after FLR.
+ *   2xVFs are auto provisioned. VF GGTT is relocated - address changes.
+ */
+
+IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF state save/restore (migration)");
+
+/* Basic submissions to verify VF is healthy pre and post-migration */
+static void simple_exec(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint64_t batch_offset, batch_addr, sdi_offset, sdi_addr;
+	uint32_t exec_queue;
+	uint32_t syncobjs;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	int b;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	bo_size = sizeof(*data) * 2;
+	bo_size = xe_bb_size(fd, bo_size);
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	syncobjs = syncobj_create(fd, 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
+			 bo_size, sync, 1);
+
+	batch_offset = (char *)&data[0].batch - (char *)data;
+	batch_addr = addr + batch_offset;
+	sdi_offset = (char *)&data[0].data - (char *)data;
+	sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data[0].batch[b++] = sdi_addr;
+	data[0].batch[b++] = sdi_addr >> 32;
+	data[0].batch[b++] = 0xc0ffee;
+	data[0].batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data[0].batch));
+
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobjs;
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	syncobj_reset(fd, &syncobjs, 1);
+
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data[0].data, 0xc0ffee);
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobjs);
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static void provision_vf(int pf_fd, int vf_num, int gt_num)
+{
+	igt_debug("Provision VF%u\n", vf_num);
+	xe_sriov_pf_set_shared_res_attr(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_num, gt_num, SZ_256M);
+	xe_sriov_pf_set_shared_res_attr(pf_fd, XE_SRIOV_SHARED_RES_GGTT, vf_num, gt_num, SZ_1G);
+	xe_sriov_pf_set_shared_res_attr(pf_fd, XE_SRIOV_SHARED_RES_CONTEXTS, vf_num, gt_num, 1024);
+	xe_sriov_pf_set_shared_res_attr(pf_fd, XE_SRIOV_SHARED_RES_DOORBELLS, vf_num, gt_num, 10);
+	xe_sriov_set_exec_quantum_ms(pf_fd, vf_num, gt_num, 500);
+	xe_sriov_set_preempt_timeout_us(pf_fd, vf_num, gt_num, 600 * USEC_PER_MSEC);
+}
+
+/* Test variant flags:
+ * BIT0: enable manual provisiong
+ * BIT1: enable GGTT relocation
+ */
+#define XE_SRIOV_VFSR_MANUAL_PROVISION (1 << 0)
+#define XE_SRIOV_VFSR_GGTT_RELOCATE    (1 << 1)
+
+static void vf_fake_save_restore(int pf_fd, int num_vfs, uint16_t test_flags)
+{
+	int vf_fd;
+	int vf_num = 1;
+	int gt_num = 0;
+	void *guc_state_buf;
+	void *ggtt_raw_buf;
+	void *lmem_state_buf;
+	int guc_state_size = 0;
+	int ggtt_raw_size = 0;
+	int lmem_state_size = 0;
+	struct drm_xe_engine_class_instance *hwe;
+
+	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+	igt_assert(!igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num));
+
+	if (test_flags & XE_SRIOV_VFSR_MANUAL_PROVISION) {
+		for (int vf_idx = 1; vf_idx <= num_vfs; vf_idx++)
+			provision_vf(pf_fd, vf_idx, gt_num);
+	}
+
+	igt_info("Enable %u VF(s)\n", num_vfs);
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(pf_fd));
+	igt_assert(igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num));
+
+	vf_fd = igt_sriov_open_vf_drm_device(pf_fd, vf_num);
+
+	igt_debug("Disable runtime PM on VF%u\n", vf_num);
+	/* Setup needs to be called prior to disable runtime PM */
+	igt_assert(igt_setup_runtime_pm(vf_fd));
+	igt_disable_runtime_pm();
+
+	igt_debug("Simple execution on VF%u - pre-migration\n", vf_num);
+	xe_for_each_engine(vf_fd, hwe)
+		simple_exec(vf_fd, hwe);
+
+	igt_info("Pause VF%u\n", vf_num);
+	igt_fail_on(xe_sriov_set_vf_control(pf_fd, vf_num, gt_num, XE_SRIOV_VF_CONTROL_PAUSE));
+
+	igt_info("Read and store VF%u GuC, GGTT and LMEM state\n", vf_num);
+	guc_state_buf = xe_sriov_get_guc_state(pf_fd, vf_num, gt_num, &guc_state_size);
+	igt_assert(guc_state_size > 0);
+
+	ggtt_raw_buf = xe_sriov_get_ggtt_raw(pf_fd, vf_num, gt_num, &ggtt_raw_size);
+	igt_assert(ggtt_raw_size > 0);
+
+	if (xe_has_vram(pf_fd)) {
+		lmem_state_buf = xe_sriov_get_lmem_state(pf_fd, vf_num, gt_num, &lmem_state_size);
+		igt_assert(lmem_state_size > 0);
+	}
+
+	/* Trigger VF FLR to get back into VF_READY state */
+	igt_info("Reset VF%u\n", vf_num);
+	igt_assert(igt_sriov_device_reset(pf_fd, vf_num));
+	/* Assume FLR is finished after sleep */
+	sleep(1);
+
+	/* Move GGTT space of VF1 to different area */
+	if (test_flags & XE_SRIOV_VFSR_GGTT_RELOCATE) {
+		igt_info("Relocate VF%u GGTT\n", vf_num);
+		xe_sriov_relocate_ggtt(pf_fd, vf_num, gt_num);
+	}
+
+	/* Pause VF again - only READY_PAUSED VF can have the state restored */
+	igt_info("Pause VF%u again\n", vf_num);
+	igt_fail_on(xe_sriov_set_vf_control(pf_fd, vf_num, gt_num, XE_SRIOV_VF_CONTROL_PAUSE));
+
+	/* Pause causes overwrite of GuC state copy stored in KMD
+	 *- restore it from a previosusly stored buffer
+	 */
+	igt_info("Write back VF%u LMEM, GGTT and GuC state\n", vf_num);
+	if (xe_has_vram(pf_fd))
+		xe_sriov_set_lmem_state(pf_fd, vf_num, gt_num, lmem_state_buf, lmem_state_size);
+
+	xe_sriov_set_ggtt_raw(pf_fd, vf_num, gt_num, ggtt_raw_buf, ggtt_raw_size);
+	xe_sriov_set_guc_state(pf_fd, vf_num, gt_num, guc_state_buf, guc_state_size);
+
+	/* Restore the snapshot to actual GuC */
+	igt_info("Restore VF%u state\n", vf_num);
+	igt_fail_on(xe_sriov_set_vf_control(pf_fd, vf_num, gt_num, XE_SRIOV_VF_CONTROL_RESTORE));
+
+	igt_info("Resume VF%u\n", vf_num);
+	igt_fail_on(xe_sriov_set_vf_control(pf_fd, vf_num, gt_num, XE_SRIOV_VF_CONTROL_RESUME));
+
+	/* Execute simple workload to assure the state restore was successful */
+	igt_debug("Simple execution on VF%u - post-migration\n", vf_num);
+	xe_for_each_engine(vf_fd, hwe)
+		simple_exec(vf_fd, hwe);
+
+	/* Cleanup - restore initial state */
+	igt_debug("Restore runtime PM for VF\n");
+	igt_restore_runtime_pm();
+
+	close(vf_fd);
+	free(guc_state_buf);
+	free(ggtt_raw_buf);
+	free(lmem_state_buf);
+
+	igt_debug("Disable VF(s)\n");
+	igt_sriov_disable_vfs(pf_fd);
+}
+
+igt_main
+{
+	int pf_fd;
+	bool autoprobe;
+
+	igt_fixture {
+		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+	}
+
+	igt_describe("Perform VF fake migration without GGTT relocation (1xVF auto provisioning)");
+	igt_subtest("vf-fake-save-restore-auto-1vf") {
+		vf_fake_save_restore(pf_fd, 1, 0);
+	}
+
+	igt_describe("Perform VF fake migration without GGTT relocation (2xVF manual provisioning)");
+	igt_subtest("vf-fake-save-restore-manual-2vf") {
+		vf_fake_save_restore(pf_fd, 2, XE_SRIOV_VFSR_MANUAL_PROVISION);
+	}
+
+	igt_describe("Perform VF fake migration with GGTT relocation (1xVF manual provisioning)");
+	igt_subtest("vf-fake-save-restore-relocate-manual-1vf") {
+		vf_fake_save_restore(pf_fd, 1,
+			XE_SRIOV_VFSR_MANUAL_PROVISION | XE_SRIOV_VFSR_GGTT_RELOCATE);
+	}
+
+	igt_describe("Perform VF fake migration with GGTT relocation (2xVF auto provisioning)");
+	igt_subtest("vf-fake-save-restore-relocate-auto-2vf") {
+		vf_fake_save_restore(pf_fd, 2, XE_SRIOV_VFSR_GGTT_RELOCATE);
+	}
+
+	igt_fixture {
+		igt_sriov_disable_vfs(pf_fd);
+		/* Abort to avoid execution of next tests with enabled VFs */
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+				igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+				"Failed to restore sriov_drivers_autoprobe value\n");
+		close(pf_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index f8a0ab836..b0100be18 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -318,6 +318,7 @@ intel_xe_progs = [
 	'xe_spin_batch',
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
+	'xe_sriov_migration',
 	'xe_sriov_scheduling',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
-- 
2.39.1

