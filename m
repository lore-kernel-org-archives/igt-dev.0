Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46450C41513
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2CB10EE8D;
	Fri, 17 May 2024 11:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDPHdNSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8FB10EE8B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946402; x=1747482402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZZjebBc5Md9+8s+8xzfLWoFRonV1KwN32JJWxn2J3dk=;
 b=oDPHdNSnybz77DzoLVe/Bb8jmOBaXS3BxYqQhRPMHSvhSJKA/YYc+bU4
 X1rJpcCqWiAB7bzyK5yi4D+gtdYRTIIaUch3Dmc23NI5JHnBqliX7V7N1
 bXBCE8CAiXD0AA3WngntbEhFaNGYDJrbdgCbNtVL37qvFJ2xluKT343XX
 wjFuTx5iKRaaGNk8CzYmfl8dmBjGCX73dpzcAb0an5wAWYxerRUGJc62S
 MF5b8FnQ5cmpr4pHSq+djN1fZfBOZY2lmuPpHe/sFJduus3yV16hwEy2C
 DrPsR6P2gEuWrY6YWQIXVndbUF7SLYartwjkRzD8H9cwEPi7Q7lUQI8qc w==;
X-CSE-ConnectionGUID: HTYeyHB6Q9++7C6F1lwyYw==
X-CSE-MsgGUID: yG9MzA5oSRGU8yntOxlRHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29619999"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29619999"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:41 -0700
X-CSE-ConnectionGUID: UhyCNLxVSgqnE7qsp4GOqA==
X-CSE-MsgGUID: 0kqHfkKVTsuuHEq9a+cbjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977342"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:39 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 06/10] tests/intel/xe_svm: Add support for GPU atomic
 access test for svm
Date: Fri, 17 May 2024 17:16:54 +0530
Message-Id: <20240517114658.810283-7-krishnaiah.bommu@intel.com>
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

Verify GPU atomic access using multiple threads by performing operations on
randomly allocated locations within malloc'ed memory in shared virtual memory.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c     | 11 +++++++
 lib/xe/xe_util.h     |  1 +
 tests/intel/xe_svm.c | 71 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index de848b8bc..672e9dcef 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -117,6 +117,17 @@ void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val)
 	batch[++i] = MI_BATCH_BUFFER_END;
 }
 
+// Function to insert atomic increment command
+void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val)
+{
+	int i = 0;
+
+	batch[i] = MI_ATOMIC | MI_ATOMIC_INC;
+	batch[++i] = dst_va;
+	batch[++i] = dst_va >> 32;
+	batch[++i] = MI_BATCH_BUFFER_END;
+}
+
 /**
  * Creates a command buffer, fills it with commands using the provided fill
  * function, and sets up the execution queue for submission.
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index c38f79e60..46e1ccc9a 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -40,6 +40,7 @@ void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func,
 uint64_t xe_cmdbuf_exec_ufence_gpuva(struct xe_buffer *cmd_buf);
 uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf);
 void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val);
+void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val);
 void xe_submit_cmd(struct xe_buffer *cmdbuf);
 int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
 void xe_destroy_buffer(struct xe_buffer *buffer);
diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index d9629246c..f9e8eb2d9 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -33,6 +33,9 @@
  *
  * SUBTEST: svm-huge-page
  * Description: verify SVM basic functionality by using huge page access
+ *
+ * SUBTEST: svm-atomic-access
+ * Description: verify SVM basic functionality by using GPU atomic access any location in malloc'ed memory
  */
 
 #include <fcntl.h>
@@ -47,6 +50,18 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define NUM_THREADS 10
+
+// Thread argument structure
+typedef struct {
+	int fd;
+	uint32_t vm;
+	void *gpu_va;
+	uint64_t dst_va;
+	uint32_t val;
+	struct drm_xe_engine_class_instance *eci;
+} thread_args_t;
+
 /**
  *  @brief Verifies basic workload execution on the GPU.
  *
@@ -202,6 +217,58 @@ static void svm_thp(int fd, uint32_t vm, struct drm_xe_engine_class_instance *ec
 	free(dst);
 }
 
+
+// Thread function for submitting atomic increment commands
+static void* thread_func(void* args)
+{
+	thread_args_t *thread_args = (thread_args_t *)args;
+	struct xe_buffer cmd_buf = {
+		.fd = thread_args->fd,
+		.gpu_addr = (void *)(uintptr_t)thread_args->gpu_va,
+		.vm = thread_args->vm,
+		.size = xe_bb_size(thread_args->fd, PAGE_ALIGN_UFENCE),
+		.placement = vram_if_possible(thread_args->fd, thread_args->eci->gt_id),
+		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+	};
+
+	xe_create_cmdbuf(&cmd_buf, insert_atomic_inc, thread_args->dst_va, thread_args->val, thread_args->eci);
+	xe_submit_cmd(&cmd_buf);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+
+	return NULL;
+}
+
+// Test GPU atomic access with multiple threads
+static void svm_atomic_access(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	int val = 0xc0ffee;
+	uint32_t *dst, *dst_to_access;
+	uint32_t size = 1024 * 1024, sz_dw = size / 4;
+	pthread_t threads[NUM_THREADS];
+
+	dst = aligned_alloc(xe_get_default_alignment(fd), size);
+	dst_to_access = dst + (rand() % sz_dw);
+	*dst_to_access = val;
+
+	thread_args_t thread_args = { fd, vm, (void *)(uintptr_t)gpu_va, (uint64_t)dst_to_access, val, eci };
+
+	// Create and launch threads
+	for (int i = 0; i < NUM_THREADS; i++) {
+		pthread_create(&threads[i], NULL, thread_func, &thread_args);
+	}
+
+	// Wait for all threads to finish
+	for (int i = 0; i < NUM_THREADS; i++) {
+		pthread_join(threads[i], NULL);
+	}
+
+	igt_assert_eq(*dst_to_access, val + NUM_THREADS);
+
+	free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -234,6 +301,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_thp(fd, vm, hwe);
 
+	igt_subtest_f("svm-atomic-access")
+		xe_for_each_engine(fd, hwe)
+			svm_atomic_access(fd, vm, hwe);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

