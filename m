Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172D5C61DFD
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 17:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1C310E60D;
	Mon, 31 Aug 2026 17:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/zxHATU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD8010EA40
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788198927; x=1819734927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EKzylEjMvlQVH9srE4vAveAiTGuGI9ehETNiY3dR9o4=;
 b=i/zxHATU6UcM4R1+aj7nI8BWhH2vGGYrRHE3/0s+QwjYOMgGL5aB69Pg
 ywKgkidBufSiGJvWb0rkcvcdRYhIWUFgfd7Vxh0cc5hiSTv6O1EPKCuqG
 mVoDWrZMkYH33xqQqochvQRWu03QbLYxdsQbWzuvTxqiYCyXz9LlZYyRq
 jC4Xb79WAyOizP0lZRLz0AQ6D0gkXle8mN4tDUkEjgm1SjHBTcq7LiH9T
 q18jKBQmgnGpa5GA7G9u9xGQiDW4I4J5LTUPzR0HTk7Mbyj7fZm79FU+X
 xi2pfyBA828R0Kbp30i9fS7bNw0+W11xhfd2A7WlRbbaOz4E13edSQxzy g==;
X-CSE-ConnectionGUID: rRbLCrszSpqffbUTCIxINg==
X-CSE-MsgGUID: FkSqdzL8SFSKGn1Eqvukcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99774494"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="99774494"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:55:27 -0700
X-CSE-ConnectionGUID: AHrj1hJuSdqdNzG34bYqPQ==
X-CSE-MsgGUID: OVhMFePYROuunEwdrOXvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="265146852"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:55:25 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 3/3] tests/intel/xe_exec_basic: Add old-point timeline
 regression test
Date: Mon, 31 Aug 2026 19:55:11 +0200
Message-ID: <20260831175512.1379368-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831175512.1379368-1-jan.maslak@intel.com>
References: <20260831175512.1379368-1-jan.maslak@intel.com>
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

Add a focused xe_exec regression test for waiting on an older completed
timeline point after the same syncobj has advanced to a later point.

Submit two Xe workloads that signal points 1 and 2 on the same timeline,
then submit a third workload with point 1 as its input dependency. Use a
binary completion syncobj for the final submission so the test remains
focused on timeline input handling, and verify that the batch executes.

This reproduces the sequence that exposed the NULL-fence dereference in
xe_exec. The generic timeline variants always wait on the latest bind
point and therefore do not cover this case.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_exec_basic.c | 156 ++++++++++++++++++++++++++++++++----
 1 file changed, 141 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index a00f3dfb91..72194387a7 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -19,6 +19,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include <stddef.h>
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES 16
@@ -46,6 +47,129 @@ wait_syncobj(int fd, uint32_t handle, enum syncobj_mode mode, uint64_t point)
 		igt_assert(syncobj_wait(fd, &handle, 1, INT64_MAX, 0, NULL));
 }
 
