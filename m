Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42A1C5DF7A
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 20:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C99410E44F;
	Mon, 17 Aug 2026 20:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4JnUKZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B83010E44F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 20:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786996839; x=1818532839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uMW1TC/puB7/vgO+DYdj71bBltPaHXRPWkKm+kAF7oA=;
 b=n4JnUKZO75bwtH2KRWunF1dQbiMb5oa54pKLdAvq5oVBkML8KpS/p5ZF
 uA2VkdXEfMxolO8GFmvGY7Z5vyHopjAQGAYmtOExC7IfhlztfUmKRiw1g
 YfpYE8hz14IXmChIth9J8BzB5Gez/zUrTZOMqdxtDtZetLxCBbFA6Orsm
 DNwqg2aeLt3Oz7fqwKGsoV52BVLduKLm5bIMT98EApHZKsL/niYZM6Cn6
 VHRHZ/GKmA5gml9jgUbmUyX954eGYHdf6ANAGVfGmyacROc7+UX1C9aCX
 IYtj0E3pKF+OrVhrnJxCRQZo7Km9HIQvaSiNSH3zk6gjsc1NsMIJQYCs2 A==;
X-CSE-ConnectionGUID: uU09iK53QF+UhPidIxMHOg==
X-CSE-MsgGUID: DYlJHQr/SPOKFEHclyFMYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87688335"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="87688335"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 13:00:39 -0700
X-CSE-ConnectionGUID: PjVdoEE1SP2+IksJKQuYtQ==
X-CSE-MsgGUID: hzO2A9lSQRyZSRVNjkEaGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="303243746"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2031NVLP.iind.intel.com) ([10.190.232.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 13:00:38 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t] tests/intel/xe_exec_mix_modes: Add multi-queue LR spinner
 switch subtest
Date: Mon, 17 Aug 2026 20:00:28 +0000
Message-ID: <20260817200029.16006-1-jagmeet.randhawa@intel.com>
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

Each spinner is armed with a queue-switch semaphore
(multi_queue_switch_on_wait + xe_spin_preempt_wait) so it yields the
shared engine to its sibling once scheduled, instead of busy-looping
and starving the rest of the group. This lets every queue in the group
be genuinely resident when the interrupting job forces the mode
switch, exercising suspend/resume of the secondary queues rather than
just the primary.

The dma-fence and LR (preempt) multi-queue suspend/resume paths are
already covered by the userptr-invalidation tests; this adds the
missing FAULT-mode coverage.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_mix_modes.c | 111 ++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index 209825f58..d9ebb8283 100644
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
@@ -221,6 +223,104 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
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
+	int64_t timeout_short = 1;
+	uint64_t vm_sync = 0;
+	size_t bo_size, spin_size;
+	uint32_t vm, bo;
+	void *map;
+	int i;
+
+	igt_require(xe_has_multi_queue_engine(fd));
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
+				  .multi_queue_switch_on_wait = true);
+		xe_spin_preempt_wait(spin[i]);
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
+	/* Spinners must have been suspended, not completed, during the switch. */
+	for (i = 0; i < N_GROUP_QUEUES; i++)
+		igt_assert_neq(0, __xe_wait_ufence(fd, &spin[i]->exec_sync,
+						   USER_FENCE_VALUE, exec_queues[i],
+						   &timeout_short));
+
+	for (i = 0; i < N_GROUP_QUEUES; i++) {
+		xe_spin_end(spin[i]);
+		xe_spin_preempt_nowait(spin[i]);
+	}
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
@@ -235,6 +335,11 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
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
@@ -243,6 +348,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
 	enum engine_execution_mode engine_execution_mode;
 	enum job_type job_type;
 
+	if (flags & FLAG_MULTI_QUEUE) {
+		run_job_multi_queue(fd, hwe);
+		return;
+	}
+
 	if (flags & FLAG_EXEC_MODE_LR)
 		engine_execution_mode = EXEC_MODE_LR;
 	else
@@ -267,6 +377,7 @@ int igt_main()
 		{ "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
 		{ "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
 		{ "spinner-interrupted-dma-fence", 0 },
+		{ "multi-queue-spinner-interrupted-lr", FLAG_EXEC_MODE_LR | FLAG_MULTI_QUEUE },
 		{ NULL },
 	};
 	int fd;
-- 
2.43.0

