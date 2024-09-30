Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EF2CE8364
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 16:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C829D10E263;
	Mon, 30 Sep 2024 16:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEth3pYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D219910E263
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727713080; x=1759249080;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LPJeWeHlaK0hyFYcVuP662R+P2HplJFKdnJNhLNOQNM=;
 b=QEth3pYtsaHJXpyfkOWhFEfC20AxrAv0sFy3iU7Ylp9gduMVrFAbvc3M
 DOj5kIrzryFu72H+mhE5alPJOYoq30aVu9RdEuAMa2C188YJS+K/o/SoZ
 xfQH6E+1J6SEm/gf1GBm42xfptRgDjDo3h7a0paCLNABXUqmMwP9/fEvQ
 UqD/wslQxIPMsUxYte6zb56ySkWI1lenSwjrmy1G+s7fkMHlET1qi5HsL
 vKc2FoJPzdlBVy+vaAQ5v+SWvwyw1S33uxZsv63nthmxMeSsxMf8klWf/
 QBAdBF1b5E7YZyHWxT5n/rH61f8WuRrCbLMuuCZzzsO7rf2fji1kYhmSf Q==;
X-CSE-ConnectionGUID: GW7FbKDDT161TJFALSGVKA==
X-CSE-MsgGUID: gx3azfq9ROW0jFTj0DQqqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44272302"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="44272302"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 09:17:59 -0700
X-CSE-ConnectionGUID: 3+c7sGl+TF+uOzI8qGhRCw==
X-CSE-MsgGUID: CD7iDeHITnOadZkg8/5kzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73230298"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa010.jf.intel.com with ESMTP; 30 Sep 2024 09:17:57 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, nirmoy.das@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t v3] tests/intel/xe_tlb: Add test to check TLB
 invalidation
Date: Mon, 30 Sep 2024 21:56:09 +0530
Message-Id: <20240930162609.2089507-1-sai.gowtham.ch@intel.com>
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

v2: Validating tlb_invalidation counts with pre and post increment counter
    values, rather complete stats.

v3: Move xe_tlb_count to lib making it generic to all stat entries. which returns
    the counter of a given stat.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/xe/xe_gt.c       |  25 ++++++++
 lib/xe/xe_gt.h       |   1 +
 tests/intel/xe_tlb.c | 148 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 4 files changed, 175 insertions(+)
 create mode 100644 tests/intel/xe_tlb.c

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 36e8fde36..dfc60e2ff 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -141,3 +141,28 @@ void xe_post_hang_ring(int fd, igt_hang_t arg)
 	xe_vm_destroy(fd, arg.spin->vm);
 }
 
+/**
+ * xe_tlb_count:
+ * @fd: open xe drm file descriptor
+ * @gt: gt_id
+ *
+ * This function returns the counter for a given stat.
+ */
+int xe_tlb_count(int fd, int gt, const char *stat)
+{
+	FILE *f;
+	char tlb_path[4096];
+	char path[256];
+	int count;
+
+	sprintf(path, "/sys/kernel/debug/dri/0/gt%d/stats", gt);
+	f = fopen(path, "r");
+
+	while (fgets(tlb_path, sizeof(tlb_path), f)) {
+		if (strstr(tlb_path, stat) != NULL) {
+			sscanf(tlb_path, "%*[^:]: %d", &count);
+			break;
+		}
+	}
+	return count;
+}
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 6fa05d6a9..7910587ac 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -13,3 +13,4 @@ void xe_force_gt_reset_all(int fd);
 igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
 				unsigned int flags);
 void xe_post_hang_ring(int fd, igt_hang_t arg);
+int xe_tlb_count(int fd, int gt, const char *stat);
diff --git a/tests/intel/xe_tlb.c b/tests/intel/xe_tlb.c
new file mode 100644
index 000000000..399384f5b
--- /dev/null
+++ b/tests/intel/xe_tlb.c
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: MIT */
+/*
+* Copyright © 2024 Intel Corporation
+*
+* Authors:
+*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
+*/
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "xe/xe_gt.c"
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
+	const char *stat = "tlb_inval_count";
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
+	tlb_pre = xe_tlb_count(fd, eci->gt_id, stat);
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
+	tlb_pos = xe_tlb_count(fd, eci->gt_id, stat);
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
index 0782d3cc7..b0a490ccb 100644
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

