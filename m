Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DBBC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C045010E3EF;
	Tue, 14 May 2024 07:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bE9iRxda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1210E3EF
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670615; x=1747206615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJjjNMzwr7mLxai93M+KJ3SUh5jCZBV3SWEDM2VU1Oc=;
 b=bE9iRxdaMD5IJBw/01ykVAQHF8lwKJfIzU85UeWs1R8oUYMw6AY+C1hS
 Dkz8kLygB9XvZz5s+BwOYQAXBDIZar1qgIWUqCq1Z7pmWJtvSdc8eYiUl
 aHIfL7ik+uRM3j2USKpcknqP0qm5aoPViDpEfyupnqukuK+ljN/RpoZ1f
 K3/Eb8FsnS/RxNHkpuvEqfAo3wbCR/FtIWNyeNPm7Xrk42NEBE1NOyORx
 Gs7h9ztNAlxyarqEAlSsdNLFsazsy5BkBwiB/iVJE81zri1PJnqJLHrf6
 OZ0HfJDGnowPrw1ot9J/LCu7ZPb25ZTm4WahitkSa/FDjQf+NSdDR1RIF Q==;
X-CSE-ConnectionGUID: b/7V6L9dS+qiOu+ppAv9CA==
X-CSE-MsgGUID: ElfYQQ20T7G+TQAMkL84DA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473032"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473032"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:15 -0700
X-CSE-ConnectionGUID: Fu67CwOIRq6xoadzeHIDdg==
X-CSE-MsgGUID: 7ZJvj2YpQTKSUfDx71eECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427940"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:14 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 08/10] tests/intel/xe_svm: svm_benchmark
Date: Tue, 14 May 2024 12:40:24 +0530
Message-Id: <20240514071026.748257-9-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
References: <20240514071026.748257-1-krishnaiah.bommu@intel.com>
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

Verify SVM performance with simple benchmark test

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c     | 29 ++++++++++++++++++++++++++++
 lib/xe/xe_util.h     |  5 +++++
 tests/intel/xe_svm.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 0e28c0093..a02ee5324 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -124,6 +124,24 @@ void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val)
 	batch[++i] = MI_BATCH_BUFFER_END;
 }
 
+/** Insert commands to batch buffer to memset dst_va buffer with val
+ */
+void insert_memset(uint32_t *batch, uint64_t dst_va, uint64_t size, uint32_t val)
+{
+#define PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
+#define   MS_MATRIX		(1 << 17)
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
 void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func, uint64_t dst_va, uint32_t val, struct drm_xe_engine_class_instance *eci)
 {
 	//make some room for a exec_ufence, which will be used to sync the
@@ -135,6 +153,17 @@ void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func, u
 	fill_func(cmd_buf->cpu_addr, dst_va, val);
 }
 
+void xe_create_cmdbuf_fill_two_dw(struct xe_buffer *cmd_buf, cmdbuf_fill_two_dw_func_t fill_func, uint64_t dst_va, uint64_t dst_va1, uint32_t val, struct drm_xe_engine_class_instance *eci)
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
 void xe_destroy_cmdbuf(struct xe_buffer *cmd_buf)
 {
 	xe_exec_queue_destroy(cmd_buf->fd, cmd_buf->exec_queue);
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
index b846ca71a..0b573e0c9 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -34,6 +34,8 @@
  * Description: verify SVM basic functionality by using GPU atomic access any location in malloc'ed memory
  * SUBTEST: svm_invalid_va
  * Description: verify SVM functionality while accessing invalid address
+ * SUBTEST: svm-benchmark
+ * Description: verify SVM performance with simple benchmark test
  */
 
 #include <fcntl.h>
@@ -254,6 +256,46 @@ static void svm_invalid_va(int fd, uint32_t vm, struct drm_xe_engine_class_insta
 	free(dst);
 }
 
+/**
+ * A simple benchmark test.
+ * Use GPU to memset a buffer with specific value and
+ * measure memset end to end bandwidth.
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
+		.fd = fd,
+		.gpu_addr = (void *)(uintptr_t)gpu_va,
+		.vm = vm,
+		.size = bo_size,
+		.placement = vram_if_possible(fd, eci->gt_id),
+		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+	};
+
+	igt_gettime(&start_time);
+	dst = aligned_alloc(xe_get_default_alignment(fd), size);
+
+	xe_create_cmdbuf_fill_two_dw(&cmd_buf, insert_memset, (uint64_t)dst, (uint64_t)size, 0x12, eci);
+	xe_submit_cmd(&cmd_buf);
+	igt_assert_eq(*dst, 0x12121212);
+	xe_destroy_cmdbuf(&cmd_buf);
+
+	free(dst);
+
+	bandwidth = (double)(size>>20)*NSEC_PER_SEC/igt_nsec_elapsed(&start_time);
+	igt_info("engine class %d, engine id %d memset E2E bandwidth(include sync overhead) %.3f MiB/s\n", eci->engine_class, eci->engine_instance, bandwidth);
+}
+
 igt_main
 {
 	int fd;
@@ -296,6 +338,10 @@ igt_main
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

