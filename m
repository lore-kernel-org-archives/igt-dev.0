Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2F8CF6497
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 11:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F00110E008;
	Mon, 30 Sep 2024 11:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cb9MbRqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A148510E008
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 11:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727696549; x=1759232549;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oWSM/Cw8Vokt1yW3Z87DFQrA5AUcqE9mHxiY5x0ygDo=;
 b=Cb9MbRqTXnQwoMpueuDp1pckHaKSvOozxTorYKKmNpmNXb60U/wJclUJ
 DtrAhTsZGbJZhOm0qhTsL4J82l5MGZyycDx63h12cSQwq69mGPfsWd6Ew
 sMFrI81nkTBMbpj/tAHoWyvx8btcmYgHUV7z4A8agYU2Q0S6CxklNWy+Z
 LBIbaNVCJSBIMqWRvcsvKcm15eeBz0rr1b/LRyEJU+FtrZ2aMDhoD7caE
 Xk17+w7GCb6tur6Im/2YP4KdDZxnlClYH2BkNxJv96WekDPnhFBAtJcBi
 Y9v8V5LQ8LD8f8SD9oj+bjVeIX0G4GtJj12Rjdm7YosQEPIuCr4r31R6H Q==;
X-CSE-ConnectionGUID: np/8K1+GTziG03h/TitF6Q==
X-CSE-MsgGUID: 2U+ID6DVTr618oDtNqwOLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26877730"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26877730"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:42:28 -0700
X-CSE-ConnectionGUID: fWajzhTpTKWz/RPLnNJWDQ==
X-CSE-MsgGUID: zyVhZvFGTPCHmtAUbkxlBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73545754"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa006.jf.intel.com with ESMTP; 30 Sep 2024 04:42:26 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH] tests/intel/xe_tlb: Add test to check TLB invalidation
Date: Mon, 30 Sep 2024 17:20:38 +0530
Message-Id: <20240930115038.2045395-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.25.1
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
expecting gpu to handle pages by invalidating and avoding page faults.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_tlb.c | 162 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 tests/intel/xe_tlb.c

diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
new file mode 100644
index 000000000..8809d09ec
--- /dev/null
+++ b/tests/intel/xe_tlb.c
@@ -0,0 +1,162 @@
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
+#include "igt_debugfs.h"
+
+/**
+ * TEST: Check Translation Lookaside Buffer Invalidation.
+ * Category: Software building block
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: TLB invalidate
+ * Test category: functionality test
+ */
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
+static int tlb_count(int fd, int gt)
+{
+	char tlb_path[4096];
+	char path[256];
+	int count;
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%d/stats", gt);
+	igt_debugfs_dump(fd, path);
+	igt_debugfs_read(fd, path, tlb_path);
+
+	sscanf(tlb_path, "%*[^:]: %d", &count);
+	igt_info("%s\n", tlb_path);
+
+	return count;
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
+	int tlb_pre, tlb_pos;
+
+	syncobj = syncobj_create(fd, 0);
+	sync[0].handle = syncobj_create(fd, 0);
+	sync[1].handle = syncobj;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data1);
+	bo_size = xe_bb_size(fd, bo_size);
+	bo1 = xe_bo_create(fd, vm, bo_size,
+				   vram_if_possible(fd, eci->gt_id),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bo2 = xe_bo_create(fd, vm, bo_size,
+				   vram_if_possible(fd, eci->gt_id),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	tlb_pre = tlb_count(fd, eci->gt_id);
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
+	tlb_pos = tlb_count(fd, eci->gt_id);
+	igt_assert_eq(data1->data, value1);
+	igt_assert_eq(data2->data, value2);
+	igt_assert(tlb_pos > tlb_pre);
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobj);
+	munmap(data1, bo_size);
+	munmap(data2, bo_size);
+	gem_close(fd, bo1);
+	gem_close(fd, bo2);
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
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 62bde353b..844de49d1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -317,6 +317,7 @@ intel_xe_progs = [
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
         'xe_sysfs_timeslice_duration',
+        'xe_tlb',
 ]
 
 intel_xe_eudebug_progs = [
-- 
2.25.1

