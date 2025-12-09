Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA2CD3B980
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDFE10E4B8;
	Tue,  9 Dec 2025 03:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0Qfu5T7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC52810E37F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250545; x=1796786545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bXTHpLQEJ0aK/pGUnMnoaSRrzFsUFWAApTNCjQlnQM8=;
 b=P0Qfu5T7dyXF2YG4tllJbKj54KvOpiKiZYp8QDZ5LsoXnkKZtd2d4DoX
 imaX3IEQvXWUnEXbuvgJMEkuBiYcW4Oa5Q59eb7NCZqo5xGas3Vg5YuD0
 8i/aUYogplLOToOMNrZU+nZOvAM/Bd8B3rDmX5zJdYejHXR82GU0w06BI
 r/0stYMfgiApAmEsMNJoEEIvM4MGDfPkr1pCTDt7+7V2e/FR9/T+6uK+H
 +Pm9JzJFPGvN1kEpB75MtXiIbHH0FpiDLKN5JNcN+O3E/iwniDs/+c5sp
 N2OuBc2HFkZW2Lw66xyw+jdlVHVEerOye7yXxRrkUUnw0LiM0FDaJiOXW w==;
X-CSE-ConnectionGUID: OCB0YjJQR827OGmGHjL01w==
X-CSE-MsgGUID: SQ+SS8GhSAepVnGplYSf8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164331"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164331"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:24 -0800
X-CSE-ConnectionGUID: czY6LF9nRry2Rj69aahZXw==
X-CSE-MsgGUID: IiqMuwoITu6MZkhO2Zq0nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570934"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 15/18] tests/intel/xe_exec_multi_queue: Add priority test
Date: Mon,  8 Dec 2025 19:22:21 -0800
Message-ID: <20251209032208.1540217-35-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
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

Validate intra queue group priority setting.
Validate that a higher priority queue in a queue group
can preempt the lower priority queue of the group.

During a queue switch, the currently running queue is
always switched out without regard to its priority.
The priority is only a factor in determining which
other queue of the group will be scheduled in.

v2: Macro and variable rename (priyanka)
    Remove simulation related code (Priyanka)
    Remove hardcoding of number of bits.
    Use BASE_ADDRESS macro for address (Sai)
v3: Update comments (Stuart)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 206 ++++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 96fb05a72..debc47954 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -13,15 +13,18 @@
 
 #include "igt.h"
 #include "xe_drm.h"
+#include "igt_core.h"
 #include "lib/igt_syncobj.h"
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 
 #define XE_EXEC_QUEUE_PRIORITY_LOW	0
 #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
 #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
 #define XE_EXEC_QUEUE_NUM_PRIORITIES	3
+#define XE_EXEC_QUEUE_PRIORITY_N	(XE_EXEC_QUEUE_NUM_PRIORITIES * 2 + 1)
 
 #define MAX_N_EXEC_QUEUES	64
 
@@ -33,6 +36,7 @@
 #define INVALIDATE		(0x1 << 5)
 #define FAULT_MODE		(0x1 << 6)
 #define SMEM			(0x1 << 7)
+#define WAIT_MODE		(0x1 << 8)
 
 #define MAX_INSTANCE 9
 
@@ -226,6 +230,204 @@ test_sanity(int fd, int gt, int class)
 	__test_sanity(fd, gt, class, true);
 }
 
