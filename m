Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84936D3B981
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225FE10E4B9;
	Tue,  9 Dec 2025 03:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MdSgr7+M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF83910E47C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250545; x=1796786545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hm5n1uO5YxGNYY19Mmu7/3avaI7Kb+TXGWPqly4f9go=;
 b=MdSgr7+MyrrBe9uPDp04P2SKAr0pCNo2zC8BP35HdePtWtzgBqZlfE0K
 RAC8CVx/iQo3UWBS6HAMLWLBC38b6GvyHb4y0rQwGrO9Zy5sKau9P69L0
 8Z3X+o2xQQT//Z/t1Yz4R2E94F4x2DYBfjoQdADvD7FC342ksZlF7Uhgp
 ifR68Nvm4UTqwdDsQIBSngu4wBGM4ajk4pHPvf5+AtFaWCKWxCsAuPnzH
 jfwE0pDrrMmV/oO2Aw7hWuT7oU5vt22q9hjGHkrRhQqFhdJyuvaklCFZt
 4JLUxu28BgcmnKXxstAySQbYhs5oUYpswBloHHqY7euOGABlZVyt11fcU A==;
X-CSE-ConnectionGUID: 4yXQXB+7Q+GJHMrmAWEH7g==
X-CSE-MsgGUID: BML9Qp7vTV6MEonCCKAILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164332"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:24 -0800
X-CSE-ConnectionGUID: Ik7sQ6/4R/KbUM9CNmskyA==
X-CSE-MsgGUID: cN7WxbBUSiKjXBSjxJApDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570937"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 16/18] tests/intel/xe_exec_multi_queue: Add submission
 sanity test
Date: Mon,  8 Dec 2025 19:22:22 -0800
Message-ID: <20251209032208.1540217-36-niranjana.vishwanathapura@intel.com>
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

Add sanity test involving exec submissions in multi queue group.

v2: Remove simulation related code (Priyanka)
    Use BASE_ADDRESS macro for address (Sai)
v3: Remove hardcoding (Stuart)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 139 ++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index debc47954..cede3abe9 100644
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
@@ -230,6 +233,138 @@ test_sanity(int fd, int gt, int class)
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
+	for (i = NUM_QUEUES - 1; i >= 0; i--) {
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
@@ -918,6 +1053,10 @@ igt_main
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

