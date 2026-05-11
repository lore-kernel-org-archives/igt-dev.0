Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9ECCD3427
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 03:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F8B10E144;
	Mon, 11 May 2026 03:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="exlNKbNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5DC10E461
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 03:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778471613; x=1810007613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1G9IU3lOu4qHtlwONldvJVi6nk/q5O2Qxg6w/nSbVlU=;
 b=exlNKbNPpbt6+S6/Bm4Ugp2qh9QAVdDovTG8c0apKMnjJcFd0UCRBj3H
 okSkkg3zCH3uRstkjVZ5N9WLFHVWd1g/lmUGmTDMEAD4pCeRZkrv5jSKd
 tgcxu0AKRaJe5yEbxvLpp9gteTFDtxqflF6z7ECdp3hke9tge3QfzTL1D
 YxzNFpkZow7zqrvg4Pe6hsXBJnLfhcSXGo2FuD8w5EbmBoQKARGZIVdi4
 mIvqq2MtYc2gFG/OYnZ0ZW5DxjQVTvTDMoUGwTzEz10ELcmaXFTKxCdwi
 oU6eiXx465YUWiqMapDkDmBVRAoYU4ONo0YyGoPUabev5AbOa47QI5uCu w==;
X-CSE-ConnectionGUID: nZfkvuT4Qq299Tqll2256A==
X-CSE-MsgGUID: 3HZ3rVBTS2atHiSbU00NMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90053004"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90053004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:53:33 -0700
X-CSE-ConnectionGUID: Km+ad/SCTFGKlsb5k4DogQ==
X-CSE-MsgGUID: EdzddBmNTICmPKXFwXsIAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="232857188"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 20:53:32 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v2 3/4] tests/intel/xe_madvise: Add atomic-global subtest
Date: Mon, 11 May 2026 09:22:58 +0530
Message-ID: <20260511035310.32323-4-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511035310.32323-1-varun.gupta@intel.com>
References: <20260511035310.32323-1-varun.gupta@intel.com>
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

Signed-off-by: Varun Gupta <varun.gupta@intel.com>

v2: Add UNMAP of CPU_ADDR_MIRROR binding before xe_vm_destroy.
    Add pagefault count print before/after exec (Nishit).
---
 tests/intel/xe_madvise.c | 86 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index f343f3c8c..baf50774d 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -877,6 +877,88 @@ static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
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
+					"svm_pagefault_count");
+
+	sync[0].addr = to_user_pointer(&data->exec_sync);
+	xe_exec(fd, &exec);
+	xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
+		       exec_queue, FIVE_SEC);
+
+	pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
+					       "svm_pagefault_count");
+	igt_info("Pagefault count: before=%d, after=%d\n",
+		 pf_count_before, pf_count_after);
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
@@ -944,6 +1026,10 @@ int igt_main()
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

