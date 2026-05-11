Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D73CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 13:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2E110E778;
	Mon, 11 May 2026 13:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iq5aobGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B7C10E77A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778507898; x=1810043898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E7ftgTZKMb/eMkcAm3G45W7aQVUjJCW/VkmOIbldnB0=;
 b=Iq5aobGSw6Yh8JYsOlVuhC1RBi74YhN59LplMWEQrFBrElQtDbHw1pxv
 M2hy85emd0FviTA6o6E/S1hu/N2/yv3a2n/X9L3pU8LpN/Nz4z2yRnt8E
 QqhlhXdPfnko0jH3MK9bp4jI36d7eMobxxo5ELsrJnd/TNQY4PNdy/OyQ
 DGc7Y8Qt326CtNgk/Nw7zDWGGo9WScgjLc2L5uuqLoHxlU5FBWEqHArKs
 cWi7D+nF/abTt0NXs5H5lvihXBpIlHhW4iaDsGdr05vDo/TOh/2hAs2Fw
 gIlumvyNIng/Xn23grwpe7e+/7h3u4jGu3PS9HNoqcwerVHOeVXkCa6Nf w==;
X-CSE-ConnectionGUID: RuyXmkdTT7Sr0l3xMV3Tgw==
X-CSE-MsgGUID: lzQ1inzVShaGimdSb6mUgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="81957743"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="81957743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:58:18 -0700
X-CSE-ConnectionGUID: WAm0PSNOQKKUzpNcmUtdKA==
X-CSE-MsgGUID: RvdZ86FdShqcbJpQoFkdrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="241817621"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:58:16 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v3 3/4] tests/intel/xe_madvise: Add atomic-global subtest
Date: Mon, 11 May 2026 19:27:36 +0530
Message-ID: <20260511135752.119868-4-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511135752.119868-1-varun.gupta@intel.com>
References: <20260511135752.119868-1-varun.gupta@intel.com>
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

Validate that madvise ATOMIC_GLOBAL permits both CPU and GPU atomic
access on SVM memory.  The test sets ATOMIC_GLOBAL on heap-allocated
memory, performs 100 CPU atomic increments while data resides in SMEM,
then executes GPU MI_ATOMIC_INC which triggers the page-fault handler
to migrate data to VRAM.  The final counter value must equal 101
(CPU + GPU increments).

v2: Add UNMAP of CPU_ADDR_MIRROR binding before xe_vm_destroy.
    Add pagefault count print before/after exec (Nishit).
v3: Print pagefault count only when count changed (Nishit).

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_madvise.c | 87 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 8aecd0e5b..c3b6935bb 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -878,6 +878,89 @@ static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: atomic-global
+ * Description: madvise atomic global supports both CPU and GPU atomic operations,
+ *		test does CPU atomic increments on SMEM then GPU MI_ATOMIC_INC
+ *		which triggers fault-driven migration to VRAM
+ * Test category: functionality test
+ */
+static void test_atomic_global(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct atomic_data *data;
+	uint32_t vm, exec_queue;
+	uint64_t addr;
+	size_t bo_size;
+	int va_bits, i;
+	int n_cpu_ops = 100;
+	int pf_count_before, pf_count_after;
+
+	va_bits = xe_va_bits(fd);
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+
+	bo_size = xe_bb_size(fd, sizeof(*data));
+	data = aligned_alloc(bo_size, bo_size);
+	igt_assert(data);
+	memset(data, 0, bo_size);
+
+	addr = to_user_pointer(data);
+
+	sync[0].addr = to_user_pointer(&data->vm_sync);
+	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
+			    DRM_XE_VM_BIND_OP_MAP,
+			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+			    sync, 1, 0, 0);
+	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
+	data->vm_sync = 0;
+
+	xe_vm_madvise(fd, vm, addr, bo_size, 0,
+		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_GLOBAL, 0, 0);
+
+	for (i = 0; i < n_cpu_ops; i++)
+		__atomic_fetch_add(&data->data, 1, __ATOMIC_SEQ_CST);
+
+	igt_assert_eq(data->data, n_cpu_ops);
+
+	atomic_build_batch(data, addr);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = addr + ((char *)&data->batch - (char *)data);
+
+	pf_count_before = xe_gt_stats_get_count(fd, eci->gt_id,
+						"svm_pagefault_count");
+
+	sync[0].addr = to_user_pointer(&data->exec_sync);
+	xe_exec(fd, &exec);
+	xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
+		       exec_queue, FIVE_SEC);
+
+	pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
+					       "svm_pagefault_count");
+	if (pf_count_before != pf_count_after)
+		igt_info("Pagefault count: before=%d, after=%d\n",
+			 pf_count_before, pf_count_after);
+
+	igt_assert_eq(data->data, n_cpu_ops + 1);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
+			    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0);
+	free(data);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -945,6 +1028,10 @@ int igt_main()
 		igt_subtest("atomic-device")
 			xe_for_each_engine(fd, hwe)
 				test_atomic_device(fd, hwe);
+
+		igt_subtest("atomic-global")
+			xe_for_each_engine(fd, hwe)
+				test_atomic_global(fd, hwe);
 	}
 
 	igt_fixture() {
-- 
2.43.0