+static void
+__test_priority(int fd, struct drm_xe_engine_class_instance *eci,
+		unsigned int flags)
+{
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint64_t vm_sync = 0, addr = BASE_ADDRESS;
+	uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
+	struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
+	uint32_t vm, num_queues, num_queue_priorities, bo = 0;
+	uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
+	int64_t fence_timeout = NSEC_PER_SEC;
+	size_t bo_size;
+	/*
+	 * Q1 - Q6 are used for the priority test.
+	 * Q Priority = id % 3
+	 * 	QID	Q1 Q2 Q3 Q4 Q5 Q6
+	 * Priority	 1  2  0  1  2  0
+	 * The HW treats priority 1 and 0 the same, so it should
+	 * pick Q with priority: Q2, Q5, Q1, Q3, Q4, Q6.
+	 */
+	int expect_order[] = {0,2,5,1,3,4,6};
+	uint32_t already_in_order = 0;		// bitmask to record Q started info
+	struct drm_xe_ext_set_property multi_queue = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+		.value = DRM_XE_MULTI_GROUP_CREATE,
+	};
+	uint64_t ext = to_user_pointer(&multi_queue);
+	int i, j, sleep_duration = 1;
+	void *bo_map;
+
+	num_queue_priorities = XE_EXEC_QUEUE_NUM_PRIORITIES;
+	num_queues = num_queue_priorities * 2 + 1;
+	igt_assert(num_queues <= XE_EXEC_QUEUE_PRIORITY_N);
+	igt_assert(num_queues <= sizeof(uint32_t) * 8);
+
+	igt_debug("%s flags 0x%x eci %d:%d:%d\n", __func__, flags, eci[0].gt_id,
+		 eci[0].engine_class, eci[0].engine_instance);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
+
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bo_map = xe_bo_map(fd, bo, bo_size);
+	for (i = 0; i < num_queues; i++)
+		spin[i] = bo_map + i * sizeof(*spin[0]);
+
+	/* Use the default priority for Q0 because we are explicitly waiting for it below */
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
+	multi_queue.value = exec_queues[0];
+
+	if (flags & DYN_PRIORITY) {
+		for (i = 1; i < num_queues; i++)
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+	} else {
+		struct drm_xe_ext_set_property mq_priority = {
+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+		};
+
+		multi_queue.base.next_extension = to_user_pointer(&mq_priority);
+
+		/* Create secondary queues with increasing order of priority */
+		for (i = 1; i < num_queues; i++) {
+			mq_priority.value = i % num_queue_priorities;
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		}
+	}
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+	vm_sync = 0;
+
+	for (i = 0; i < num_queues; i++) {
+		uint64_t spin_addr = addr + i * sizeof(struct xe_spin);
+
+		xe_spin_init_opts(spin[i], .addr = spin_addr, .preempt = true);
+		sync.addr = spin_addr + (char *)&spin[i]->exec_sync - (char *)spin[i];
+		exec.exec_queue_id = exec_queues[i];
+		exec.address = spin_addr;
+		xe_exec(fd, &exec);
+
+		/* Wait for job on Q0 to start, other queues block behind Q0 */
+		if (!i)
+			xe_spin_wait_started(spin[i]);
+	}
+
+	sleep(sleep_duration);
+
+	/*
+	 * Expect the job on other queue to not get scheduled while the spinner
+	 * on q0 is not waiting on preempt condition.
+	 */
+	for (i = 1; i < num_queues; i++)
+		igt_assert(!xe_spin_started(spin[i]));
+
+	if (flags & DYN_PRIORITY) {
+		/* Assign increasing order of priority for secondary queues */
+		for (i = 1; i < num_queues; i++)
+			xe_exec_queue_set_property(fd, exec_queues[i],
+						   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+						   i % num_queue_priorities);
+
+		/* Wait for priorities to take effect */
+		sleep(sleep_duration);
+	}
+
+	/*
+	 * Trigger a queue switch by making the spinner on q0 to wait on preempt
+	 * condition, allowing job on q1 to get scheduled and finish. When we end
+	 * the spin[0], it triggers the CFEG to perform a queue priority arbitration
+	 * rather than a full context switch out. Consequently, in both semaphore
+	 * (WAIT_MODE) and non-semaphore scenarios, a priority check will occur.
+	 */
+	if (flags & WAIT_MODE)
+		xe_spin_preempt_wait(spin[0]);
+	else
+		xe_spin_end(spin[0]);
+
+	/* Wait for jobs to get scheduled */
+	i = 1;
+	while (i < num_queues) {
+		for (j = 1; j < num_queues; j++) {
+			if (xe_spin_started(spin[j]) && ((already_in_order & (1 << j)) == 0)) {
+				start_order[i] = j;
+				xe_spin_end(spin[j]);
+				xe_wait_ufence(fd, &spin[j]->exec_sync, USER_FENCE_VALUE,
+					       exec_queues[j], fence_timeout);
+				already_in_order |= (1 << j);
+				i++;
+			}
+		}
+	}
+
+	/* While ending spinner on q0, bring it out of preempt wait */
+	if (flags & WAIT_MODE) {
+		xe_spin_end(spin[0]);
+		xe_spin_preempt_nowait(spin[0]);
+	}
+	xe_wait_ufence(fd, &spin[0]->exec_sync, USER_FENCE_VALUE, exec_queues[0], fence_timeout);
+
+	igt_debug("Order\t Actual\t Expect\n");
+	for (i = 1, j = 0; i < num_queues; i++) {
+		igt_debug("  %d\t  Q%d(%d)\t  Q%d(%d)\n",i, start_order[i], start_order[i] % num_queue_priorities,
+                         expect_order[i], expect_order[i] % num_queue_priorities);
+
+		/* The priority 0, 1 are the same, so we can skip the comparison */
+		if (expect_order[i] % num_queue_priorities < XE_EXEC_QUEUE_PRIORITY_HIGH &&
+		    start_order[i] % num_queue_priorities < XE_EXEC_QUEUE_PRIORITY_HIGH)
+			continue;
+
+		if (start_order[i] % num_queue_priorities != expect_order[i] % num_queue_priorities)
+			j++;
+	}
+
+	/* There should be no out of order execution */
+	igt_assert(j == 0);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+
+	for (i = 0; i < num_queues; i++)
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+
+	munmap(bo_map, bo_size);
+	gem_close(fd, bo);
+
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: priority
+ * Description: Validate queue priority setting
+ * Test category: functionality test
+ */
+static void
+test_priority(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	__test_priority(fd, eci, 0);
+	__test_priority(fd, eci, WAIT_MODE);
+	__test_priority(fd, eci, DYN_PRIORITY);
+	__test_priority(fd, eci, DYN_PRIORITY | WAIT_MODE);
+}
+
 static void
 test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
 		  int n_exec_queues, int n_execs, unsigned int flags)
@@ -721,6 +923,10 @@ igt_main
 			xe_for_each_multi_queue_engine_class(class)
 				test_exec_virtual(fd, gt, class);
 
+	igt_subtest_f("priority")
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_priority(fd, hwe);
+
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("one-queue-%s", s->name)
 			xe_for_each_multi_queue_engine(fd, hwe)
-- 
2.43.0

