Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC39CD98ED
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 23:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E368C10E33A;
	Wed, 17 Jun 2026 23:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJgMs1HU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DBB10E33A
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 23:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781739701; x=1813275701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ol6CoFsP3SbxvGRxzE+vjl7OkrsoDlqWbWfPvyG1n+U=;
 b=eJgMs1HUgtTqlLD8RdyLKb4mGebZuBfliQ0QEriOtXLCZSLL/6oNJsRa
 HOhcV/nVGBX1GpR+lNKWAywprASerJoA4MPcoydxS3X2X5MBi3BpCnv/Z
 C7deF4T2MgRtxV28OjkGWMg1FWb7b+kVRTSAkTSfjSbpsnnpx6RusgtjL
 IuLD/ReXotGGW4MS8pjR/1dHmg9mQZRV3/b94KYqdnCai1oGNdHg2/dO8
 NskZcUEC8/c4K+ToSibJ03vUp3p+FBGNHsxqfT0TU5JEEWNO+o6XRthTL
 tb30uEC7ryvAg8D+mY1U8Ri0kISHn78SMdDyNnuz3X2U8TKRDFgcJAIGR A==;
X-CSE-ConnectionGUID: 0b897y5rTk2sxgcoP7/5wg==
X-CSE-MsgGUID: tkUREPZTT7aVvK4DUxOvpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="100119508"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="100119508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 16:41:34 -0700
X-CSE-ConnectionGUID: N/mmWoW0Rymqx+lhqO1//w==
X-CSE-MsgGUID: 68G8+zJwRuOw4WNy2JriEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="252106332"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 16:41:32 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 brian3.nguyen@intel.com, stuart.summers@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_vm: Use ufence to generate faults in
 fault mode
Date: Thu, 18 Jun 2026 07:41:29 +0800
Message-ID: <20260617234129.836216-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

Originally, the test vm-get-property-exercise used the fact that the VM
was not in fault mode when generating a fault to ensure that the fault
would be stored for the xe_vm_get_property_ioctl.  This is because faults
are only stored if they fail to be recovered by the xe_pagefault_service
function, and the VM not being in fault mode was one such case where
xe_pagefault_service would fail.

However, it has been decided that faults originating from VMs not in
fault mode should be considered "invalid faults" and thus should not
even enter the xe_pagefault_work_queue, meaning they are not stored by
xe_pagefault_save_to_vm.  This results in vm-get-property-exercise
failing because no faults are stored.

Update the VM to use the DRM_XE_VM_CREATE_FLAG_FAULT_MODE on creation.
This necessitates also using DRM_XE_VM_CREATE_FLAG_LR_MODE, as VMs with
the former cannot be created without the latter.

syncobj is unsupported on VMs with LR mode enabled, so update gen_pf to
use ufence instead.

Suggested-by: Brian Nguyen <brian3.nguyen@intel.com>
Suggested-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 109 +++++++++++++++++++++++---------------------
 1 file changed, 57 insertions(+), 52 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 555c35eca2..bb8e7790dc 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2919,96 +2919,101 @@ gen_pf(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
 	int n_exec_queues = 2;
 	int n_execs = 2;
 	uint64_t addr = 0x1a0000;
-	struct drm_xe_sync sync[2] = {
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
-		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	uint64_t sync_addr = 0x101a0000;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
 	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
-		.num_syncs = 2,
+		.num_syncs = 1,
 		.syncs = to_user_pointer(sync),
 	};
-	uint32_t exec_queues[2];
-	uint32_t syncobjs[2];
-	size_t bo_size;
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	size_t bo_size, sync_size;
 	uint32_t bo = 0;
 	struct {
-		struct xe_spin spin;
 		uint32_t batch[16];
 		uint64_t pad;
+		uint64_t vm_sync;
 		uint32_t data;
 	} *data;
-	struct xe_spin_opts spin_opts = { .preempt = false };
+	uint64_t *exec_sync;
 	int i, b;
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
+	sync_size = sizeof(*exec_sync) * n_execs;
+	sync_size = xe_bb_size(fd, sync_size);
 
-	bo = xe_bo_create(fd, vm, bo_size,
+	bo = xe_bo_create(fd, 0, bo_size,
 			  vram_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
+	memset(data, 0, bo_size);
 
-	for (i = 0; i < n_exec_queues; i++) {
+#define EXEC_SYNC_ADDRESS	0x00007fbdeadbe000
+	exec_sync = mmap((void *)EXEC_SYNC_ADDRESS, sync_size, PROT_READ | PROT_WRITE,
+			 MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_sync != MAP_FAILED);
+	memset(exec_sync, 0, sync_size);
+
+	for (i = 0; i < n_exec_queues; i++)
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-		syncobjs[i] = syncobj_create(fd, 0);
-	};
 
-	sync[0].handle = syncobj_create(fd, 0);
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
+	xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(exec_sync),
+				 sync_addr, sync_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
 	for (i = 0; i < n_execs; i++) {
-		uint64_t base_addr = !i ? addr + bo_size * 128 : addr;
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
-		uint64_t batch_addr = base_addr + batch_offset;
-		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = base_addr + sdi_offset;
-		uint64_t exec_addr;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_addr = 0x1fffffffffff000;
 		int e = i % n_exec_queues;
 
-		if (!i) {
-			spin_opts.addr = base_addr + spin_offset;
-			xe_spin_init(&data[i].spin, &spin_opts);
-			exec_addr = spin_opts.addr;
-		} else {
-			b = 0;
-			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-			data[i].batch[b++] = sdi_addr;
-			data[i].batch[b++] = sdi_addr >> 32;
-			data[i].batch[b++] = 0xc0ffee;
-			data[i].batch[b++] = MI_BATCH_BUFFER_END;
-			igt_assert(b <= ARRAY_SIZE(data[i].batch));
-
-			exec_addr = batch_addr;
-		}
+		b = 0;
+		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = 0xc0ffee;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-		sync[1].handle = syncobjs[e];
+		sync[0].addr = sync_addr + (char *)&exec_sync[i] - (char *)exec_sync;
 
 		exec.exec_queue_id = exec_queues[e];
-		exec.address = exec_addr;
-		if (e != i)
-			syncobj_reset(fd, &syncobjs[e], 1);
+		exec.address = batch_addr;
 		xe_exec(fd, &exec);
 	}
 
-	for (i = 0; i < n_exec_queues && n_execs; i++)
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
-					NULL));
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	for (i = 0; i < n_execs; i++) {
+		int64_t timeout = NSEC_PER_SEC;
 
-	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		igt_assert_eq(__xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
+					       exec_queues[i % n_exec_queues], &timeout), -EIO);
+	}
+
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	data[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, 0, 0, sync_addr, sync_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 
-	syncobj_destroy(fd, sync[0].handle);
-	for (i = 0; i < n_exec_queues; i++) {
-		syncobj_destroy(fd, syncobjs[i]);
+	for (i = 0; i < n_exec_queues; i++)
 		xe_exec_queue_destroy(fd, exec_queues[i]);
-	}
 
+	munmap(exec_sync, sync_size);
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 }
@@ -3068,7 +3073,7 @@ static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
 {
 	uint32_t vm;
 
-	vm = xe_vm_create(fd, 0, 0);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	func(fd, vm);
 	xe_vm_destroy(fd, vm);
 }
-- 
2.53.0

