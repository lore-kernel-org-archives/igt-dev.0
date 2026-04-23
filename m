Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4152FFAD41F
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 06:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52C910E142;
	Thu, 23 Apr 2026 06:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHSHoOci";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4490E10E142
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 06:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776926361; x=1808462361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pCVp3VzTAcUZipnqrKtLakn759ce/6uDTvxXoDoGQ7g=;
 b=cHSHoOciyKMZtWep7wl7jKZXPEpJfKQOnjXGb2DunCNelicROsJust0r
 IcmSQ7zIzKwvdtIap97ejRdxYCdgE3P8pvmPYLfAa+VFgCS6FEsO2x4K1
 bSFFWEfsR6qhEAQD+HAJafYbxIYKBi2Bllw1pETz61RawaundJv4kJt7z
 QBSvrT1k3TGKFuMtxuzbt3KdXbSz6hdRLn1nhEKrHzVC6Ormv018ChsNm
 cY4QRxqCfjFWBtaP8sJBqat/yAEGuBpsy7MuhfiwKwSZrM7uF6GvzdoF+
 oSI+D9NoA1bMsNXKGMmgNYQHON0SKByMqnnYrSHGYPY9XYRUFGyKlhUXf A==;
X-CSE-ConnectionGUID: QSs9dZjaSFW6jquwRJlN9Q==
X-CSE-MsgGUID: 1P3YnunESvqm7FOWiLYIcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76921582"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="76921582"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:39:21 -0700
X-CSE-ConnectionGUID: I1SKdw9pSsucPeB2sQrKVw==
X-CSE-MsgGUID: KWjHw4pKSlKbgZqlEpjsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="237557304"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:39:19 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 4/4] tests/intel/xe_madvise: Add atomic-cpu subtest
Date: Thu, 23 Apr 2026 12:08:53 +0530
Message-ID: <20260423063904.3944005-5-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423063904.3944005-1-varun.gupta@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Validate that madvise ATOMIC_CPU blocks GPU atomic operations on SVM
memory.  The test sets ATOMIC_CPU on heap-allocated memory, then
submits GPU MI_ATOMIC_INC which must fail because the page-fault
handler returns -EACCES for CPU-only atomic mode, causing an engine
reset.  The fence wait times out (QUARTER_SEC) and the counter must
remain 0.  Only the first engine is tested to limit CAT errors from
repeated resets.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_madvise.c | 77 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index c251186d3..3411a6f3d 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -936,6 +936,77 @@ static void test_atomic_global(int fd, struct drm_xe_engine_class_instance *eci)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: atomic-cpu
+ * Description: madvise atomic cpu supports only CPU atomic operations,
+ *		test verifies GPU MI_ATOMIC_INC is rejected by fault handler
+ * Test category: functionality test
+ */
+static void test_atomic_cpu(int fd, struct drm_xe_engine_class_instance *eci)
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
+	int va_bits, err;
+	int64_t timeout = QUARTER_SEC;
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
+		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_CPU, 0, 0);
+
+	atomic_build_batch(data, addr);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = addr + ((char *)&data->batch - (char *)data);
+
+	/*
+	 * GPU MI_ATOMIC_INC must fail: page-fault handler returns -EACCES
+	 * for ATOMIC_CPU mode, causing engine reset.  Wait with a short
+	 * timeout — the fence should not signal.
+	 */
+	sync[0].addr = to_user_pointer(&data->exec_sync);
+	xe_exec(fd, &exec);
+	err = __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
+			       exec_queue, &timeout);
+
+	igt_assert_neq(err, 0);
+	igt_assert_eq(data->data, 0);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	free(data);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -1007,6 +1078,12 @@ int igt_main()
 		igt_subtest("atomic-global")
 			xe_for_each_engine(fd, hwe)
 				test_atomic_global(fd, hwe);
+
+		igt_subtest("atomic-cpu")
+			xe_for_each_engine(fd, hwe) {
+				test_atomic_cpu(fd, hwe);
+				break;
+			}
 	}
 
 	igt_fixture() {
-- 
2.43.0

