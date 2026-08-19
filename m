Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABD7C5DF85
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 19:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0674F10EEAF;
	Wed, 19 Aug 2026 19:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1EQAkEb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E348710E109
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787168381; x=1818704381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cuQmfXzkyXw2R3+KITmSgWhI+w7KEswdqzzB22fSdYs=;
 b=Y1EQAkEbfg+enrkKKXE3jPYI1y826BQC0rlnx1OkGEsUqoIA1CPl+A73
 WubLa7X2/sX+7A/33NvbVXdSGGHriPIg2ItvvrEXj6j0xykERVDg2mE4z
 GFc8kF+UcX2aLYvxXQZo1+ZwOplpE/FGoBWACtW1miMzcWVY/6o6UzIjP
 5lj1a5XLziuD5maFN9bOz8lysK7F+MUwgWlCoc4hgqmOxYZu2/Tx7LHsy
 TBXrNU2W5McNkv7Gai2vjKwuier7ITX3bIZbTuRQNq1CEApeXIOHeP5LE
 BjSaKh8S1D0owP6fXWsgJnD/UYnHP8c1t75OdL5LobZbtGdylWSLmUDRN w==;
X-CSE-ConnectionGUID: s0lm2XoQQza7NcXFxilBOg==
X-CSE-MsgGUID: 0tPsTMn6SrmycrHPbpiA2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87760664"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87760664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:39:40 -0700
X-CSE-ConnectionGUID: 5qvzPtQlRy2HHunSSUgNlQ==
X-CSE-MsgGUID: AWWzwubETRGxzS5W6k8fTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="270856767"
Received: from unknown (HELO DUT2031NVLP.iind.intel.com) ([10.190.232.106])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:39:39 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t,
 v2] tests/intel/xe_exec_mix_modes: Add multi-queue LR spinner switch
 subtest
Date: Wed, 19 Aug 2026 19:39:26 +0000
Message-ID: <20260819193926.4442-1-jagmeet.randhawa@intel.com>
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

Add exec-multi-queue-spinner-interrupted-lr, which runs preemptible
spinners on every queue in a multi-queue exec queue group in long
running mode, then submits a dma-fence job on the same engine to force
the group from FAULT into DMA_FENCE mode.

Each spinner uses a multi-queue switch point (multi_queue_switch) so it
yields the shared engine to its sibling once scheduled, instead of
busy-looping and starving the rest of the group. This lets every queue
in the group be genuinely resident when the interrupting job forces the
mode switch, exercising suspend/resume of the secondary queues rather
than just the primary.

The dma-fence and LR (preempt) multi-queue suspend/resume paths are
already covered by the userptr-invalidation tests; this adds the
missing FAULT-mode coverage.

v2: (Niranjana)
- Use a plain multi_queue_switch point; drop xe_spin_preempt_wait/nowait().
- Drop the redundant "still pending" ufence check before ending the spinners.
- Move the capability check to test_exec() and assert FLAG_EXEC_MODE_LR.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_mix_modes.c | 101 ++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index 209825f58..373058277 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -27,6 +27,7 @@
 
 #define FLAG_EXEC_MODE_LR	(0x1 << 0)
 #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
+#define FLAG_MULTI_QUEUE	(0x1 << 2)
 
 #define NUM_INTERRUPTING_JOBS	1
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
@@ -34,6 +35,7 @@
 #define SPIN_DATA		1
 #define EXEC_DATA		2
 #define DATA_COUNT		3
+#define N_GROUP_QUEUES		2
 
 struct data {
 	struct xe_spin spin;
@@ -221,6 +223,92 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 	xe_vm_destroy(fd, vm);
 }
 
+static void
+run_job_multi_queue(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t exec_queues[N_GROUP_QUEUES];
+	struct xe_spin *spin[N_GROUP_QUEUES];
+	uint64_t addr[N_GROUP_QUEUES];
+	uint64_t base_addr = 0x1a0000;
+	int64_t fence_timeout = NSEC_PER_SEC;
+	uint64_t vm_sync = 0;
+	size_t bo_size, spin_size;
+	uint32_t vm, bo;
+	void *map;
+	int i;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			      DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	/* exec_queues[0] is the primary, the rest join its group. */
+	for (i = 0; i < N_GROUP_QUEUES; i++) {
+		struct drm_xe_ext_set_property multi_queue = {
+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+		};
+		uint64_t ext = to_user_pointer(&multi_queue);
+
+		multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+		exec_queues[i] = xe_exec_queue_create(fd, vm, hwe, ext);
+	}
+
+	spin_size = xe_bb_size(fd, sizeof(struct xe_spin));
+	bo_size = spin_size * N_GROUP_QUEUES;
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	map = xe_bo_map(fd, bo, bo_size);
+	for (i = 0; i < N_GROUP_QUEUES; i++) {
+		spin[i] = (struct xe_spin *)((char *)map + i * spin_size);
+		addr[i] = base_addr + i * spin_size;
+	}
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, base_addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+	vm_sync = 0;
+
+	for (i = 0; i < N_GROUP_QUEUES; i++) {
+		/* Yield the shared engine at a switch point instead of busy-spinning. */
+		xe_spin_init_opts(spin[i], .addr = addr[i], .preempt = true,
+				  .multi_queue_switch = true);
+		sync.addr = addr[i] + (char *)&spin[i]->exec_sync - (char *)spin[i];
+		exec.exec_queue_id = exec_queues[i];
+		exec.address = addr[i];
+		xe_exec(fd, &exec);
+		xe_spin_wait_started(spin[i]);
+	}
+
+	/* Force the group from FAULT into DMA_FENCE mode. */
+	run_job(fd, hwe, EXEC_MODE_DMA_FENCE, SIMPLE_BATCH_STORE, false, NULL);
+
+	for (i = 0; i < N_GROUP_QUEUES; i++)
+		xe_spin_end(spin[i]);
+
+	for (i = 0; i < N_GROUP_QUEUES; i++)
+		xe_wait_ufence(fd, &spin[i]->exec_sync, USER_FENCE_VALUE,
+			       exec_queues[i], fence_timeout);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+
+	for (i = 0; i < N_GROUP_QUEUES; i++)
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+	munmap(map, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: exec-simple-batch-store-lr
  * Description: Execute a simple batch store job in long running mode
@@ -235,6 +323,11 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
  * SUBTEST: exec-spinner-interrupted-dma-fence
  * Description: Spin in dma fence mode then get interrupted by a simple
  *              batch store job in long running mode
+ *
+ * SUBTEST: exec-multi-queue-spinner-interrupted-lr
+ * Description: Run preemptible spinners on a multi-queue exec queue group
+ *              in long running mode, then get interrupted by a simple
+ *              batch store job in dma fence mode
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
@@ -243,6 +336,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
 	enum engine_execution_mode engine_execution_mode;
 	enum job_type job_type;
 
+	if (flags & FLAG_MULTI_QUEUE) {
+		igt_assert(flags & FLAG_EXEC_MODE_LR);
+		igt_require(xe_engine_class_supports_multi_queue(fd, hwe->engine_class));
+		run_job_multi_queue(fd, hwe);
+		return;
+	}
+
 	if (flags & FLAG_EXEC_MODE_LR)
 		engine_execution_mode = EXEC_MODE_LR;
 	else
@@ -267,6 +367,7 @@ int igt_main()
 		{ "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
 		{ "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
 		{ "spinner-interrupted-dma-fence", 0 },
+		{ "multi-queue-spinner-interrupted-lr", FLAG_EXEC_MODE_LR | FLAG_MULTI_QUEUE },
 		{ NULL },
 	};
 	int fd;
-- 
2.43.0

