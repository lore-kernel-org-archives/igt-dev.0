Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64009C25B78
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2B10E3BE;
	Tue, 14 May 2024 07:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2mlcJnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8144110E3BE
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670619; x=1747206619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ovgqaBQjTZRDBgz3YnQGziPzQW9AhfjWz6gMEeTnpew=;
 b=W2mlcJnQIuXs2x+B5SfWOSJ0dQBU5YmZWZrpr3NJKt2N1AGe1UALMj9U
 b31gmcTH77ldYdTGlyOti3qHTQJ9gQ20GYgiwHVzgeovRu1Uac5vzHWSS
 qWGf1PqMRA8H8O03Yu6cuhf+dGHPfXskA19jhis34w5R1We+C84hdFdly
 zGbpl4TP/e7ooyuVrmLwKXheBkiCS2PmDjcUOjn3TBLlNk4/jMxg42gmU
 7m8G6+x5GE3UwyacxTD8kFiUP60J49kh39EXRRwwtGh3olpZLvc3NbXhS
 tLY1jpy3Bfqkz+rW1TmpP8t1icPVpFiUPhJsTe1L7t/p/ksljjH0+8Ftv A==;
X-CSE-ConnectionGUID: P1RSFMEuTNScWrelPXAbNg==
X-CSE-MsgGUID: 91PE58UcQMmJE8rYOW/70A==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473035"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:19 -0700
X-CSE-ConnectionGUID: 4tsHyaa2Q0CRnPS+ewJsaw==
X-CSE-MsgGUID: aV0ZnEybRwaxvKU4k5EbNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30428040"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:18 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 10/10] tests/intel/xe_svm: svm-sparse-access
Date: Tue, 14 May 2024 12:40:26 +0530
Message-Id: <20240514071026.748257-11-krishnaiah.bommu@intel.com>
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

Verify Sparsely access two memory locations with svm

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/xe/xe_util.c     | 15 +++++++++++++++
 lib/xe/xe_util.h     |  1 +
 tests/intel/xe_svm.c | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index a02ee5324..fc07c14b7 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -142,6 +142,21 @@ void insert_memset(uint32_t *batch, uint64_t dst_va, uint64_t size, uint32_t val
 	*batch++ = MI_BATCH_BUFFER_END;
 }
 
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
 void xe_create_cmdbuf(struct xe_buffer *cmd_buf, cmdbuf_fill_func_t fill_func, uint64_t dst_va, uint32_t val, struct drm_xe_engine_class_instance *eci)
 {
 	//make some room for a exec_ufence, which will be used to sync the
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
index e8989afaa..fbda6aaea 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -38,6 +38,8 @@
  * Description: verify SVM functionality while accessing read only memory
  * SUBTEST: svm-benchmark
  * Description: verify SVM performance with simple benchmark test
+ * SUBTEST: svm-sparse-access
+ * Description: verify Sparsely access two memory locations with svm
  */
 
 #include <fcntl.h>
@@ -330,6 +332,39 @@ static void svm_benchmark(int fd, uint32_t vm, struct drm_xe_engine_class_instan
 	igt_info("engine class %d, engine id %d memset E2E bandwidth(include sync overhead) %.3f MiB/s\n", eci->engine_class, eci->engine_instance, bandwidth);
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
+		.fd = fd,
+		.gpu_addr = (void *)(uintptr_t)gpu_va,
+		.vm = vm,
+		.size = bo_size,
+		.placement = vram_if_possible(fd, eci->gt_id),
+		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
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
@@ -380,6 +415,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_benchmark(fd, vm, hwe);
 
+	igt_subtest_f("svm-sparse-access")
+		xe_for_each_engine(fd, hwe)
+			svm_sparse_access(fd, vm, hwe);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

