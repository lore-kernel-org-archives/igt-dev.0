Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212A9C30653
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 12:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D09B10E894;
	Wed, 26 Jun 2024 12:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRUpMztv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C01E10E89B
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719406296; x=1750942296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XUiVS+L8ix7PNjECb41X7jLwB76E8kF/dXyAB0R7DGA=;
 b=ZRUpMztvXmgxhk6eMCCwpAhJbiia/LvNLttsLJplZVHRtbF0HkOjaflO
 XZuYc3/A2SOCh6C3MjVRNr3v5guL9TsWCWhcjxfagMWOCw3XoSckDYoRC
 12wEMr4Gwp/f4nKAobd1Zr2+NHVJjzQRzwnL2O4eYjgaiVp6wFQX24g4F
 NEBQwsLjdZrGf1qu6jsEYDMBDO5z4Lih/ohUMszluoHgoawMGi4jEDSL6
 urNiV13c8SLBtC/ezTQMY//LbL4R1HADXx/FguPU7vd2BPTe7Kp0MrcY3
 guG2jVenBRUw7Avlq7SgCOktgdvaAbBfl1Wh9Xe+q4IvxwN8GfUamDBP3 A==;
X-CSE-ConnectionGUID: HYB/GHaxRYeMpCIb1XBR0Q==
X-CSE-MsgGUID: SvvGL9/1SYOV4j89pPct5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27065286"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="27065286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 05:51:36 -0700
X-CSE-ConnectionGUID: o9mm3JILRi2Gi98tiVocOg==
X-CSE-MsgGUID: 1AfRwlOpS42R3MVFhgB7kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43884497"
Received: from aantonov-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.249.39.2])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 05:51:35 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/spin: Promote preempter()
Date: Wed, 26 Jun 2024 14:51:25 +0200
Message-ID: <20240626125127.2279505-1-francois.dugast@intel.com>
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

The preempter code is small and self-contained so promote it by
removing it from the test file and moving it to the lib so that
it can be easily reused while also preventing code duplications.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/xe/xe_spin.c            | 86 ++++++++++++++++++++++++++++++++++++
 lib/xe/xe_spin.h            |  2 +
 tests/intel/xe_spin_batch.c | 88 +------------------------------------
 3 files changed, 89 insertions(+), 87 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 3adacc3a8..22c620667 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -366,3 +366,89 @@ uint32_t xe_cork_sync_handle(struct xe_cork *cork)
 {
 	return cork->syncobj;
 }
+
+struct data {
+	uint32_t batch[16];
+	uint64_t pad;
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
+void xe_preempter(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct drm_xe_ext_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+		.value = 2, /* High priority */
+	};
+	struct data *data;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t syncobj;
+	size_t bo_size;
+	int value = 0x123456;
+	uint64_t addr = 0x100000;
+	uint32_t bo = 0;
+
+	syncobj = syncobj_create(fd, 0);
+	sync.handle = syncobj;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data);
+	bo_size = xe_bb_size(fd, bo_size);
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, hwe->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+	data = xe_bo_map(fd, bo, bo_size);
+	store_dword_batch(data, addr, value);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &syncobj, 1);
+
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, to_user_pointer(&ext));
+	exec.exec_queue_id = exec_queue;
+	exec.address = data->addr;
+	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data->data, value);
+
+	syncobj_destroy(fd, syncobj);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index d65adb05c..b528a62e0 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -74,4 +74,6 @@ void xe_cork_wait_done(struct xe_cork *cork);
 void xe_cork_fini(struct xe_cork *cork);
 uint32_t xe_cork_sync_handle(struct xe_cork *cork);
 
+void xe_preempter(int fd, struct drm_xe_engine_class_instance *hwe);
+
 #endif	/* XE_SPIN_H */
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 4e95060d3..c4df7dbc2 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -129,92 +129,6 @@ static void spin_all(int fd, int gt, int class)
 	xe_vm_destroy(fd, vm);
 }
 
-struct data {
-	uint32_t batch[16];
-	uint64_t pad;
-	uint32_t data;
-	uint64_t addr;
-};
-
-static void store_dword_batch(struct data *data, uint64_t addr, int value)
-{
-	int b;
-	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
-	uint64_t batch_addr = addr + batch_offset;
-	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
-	uint64_t sdi_addr = addr + sdi_offset;
-
-	b = 0;
-	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-	data->batch[b++] = sdi_addr;
-	data->batch[b++] = sdi_addr >> 32;
-	data->batch[b++] = value;
-	data->batch[b++] = MI_BATCH_BUFFER_END;
-	igt_assert(b <= ARRAY_SIZE(data->batch));
-
-	data->addr = batch_addr;
-}
-
-static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
-{
-	struct drm_xe_sync sync = {
-		.flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
-	};
-	struct drm_xe_exec exec = {
-		.num_batch_buffer = 1,
-		.num_syncs = 1,
-		.syncs = to_user_pointer(&sync),
-	};
-	struct drm_xe_ext_set_property ext = {
-		.base.next_extension = 0,
-		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
-		.value = 2, /* High priority */
-	};
-	struct data *data;
-	uint32_t vm;
-	uint32_t exec_queue;
-	uint32_t syncobj;
-	size_t bo_size;
-	int value = 0x123456;
-	uint64_t addr = 0x100000;
-	uint32_t bo = 0;
-
-	syncobj = syncobj_create(fd, 0);
-	sync.handle = syncobj;
-
-	vm = xe_vm_create(fd, 0, 0);
-	bo_size = sizeof(*data);
-	bo_size = xe_bb_size(fd, bo_size);
-
-	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, hwe->gt_id),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-
-	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
-	data = xe_bo_map(fd, bo, bo_size);
-	store_dword_batch(data, addr, value);
-
-	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
-	syncobj_reset(fd, &syncobj, 1);
-
-	exec_queue = xe_exec_queue_create(fd, vm, hwe, to_user_pointer(&ext));
-	exec.exec_queue_id = exec_queue;
-	exec.address = data->addr;
-	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
-	xe_exec(fd, &exec);
-
-	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
-	igt_assert_eq(data->data, value);
-
-	syncobj_destroy(fd, syncobj);
-	munmap(data, bo_size);
-	gem_close(fd, bo);
-
-	xe_exec_queue_destroy(fd, exec_queue);
-	xe_vm_destroy(fd, vm);
-}
-
 #define SPIN_FIX_DURATION_NORMAL		0
 #define SPIN_FIX_DURATION_PREEMPT		1
 /**
@@ -290,7 +204,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 		xe_exec(fd, &exec);
 		xe_spin_wait_started(spin);
 		if (flags & SPIN_FIX_DURATION_PREEMPT)
-			preempter(fd, hwe);
+			xe_preempter(fd, hwe);
 
 		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
 		igt_stats_push_float(&stats, igt_nsec_elapsed(&tv) * 1e-6);
-- 
2.43.0

