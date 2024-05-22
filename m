Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD7DC25B7A
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 09:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAC610EC4C;
	Wed, 22 May 2024 09:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qq11bX5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C4A10EE21
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 09:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716371264; x=1747907264;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CXG8XzTEhVw/FuDrU3TomI553jNYzNSPnP09sxw+juU=;
 b=Qq11bX5Md+v224iki9S9BJxkZ85nRve1jrkWVX8V9cyZW0C/BSBHPSLQ
 wgvlx8ndTasbBanSsIEA2NBfno+Oqz2y2/rDPM//zw0nNtpbk9sFU8z0B
 2gTi2ZModWt1h0OvSkXjHIMwveuWapz1XM9Uq1gNQkeKFnXPObSX4jvF0
 P5j4qVAK83xxirQg0rhJK8PRUvCiLeJv/wXYpQmCp3zn6ELk5hQAW614g
 bjt2pwPV82dqBu0zipOQR9R7u5l8qLMY+H4QBvJ+tIV/lA/N2TnQ81FJB
 QpbZe5I9jajTSYfkTIf7SJzMvotb7+abhnq9UYQnVqZgHoq9o+43FfXgZ w==;
X-CSE-ConnectionGUID: V9Hi4M7UQ+2T/POgHM5pBw==
X-CSE-MsgGUID: ixk4v53kR/amCkHMtl0E/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12728517"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="12728517"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 02:47:44 -0700
X-CSE-ConnectionGUID: QNnLXRsAR+ypm2Ks0gWMFg==
X-CSE-MsgGUID: hlIrUkfLQhC6b2UyAzPX9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="64072148"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa002.jf.intel.com with ESMTP; 22 May 2024 02:47:42 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t] tests/intel/xe_tlb: Check TLB invalidation
Date: Wed, 22 May 2024 15:17:40 +0530
Message-Id: <20240522094740.32684-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test validates TLB invalidation by binding different buffer objects
with the same vma and submitting workload simultaneously, Ideally
expecting gpu to handle pages by invalidating and  avoding page faults.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_tlb.c | 178 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 tests/intel/xe_tlb.c

diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
new file mode 100644
index 000000000..8e6dba5a3
--- /dev/null
+++ b/tests/intel/xe_tlb.c
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: MIT */
+/*
+* Copyright © 2024 Intel Corporation
+*
+* Authors:
+*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
+*/
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe_drm.h"
+
+/**
+ * TEST: Check Translation Lookaside Buffer Invalidation.
+ * Category: Software building block
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: TLB invalidate
+ * Test category: functionality test
+ */
+
+struct data {
+	uint32_t batch[16];
+	uint32_t data;
+	uint64_t addr;
+};
+
+static void store_dword_batch(struct data *data, uint64_t addr, int value)
+{
+	int b;
+	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
+	uint64_t batch_addr = addr + batch_offset;
+	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
+	uint64_t sdi_addr = addr + sdi_offset;
+
+	b = 0;
+	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data->batch[b++] = sdi_addr;
+	data->batch[b++] = sdi_addr >> 32;
+	data->batch[b++] = value;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+
+	data->addr = batch_addr;
+}
+
+const char *xe_trace_enable_path =
+				"/sys/kernel/debug/tracing/events/xe/enable";
+const char *trace_path = "/sys/kernel/tracing/trace";
+
+static bool sysfs_write(const char *file, const char *value)
+{
+	FILE *fp = fopen(file, "w");
+
+	igt_assert_f(fp, "error in opening file %s\n", file);
+	igt_assert_f(fwrite(value, 1, strlen(value), fp) == strlen(value),
+			"failed to update sysfs tracing node %s\n", file);
+	fclose(fp);
+	return 0;
+}
+
+static void start_tracing(void)
+{
+	sysfs_write(xe_trace_enable_path, "1");
+}
+
+static void validate_debugfs_trace(int fd)
+{
+	igt_assert(igt_debugfs_search(fd, trace_path, "tlb_invalidation_fence_create"));
+}
+
+static void stop_tracing(void)
+{
+	sysfs_write(xe_trace_enable_path, "0");
+}
+
+/**
+ * SUBTEST: basic-tlb
+ * Description: Check Translation Lookaside Buffer Invalidation.
+ */
+static void tlb_invalidation(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct data *data1;
+	struct data *data2;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t bind_engine;
+	uint32_t syncobj;
+	size_t bo_size;
+	int value1 = 0x123456;
+	int value2 = 0x123465;
+	uint64_t addr = 0x100000;
+	uint32_t bo1, bo2;
+
+	syncobj = syncobj_create(fd, 0);
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[1].handle = syncobj;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data1);
+	bo_size = xe_bb_size(fd, bo_size);
+
+	bo1 = xe_bo_create(fd, vm, bo_size,
+				   vram_if_possible(fd, eci->gt_id),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bo2 = xe_bo_create(fd, vm, bo_size,
+				   vram_if_possible(fd, eci->gt_id),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	start_tracing();
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
+	xe_vm_bind_async(fd, vm, bind_engine, bo1, 0, addr, bo_size, sync, 1);
+	data1 = xe_bo_map(fd, bo1, bo_size);
+
+	store_dword_batch(data1, addr, value1);
+	exec.exec_queue_id = exec_queue;
+	exec.address = data1->addr;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+
+	xe_vm_bind_async(fd, vm, bind_engine, bo2, 0, addr, bo_size, sync, 1);
+	data2 = xe_bo_map(fd, bo2, bo_size);
+
+	store_dword_batch(data2, addr, value2);
+	exec.exec_queue_id = exec_queue;
+	exec.address = data2->addr;
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+
+	igt_assert_eq(data1->data, value1);
+	igt_assert_eq(data2->data, value2);
+	validate_debugfs_trace(fd);
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobj);
+	munmap(data1, bo_size);
+	munmap(data2, bo_size);
+	gem_close(fd, bo1);
+	gem_close(fd, bo2);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	int fd;
+	struct drm_xe_engine *engine;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("basic-tlb") {
+		engine = xe_engine(fd, 0);
+		tlb_invalidation(fd, &engine->instance);
+	}
+
+	igt_fixture {
+		stop_tracing();
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 758ae090c..e4fee5ca0 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -316,6 +316,7 @@ intel_xe_progs = [
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
 	'xe_sysfs_scheduler',
+	'xe_tlb',
 ]
 
 msm_progs = [
-- 
2.39.1