+struct xe_exec_data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+};
+
+static void
+write_store_dword_batch(struct xe_exec_data *data, uint64_t addr,
+			uint32_t value)
+{
+	unsigned int b = 0;
+
+	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	data->batch[b++] = addr;
+	data->batch[b++] = addr >> 32;
+	data->batch[b++] = value;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+}
+
+/**
+ * SUBTEST: timeline-syncobj-exec-completed-point-in
+ * Description: Submit xe_exec with an input dependency on an older completed
+ *              timeline point after the same syncobj has advanced to a later
+ *              point, and verify the batch completes.
+ * Test category: functionality test
+ */
+
+static void
+test_timeline_syncobj_exec_completed_point_in(
+	int fd, struct drm_xe_engine_class_instance *eci)
+{
+	struct xe_exec_data *data;
+	struct drm_xe_sync signal_sync;
+	struct drm_xe_sync exec_sync[2];
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+	};
+	const uint32_t prime_value = 0x1234abcd;
+	const uint32_t expected = 0xc0ffee;
+	const uint64_t addr = 0x1a0000;
+	uint64_t point1 = 1;
+	uint64_t point2 = 2;
+	uint64_t sdi_addr;
+	size_t bo_size;
+	uint32_t vm;
+	uint32_t bo;
+	uint32_t exec_queue;
+	uint32_t input_syncobj;
+	uint32_t completion_syncobj;
+
+	bo_size = xe_bb_size(fd, sizeof(*data));
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	sdi_addr = addr + offsetof(struct xe_exec_data, data);
+
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
+	exec.exec_queue_id = exec_queue;
+	exec.address = addr + offsetof(struct xe_exec_data, batch);
+	input_syncobj = syncobj_create(fd, 0);
+
+	/* Signal point 1 from Xe work. */
+	write_store_dword_batch(data, sdi_addr, prime_value);
+	signal_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = input_syncobj,
+		.timeline_value = point1,
+	};
+	exec.syncs = to_user_pointer(&signal_sync);
+	exec.num_syncs = 1;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_timeline_wait(fd, &input_syncobj, &point1, 1,
+					 INT64_MAX, 0, NULL));
+	igt_assert_eq(data->data, prime_value);
+
+	/* Advance the same timeline to point 2. */
+	data->data = 0;
+	write_store_dword_batch(data, sdi_addr, prime_value);
+	signal_sync.timeline_value = point2;
+	xe_exec(fd, &exec);
+	igt_assert(syncobj_timeline_wait(fd, &input_syncobj, &point2, 1,
+					 INT64_MAX, 0, NULL));
+	igt_assert_eq(data->data, prime_value);
+
+	/*
+	 * Wait on the already-completed point 1 after point 2 has completed.
+	 * The binary output keeps this test focused on the timeline input.
+	 */
+	data->data = 0;
+	write_store_dword_batch(data, sdi_addr, expected);
+	completion_syncobj = syncobj_create(fd, 0);
+	exec_sync[0] = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
+		.handle = input_syncobj,
+		.timeline_value = point1,
+	};
+	exec_sync[1] = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = completion_syncobj,
+	};
+	exec.syncs = to_user_pointer(exec_sync);
+	exec.num_syncs = ARRAY_SIZE(exec_sync);
+	xe_exec(fd, &exec);
+
+	igt_assert(syncobj_wait(fd, &completion_syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert_eq(data->data, expected);
+
+	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
+	syncobj_destroy(fd, completion_syncobj);
+	syncobj_destroy(fd, input_syncobj);
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: once-%s
  * Description: Run %arg[1] test only once
@@ -168,12 +292,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t exec_sync_points[MAX_N_EXEC_QUEUES] = {};
 	size_t bo_size;
 	uint32_t bo = 0;
-	struct {
-		uint32_t batch[16];
-		uint64_t pad;
-		uint32_t data;
-	} *data;
-	int i, b;
+	struct xe_exec_data *data;
+	int i;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 	igt_assert_lte(n_vm, MAX_N_EXEC_QUEUES);
@@ -260,20 +380,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < n_execs; i++) {
 		int cur_vm = i % n_vm;
 		uint64_t __addr = addr[cur_vm];
-		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_offset = i * sizeof(*data) +
+					offsetof(struct xe_exec_data, batch);
 		uint64_t batch_addr = __addr + batch_offset;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_offset = i * sizeof(*data) +
+				     offsetof(struct xe_exec_data, data);
 		uint64_t sdi_addr = (flags & SPARSE ? sparse_addr[i % n_vm] :
 				     __addr)+ sdi_offset;
 		int e = i % n_exec_queues;
 
-		b = 0;
-		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-		data[i].batch[b++] = sdi_addr;
-		data[i].batch[b++] = sdi_addr >> 32;
-		data[i].batch[b++] = 0xc0ffee;
-		data[i].batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+		write_store_dword_batch(&data[i], sdi_addr, 0xc0ffee);
 
 		if (use_timeline) {
 			exec_sync[0] = (struct drm_xe_sync) {
@@ -594,10 +710,20 @@ register_multigpu_exec_subtest(const struct exec_setup_variant *setup,
 int igt_main()
 {
 	int fd;
+	struct drm_xe_engine_class_instance *hwe;
 
 	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
 
+	igt_subtest_with_dynamic("timeline-syncobj-exec-completed-point-in") {
+		require_syncobj_mode(fd, SYNC_MODE_TIMELINE);
+		xe_for_each_engine(fd, hwe)
+			igt_dynamic_f("%s%d",
+				      xe_engine_class_short_string(hwe->engine_class),
+				      hwe->engine_instance)
+			test_timeline_syncobj_exec_completed_point_in(fd, hwe);
+	}
+
 	for (const struct exec_setup_variant *setup = exec_setup_variants;
 	     setup->name; setup++)
 		for (const struct workload_variant *workload = workload_variants;
-- 
2.43.0

