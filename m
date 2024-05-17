Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C766EC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC1310EE83;
	Fri, 17 May 2024 11:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SR/Le5o2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15AD10EE87
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946397; x=1747482397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67kXY+4xBo+Ej9OPUsY5SR0FJQ9d0vFKppZ57w++0DA=;
 b=SR/Le5o2RISWUu/7+QTVsqeGuxU0dm8ElFt40gmk0aH+JcHknMRQHHXm
 baGHXbgdxT8dkmyfxxxLVFNkc/yMfI7jFP0PvylRIjI3Z9vKKCUtEoOBz
 lLe5D1V/2CvuxN45LnKb6lEIGiFb0kQcrkp/lZIAvZVzjq2ZrQXgNTR91
 5QYHbxr8v6Xd3FFmDT6S6yJZj1QjHRy2cknZGR3sBv5Pfk7xT0XHk8PLd
 DIWZ5W8/9e5UJydw++0kktxVAcAtnbAKs4vOzK+faxcLuD2yHaj/hTCTt
 BbC4nAZpdW/I+RQq1vUBQ/76KDaCS3IFdPBxZefS162YIV8ZHSVRjoMjo Q==;
X-CSE-ConnectionGUID: TSZR+DBfQcGn6gl/w5FsWg==
X-CSE-MsgGUID: OhzHkRXSRcqJirqg3BMosQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29619981"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29619981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:35 -0700
X-CSE-ConnectionGUID: uB9UVV3OSA+ayijlfbJtlA==
X-CSE-MsgGUID: P+UEDP8zT0OPVdjaIZdyYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977292"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:33 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 03/10] tests/intel/xe_svm: Add SVM basic tests using
 malloc and mmap
Date: Fri, 17 May 2024 17:16:51 +0530
Message-Id: <20240517114658.810283-4-krishnaiah.bommu@intel.com>
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

Adds subtests to verify the basic functionality of Shared Virtual Memory (SVM)
in the xe driver. The tests ensure that memory allocated with malloc or mmap can be correctly
used for GPU command submission and data verification.

Subtests:
- svm-basic-malloc: Verifies SVM functionality using memory allocated with malloc.
- svm-basic-mmap: Verifies SVM functionality using memory allocated with mmap.

The verification is done by writing a specific value to the allocated memory via GPU and
checking if the value is correctly stored.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/drm-uapi/xe_drm.h |  1 +
 tests/intel/xe_svm.c      | 52 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 0b709b374..69c8792bb 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -973,6 +973,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 6302af95b..741961529 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -21,6 +21,12 @@
  *
  * SUBTEST: xe-basic
  * Description: Basic test to verify store dword functionality using helper functions
+ *
+ * SUBTEST: svm-basic-malloc
+ * Description: Verify SVM basic functionality using malloc.
+ *
+ * SUBTEST: svm-basic-mmap
+ * Description: Verify SVM basic functionality using mmap.
  */
 
 #include <fcntl.h>
@@ -75,6 +81,44 @@ static void xe_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *e
 	xe_destroy_buffer(&dst_buf);
 }
 
+/**
+ * @brief Tests SVM functionality using malloc or mmap.
+ *
+ * This function tests the ability to use malloc or mmap allocated memory
+ * for direct GPU command submission and data verification.
+ */
+static void svm_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci, bool test_mmap)
+{
+	uint64_t gpu_va = 0x1a0000;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t *dst;
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
+	if (test_mmap)
+		dst = mmap(NULL, 4, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
+	else
+		dst = aligned_alloc(xe_get_default_alignment(fd), 4);
+
+	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
+	xe_submit_cmd(&cmd_buf);
+
+	igt_assert_eq(*dst, 0xc0ffee);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	if (test_mmap)
+		munmap(dst, 4);
+	else
+		free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -91,6 +135,14 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			xe_basic(fd, vm, hwe);
 
+	igt_subtest_f("svm-basic-malloc")
+		xe_for_each_engine(fd, hwe)
+			svm_basic(fd, vm, hwe, false);
+
+	igt_subtest_f("svm-basic-mmap")
+		xe_for_each_engine(fd, hwe)
+			svm_basic(fd, vm, hwe, true);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

