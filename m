Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FD7FF886F
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 02:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C7A10EE2A;
	Wed, 29 Apr 2026 02:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSKXKu43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C15C10EE2A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 02:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777428544; x=1808964544;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1+aWsTanCeEAS7okvTE1Kd87RaDsSf/gQYqjzpwubw4=;
 b=GSKXKu43mchURhmeKVJvSjkLBsU73mQvsqxypTsWtvHsoyL1lVYbG6xS
 OXoqPxho+B+6I9r75pAAYt1pd7YaZz7rAEH+J3lUn/uF3up/c0tbJ/r+s
 KepQgQVSRre6bjdyZ55LTE4QvZtHqZk/NGBXbXFg2221gRewImdaZdZye
 W4ONWk9YsXusya/Wv3JhUDDvab8nlWTXRbz5kwchjVrt+QO0OopVOclbT
 ZzaJRbkuNRislgsGhVcyESIbOiu3hForXMrWy7+wAkqZGrRwX9V3OMSuJ
 4puTDaJEVt1VD7DwesUK5tK/gkSAoFgJRb1yu2rjBqSel8ObTIq9CsIWO w==;
X-CSE-ConnectionGUID: HCqRZON5S+OFPQkpiDqvgg==
X-CSE-MsgGUID: iUsHuw/8RkyMHDBLkrVySg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78335583"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="78335583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 19:09:03 -0700
X-CSE-ConnectionGUID: Ul+mNlMeTymXx++aCgUwWA==
X-CSE-MsgGUID: cLsCFUhQSSqKZ9J7G1jZCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="235902015"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 19:09:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] tests/intel/xe_exec_multi_queue: replace sleep with
 barrier queue
Date: Tue, 28 Apr 2026 19:08:57 -0700
Message-ID: <20260429020856.1857656-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
References: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
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

In __test_priority() DYN_PRIORITY case, replace sleep() with a
deterministic barrier using an extra queue in the same multi-queue
group. After assigning priorities, submit a spinner to the extra
queue, end it immediately and wait for its user fence to signal.
This guarantees a full scheduler round-trip confirming the priority
updates have taken effect before releasing the other queues.

Increase exec_queues[] and spin[] array sizes by 1 to accommodate
the extra barrier queue slot at index num_queues.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 37 +++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 382705d065..8c6fbb2d18 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -381,8 +381,8 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 		.syncs = to_user_pointer(&sync),
 	};
 	uint64_t vm_sync = 0, addr = BASE_ADDRESS;
-	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
-	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
+	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N + 1];
+	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N + 1];
 	uint32_t vm, num_queues, num_queue_priorities, bo = 0;
 	uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
 	int64_t fence_timeout = NSEC_PER_SEC;
@@ -403,7 +403,7 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 		.value = DRM_XE_MULTI_GROUP_CREATE,
 	};
 	uint64_t ext = to_user_pointer(&multi_queue);
-	int i, j, sleep_duration = 1;
+	int i, j;
 	void *bo_map;
 
 	num_queue_priorities = XE_EXEC_QUEUE_NUM_PRIORITIES;
@@ -415,12 +415,12 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 		 eci[0].engine_class, eci[0].engine_instance);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
+	bo_size = xe_bb_size(fd, sizeof(*spin[0]) * (num_queues + 1));
 
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	bo_map = xe_bo_map(fd, bo, bo_size);
-	for (i = 0; i < num_queues; i++)
+	for (i = 0; i < num_queues + 1; i++)
 		spin[i] = bo_map + i * sizeof(*spin[0]);
 
 	/* Use the default priority for Q0 because we are explicitly waiting for it below */
@@ -430,6 +430,11 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & DYN_PRIORITY) {
 		for (i = 1; i < num_queues; i++)
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		/*
+		 * Create an extra queue in the same multi-queue group, used as
+		 * a barrier to confirm priority updates have taken effect.
+		 */
+		exec_queues[num_queues] = xe_exec_queue_create(fd, vm, eci, ext);
 	} else {
 		struct drm_xe_ext_set_property mq_priority = {
 			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
@@ -474,14 +479,28 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_spin_wait_started(spin[i]);
 
 	if (flags & DYN_PRIORITY) {
+		uint64_t barrier_spin_addr = addr + num_queues * sizeof(struct xe_spin);
+
 		/* Assign increasing order of priority for secondary queues */
 		for (i = 1; i < num_queues; i++)
 			xe_exec_queue_set_property(fd, exec_queues[i],
 						   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
 						   i % num_queue_priorities);
 
-		/* Wait for priorities to take effect */
-		sleep(sleep_duration);
+		/*
+		 * Submit a barrier job on the extra queue to ensure priority
+		 * updates have taken effect before releasing the other queues.
+		 */
+		xe_spin_init_opts(spin[num_queues], .addr = barrier_spin_addr,
+				  .preempt = true);
+		sync.addr = barrier_spin_addr +
+			((char *)&spin[num_queues]->exec_sync - (char *)spin[num_queues]);
+		exec.exec_queue_id = exec_queues[num_queues];
+		exec.address = barrier_spin_addr;
+		xe_exec(fd, &exec);
+		xe_spin_end(spin[num_queues]);
+		xe_wait_ufence(fd, &spin[num_queues]->exec_sync, USER_FENCE_VALUE,
+			       exec_queues[num_queues], fence_timeout);
 	}
 
 	/*
@@ -566,6 +585,10 @@ __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < num_queues; i++)
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 
+	/* Destroy the extra queue */
+	if (flags & DYN_PRIORITY)
+		xe_exec_queue_destroy(fd, exec_queues[num_queues]);
+
 	munmap(bo_map, bo_size);
 	gem_close(fd, bo);
 
-- 
2.43.0

