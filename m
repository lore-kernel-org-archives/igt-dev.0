Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A84FD58CC5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 05:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F6910E3C4;
	Mon, 23 Mar 2026 05:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDhfc4B9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E222E10E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 05:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774242966; x=1805778966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hx9mvfAorZ/nqn/Ksw/kQZNV0Jweg6ECaIcRxaZQjRs=;
 b=YDhfc4B9540bLFIyIYaxfrUEdI/+TLSDVdaSn9OmD01ctcdmFD3GWCAD
 Hmia7/MddPHr+x7m6tfkVNzgPlcaN7OLzd+OeLCgZLXfwAaznvm9cqVZV
 +tQ7mSrFd3Z15fGZFmrJuLhQT5tvCTKXugSca8ph/0W5iY1sben4+augf
 RqRFCxbshvY5VbUaC+JSWXtx31wNmP5wJ2R1EeiLyzLXGDKGy+MwkfiRF
 VDHOQcVKuYSGEFf2budxZ6dWYyEM1dyOT4VRA/8G4jwnBJ7PlWsMl+jVl
 +XeQ8ngsDTlD/9AqkT8skwGVv/7kMyzdWbSDtK1WeS4nFAgsZQQIsZ384 w==;
X-CSE-ConnectionGUID: CJzgkN2QSj21P0a64RQAaw==
X-CSE-MsgGUID: VkTUPGEaSsuIxFeA4pgAmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86601030"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="86601030"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 22:16:05 -0700
X-CSE-ConnectionGUID: GbrnK/EZR/S4XaF4mJJWlQ==
X-CSE-MsgGUID: WNOP6ns4Qm2rTOl8IlGHWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="247741769"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 22 Mar 2026 22:16:03 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [RFC v2] Access counter: Tests for access counter
Date: Mon, 23 Mar 2026 11:21:09 +0530
Message-Id: <20260323055109.2949463-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

Co-developed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/meson.build                    |   1 +
 lib/xe/xe_trace.c                  |  71 ++++++
 lib/xe/xe_trace.h                  |  13 +
 tests/intel/xe_access_counter.c    | 347 ++++++++++++++++++++++++++
 tests/intel/xe_access_counter_sa.c | 386 +++++++++++++++++++++++++++++
 tests/meson.build                  |   2 +
 6 files changed, 820 insertions(+)
 create mode 100644 lib/xe/xe_trace.c
 create mode 100644 lib/xe/xe_trace.h
 create mode 100644 tests/intel/xe_access_counter.c
 create mode 100644 tests/intel/xe_access_counter_sa.c

diff --git a/lib/meson.build b/lib/meson.build
index cd03e8f63..d405c87d9 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -131,6 +131,7 @@ lib_sources = [
 	'xe/xe_sriov_admin.c',
 	'xe/xe_sriov_debugfs.c',
 	'xe/xe_sriov_provisioning.c',
+        'xe/xe_trace.c',
 	'xe/xe_util.c',
 ]
 
