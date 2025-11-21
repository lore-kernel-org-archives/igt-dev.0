Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843E5CFA46E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEA310E7F9;
	Fri, 21 Nov 2025 03:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzEm/ZUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8760810E7FB
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697448; x=1795233448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SRYV+l2qSzUyyAD5WQ8S14lDHFazOe6u/CFeoCYBJMw=;
 b=mzEm/ZUyeff35IKEHooJ6D8sek0gTZKlHzH6Y68YkISTX9pmKYE2bgt0
 hLB9WwE9qCigE3XJ96044AW6wT275zxuYSBuIXezo0NG67xc/MMcrs0hK
 xT9fHTM8w+euy3vPWybSM3wWo4L8C9Gb++oBDQSVYLOZOhgx4/6kFP99U
 1UOww4WEt9n4d5XxYWOEnjjWBzeAB4F0R5NzLjA9Y3XebJKCAPWWrvO+R
 neQO8+Ui/ngPU/fbTK3LcxCaXf68noP1FFxwOSalECvEq/ajbKis5jhpX
 dQ90X6zi8WZ9B3tRrqI6ZRpV4kenMlkUVU7B4kcmaIQLZdqjgwidr5hsj g==;
X-CSE-ConnectionGUID: jgGv6H5wRIK3UkGeQG4Mzw==
X-CSE-MsgGUID: ySBSa7Q/SJCNbuglAx8MKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484678"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:27 -0800
X-CSE-ConnectionGUID: JHenad0UTnCiXF12uYsfRw==
X-CSE-MsgGUID: lMnjGessTZepX2p2XoxDNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433509"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 16/19] tests/intel/xe_exec_multi_queue: Add submission
 sanity test
Date: Thu, 20 Nov 2025 19:57:28 -0800
Message-ID: <20251121035715.767226-37-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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

Add sanity test involving exec submissions in multi queue group.

v2: Remove simulation related code (Priyanka)
    Use BASE_ADDRESS macro for address (Sai)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 139 ++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 06e898a47..9f7b3b4d7 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -44,6 +44,9 @@
 
 #define BASE_ADDRESS	0x1a0000
 
+/* Number of queues in exec sanity tests */
+#define NUM_QUEUES		2
+
 static void
 __test_sanity(int fd, int gt, int class, bool preempt_mode)
 {
@@ -216,6 +219,138 @@ test_sanity(int fd, int gt, int class)
 	__test_sanity(fd, gt, class, true);
 }
 
+static void
+__test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
+{
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync = { };
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint64_t vm_sync = 0, addr[NUM_QUEUES];
+	uint32_t vm, exec_queues[NUM_QUEUES], bo[NUM_QUEUES];
+	int64_t fence_timeout = NSEC_PER_SEC;
+	struct xe_spin *spin[NUM_QUEUES];
+	size_t bo_size;
+	struct drm_xe_ext_set_property multi_queue = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+		.value = DRM_XE_MULTI_GROUP_CREATE,
+	};
+	uint64_t ext = to_user_pointer(&multi_queue);
+	bool preempt_mode = flags & PREEMPT_MODE;
+	int i;
+
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	if (preempt_mode) {
+		sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync.timeline_value = USER_FENCE_VALUE;
+	} else {
+		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
+		sync.handle = syncobj_create(fd, 0);
+	}
+
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
+	bo_size = xe_bb_size(fd, sizeof(struct xe_spin));
+
+	for (i = 0; i < NUM_QUEUES; i++) {
+		bo[i] = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
+				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		spin[i] = xe_bo_map(fd, bo[i], bo_size);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		if (i == 0)
+			multi_queue.value = exec_queues[i];
+
+		addr[i] = BASE_ADDRESS + i * bo_size;
+	}
+
+	if (preempt_mode)
+		sync.addr = to_user_pointer(&vm_sync);
+
+	for (i = 0; i < NUM_QUEUES; i++) {
+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, addr[i], bo_size, &sync, 1);
+		if (preempt_mode) {
+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+			vm_sync = 0;
+		} else {
+			igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+			syncobj_reset(fd, &sync.handle, 1);
+		}
+	}
+
+	/* Validate job submission on secondary queue before primary queue */
+	for (i = 1; i >= 0; i--) {
+		xe_spin_init_opts(spin[i], .addr = addr[i]);
+		if (preempt_mode)
+			sync.addr = addr[i] + (char *)&spin[i]->exec_sync - (char *)spin[i];
+
+		exec.exec_queue_id = exec_queues[i];
+		exec.address = addr[i];
+		xe_exec(fd, &exec);
+		xe_spin_wait_started(spin[i]);
+		xe_spin_end(spin[i]);
+		if (preempt_mode) {
+			xe_wait_ufence(fd, &spin[i]->exec_sync, USER_FENCE_VALUE, exec_queues[i], fence_timeout);
+		} else {
+			igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+			syncobj_reset(fd, &sync.handle, 1);
+		}
+	}
+
+	/* Destroy primary queue */
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+
+	/* Validate submission on secondary queues fail after destroying the primary */
+	xe_spin_init_opts(spin[1], .addr = addr[1]);
+	if (preempt_mode)
+		sync.addr = addr[1] + (char *)&spin[1]->exec_sync - (char *)spin[1];
+
+	exec.exec_queue_id = exec_queues[1];
+	exec.address = addr[1];
+	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
+
+	if (preempt_mode)
+		sync.addr = to_user_pointer(&vm_sync);
+
+	for (i = 0; i < NUM_QUEUES; i++) {
+		xe_vm_unbind_async(fd, vm, 0, 0, addr[i], bo_size, &sync, 1);
+		if (preempt_mode) {
+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+			vm_sync = 0;
+		} else {
+			igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+			syncobj_reset(fd, &sync.handle, 1);
+		}
+	}
+
+	/* Destroy secondary queue */
+	xe_exec_queue_destroy(fd, exec_queues[1]);
+
+	for (i = 0; i < NUM_QUEUES; i++) {
+		munmap(spin[i], bo_size);
+		gem_close(fd, bo[i]);
+	}
+
+	if (!preempt_mode)
+		syncobj_destroy(fd, sync.handle);
+
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: exec-sanity
+ * Description: Run exec submission sanity tests
+ * Test category: functionality test
+ */
+static void
+test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	__test_exec_sanity(fd, eci, 0);
+	__test_exec_sanity(fd, eci, PREEMPT_MODE);
+}
+
 static void
 __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
 		unsigned int flags)
@@ -901,6 +1036,10 @@ igt_main
 			xe_for_each_multi_queue_engine_class(class)
 				test_sanity(fd, gt, class);
 
+	igt_subtest_f("exec-sanity")
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_exec_sanity(fd, hwe);
+
 	igt_subtest_f("virtual")
 		xe_for_each_gt(fd, gt)
 			xe_for_each_multi_queue_engine_class(class)
-- 
2.43.0

