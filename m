Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59232C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 17:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08BE10E039;
	Tue, 13 May 2025 17:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlgbT3LV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81E010E039
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747156035; x=1778692035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=INsOOKDSr5fzlJ+U1HYppCFFeNDFiYrVPij5Ckgvbhg=;
 b=BlgbT3LVik0sLVW+7Vg4ZwRbvlkmfODYHGUtALeaveMpXZlPUPWM14NA
 UaNYqzz6PnDGI61BNk3t1bfAsz+QMl7fKTevmU6/ZkxxF3ifRvdrVp9az
 Em9mfk4iZpa0332MJyp3dho/BqiZBLlJMtY6BGmtAElGA2/9PM6e8e1QK
 VvCIXf8QRiDeqDc0zKroCug8PVOBOVDXS7Pr4nBtkyF3G+841317Rqd4n
 ZHAUO7VnC2EaPyIAEpNZhrtPWysYiJ/BwIJB0/0TbYN/zUVRUTN0rgSH2
 f/1PuxefjWXxRuBPlybEY0AYEEkvLeDroVh5m4iOIYsNszRr7LT3JEbit A==;
X-CSE-ConnectionGUID: mJV2BeQwSFWG9WrbfTqWRA==
X-CSE-MsgGUID: k/UFW7AmSRKTLS7tLJ1MxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48269608"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48269608"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 10:07:14 -0700
X-CSE-ConnectionGUID: ggoQIlekR/aitJctxZMC/A==
X-CSE-MsgGUID: TqLXj0TJTlyi3dCZ6A+0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="174894236"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa001.jf.intel.com with ESMTP; 13 May 2025 10:07:14 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to validate
 basic SVM functionality
Date: Tue, 13 May 2025 17:07:09 +0000
Message-Id: <20250513170711.14518-2-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Basic test validates basic SVM functionlity.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 06daac8c2..ba11ed834 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -32,6 +32,8 @@
 struct batch_data {
 	uint32_t batch[16];
 	uint64_t pad;
+	uint64_t vm_sync;
+	uint64_t exec_sync;
 	uint32_t data;
 	uint32_t expected_data;
 };
@@ -405,6 +407,63 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
 		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
 }
 
+/**
+ * SUBTEST: basic-svm
+ * Description: Test validates basic svm.
+ * Test category: functionality test
+ */
+static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
+		       size_t bo_size, int num_dwords)
+{
+	uint64_t addr;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	struct batch_data *data;
+	uint32_t exec_queues, vm;
+	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	data = aligned_alloc(aligned_size, bo_size);
+	igt_assert(data != NULL);
+	memset(data, 0, bo_size);
+
+	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	bind_system_allocator(sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
+	addr = to_user_pointer(data);
+	for (int i = 0; i <= num_dwords; i++) {
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = addr + batch_offset;
+		uint64_t sdi_offset = (char *)&(data[i].data) - (char *)data;
+		uint64_t sdi_addr = addr + sdi_offset;
+		int b = 0;
+
+		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
+		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+		exec.exec_queue_id = exec_queues;
+		exec.address = batch_addr;
+		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+		xe_exec(fd, &exec);
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
+		data[i].exec_sync = 0;
+		igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
+	}
+	unbind_system_allocator();
+	free(data);
+	xe_exec_queue_destroy(fd, exec_queues);
+	xe_vm_destroy(fd, vm);
+}
 /**
  * SUBTEST: unaligned-alloc
  * Description: allocate unaligned sizes of memory
@@ -1597,6 +1656,7 @@ struct section {
 
 igt_main
 {
+	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section sections[] = {
 		{ "malloc", 0 },
@@ -1695,11 +1755,15 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(!xe_supports_faults(fd));
 
+		engine = xe_engine(fd, 1);
 		xe = xe_device_get(fd);
 		va_bits = xe->va_bits;
 		open_sync_file();
 	}
 
+	igt_subtest("basic-svm")
+		test_basic(fd, &engine->instance, SZ_64K, 1);
+
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-- 
2.34.1

