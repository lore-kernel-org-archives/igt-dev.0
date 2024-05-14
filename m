Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C838FC25B75
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5024310E25A;
	Tue, 14 May 2024 07:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9h9hSuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFAD10E25A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670605; x=1747206605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lc1urhugeUUP6zQDk2TCxJ+Dw0aD81qDygdmW2anh2w=;
 b=f9h9hSuX6xOdq4mNsKa+nCHSgO5DpXHVSra7OniwKiYS7tRm/UZl39VU
 3u8RFMW++AtqBGGuvlpDEVpcigTZM9j+pW0tXwmsClqQTr+21FIbtU1BH
 2qtrfUwDwpy5l+xfFMsguKUN3MRDmEvctm2XaSqL3sJdjy+Cz4KSVd7r6
 7g9NVD5Pj5gHoqjnevmWJY/D90eSZh7fTp1PERJAFj4nTvn5WwsGm7Kcb
 0GWKtIjmcoY1j4N11y0nUO2q8jQaUNqlrFOhzTuUOrE56NwU90s1QfFfo
 hHmfTIyYVC0AfXbo5YHqh0Crm2vc2ntpklKal2d5fbED7S2wsEAZvryaf A==;
X-CSE-ConnectionGUID: cX/s/bqzRliwUDiPzUDTdA==
X-CSE-MsgGUID: JGcJODZURtaSvjunqsBdUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473012"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:05 -0700
X-CSE-ConnectionGUID: /YZDwwmxQemc9hQNk4e33g==
X-CSE-MsgGUID: Pb/JlRVSR06vqO3EBzGnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427710"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:04 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 03/10] tests/xe_svm: basic svm test
Date: Tue, 14 May 2024 12:40:19 +0530
Message-Id: <20240514071026.748257-4-krishnaiah.bommu@intel.com>
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

Test will verify SVM basic functionality, by allocating a memory with
system allocator(malloc() or mmap()) and accessing in GPU.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/drm-uapi/xe_drm.h |  2 ++
 tests/intel/xe_svm.c      | 57 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 0b709b374..228bc2974 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -973,6 +973,8 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
+
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 7d0892a3d..2daed1eff 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -14,8 +14,18 @@
  */
 
 /**
- * TEST: xe_basic
+ * TEST: xe_svm
+ * Description: Test shared virtual memory
+ * Sub-category: Memory management
+ * Functionality: svm
+ * Run type: FULL
+ *
+ * SUBTEST: xe_basic
  * Description: Basic test to verify store dword by using helper funtions
+ * SUBTEST: svm-basic-malloc
+ * Description: verify SVM basic functionality by using malloc
+ * SUBTEST: svm-basic-mmap
+ * Description: verify SVM basic functionality by using mmap
  */
 
 #include <fcntl.h>
@@ -67,6 +77,40 @@ static void xe_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *e
 	xe_destroy_buffer(&dst_buf);
 }
 
+/**
+ *  Use malloc or mmap memory for direct GPU submission
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
+	igt_assert_eq(*dst, 0xc0ffee);
+	xe_destroy_cmdbuf(&cmd_buf);
+
+	if (test_mmap)
+		munmap(dst, 4);
+	else
+		free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -77,13 +121,22 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_supports_faults(fd));
 		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+		__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << 47, DRM_XE_VM_BIND_OP_MAP,
+				DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR, 0, 0, 0, 0);
 	}
 
-
 	igt_subtest_f("xe-basic")
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

