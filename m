Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBC9C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA7410EE90;
	Fri, 17 May 2024 11:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeIfhNhB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CEF10EE90
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946405; x=1747482405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9zOO0QIXhXEElYHF2Z1+NOXHRkaNUkYejCKIeDjDUzA=;
 b=aeIfhNhBVA9X+EbVYyR+CpI24owBEjHXtb/HQNLvBrhurbNJI2BzccEc
 lW4uEAOguzOtSysrI8jxLxj0Ir2Ua7F6O3dkulCOrOLfP11XQ1ZTuVCci
 0ASEf7W3DJZgX/GokkBgPeWtqUzNGSHFRgCRGO6LdB7QdOwbLYLCDTzW4
 s9FdYFPdr0i4wf4E396dz22dCq9sgp4o0e3xinYWbK+LUJqD4+Pv6Xi6I
 jVYU47M+I/LtANe5ONLxY9ykOIqeUC0Bbe0KcqnevdtIK4FdSsKWaEz0R
 mLssa/WVS9v5PbbWQW8uuxjeR3zRXcbGDQY4qhIeAPPn5ZPCQb3+xwD82 w==;
X-CSE-ConnectionGUID: QNRcIzN5Qc2vZL7OpncfKA==
X-CSE-MsgGUID: zJ130iELRz22Q+gy5h3gDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29620003"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29620003"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:45 -0700
X-CSE-ConnectionGUID: SEj0EiKuTlqCCOKJcAuSIA==
X-CSE-MsgGUID: TgErOhesRt2+MV6vhgLVfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977356"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:43 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 08/10] tests/intel/xe_svm: Add svm-benchmark test to
 measure SVM performance with a simple benchmark
Date: Fri, 17 May 2024 17:16:56 +0530
Message-Id: <20240517114658.810283-9-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
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

svm-benchmark test provides a basic benchmark to compare the performance of
system allocators against runtime allocators in SVM scenarios.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c     | 34 +++++++++++++++++++++++++++++++
 lib/xe/xe_util.h     |  5 +++++
 tests/intel/xe_svm.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 672e9dcef..c19cdae0c 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -128,6 +128,24 @@ void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val)
 	batch[++i] = MI_BATCH_BUFFER_END;
 }
 
