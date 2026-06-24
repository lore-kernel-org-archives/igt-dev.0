Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF07CDB470
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 06:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA4810E039;
	Wed, 24 Jun 2026 06:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdvGS7oC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4D110E039
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 06:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782282030; x=1813818030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4r/wap8PXRwCdIyW97WeVOoVVHBNtA71wQA0G604VRE=;
 b=KdvGS7oCD10Xn4KLGB7dPTLJFKN8+rN3J+TD5wFRFyACA6PHX3jmFfSK
 EQX8ESrVCZy/I7nOhw9HdtMkf1oTEDFBcxhG2HOCf7ExjmsxvOW6hPauA
 FbFxetCooAKZbJEjYWxTorsTZJSoL7dmApFZDtmdCgnjBzBFPBG+HIGB6
 9TGR07ojhZcNEROyBPxXVz6Il+1UQ+rabAqkfPxgpL+NWvtff8tE8nYTg
 Ipf6OKEc7/MSBf7mJS01i+tT/eD5W302G1MAKUuhQSv8sJF0hSC9DZF73
 xVhULHHIEeAvBbQX6XUTXMvPb9ElOH+ZLgXVG7fUOO+QfHfKM+Sh/lU+P w==;
X-CSE-ConnectionGUID: 3AxhbWIKTN+5v85pUbhYIA==
X-CSE-MsgGUID: Cs+IKsnSRn+cWZK7ItKCog==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83085750"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="83085750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 23:20:30 -0700
X-CSE-ConnectionGUID: lSxnGD1+QrKhUHR/HjVHxg==
X-CSE-MsgGUID: ka9HVIitT0ekqzIBbMcClA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="287872615"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.72.118])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 23:20:28 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 dwarakanath.ramadeva@intel.com, Oak Zeng <oak.zeng@intel.com>,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Revive atomic tests
Date: Wed, 24 Jun 2026 06:20:23 +0000
Message-ID: <20260624062022.34659-2-gajendra.uttamchand@intel.com>
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

From: Oak Zeng <oak.zeng@intel.com>

This partially reverts "drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic tests" (
commit 3557bb1215d5d57a4fbad50537272e96f37d71ce on upstream).

We revive the atomic tests on igt with fixes
    use xe_bb_size
    calculate wait bo size separately
    wait fences for none WAIT_ATOMIC cases.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 159 +++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 4649c67de..df836158a 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -36,6 +36,7 @@
 #define INVALID_VA	(0x1 << 8)
 #define ENABLE_SCRATCH  (0x1 << 9)
 #define MULTI_QUEUE	(0x1 << 10)
+#define WAIT_ATOMIC	(0x1 << 11)

 /**
  * SUBTEST: invalid-va
@@ -438,6 +439,148 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		close(map_fd);
 }

+#define   MI_ATOMIC_INLINE_DATA         (1 << 18)
+#define   MI_ATOMIC_ADD                 (0x7 << 8)
+
+/**
+ * SUBTEST: atomic-once
+ * Description: Run atomic fault mode test only once
+ * Test category: functionality test
+ *
+ * SUBTEST: atomic-once-wait
+ * Description: Run atomic wait fault mode test once
+ * Test category: functionality test
+ *
+ * SUBTEST: atomic-many
+ * Description: Run atomic fault mode test many times
+ * Description: atomic many
+ * Test category: functionality test
+ *
+ * SUBTEST: atomic-many-wait
+ * Description: Run atomic wait fault mode test many times
+ * Test category: functionality test
+ *
+ */
+static void
+test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
+	    int n_atomic, unsigned int flags)
+{
+	uint32_t vm;
+	uint64_t addr = 0x1a0000, addr_wait;
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queue;
+	size_t bo_size, bo_wait_size;
+	uint32_t bo, bo_wait;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *data;
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint64_t vm_sync;
+		uint64_t exec_sync;
+		uint32_t data;
+	} *wait;
+	uint32_t *ptr;
+	int i, b, wait_idx = 0;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	bo_size = sizeof(*data) * n_atomic;
+	bo_size = xe_bb_size(fd, bo_size);
+	bo_wait_size = sizeof(*wait) * (n_atomic > 4 ? n_atomic : 4);
+	bo_wait_size = xe_bb_size(fd, bo_wait_size);
+	addr_wait = addr + bo_size;
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			  all_memory_regions(fd),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bo_wait = xe_bo_create(fd, vm, bo_wait_size,
+			       vram_if_possible(fd, eci->gt_id),
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+	wait = xe_bo_map(fd, bo_wait, bo_wait_size);
+	ptr = &data[0].data;
+	memset(data, 0, bo_size);
+	memset(wait, 0, bo_wait_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+#define ONE_SEC 1000000000
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
+		       ONE_SEC);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo_wait, 0, addr_wait, bo_wait_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
+		       ONE_SEC);
+
+	for (i = 0; i < n_atomic; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&data[0].data - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+
+		b = 0;
+		data[i].batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
+		data[i].batch[b++] = sdi_addr;
+		data[i].batch[b++] = sdi_addr >> 32;
+		data[i].batch[b++] = MI_BATCH_BUFFER_END;
+
+		sync[0].addr = addr_wait +
+			(char *)&wait[i].exec_sync - (char *)wait;
+
+		exec.exec_queue_id = exec_queue;
+		exec.address = batch_addr;
+		xe_exec(fd, &exec);
+
+		if (flags & WAIT_ATOMIC)
+			xe_wait_ufence(fd, &wait[i].exec_sync, USER_FENCE_VALUE,
+				       exec_queue, ONE_SEC);
+		__atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST);
+	}
+
+	if (!(flags & WAIT_ATOMIC)) {
+		for (i = 0; i < n_atomic; i++) {
+			xe_wait_ufence(fd, &wait[i].exec_sync, USER_FENCE_VALUE,
+					exec_queue, ONE_SEC);
+		}
+	}
+	igt_assert(*ptr == n_atomic * 2);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
+		       ONE_SEC);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr_wait, bo_wait_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
+		       ONE_SEC);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	munmap(data, bo_size);
+	munmap(wait, bo_wait_size);
+	gem_close(fd, bo);
+	gem_close(fd, bo_wait);
+	xe_vm_destroy(fd, vm);
+}
+
 static void
 test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 {
@@ -589,6 +732,22 @@ int igt_main()
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);

+	igt_subtest("atomic-once")
+		xe_for_each_engine(fd, hwe)
+			test_atomic(fd, hwe, 1, 0);
+
+	igt_subtest("atomic-once-wait")
+		xe_for_each_engine(fd, hwe)
+			test_atomic(fd, hwe, 1, WAIT_ATOMIC);
+
+	igt_subtest("atomic-many")
+		xe_for_each_engine(fd, hwe)
+			test_atomic(fd, hwe, 8, 0);
+
+	igt_subtest("atomic-many-wait")
+		xe_for_each_engine(fd, hwe)
+			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
--
2.43.0

