Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD43AC43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 04:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D7A10E55C;
	Fri,  3 Jul 2026 04:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BkRsu7lX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFF510E55A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 04:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783052122; x=1814588122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GfYORQh3ZSKrScvUiiza4LdwAbjJHoqutoJHaUPPBxY=;
 b=BkRsu7lXKBOhQsBVOTVjxk4MTcXOfRZJUjV/ReUPvd9wdSGgt9d/lVbH
 8Rf4gSA6mW0ltQH9Q6X9R7x4XSk9wDzsLrasOV8634fIreq7FP9X7EZkA
 p0VI7tlyvJiKJ5iB3xzf4fga/HRsMe3EQNlhg2sppnN/OUS/h0r5WZ9II
 wPpkACcAJk1uNBdzN/mOs49sdngVaCaH46BqJaxLvGu6JxoJFhsLW+21r
 JtPG/MzKy+xc9SlWKCBFFptAa+gPzkloYQtMqbzvOmMwjh0pUSqzAWmi+
 pFjR0e9uibwKVxVo8c587xjI5UxPKwOp4qZHeh4PHxK3dCKkiSL3cG2Iy g==;
X-CSE-ConnectionGUID: FY2CWa7ATzSdk5u3DPrS1w==
X-CSE-MsgGUID: ppTIyjOsSBOM7MZLAUs5TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="109350332"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="109350332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 21:15:22 -0700
X-CSE-ConnectionGUID: OBbP/NtMQ1+JgHbChBU1Uw==
X-CSE-MsgGUID: UGq4/ATDRvuI/xPRfwQBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="250362328"
Received: from mramim-mobl1.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.177.29])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 21:15:18 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org,
	nakshtra.goyal@intel.com
Cc: francois.dugast@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 dwarakanath.ramadeva@intel.com, Oak Zeng <oak.zeng@intel.com>,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_exec_fault_mode: Revive atomic tests
Date: Fri,  3 Jul 2026 04:15:12 +0000
Message-ID: <20260703041511.90011-2-gajendra.uttamchand@intel.com>
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

Extend faulting mode test coverage to atomics by reviving the atomic subtests
that were removed along with VM_MADVISE. These subtests exercise MI_ATOMIC
(atomic increment) operations on a faultable VM, both with and without waiting
on each individual exec's completion fence, and validate the final atomic counter
value against the expected number of increments:

  atomic-once      - single atomic op, no per-exec wait
  atomic-once-wait - single atomic op, wait on each exec
  atomic-many      - multiple atomic ops, no per-exec wait
  atomic-many-wait - multiple atomic ops, wait on each exec

This partially reverts "drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic tests" (
commit 3557bb1215d5d57a4fbad50537272e96f37d71ce on upstream).

We revive the atomic tests on igt with fixes
    use xe_bb_size
    calculate wait bo size separately
    wait fences for none WAIT_ATOMIC cases.

v1:
	remove the additional description (Nakshtra)

v2:
	review feedback fixes (Francois)
	- unused fields from data struct
	- ONE_SEC replace with NSEC_PER_SEC
	- Add assert after atomic batch

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Reviewed-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 154 +++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 7277eb007..1a9ecb307 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -36,6 +36,7 @@
 #define INVALID_VA	(0x1 << 8)
 #define ENABLE_SCRATCH  (0x1 << 9)
 #define MULTI_QUEUE	(0x1 << 10)
+#define WAIT_ATOMIC	(0x1 << 11)

 /**
  * SUBTEST: invalid-va
@@ -467,6 +468,143 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		close(map_fd);
 }

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
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
+				  NSEC_PER_SEC);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo_wait, 0, addr_wait, bo_wait_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
+				  NSEC_PER_SEC);
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
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
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
+					   exec_queue, NSEC_PER_SEC);
+		__atomic_add_fetch(ptr, 1, __ATOMIC_SEQ_CST);
+	}
+
+	if (!(flags & WAIT_ATOMIC)) {
+		for (i = 0; i < n_atomic; i++) {
+			    xe_wait_ufence(fd, &wait[i].exec_sync, USER_FENCE_VALUE,
+				    exec_queue, NSEC_PER_SEC);
+		}
+	}
+	igt_assert(*ptr == n_atomic * 2);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
+			   NSEC_PER_SEC);
+
+	sync[0].addr = to_user_pointer(&wait[wait_idx].vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr_wait, bo_wait_size, sync, 1);
+	xe_wait_ufence(fd, &wait[wait_idx++].vm_sync, USER_FENCE_VALUE, 0,
+			   NSEC_PER_SEC);
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
@@ -618,6 +756,22 @@ int igt_main()
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

