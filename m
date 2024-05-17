Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A47C25B77
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4210EE82;
	Fri, 17 May 2024 11:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auFvgMEi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159F710EE94
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946409; x=1747482409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bd+1ihCHmSa1ngxslCwXk51LiD9p5fmeLlUJPntYSBE=;
 b=auFvgMEizSCK+fHZnGNxPwfEp8wiVsmaqKnGPa7abMslhBuCUT1nbtDk
 Y1WDvFXDyO2PJk9ePTsQZCmwc/X+5guaBhYffc1jwR8kFGEZnYho/eY2/
 i/aKrxG5FWfsfFtTANVtQS7OxJSzhB6B++2EY5CzOO0+LsCkJnz48u6zA
 vwl6TYa+Ania2GmaUGG2fHHKYr6i1HzB3LzjRm+aep55KNmNlYsEhlJ7x
 Is/7E3ofGVd/wJxC/tQaxpioTR7w6Q8PrlwVSfdiVsvLW2KbX63QpCxhJ
 q7huvOBWMmjTAWY1e7xXJaGHk8rFMm0XGCTOGl+SoWZM22xHN6M2IyulV Q==;
X-CSE-ConnectionGUID: PSDZliSySICRjOJb5BScZw==
X-CSE-MsgGUID: cZLdd86UQJyCVKcZ+6ir5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29620006"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29620006"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:49 -0700
X-CSE-ConnectionGUID: U+HAzhtKSQCBqtzzFRrptg==
X-CSE-MsgGUID: PuTOGSHjQpG7yEuqsIquMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977369"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:47 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 10/10] tests/intel/xe_svm: Add svm-sparse-access test
 to verify sparsely accessing two memory locations with SVM
Date: Fri, 17 May 2024 17:16:58 +0530
Message-Id: <20240517114658.810283-11-krishnaiah.bommu@intel.com>
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

svm-sparse-access verifies the functionality of sparsely accessing two memory locations using SVM

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c     | 18 ++++++++++++++++++
 lib/xe/xe_util.h     |  1 +
 tests/intel/xe_svm.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index c19cdae0c..217d3fa1b 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -146,6 +146,24 @@ void insert_memset(uint32_t *batch, uint64_t dst_va, uint64_t size, uint32_t val
 	*batch++ = MI_BATCH_BUFFER_END;
 }
 
+/**
+ * Insert commands to batch buffer to store values in two memory locations.
+ */
+void insert_two_stores(uint32_t *batch, uint64_t dst_va, uint64_t dst_va1, uint32_t val)
+{
+	int i = 0;
+
+	batch[i] = MI_STORE_DWORD_IMM;
+	batch[++i] = dst_va;
+	batch[++i] = dst_va >> 32;
+	batch[++i] = val;
+	batch[++i] = MI_STORE_DWORD_IMM;
+	batch[++i] = dst_va1;
+	batch[++i] = dst_va1 >> 32;
+	batch[++i] = val;
+	batch[++i] = MI_BATCH_BUFFER_END;
+}
+
 /**
  * Creates a command buffer, fills it with commands using the provided fill
  * function, and sets up the execution queue for submission.
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 50f2a4bc4..f463cca3b 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -46,6 +46,7 @@ uint64_t *xe_cmdbuf_exec_ufence_cpuva(struct xe_buffer *cmd_buf);
 void insert_store(uint32_t *batch, uint64_t dst_va, uint32_t val);
 void insert_atomic_inc(uint32_t *batch, uint64_t dst_va, uint32_t val);
 void insert_memset(uint32_t *batch, uint64_t dst_va, uint64_t size, uint32_t val);
+void insert_two_stores(uint32_t *batch, uint64_t dst_va, uint64_t dst_va1, uint32_t val);
 void xe_submit_cmd(struct xe_buffer *cmdbuf);
 int64_t __xe_submit_cmd(struct xe_buffer *cmdbuf);
 void xe_destroy_buffer(struct xe_buffer *buffer);
diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 86c9e86b8..0bdc1cc1e 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -45,6 +45,9 @@
  *
  * SUBTEST: svm-mprotect
  * Description: verify SVM functionality while accessing read only memory
+ *
+ * SUBTEST: svm-sparse-access
+ * Description: verify Sparsely access two memory locations with svm
  */
 
 #include <fcntl.h>
@@ -380,6 +383,39 @@ static void svm_mprotect(int fd, uint32_t vm, struct drm_xe_engine_class_instanc
 	free(dst);
 }
 
+/**
+ *  Sparsely access two memory locations
+ */
+static void svm_sparse_access(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t size = 1024*1024, sz_dw = size/4;
+	uint32_t *dst, *dst_to_access, *dst_to_access1;
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
+	dst = malloc(size);
+	dst_to_access = dst + (sz_dw>>1);
+	dst_to_access1 = dst + (sz_dw>>2);
+
+	xe_create_cmdbuf_fill_two_dw(&cmd_buf, insert_two_stores, (uint64_t)dst_to_access, (uint64_t)dst_to_access1, 0xc0ffee, eci);
+	xe_submit_cmd(&cmd_buf);
+
+	igt_assert_eq(*dst_to_access, 0xc0ffee);
+	igt_assert_eq(*dst_to_access1, 0xc0ffee);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -428,6 +464,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_mprotect(fd, vm, hwe);
 
+	igt_subtest_f("svm-sparse-access")
+		xe_for_each_engine(fd, hwe)
+			svm_sparse_access(fd, vm, hwe);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

