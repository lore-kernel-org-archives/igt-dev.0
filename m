Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A440C27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 12:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBFB10E89B;
	Wed, 26 Jun 2024 12:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTn+luER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1681410E89B
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719406297; x=1750942297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r6ZRSndAiqpUCMedGr2A4waq9LY8CONGkVUZOsNMeG8=;
 b=eTn+luERE6Ln5UMSmmbPuvSLHHjNTGCCUHg0yPXKiBMhg4MYTDd+xyYk
 /JlahuWnvhAxojPXhEFfTp7ql3nXMYOgHlC4bsRHqKA2v4WOa4+syEJav
 WrHhH9N5equzci0FOVnoByrdbc2nIc4jfcTcHAW3T/3Baz8aFj5N6SsQd
 DMJ+bEIMkvVXtUhLRLxiSHcmp7FUgPgk+2wDZ6I2UR3FabmrlY989XOn8
 MC5paF2/e6+0pmNg1yEtjj4PZd+GnVPKm/fMsXD9g6w6AI8Qp1NCPFi0s
 yCCXV0MiclGiyFpb6mP6VL3sa2RLxit1r6KqUxZeRChhaku8TeW9Z//iE Q==;
X-CSE-ConnectionGUID: 7ijDz1aORNWAHcebSNLr7Q==
X-CSE-MsgGUID: RQ+CvK+TRBaYQG+gbnnWEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27065288"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="27065288"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 05:51:37 -0700
X-CSE-ConnectionGUID: pCLB40e/TfaapUDGi+xpcQ==
X-CSE-MsgGUID: 74QYzTGhRryH7dooil+adA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43884505"
Received: from aantonov-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.249.39.2])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 05:51:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_fault_mode: Add
 preempt_faulting test
Date: Wed, 26 Jun 2024 14:51:26 +0200
Message-ID: <20240626125127.2279505-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626125127.2279505-1-francois.dugast@intel.com>
References: <20240626125127.2279505-1-francois.dugast@intel.com>
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

Test Xe KMD capability to preempt a low-priority long running faulting
job with a high-priority dma-fence job. The code follows the pattern
of existing xe_exec_compute_mode tests but with a call to xe_preempter.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_compute_mode.c |  1 -
 tests/intel/xe_exec_fault_mode.c   | 94 ++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 389de7ca4..42fc4b6e7 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -542,7 +542,6 @@ igt_main
 	igt_subtest("lr-mode-workload")
 		lr_mode_workload(fd);
 
-
 	igt_fixture
 		drm_close_driver(fd);
 }
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index b022f97d3..060cef8bb 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -21,6 +21,7 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES	16
@@ -345,6 +346,94 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		close(map_fd);
 }
 
+/**
+ * SUBTEST: preempt-faulting
+ * Description: Preempt a low priority LR faulting job with a high prio dma-fence one
+ * Test category: functionality test
+ */
+#define VM_DATA		0
+#define SPIN_DATA	1
+#define DATA_COUNT	2
+static void preempt_faulting(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE},
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct drm_xe_ext_set_property ext_prio = {
+		.base.next_extension = 0,
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+		.value = 0, /* Low priority */
+	};
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[16];
+		uint64_t vm_sync;
+		uint32_t data;
+		uint64_t exec_sync;
+	} *data = NULL;
+	struct xe_spin_opts spin_opts = { .preempt = false };
+	size_t bo_size;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t bo = 0;
+	uint64_t ext = 0;
+	const uint64_t duration_ns = NSEC_PER_SEC / 10; /* 100ms */
+	struct timespec tv;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	bo_size = sizeof(*data) * DATA_COUNT;
+	bo_size = xe_bb_size(fd, bo_size);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id), 0);
+	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
+
+	ext = to_user_pointer(&ext_prio);
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, ext);
+
+	sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
+	xe_vm_bind_async(fd, vm, hwe->gt_id, bo, 0,
+			       addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	data[VM_DATA].vm_sync = 0;
+
+	spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
+	spin_opts.preempt = true;
+	spin_opts.ctx_ticks = duration_to_ctx_ticks(fd, 0, duration_ns);
+	xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
+	sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
+	exec.exec_queue_id = exec_queue;
+	exec.address = spin_opts.addr;
+
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(&data[SPIN_DATA].spin);
+	igt_gettime(&tv);
+	xe_preempter(fd, hwe);
+	/*
+	 * Check the preempter did not wait but really preempted and as a consequence
+	 * its execution duration only lasted a small part of the spinner duration.
+	 */
+	igt_assert(igt_nsec_elapsed(&tv) < 0.5 * duration_ns);
+	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+
+	sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -455,6 +544,11 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
 
+	igt_subtest("preempt-faulting")
+		xe_for_each_engine(fd, hwe)
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+				preempt_faulting(fd, hwe);
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.43.0