+/** Insert commands to batch buffer to memset dst_va buffer with val
+ */
+void insert_memset(uint32_t *batch, uint64_t dst_va, uint64_t size, uint32_t val)
+{
+#define PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
+#define MS_MATRIX		(1 << 17)
+	const int page_shift = 12;
+
+	*batch++ = PVC_MEM_SET_CMD | MS_MATRIX | (7 - 2);
+	*batch++ = BIT(page_shift) - 1;
+	*batch++ = (size >> page_shift) - 1;
+	*batch++ = BIT(page_shift) - 1;
+	*batch++ = lower_32_bits(dst_va);
+	*batch++ = upper_32_bits(dst_va);
+	*batch++ = (uint32_t)val << 24;
+	*batch++ = MI_BATCH_BUFFER_END;
+}
+
 /**
  * Creates a command buffer, fills it with commands using the provided fill
  * function, and sets up the execution queue for submission.
@@ -143,6 +161,22 @@ void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func, u
 	fill_func(cmd_buf->cpu_addr, dst_va, val);
 }
 
+/**
+ * Create a command buffer and fill it with a two-DW command function.
+ */
+void xe_create_cmdbuf_fill_two_dw(struct xe_buffer *cmd_buf, cmdbuf_fill_two_dw_func_t fill_func,
+		uint64_t dst_va, uint64_t dst_va1, uint32_t val, struct drm_xe_engine_class_instance *eci)
+{
+	//make some room for a exec_ufence, which will be used to sync the
+	//submission of this command....
+
+	cmd_buf->size = xe_bb_size(cmd_buf->fd, cmd_buf->size + PAGE_ALIGN_UFENCE);
+	xe_create_buffer(cmd_buf);
+	cmd_buf->exec_queue = xe_exec_queue_create(cmd_buf->fd, cmd_buf->vm, eci, 0);
+	fill_func(cmd_buf->cpu_addr, dst_va, dst_va1, val);
+}
+
+
 /**
  * Destroys a command buffer created by xe_create_cmdbuf and releases
  * associated resources.
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 46e1ccc9a..50f2a4bc4 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -34,13 +34,18 @@ struct xe_buffer {
 };
 
 typedef void (*cmdbuf_fill_func_t) (uint32_t *batch, uint64_t dst_gpu_va, uint32_t val);
+typedef void (*cmdbuf_fill_two_dw_func_t) (uint32_t *batch, uint64_t dst_gpu_va,
+		uint64_t dst_gpu_va1, uint32_t val);
 void xe_create_buffer(struct xe_buffer *buffer);
 void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func,
 		uint64_t dst_va, uint32_t val, struct drm_xe_engine_class_instance *eci);
+void xe_create_cmdbuf_fill_two_dw(struct xe_buffer *cmd_buf, cmdbuf_fill_two_dw_func_t fill_func,
+		uint64_t dst_va, uint64_t dst_va1, uint32_t val, struct drm_xe_engine_class_instance *eci);
 uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf);
 uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf);
 void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val);
 void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val);
+void insert_memset(uint32_t *batch, uint64_t dst_va, uint64_t size, uint32_t val);
 void xe_submit_cmd(struct xe_buffer *cmdbuf);
 int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
 void xe_destroy_buffer(struct xe_buffer *buffer);
diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 895cf26ac..072a602b1 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -39,6 +39,9 @@
  *
  * SUBTEST: svm-invalid-va
  * Description: Verify SVM functionality while accessing an invalid address.
+ *
+ * SUBTEST: svm-benchmark
+ * Description: Verify SVM performance with a simple benchmark test.
  */
 
 #include <fcntl.h>
@@ -301,6 +304,47 @@ static void svm_invalid_va(int fd, uint32_t vm, struct drm_xe_engine_class_insta
 	free(dst);
 }
 
+/**
+ * A simple benchmark test.
+ * Uses the GPU to memset a buffer with a specific value and measures the end-to-end bandwidth.
+ * This provides a basic comparison of the performance between the system allocator and the runtime allocator.
+ *
+ * By comparing the output of those two tests, we can have
+ * a very basic concept of the performance of sytem allocator
+ * compared to runtime allocator.
+ */
+static void svm_benchmark(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t *dst, size = 1 << 26;
+	struct timespec start_time;
+	double bandwidth;
+
+	struct xe_buffer cmd_buf = {
+			.fd = fd,
+			.gpu_addr = (void *)(uintptr_t)gpu_va,
+			.vm = vm,
+			.size = bo_size,
+			.placement = vram_if_possible(fd, eci->gt_id),
+			.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+	};
+
+	igt_gettime(&start_time);
+	dst = aligned_alloc(xe_get_default_alignment(fd), size);
+
+	xe_create_cmdbuf_fill_two_dw(&cmd_buf, insert_memset, (uint64_t)dst, (uint64_t)size, 0x12, eci);
+	xe_submit_cmd(&cmd_buf);
+
+	igt_assert_eq(*dst, 0x12121212);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	free(dst);
+
+	bandwidth = (double)(size>>20)*NSEC_PER_SEC/igt_nsec_elapsed(&start_time);
+	igt_info("engine class %d, engine id %d memset E2E bandwidth(include sync overhead) %.3f MiB/s\n", eci->engine_class, eci->engine_instance, bandwidth);
+}
+
 igt_main
 {
 	int fd;
@@ -341,6 +385,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_invalid_va(fd, vm, hwe);
 
+	igt_subtest_f("svm-benchmark")
+		xe_for_each_engine(fd, hwe)
+			svm_benchmark(fd, vm, hwe);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

