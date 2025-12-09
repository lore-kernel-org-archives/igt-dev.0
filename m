Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF283D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55310E4BC;
	Tue,  9 Dec 2025 03:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqvNVO7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E6C10E37F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250544; x=1796786544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cz5h0b2Erem2EiZBtjIwTt21+b1Aqvi+QjekL4Uwga0=;
 b=LqvNVO7pSuvgLPbD6V4ets9WXDczpFytRlu7kKSEO0yhFwixoJnPVzxb
 naCjF5BvYqv1IJ/ilGDwpoLGPWVQqDAPyr/rKSDdvDWLfcPB6+xC9ynj3
 jWQIYOJ+qG90Ki4qfOcnbt5f7Tu/Szg1+llpWpDCgyujsIxnddRHnqd/P
 bsXcgp4M5oENAmAS1KXUmlFE4M7pKUmnV+xuZcB80sPUn7iLX/RnKU3Dq
 yK2IzQf+dhV1pgEtL7OxKAoqAfWFCeg+m1WqBySipdYLyhsduG8j/m8WI
 7WWkS2dnkmUZOybXf9I8iA8nv4JbUU/RuFeM+vn4gfPB03Sl5g8kSrpRl A==;
X-CSE-ConnectionGUID: Iijy3P+/RuCfBoBaWOKJvg==
X-CSE-MsgGUID: n2ogqC0wQQSxQ/ykKQMQwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164323"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:24 -0800
X-CSE-ConnectionGUID: 39hhEzXjTsGivZt/viRztA==
X-CSE-MsgGUID: hLG5gRY2TLCQZd2fjaqjGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570912"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 08/18] tests/intel/xe_exec_multi_queue: Add preempt mode
 test
Date: Mon,  8 Dec 2025 19:22:14 -0800
Message-ID: <20251209032208.1540217-28-niranjana.vishwanathapura@intel.com>
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

Validate multi queue group functionality in preempt mode.

v2: Remove simulation related code (Priyanka)
    Use BASE_ADDRESS macro for address (Sai)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 153 +++++++++++++++++++++++++++++-
 1 file changed, 148 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 4acf5a47f..c81d9b8ab 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -28,6 +28,7 @@
 #define USERPTR			(0x1 << 0)
 #define PRIORITY		(0x1 << 1)
 #define CLOSE_FD		(0x1 << 2)
+#define PREEMPT_MODE		(0x1 << 3)
 
 #define MAX_INSTANCE 9
 
@@ -36,7 +37,7 @@
 #define BASE_ADDRESS	0x1a0000
 
 static void
-__test_sanity(int fd, int gt, int class)
+__test_sanity(int fd, int gt, int class, bool preempt_mode)
 {
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	struct drm_xe_ext_set_property multi_queue = {
@@ -72,7 +73,7 @@ __test_sanity(int fd, int gt, int class)
 	if (!n)
 		return;
 
-	vm = xe_vm_create(fd, 0, 0);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
 
 	/* Invalid flags */
 	while (!invalid_flag)
@@ -132,7 +133,7 @@ __test_sanity(int fd, int gt, int class)
 
 	/* Queues in a queue group must share the same address space (vm) */
 	multi_queue.value = exec_queues[0];
-	vm2 = xe_vm_create(fd, 0, 0);
+	vm2 = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -EINVAL);
 	xe_vm_destroy(fd, vm2);
 
@@ -217,7 +218,137 @@ __test_sanity(int fd, int gt, int class)
 static void
 test_sanity(int fd, int gt, int class)
 {
-	__test_sanity(fd, gt, class);
+	__test_sanity(fd, gt, class, false);
+	__test_sanity(fd, gt, class, true);
+}
+
+static void
+test_preempt_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
+		  int n_exec_queues, int n_execs, unsigned int flags)
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
+	uint32_t vm;
+	uint64_t addr = BASE_ADDRESS;
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	int64_t fence_timeout = NSEC_PER_SEC;
+	uint64_t vm_sync = 0;
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	int i, b;
+
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
+	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	bo_size = xe_bb_size(fd, sizeof(*data) * n_execs);
+
+	if (flags & USERPTR) {
+		data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
+		igt_assert(data);
+
+		memset(data, 0, bo_size);
+	} else {
+		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci[0].gt_id),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		data = xe_bo_map(fd, bo, bo_size);
+	}
+
+	for (i = 0; i < n_exec_queues; i++) {
+		struct drm_xe_ext_set_property multi_queue = {
+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+		};
+		struct drm_xe_ext_set_property mq_priority = {
+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+		};
+		uint64_t ext = to_user_pointer(&multi_queue);
+
+		if (flags & PRIORITY) {
+			multi_queue.base.next_extension = to_user_pointer(&mq_priority);
+			mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
+		}
+
+		multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, num_placement, eci,
+						     ext, &exec_queues[i]), 0);
+	};
+
+	sync.addr = to_user_pointer(&vm_sync);
+	if (bo)
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data),
+					 addr, bo_size, &sync, 1);
+
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+	vm_sync = 0;
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int e = i % n_exec_queues;
+
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		sync.addr = addr + (char *)&data[i].exec_sync - (char *)data;
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+	}
+
+	for (i = 0; i < n_execs; i++)
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			       exec_queues[i % n_exec_queues], fence_timeout);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+
+	for (i = 0; i < n_execs; i++)
+		igt_assert_eq(data[i].data, 0xc0ffee);
+
+	if (!(flags & CLOSE_FD))
+		for (i = 0; i < n_exec_queues; i++)
+			xe_exec_queue_destroy(fd, exec_queues[i]);
+
+	if (bo) {
+		munmap(data, bo_size);
+		gem_close(fd, bo);
+	} else {
+		free(data);
+	}
+
+	if (!(flags & CLOSE_FD))
+		xe_vm_destroy(fd, vm);
+	else
+		drm_close_driver(fd);
 }
 
 static void
@@ -389,12 +520,19 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  * @userptr:					userptr
  * @priority:					priority
  * @close-fd:					close fd without destroying exec queues
+ * @preempt-mode-basic:				preempt-mode basic
+ * @preempt-mode-userptr:			preempt-mode userptr
+ * @preempt-mode-priority:			preempt-mode priority
+ * @preempt-mode-close-fd:			preempt-mode close fd without destroying exec queues
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
 	  int n_exec_queues, int n_execs, unsigned int flags)
 {
-	test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs, flags);
+	if (flags & PREEMPT_MODE)
+		test_preempt_mode(fd, eci, num_placement, n_exec_queues, n_execs, flags);
+	else
+		test_legacy_mode(fd, eci, num_placement, n_exec_queues, n_execs, flags);
 }
 
 /**
@@ -418,6 +556,7 @@ test_exec_virtual(int fd, int gt, int class)
 	igt_assert(n);
 
 	test_exec(fd, eci, n, n, n, 0);
+	test_exec(fd, eci, n, n, n, PREEMPT_MODE);
 }
 
 igt_main
@@ -431,6 +570,10 @@ igt_main
 		{ "userptr", USERPTR },
 		{ "priority", PRIORITY },
 		{ "close-fd", CLOSE_FD },
+		{ "preempt-mode-basic", PREEMPT_MODE },
+		{ "preempt-mode-userptr", PREEMPT_MODE | USERPTR },
+		{ "preempt-mode-priority", PREEMPT_MODE | PRIORITY },
+		{ "preempt-mode-close-fd", PREEMPT_MODE | CLOSE_FD },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

