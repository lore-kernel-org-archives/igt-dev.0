Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBEECCFA08
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1689810E2FE;
	Fri, 31 Oct 2025 18:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1awU4/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C80910E320
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DPINFt4k2jnmaFqtnnoWuc91fX1Qhl/pRLefH1bvYi4=;
 b=h1awU4/deF3B2QXFr9yeg9Uw/FlMAA/e0saoG/WrLZzl+bwQgAgg3bFV
 RG5h18/lsC0KrKblAJv77jc7f7Kg8avz2wC/gIaaYqQWM+Gxfys2jjpVg
 HoMos8MK09xEnj7dFH0ZlykkkYAEvgMZWzofzNrW3Qk0xDngoHBX+Jexh
 4OvfBEgWWLuqtzIRnTYmxUh2yYDH/6hHIGvdnHfLLeSTxVVlzP7kDwsSh
 NjeHPpA7cL3SXE3D1k8IZWuc0MM8huoWCMy+yOusD4tV10nc5DkD/ByWT
 Ws8Y/N/vCMvLvxGLsq69a0I84R68lvVME2g6hwYtV580hh3ukHRsAL2Fu Q==;
X-CSE-ConnectionGUID: gEUNvu+hTbqqfHB+NRkE/g==
X-CSE-MsgGUID: CzbWaazmSsOgcbGssrse1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144730"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: Q5mwaazARDS8ygZNbjtiAg==
X-CSE-MsgGUID: luUKl0V6T3ezA6CUSzu0SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650024"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 08/18] tests/xe_exec_multi_queue: Add preempt mode test
Date: Fri, 31 Oct 2025 11:35:45 -0700
Message-ID: <20251031183555.1882721-9-niranjana.vishwanathapura@intel.com>
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

Validate multi queue group functionality in preempt mode.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 156 +++++++++++++++++++++++++++++-
 1 file changed, 151 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index eb40e92d2..191c55fdd 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -18,6 +18,8 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define SIM_MULTIPLIER	100u
+
 #define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
 #define XE_EXEC_QUEUE_PRIORITY_HIGH	2
 
@@ -26,13 +28,14 @@
 #define USERPTR			(0x1 << 0)
 #define PRIORITY		(0x1 << 1)
 #define CLOSE_FD		(0x1 << 2)
+#define PREEMPT_MODE		(0x1 << 3)
 
 #define MAX_INSTANCE 9
 
 #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
 
 static void
-__test_sanity(int fd, int gt, int class)
+__test_sanity(int fd, int gt, int class, bool preempt_mode)
 {
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	struct drm_xe_ext_set_property multi_queue = {
@@ -65,7 +68,7 @@ __test_sanity(int fd, int gt, int class)
 	if (!n)
 		return;
 
-	vm = xe_vm_create(fd, 0, 0);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
 
 	/* Invalid flags */
 	while (!invalid_flag)
@@ -114,7 +117,7 @@ __test_sanity(int fd, int gt, int class)
 
 	/* Queues in a queue group must share the same address space (vm) */
 	multi_queue.value = exec_queues[0];
-	vm2 = xe_vm_create(fd, 0, 0);
+	vm2 = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -EINVAL);
 	xe_vm_destroy(fd, vm2);
 
@@ -199,7 +202,138 @@ __test_sanity(int fd, int gt, int class)
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
+	uint64_t addr = 0x1a0000;
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	int64_t fence_timeout;
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
+	fence_timeout = NSEC_PER_SEC * (igt_run_in_simulation() ? SIM_MULTIPLIER : 1);
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
@@ -371,12 +505,19 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -402,6 +543,7 @@ test_exec_virtual(int fd, int gt, int class)
 		return;
 
 	test_exec(fd, eci, n, n, n, 0);
+	test_exec(fd, eci, n, n, n, PREEMPT_MODE);
 }
 
 igt_main
@@ -415,6 +557,10 @@ igt_main
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

