Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63B2C25B75
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D99D10E3C5;
	Tue, 14 May 2024 07:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqQsalO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6DC10E3C5
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670611; x=1747206611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iI0omQJoyn/mkhjZcHKX6r8e3ALbRHLWAzB4KrDIdrs=;
 b=AqQsalO5Lva6kuTFcJI5St53pqgvh2+keDglEYW+s9we4WMSPUHSUQ1x
 JhlZSBwmRAjenDyg9DIDW6OBH24B6dy8oHW02/u6wWL1gf6MTEUtFUU6G
 mg7DZ22fGPKjmtRvUubdgpF6qPz4773xxsoEBaHZLE6xij+8UFHou0Zr6
 uZFTw0icXEiSr7wlTusGyoqLsAYiQ+6tFVeqrkmxDygInUiD7DXW1vHWn
 4T5JJUyfV/R79YKp0jWdeMp514jYIgLWoL7lQAThg61FffoSf+MyLV7vz
 7ZOZYxs+gxEtgJ2b+edLzGsYrhZqGYcOWIJcyE7GFT934nJHlTSfTYaDI A==;
X-CSE-ConnectionGUID: 2AAfZx7nScuZLBzsF/2LSw==
X-CSE-MsgGUID: 3kM1UNk4SI+GyD3mM/0zzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473026"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473026"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:11 -0700
X-CSE-ConnectionGUID: cHN+RvjDTxmIO3jXxsEhUw==
X-CSE-MsgGUID: oEsrrAkbQxO2shR9Y+S8fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427842"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:10 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 06/10] tests/intel/xe_svm: svm_atomic_access
Date: Tue, 14 May 2024 12:40:22 +0530
Message-Id: <20240514071026.748257-7-krishnaiah.bommu@intel.com>
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

Verify GPU atomic access any location in malloc'ed memory by using svm

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c     | 17 +++++++++++++++++
 lib/xe/xe_util.h     |  1 +
 tests/intel/xe_svm.c | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 1bdb5fa08..0e28c0093 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -107,6 +107,23 @@ void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val)
 	batch[++i] = MI_BATCH_BUFFER_END;
 }
 
+/*
+a command buffer is a buffer in GT0's vram, filled with gpu commands,
+plus some memory for a ufence used to sync command submission
+*/
+void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val)
+{
+	int i = 0;
+
+	//suppress compiler warning
+	(void)(val);
+
+	batch[i] = MI_STORE_DWORD_IMM_GEN4;
+	batch[++i] = dst_va;
+	batch[++i] = dst_va >> 32;
+	batch[++i] = MI_BATCH_BUFFER_END;
+}
+
 void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func, uint64_t dst_va, uint32_t val, struct drm_xe_engine_class_instance *eci)
 {
 	//make some room for a exec_ufence, which will be used to sync the
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
index 4f2818cc8..421d7fd1a 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -30,6 +30,8 @@
  * Description: verify SVM basic functionality by using randomly access any location in malloc'ed memory
  * SUBTEST: svm-huge-page
  * Description: verify SVM basic functionality by using huge page access
+ * SUBTEST: svm-atomic-access
+ * Description: verify SVM basic functionality by using GPU atomic access any location in malloc'ed memory
  */
 
 #include <fcntl.h>
@@ -189,6 +191,39 @@ static void svm_thp(int fd, uint32_t vm, struct drm_xe_engine_class_instance *ec
 	free(dst);
 }
 
+/**
+ *  Test GPU atomic access any location in malloc'ed memory
+ */
+static void svm_atomic_access(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	int val = 0xc0ffee;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t *dst, *dst_to_access;
+	uint32_t size = 1024*1024, sz_dw = size/4;
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
+	dst = aligned_alloc(xe_get_default_alignment(fd), size);
+	dst_to_access = dst + random()%sz_dw;
+	*dst_to_access = val;
+
+	xe_create_cmdbuf(&cmd_buf, insert_atomic_inc, (uint64_t)dst_to_access, val, eci);
+	xe_submit_cmd(&cmd_buf);
+
+	igt_assert_eq(*dst_to_access, val + 1);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -223,6 +258,10 @@ igt_main
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

