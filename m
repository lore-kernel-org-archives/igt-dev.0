Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0F7CCFA0E
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CB010EC10;
	Fri, 31 Oct 2025 18:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vn8WjCfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04DF10E320
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VI/CZCCVWT0v7Npu7uPWQaA5xI120AhYXBPslCQsdIo=;
 b=Vn8WjCfTZesYDIS+Pbja6U6Biy5MLNl/cX5u5uKtHs+p/FxAnUK0I2rn
 9cGfp0NTZE9c80If3i1zBcZk54t+gxAgDoRGBec+LYGb6XH0NJe8XF9OG
 ROlDWhuCWacEfVOeoaWptpQUkeqrqEdpgVnhRS3bSU7JfbwsVxoNdKyYo
 kVWW5Pnr4zqn0Z+e81kXccj2AzMDhIEUy4MbJ2QrknCp+oQx8VutZKfCt
 NPieBMhn2QwlAUgsxlKVgmZJzOhFtz8KZCC4Cvfq04SuKqyV2MQg8izvS
 QT4WHDsNg43SvywQcCmh7+MhVsaSh4eCb+DJJeSFYv9P+sME7CjSTHXC0 w==;
X-CSE-ConnectionGUID: asnAlcDASNGf9GysjfJWLg==
X-CSE-MsgGUID: 2wC5boE2Q7uj/7O/lBWEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144738"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144738"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: tFYG8VH4TU6TfjYM0i589g==
X-CSE-MsgGUID: h2rg6BNKR5OIuT7OmQZKCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650037"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 16/18] tests/xe_exec_multiq: Add submission sanity test
Date: Fri, 31 Oct 2025 11:35:53 -0700
Message-ID: <20251031183555.1882721-17-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 138 ++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 9cd4a7a16..10b89692f 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -44,6 +44,9 @@
 
 #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
 
+/* Number of queues in exec sanity tests */
+#define NUM_QUEUES		2
+
 static void
 __test_sanity(int fd, int gt, int class, bool preempt_mode)
 {
@@ -216,6 +219,137 @@ test_sanity(int fd, int gt, int class)
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
+	uint64_t vm_sync = 0, addr[NUM_QUEUES] = { 0x1a00000, 0x1c00000 };
+	uint32_t vm, exec_queues[NUM_QUEUES], bo[NUM_QUEUES];
+	struct xe_spin *spin[NUM_QUEUES];
+	int64_t fence_timeout;
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
+	}
+
+	fence_timeout = NSEC_PER_SEC * (igt_run_in_simulation() ? SIM_MULTIPLIER : 1);
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
@@ -911,6 +1045,10 @@ igt_main
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

