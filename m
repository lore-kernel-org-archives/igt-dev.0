Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22203C25B7A
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B922910EE89;
	Fri, 17 May 2024 11:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7TQcAfg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC03D10EE87
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946400; x=1747482400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fUJOeRRpDwIVHyPuxfQRTE4houNZM9MrEvZKYAhq15s=;
 b=d7TQcAfgNxeUK16avmCtCAX6/aG2cqwLj3S2bqp9vI3NQRn6oWGL4l6W
 NLp5eRgzqeGd6IHT/3OyAyL4n6PlkFXdauU30SorpzXg6NvZ3z26ppHmi
 jtS8Y+5qXT157n5k+jXefAzADVtenwthmJuUzXhMBxNDP1sb19Cey8lon
 m8kpV9JZ8nOOPxwhThgpPPX6JIDMHV7yvoAU5lff8fKgMjpjbHnd8h15x
 RIu78UZxu5uH0ECkUNWWyure/GgYR9MtU5uSjWkYBqcUA0ZXZHFF5dmah
 ps12v/zer0RFBB/YSJ0LMS+daHHitJBvIUCM+ln0XcpTPQfTDgG42C5b/ w==;
X-CSE-ConnectionGUID: bbMGtJ/uTAiNdldyLEHosg==
X-CSE-MsgGUID: HiemQRxKRBGImDfrnKZ+Jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29619982"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29619982"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:37 -0700
X-CSE-ConnectionGUID: mm4/FMZoT9mQ1RUbV+WZ0w==
X-CSE-MsgGUID: hBfukrJORuirv8fdcnqSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977299"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:35 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 04/10] tests/intel/xe_svm: add random access test for
 SVM
Date: Fri, 17 May 2024 17:16:52 +0530
Message-Id: <20240517114658.810283-5-krishnaiah.bommu@intel.com>
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

Verifies the Shared Virtual Memory (SVM) functionality by randomly
accessing any location in malloc'ed memory. The test ensures that
the GPU can correctly handle random memory access patterns.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 741961529..73a232c47 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -27,6 +27,9 @@
  *
  * SUBTEST: svm-basic-mmap
  * Description: Verify SVM basic functionality using mmap.
+ *
+ * SUBTEST: svm-random-access
+ * Description: Verifies that the GPU can randomly access and correctly store values in malloc'ed memory.
  */
 
 #include <fcntl.h>
@@ -119,6 +122,40 @@ static void svm_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *
 		free(dst);
 }
 
+/**
+ *  @brief Verifies GPU can randomly access any location in malloc'ed memory.
+ *
+ *This function tests the ability of the GPU to randomly access and correctly store
+ * values in malloc'ed memory.
+ */
+static void svm_random_access(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
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
+	dst = malloc(size);
+	dst_to_access = dst + random()%sz_dw;
+
+	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst_to_access, 0xc0ffee, eci);
+	xe_submit_cmd(&cmd_buf);
+
+	igt_assert_eq(*dst, 0xc0ffee);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -143,6 +180,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_basic(fd, vm, hwe, true);
 
+	igt_subtest_f("svm-random-access")
+		xe_for_each_engine(fd, hwe)
+			svm_random_access(fd, vm, hwe);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