diff --git a/lib/xe/xe_trace.c b/lib/xe/xe_trace.c
new file mode 100644
index 000000000..8ac626610
--- /dev/null
+++ b/lib/xe/xe_trace.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include "igt.h"
+#include "igt_types.h"
+#include "igt_sysfs.h"
+#include "xe_trace.h"
+
+const char *xe_migration_trace_path =
+				"/sys/kernel/tracing/events/xe/xe_bo_move/enable";
+const char *xe_acc_counter = "/sys/kernel/tracing/events/xe/xe_vma_acc/enable";
+const char *trace_on_path = "/sys/kernel/tracing/tracing_on";
+const char *trace_path = "/sys/kernel/tracing/trace";
+
+void xe_validate_migrate_trace(int xe, int flag)
+{
+	igt_assert_eq(igt_debugfs_search(xe, trace_path,
+		      "migrate object"), flag);
+}
+
+void xe_validate_acc_trace(int xe, int flag, const char *type)
+{
+	igt_assert_eq(igt_debugfs_search(xe,
+		      trace_path, "xe_vma_acc"), flag);
+	if (flag && type) {
+		char type_str[32];
+
+		snprintf(type_str, sizeof(type_str), "type=%s", type);
+		igt_assert_eq(igt_debugfs_search(xe, trace_path, type_str), 1);
+	}
+}
+
+bool xe_sysfs_trace_write(const char *file, const char *value)
+{
+	FILE *fp;
+
+	fp = fopen(file, "w");
+	if (!fp)
+		return false;
+
+	igt_assert_f(fwrite(value, 1, strlen(value), fp) == strlen(value),
+			"failed to update sysfs tracing node %s\n", file);
+	fclose(fp);
+	return true;
+}
+
+void xe_start_tracing(void)
+{
+	bool success = true;
+
+	success &= xe_sysfs_trace_write(xe_acc_counter, "1");
+	success &= xe_sysfs_trace_write(xe_migration_trace_path, "1");
+	success &= xe_sysfs_trace_write(trace_path, "1");
+	success &= xe_sysfs_trace_write(trace_on_path, "1");
+
+	igt_assert(success);
+}
+
+void xe_stop_tracing(void)
+{
+	xe_sysfs_trace_write(xe_acc_counter, "0");
+	xe_sysfs_trace_write(xe_migration_trace_path, "0");
+	xe_sysfs_trace_write(trace_on_path, "0");
+	xe_sysfs_trace_write(trace_path, "0");
+}
diff --git a/lib/xe/xe_trace.h b/lib/xe/xe_trace.h
new file mode 100644
index 000000000..9ec395acc
--- /dev/null
+++ b/lib/xe/xe_trace.h
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#include <stdio.h>
+#include <string.h>
+#include "igt.h"
+
+void xe_validate_migrate_trace(int xe, int flag);
+void xe_validate_acc_trace(int xe, int flag, const char *type);
+bool xe_sysfs_trace_write(const char *file, const char *value);
+void xe_start_tracing(void);
+void xe_stop_tracing(void);
diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
new file mode 100644
index 000000000..f557b3b9e
--- /dev/null
+++ b/tests/intel/xe_access_counter.c
@@ -0,0 +1,347 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for access counter functionality
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: access counter
+ * Test category: functionality test
+ *
+ * SUBTEST: access-trigger-one-execqueue
+ * Description: Tests basic functionality of access counter and single
+ *		exec queue.
+ *
+ * SUBTEST: access-trigger-many-execqueues
+ * Description: Tests basic functionality of access counter with many exec
+ *		queues.
+ *
+ * SUBTEST: no-access-trigger-one-execqueue
+ * Description: Tests basic functionality of NC bit in ppgtt with single
+ *		exec queue.
+ *
+ * SUBTEST: no-access-trigger-many-execqueues
+ * Description: Tests basic functionality of NC bit in ppgtt counter with
+ * 		many exec queues.
+ *
+ * SUBTEST: access-notify
+ * Description: Tests NOTIFY access counter event using LRC-programmed thresholds.
+ *              Uses a single exec queue with a batch that stores to
+ *              HW_ACC_CTR_ARRAY_SIZE+1 distinct 2MiB regions, filling all HW
+ *              AC slots and triggering LRU eviction and the NOTIFY interrupt.
+ *
+ * SUBTEST: access-trigger-negative
+ * Description: Tests if it gets migrated when number of stores is less
+ *		than set triggered value.
+ */
+
+#include <fcntl.h>
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_trace.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define NOTIFY_TEST		(0x1 << 0)
+#define NC_TEST                 (0x1 << 1)
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define BATCH_SIZE		1500
+#define TRIGGER			5
+#define HW_ACC_CTR_ARRAY_SIZE	64
+
+struct drm_xe_exec_queue_set_acc_param {
+        /** @base: base user extension */
+        struct drm_xe_user_extension base;
+
+        /** @trigger: Access counter trigger threshold */
+        __u16 trigger;
+
+        /** @notify: Access counter notify threshold */
+        __u16 notify;
+
+        /** @granularity: granularity, enum @drm_xe_access_counter_granularity */
+        __u8 granularity;
+
+        /** @pad1: MBZ */
+        __u8 pad1;
+
+        /** @pad2: MBZ */
+        __u16 pad2;
+};
+
+enum acc_ctr_granularity {
+	ACC_GRAN_64K  = 0,
+	ACC_GRAN_2M   = 1,
+	ACC_GRAN_16M  = 2,
+	ACC_GRAN_64M  = 3,
+};
+
+static void
+test_exec(int fd, int trigger, int num_stores, struct drm_xe_engine_class_instance *eci,
+	  int n_exec_queues, unsigned int flags)
+{
+	uint64_t addr = SZ_2M;
+	uint32_t vm;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+
+	struct drm_xe_exec_queue_set_acc_param acc_param = {
+		.base = { .name = 1 },
+		.trigger = trigger,
+		.notify = 0,
+		.granularity = ACC_GRAN_64M,
+	};
+
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct {
+		uint32_t batch[BATCH_SIZE];
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+
+	/* NOTIFY_TEST: one 2MiB BO per AC slot + 1 to trigger LRU eviction */
+	uint32_t notify_bos[HW_ACC_CTR_ARRAY_SIZE + 1];
+	uint64_t notify_addrs[HW_ACC_CTR_ARRAY_SIZE + 1];
+	uint32_t exec_queues[n_exec_queues];
+	size_t bo_size;
+	uint32_t bo = 0;
+	int dir = igt_debugfs_dir(fd);
+	int i;
+
+	if (flags & NOTIFY_TEST) {
+		/*
+		 * trigger=1000: high enough that TRIGGER never fires on a
+		 * single-store-per-region batch, but non-zero so counting
+		 * is enabled (trigger=0 disables the counter per BSpec).
+		 */
+		acc_param.trigger = 1000;
+		acc_param.notify = trigger;
+		acc_param.granularity = ACC_GRAN_2M;
+	}
+
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	bo_size = sizeof(*data) * n_exec_queues;
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
+			xe_get_default_alignment(fd));
+
+	bo = xe_bo_create(fd, 0, bo_size,
+			  system_memory(fd) | all_memory_regions(fd),
+			  DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
+
+	if (flags & NOTIFY_TEST) {
+		/*
+		 * Allocate (HW_ACC_CTR_ARRAY_SIZE+1) individual 2MiB BOs, each
+		 * bound at its own 2MiB-aligned VA and prefetched into smem.
+		 * A single batch then stores one DWORD per BO, accessing 257
+		 * distinct 2MiB regions in one uninterrupted command stream.
+		 * This fills all 256 HW AC slots and forces LRU eviction + NOTIFY
+		 * on the 257th unique region access.
+		 */
+		int n_slots = HW_ACC_CTR_ARRAY_SIZE + 1;
+		uint64_t base = ALIGN(addr + bo_size, SZ_2M);
+
+		for (int s = 0; s < n_slots; s++) {
+			notify_addrs[s] = base + (uint64_t)s * SZ_2M;
+			notify_bos[s] = xe_bo_create(fd, 0, SZ_2M,
+						     system_memory(fd) | all_memory_regions(fd),
+						     DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+						     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			xe_vm_bind_async(fd, vm, 0, notify_bos[s], 0,
+					 notify_addrs[s], SZ_2M, sync, 1);
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
+				       NSEC_PER_SEC);
+			data[0].vm_sync = 0;
+			xe_vm_prefetch_async(fd, vm, 0, 0, notify_addrs[s],
+					     SZ_2M, sync, 1, 0);
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
+				       NSEC_PER_SEC);
+			data[0].vm_sync = 0;
+		}
+	}
+
+	for (i = 0; i < n_exec_queues; i++)
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, to_user_pointer(&acc_param));
+
+	/* Always bind the main BO — it holds the batch and exec_sync */
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & NC_TEST ? 1 : 0);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+	xe_start_tracing();
+	for (i = 0; i < n_exec_queues; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_addr;
+		uint32_t *batch_ptr = data[i].batch;
+		int b = 0;
+
+		if (flags & NOTIFY_TEST) {
+			int n_slots = HW_ACC_CTR_ARRAY_SIZE + 1;
+
+			igt_info("NOTIFY_TEST: batch with %d stores across %d individual 2MiB BOs\n",
+			       n_slots, n_slots);
+			for (int slot = 0; slot < n_slots; slot++) {
+				batch_ptr[b++] = MI_STORE_DWORD_IMM_GEN4;
+				batch_ptr[b++] = lower_32_bits(notify_addrs[slot]);
+				batch_ptr[b++] = upper_32_bits(notify_addrs[slot]);
+				batch_ptr[b++] = slot;
+			}
+			batch_ptr[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+		} else {
+			sdi_addr = addr + ((char *)&data[i].data - (char *)data);
+			for (int store = 0; store < num_stores * 50; store++) {
+				batch_ptr[b++] = MI_STORE_DWORD_IMM_GEN4;
+				batch_ptr[b++] = lower_32_bits(sdi_addr);
+				batch_ptr[b++] = upper_32_bits(sdi_addr);
+				batch_ptr[b++] = store;
+			}
+			batch_ptr[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+		}
+		sync[0].addr = addr + ((char *)&data[i].exec_sync - (char *)data);
+		exec.exec_queue_id = exec_queues[i];
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+	}
+	/* There is race condition in that xe_vm_unbind_async() might be called
+	 * below before KMD has even processed the hardware interrupt for access
+	 * counter trigger.
+	 */
+	sleep(2);
+	for (i = 0; i < n_exec_queues; i++)
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	/* Unbind and free notify BOs, then main BO */
+	if (flags & NOTIFY_TEST) {
+		int n_slots = HW_ACC_CTR_ARRAY_SIZE + 1;
+
+		for (int s = 0; s < n_slots; s++) {
+			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			xe_vm_unbind_async(fd, vm, 0, 0, notify_addrs[s], SZ_2M,
+					   sync, 1);
+			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
+				       NSEC_PER_SEC);
+			data[0].vm_sync = 0;
+			gem_close(fd, notify_bos[s]);
+		}
+	}
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	if (!(flags & NOTIFY_TEST)) {
+		for (i = 0; i < n_exec_queues; i++) {
+			uint32_t got = data[i].data;
+			igt_assert(got == num_stores * 50 - 1);
+		}
+	}
+
+	if (flags & NOTIFY_TEST) {
+		xe_validate_acc_trace(fd, 1, "NOTIFY");
+		xe_validate_migrate_trace(fd, 1);
+	} else if (!(flags & NC_TEST) && (trigger == num_stores)) {
+		xe_validate_acc_trace(fd, 1, "TRIGGER");
+		xe_validate_migrate_trace(fd, 1);
+	} else {
+		xe_validate_acc_trace(fd, 0, NULL);
+		xe_validate_migrate_trace(fd, 0);
+	}
+	xe_stop_tracing();
+
+	for (i = 0; i < n_exec_queues; i++)
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+	close(dir);
+}
+
+int igt_main()
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	int fd;
+
+	igt_fixture() {
+		struct timespec tv = {};
+		bool supports_faults;
+		int ret = 0;
+		int timeout = igt_run_in_simulation() ? 20 : 2;
+
+		fd = drm_open_driver(DRIVER_XE);
+
+		igt_require(xe_has_vram(fd));
+		do {
+			if (ret)
+				usleep(5000);
+			ret = xe_supports_faults(fd);
+		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < timeout);
+
+		supports_faults = !ret;
+		igt_require(supports_faults);
+	}
+	/* Pass trigger value same as number of stores */
+	igt_subtest("access-trigger-one-execqueue") {
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 1, 0);
+	}
+
+	/* Pass trigger value same as number of stores but No trigger*/
+	igt_subtest("no-access-trigger-one-execqueue") {
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 1, NC_TEST);
+	}
+
+	/* Pass trigger value same as number of stores but No trigger*/
+	igt_subtest("access-trigger-many-execqueues") {
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 4, 0);
+	}
+	
+	/* Pass trigger value same as number of stores but No trigger*/
+	igt_subtest("no-access-trigger-many-execqueues") {
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 4, NC_TEST);
+	}
+
+	igt_subtest("access-notify") {
+		xe_for_each_engine(fd, hwe) {
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 1, NOTIFY_TEST);
+			break;
+		}
+	}
+	/* Pass trigger value much greater than number of stores */
+	igt_subtest("access-trigger-negative") {
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER + 400, TRIGGER, hwe, 1, 0);
+	}
+
+	igt_fixture()
+		drm_close_driver(fd);
+}
diff --git a/tests/intel/xe_access_counter_sa.c b/tests/intel/xe_access_counter_sa.c
new file mode 100644
index 000000000..6f30f825b
--- /dev/null
+++ b/tests/intel/xe_access_counter_sa.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Access counter tests using system allocator (CPU_ADDR_MIRROR)
+ * Category: Core
+ * Mega feature: USM
+ * Sub-category: access counter
+ * Functionality: access counter, system allocator
+ * Test category: functionality test
+ *
+ * SUBTEST: access-trigger-one-execqueue
+ * Description: Tests access counter TRIGGER event with a single exec queue
+ *		using the system allocator (CPU_ADDR_MIRROR) for all allocations.
+ *
+ * SUBTEST: access-trigger-many-execqueues
+ * Description: Tests access counter TRIGGER event with many exec queues
+ *		using the system allocator (CPU_ADDR_MIRROR) for all allocations.
+ *
+ * SUBTEST: no-access-trigger-one-execqueue
+ * Description: Tests that no TRIGGER fires with a single exec queue when
+ *		the store count stays below the trigger threshold.
+ *
+ * SUBTEST: no-access-trigger-many-execqueues
+ * Description: Tests that no TRIGGER fires with many exec queues when
+ *		the store count stays below the trigger threshold.
+ *
+ * SUBTEST: access-notify
+ * Description: Tests NOTIFY access counter event using LRC-programmed
+ *		thresholds. Allocates HW_ACC_CTR_ARRAY_SIZE+1 distinct 2MiB
+ *		regions via aligned_alloc, filling all HW AC slots and
+ *		triggering LRU eviction and the NOTIFY interrupt.
+ *		Uses the system allocator (CPU_ADDR_MIRROR) instead of
+ *		explicit BO binds.
+ *
+ * SUBTEST: access-trigger-negative
+ * Description: Tests that no TRIGGER fires when the store count is well
+ *		below the programmed trigger threshold, using the system
+ *		allocator for all allocations.
+ */
+
+#include <fcntl.h>
+#include <linux/mman.h>
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_trace.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define NOTIFY_TEST		(0x1 << 0)
+#define NC_TEST			(0x1 << 1)
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define BATCH_SIZE		1500
+#define TRIGGER			5
+#define HW_ACC_CTR_ARRAY_SIZE	64
+
+/* Five-second timeout for xe_wait_ufence calls */
+#define FIVE_SEC		(5LL * NSEC_PER_SEC)
+
+/*
+ * Number of VA bits available on the device — set in igt_fixture via
+ * xe_va_bits().  Used by the bind_system_allocator / unbind_system_allocator
+ * macros below.
+ */
+static int va_bits;
+
+/*
+ * fd and vm must be visible to the macros below.  They are declared as
+ * function-local variables in test_exec() but the macros are meant to be used
+ * only from inside that function (same pattern as xe_exec_system_allocator.c).
+ */
+#define bind_system_allocator(__sync, __num_sync)			\
+	__xe_vm_bind_assert(fd, vm, 0,					\
+		0, 0, 0, 0x1ull << va_bits,				\
+		DRM_XE_VM_BIND_OP_MAP,					\
+		DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,			\
+		(__sync), (__num_sync), 0, 0)
+
+#define unbind_system_allocator()					\
+	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,		\
+		DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0, 0)
+
+struct drm_xe_exec_queue_set_acc_param {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @trigger: Access counter trigger threshold */
+	__u16 trigger;
+
+	/** @notify: Access counter notify threshold */
+	__u16 notify;
+
+	/** @granularity: granularity, enum @drm_xe_access_counter_granularity */
+	__u8 granularity;
+
+	/** @pad1: MBZ */
+	__u8 pad1;
+
+	/** @pad2: MBZ */
+	__u16 pad2;
+};
+
+enum acc_ctr_granularity {
+	ACC_GRAN_64K  = 0,
+	ACC_GRAN_2M   = 1,
+	ACC_GRAN_16M  = 2,
+	ACC_GRAN_64M  = 3,
+};
+
+/*
+ * Layout of the data buffer allocated for batch + sync + result.
+ * Each exec queue gets its own slot so multiple queues can run in parallel.
+ */
+struct exec_slot {
+	uint32_t batch[BATCH_SIZE];
+	uint64_t vm_sync;
+	uint64_t exec_sync;
+	uint32_t data;
+};
+
+static void
+test_exec(int fd, int trigger, int num_stores,
+	  struct drm_xe_engine_class_instance *eci,
+	  int n_exec_queues, unsigned int flags)
+{
+	uint32_t vm;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct drm_xe_exec_queue_set_acc_param acc_param = {
+		.base  = { .name = 1 },
+		.trigger    = trigger,
+		.notify     = 0,
+		.granularity = ACC_GRAN_64M,
+	};
+
+	/* Per-queue execution slots — aligned_alloc'd from system memory */
+	size_t slot_buf_size = ALIGN(sizeof(struct exec_slot) * n_exec_queues,
+				     SZ_2M);
+	struct exec_slot *data;
+
+	/*
+	 * NOTIFY_TEST: (HW_ACC_CTR_ARRAY_SIZE + 1) separate 2MiB allocations,
+	 * one GPU store each to fill all HW AC slots and force LRU eviction.
+	 */
+	int n_notify_slots = HW_ACC_CTR_ARRAY_SIZE + 1;
+	void *notify_ptrs = NULL;
+
+	uint32_t exec_queues[n_exec_queues];
+	int i;
+
+	if (flags & NOTIFY_TEST) {
+		/*
+		 * trigger=1000: high enough that TRIGGER never fires on a
+		 * single-store-per-region batch, but non-zero so counting is
+		 * enabled (trigger=0 disables per BSpec).
+		 */
+		acc_param.trigger = 1000;
+		acc_param.notify = trigger;
+		acc_param.granularity = ACC_GRAN_2M;
+	}
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	/*
+	 * Allocate the per-queue execution buffer from system memory.
+	 * Alignment to SZ_2M ensures it falls on a clean 2MiB boundary so the
+	 * GPU sees deterministic huge-page regions.
+	 */
+	data = aligned_alloc(SZ_2M, slot_buf_size);
+	igt_assert(data);
+	memset(data, 0, slot_buf_size);
+
+	/*
+	 * Bind the whole user VA space with CPU_ADDR_MIRROR so that any
+	 * subsequent aligned_alloc / malloc address is automatically
+	 * GPU-accessible on demand (page faults resolved by SVM infra).
+	 *
+	 * Pass a user-fence so we know the bind has landed before submitting
+	 * any GPU work.
+	 */
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	bind_system_allocator(sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+	if (!(flags & NC_TEST))
+		xe_vm_madvise(fd, vm, 0, 0x1ull << va_bits, 0,
+			      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
+			      DRM_XE_MIGRATE_ALL_PAGES, 0);
+	data[0].vm_sync = 0;
+
+	/*
+	 * For NOTIFY_TEST allocate (HW_ACC_CTR_ARRAY_SIZE + 1) independent
+	 * 2MiB regions.  Each is a separate aligned_alloc so each one maps to
+	 * a distinct 2MiB GPU virtual address region — this is what drives the
+	 * AC slot fill and the LRU-eviction / NOTIFY path.
+	 *
+	 */
+	if (flags & NOTIFY_TEST) {
+		notify_ptrs = aligned_alloc(SZ_2M, SZ_2M * n_notify_slots);
+		igt_assert(notify_ptrs);
+		memset(notify_ptrs, 0, SZ_2M * n_notify_slots);
+
+	}
+
+	/* Create exec queues with access-counter parameter extension */
+	for (i = 0; i < n_exec_queues; i++)
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
+						      to_user_pointer(&acc_param));
+
+	xe_start_tracing();
+	for (i = 0; i < n_exec_queues; i++) {
+		uint64_t batch_addr =
+			to_user_pointer(data) +
+			(uint64_t)((char *)&data[i].batch - (char *)data);
+		uint32_t *bp = data[i].batch;
+		int b = 0;
+
+		if (flags & NOTIFY_TEST) {
+			igt_info("NOTIFY_TEST: batch with %d stores across "
+				 "%d individual 2MiB regions (system alloc)\n",
+				 n_notify_slots, n_notify_slots);
+
+			for (int s = 0; s < n_notify_slots; s++) {
+				uint64_t sdi_addr = to_user_pointer(notify_ptrs + s * SZ_2M);
+
+				bp[b++] = MI_STORE_DWORD_IMM_GEN4;
+				bp[b++] = lower_32_bits(sdi_addr);
+				bp[b++] = upper_32_bits(sdi_addr);
+				bp[b++] = s;
+			}
+		} else {
+			uint64_t sdi_addr =
+				to_user_pointer(data) +
+				(uint64_t)((char *)&data[i].data - (char *)data);
+
+			for (int store = 0; store < num_stores * 50; store++) {
+				bp[b++] = MI_STORE_DWORD_IMM_GEN4;
+				bp[b++] = lower_32_bits(sdi_addr);
+				bp[b++] = upper_32_bits(sdi_addr);
+				bp[b++] = store;
+			}
+		}
+
+		bp[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync[0].addr =
+			to_user_pointer(data) +
+			(uint64_t)((char *)&data[i].exec_sync - (char *)data);
+
+		exec.exec_queue_id = exec_queues[i];
+		exec.address = batch_addr;
+
+		xe_exec(fd, &exec);
+	}
+
+	/*
+	 * Allow time for the access counter interrupt to reach the driver
+	 * before we validate the trace.
+	 */
+	sleep(2);
+
+	for (i = 0; i < n_exec_queues; i++)
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, 0,
+			       FIVE_SEC);
+
+	if (flags & NOTIFY_TEST)
+		xe_validate_acc_trace(fd, 1, "NOTIFY");
+	else if (!(flags & NC_TEST) && (trigger == num_stores))
+		xe_validate_acc_trace(fd, 1, "TRIGGER");
+	else
+		xe_validate_acc_trace(fd, 0, NULL);
+
+	xe_stop_tracing();
+
+	/* Validate results for TRIGGER subtests */
+	if (!(flags & NOTIFY_TEST)) {
+		for (i = 0; i < n_exec_queues; i++)
+			igt_assert_eq(data[i].data, (uint32_t)(num_stores * 50 - 1));
+	}
+
+
+	/* Destroy exec queues */
+	for (i = 0; i < n_exec_queues; i++)
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+
+	/* Free NOTIFY_TEST regions */
+	if (flags & NOTIFY_TEST) {
+		free(notify_ptrs);
+	}
+
+	/* Unbind the system allocator mapping, then tear down the VM */
+	unbind_system_allocator();
+	xe_vm_destroy(fd, vm);
+
+	free(data);
+}
+
+int igt_main()
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture () {
+		struct timespec tv = {};
+		bool supports_faults;
+		int ret = 0;
+		int timeout = igt_run_in_simulation() ? 20 : 2;
+
+		fd = drm_open_driver(DRIVER_XE);
+
+		igt_require(xe_has_vram(fd));
+		do {
+			if (ret)
+				usleep(5000);
+			ret = xe_supports_faults(fd);
+		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < timeout);
+
+		supports_faults = !ret;
+		igt_require(supports_faults);
+
+		va_bits = xe_va_bits(fd);
+	}
+
+	/*
+	 * TRIGGER fires: store count == trigger threshold, system allocator
+	 * provides GPU access to malloc'd memory via CPU_ADDR_MIRROR.
+	 */
+	igt_subtest("access-trigger-one-execqueue")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 1, 0);
+
+	igt_subtest("no-access-trigger-one-execqueue")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 1, NC_TEST);
+
+	/*
+	 * TRIGGER fires across multiple exec queues.
+	 */
+	igt_subtest("access-trigger-many-execqueues")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 4, 0);
+
+	/*
+	 * TRIGGER must NOT fire with many exec queues when count < threshold.
+	 */
+	igt_subtest("no-access-trigger-many-execqueues")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 4, NC_TEST);
+
+	/*
+	 * NOTIFY path: 257 distinct 2MiB system-allocator regions force AC
+	 * slot overflow and the LRU-eviction / NOTIFY interrupt.
+	 */
+	igt_subtest("access-notify") {
+		xe_for_each_engine(fd, hwe) {
+			test_exec(fd, TRIGGER, TRIGGER, hwe, 1, NOTIFY_TEST);
+			break; /* one engine is sufficient */
+		}
+	}
+
+	/*
+	 * Negative: trigger threshold far above actual store count — no AC
+	 * event should fire.
+	 */
+	igt_subtest("access-trigger-negative")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, TRIGGER + 400, TRIGGER, hwe, 1, 0);
+
+	igt_fixture ()
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae..7cc23222a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -281,6 +281,8 @@ intel_kms_progs = [
 
 intel_xe_progs = [
 	'xe_wedged',
+        'xe_access_counter',
+        'xe_access_counter_sa',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.34.1

