Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA302FAD41F
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 06:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFB610E142;
	Thu, 23 Apr 2026 06:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQhxbAJL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924B810E142
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776926359; x=1808462359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5veRishD5MJiqe1Tj3E0wa+QSfVBEmTa8WqYYKhry3Q=;
 b=nQhxbAJL+YUzCJwAEJVQtBFwMUSmN8qi8xiQHPquftogo2SUx1RJvG6d
 TKJe504Fi+mt0W0Qq+FaVIEQCGY3YTWPIH0vWYPI5sj/3pe0KKbUyLf8e
 egVUHjaCab06ae+xwvcgvcMBABia136YInpFB1tAB0i6GgAKDQWs0wIiw
 9bLGIF3gLhlAjB9l3Gol5y8bFj5HBZgvrcGLLuEz8Bu0QPULS3aYtQI4x
 cqt8c2iZgyEhujbNzpGYB3S0LoBwhtCNBOlAJBUaAtkcSHLh86fDlFNjn
 4U6LHpB7jW8PUnTF6AP89THpQFsWPSPq4HH9WjEk6nZDXyu+H0F1z5xup g==;
X-CSE-ConnectionGUID: BDCh0DS/TGebAQiOWnO0iA==
X-CSE-MsgGUID: IED6yhd8Sleb+5Dm0n7eqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76921580"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="76921580"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:39:19 -0700
X-CSE-ConnectionGUID: Fub68wLOQoq4HaOmx0PdgQ==
X-CSE-MsgGUID: A/uEoVxqSWaKZ3AZnTXaJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="237557301"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:39:18 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 3/4] tests/intel/xe_madvise: Add atomic-global subtest
Date: Thu, 23 Apr 2026 12:08:52 +0530
Message-ID: <20260423063904.3944005-4-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423063904.3944005-1-varun.gupta@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
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
---
 tests/intel/xe_madvise.c | 75 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 1f4fb16b9..c251186d3 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -865,6 +865,77 @@ static void test_atomic_device(int fd, struct drm_xe_engine_class_instance *eci)
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
+	sync[0].addr = to_user_pointer(&data->exec_sync);
+	xe_exec(fd, &exec);
+	xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
+		       exec_queue, FIVE_SEC);
+
+	igt_assert_eq(data->data, n_cpu_ops + 1);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	free(data);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -932,6 +1003,10 @@ int igt_main()
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

