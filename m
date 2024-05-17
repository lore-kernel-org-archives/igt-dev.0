Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BBEC25B7A
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190E010EE8E;
	Fri, 17 May 2024 11:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emwGlPX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E3410EE8B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946403; x=1747482403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D0dHY6sc36C9z/KsyqHub04viSX7+52LwQrlzCfoPtk=;
 b=emwGlPX/8EtfcqkYvBHnpqeJ5Altle9/X4TppoysfOCfdyGFm5rc2SBs
 XCJBGRlFzk6HpqumvetvrPreUrUjMlqzCNLSEVI9k8Fgju4aILK/VdBZ1
 8SbUGVa0dP8HCSvaYTrxyV+laBOSOoKu3Q+G8I2z7yzGGhNkK8Fs3zOiY
 YXqNaNq1GCH4HLHI8fb+Tjs2Nr9ESh/xbcyGJpLMrQK93bUlmUNPvMUBT
 V4WcjghZmHAmCxNdEgHT6xjMlw8fzm/uk/bIPdKw8hjEH3PFx9/ytp/H0
 swvPQ3OgKRNhDsPr7zgHVKT0DXi8+RbNf/J1947PlqdElSbxtNuZNtKtK A==;
X-CSE-ConnectionGUID: 2XTdO6xGQh6M40MR01BiYw==
X-CSE-MsgGUID: wvvZThJpTZmW7LuxLhnW4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29620002"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29620002"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:43 -0700
X-CSE-ConnectionGUID: zeoJ8RRYS4ubb8UzSg1vog==
X-CSE-MsgGUID: 7J4RZxMnRharBrTCIoL34Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977350"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:41 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 07/10] tests/intel/xe_svm: Add svm-invalid-va test to
 verify SVM functionality with invalid address access
Date: Fri, 17 May 2024 17:16:55 +0530
Message-Id: <20240517114658.810283-8-krishnaiah.bommu@intel.com>
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

svm-invalid-va test ensures that the driver correctly handles catastrophic
errors when the GPU attempts to access an invalid address in SVM.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index f9e8eb2d9..895cf26ac 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -36,6 +36,9 @@
  *
  * SUBTEST: svm-atomic-access
  * Description: verify SVM basic functionality by using GPU atomic access any location in malloc'ed memory
+ *
+ * SUBTEST: svm-invalid-va
+ * Description: Verify SVM functionality while accessing an invalid address.
  */
 
 #include <fcntl.h>
@@ -269,6 +272,35 @@ static void svm_atomic_access(int fd, uint32_t vm, struct drm_xe_engine_class_in
 	free(dst);
 }
 
+/**
+ * Submit a GPU command to access an invalid address.
+ * Driver should detect a catastrophic error.
+ */
+static void svm_invalid_va(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t *dst;
+
+	struct xe_buffer cmd_buf = {
+			.fd = fd,
+			.gpu_addr = (void *)(uintptr_t)gpu_va,
+			.vm = vm,
+			.size = bo_size,
+			.placement = vram_if_possible(fd, eci->gt_id),
+			.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
+	};
+
+	dst = (uint32_t *)0x1fffffffffff000;
+
+	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
+
+	igt_assert_eq(__xe_submit_cmd(&cmd_buf), -EIO); // for invalid address __xe_wait_ufence will return -EIO
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -305,6 +337,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_atomic_access(fd, vm, hwe);
 
+	igt_subtest_f("svm-invalid-va")
+		xe_for_each_engine(fd, hwe)
+			svm_invalid_va(fd, vm, hwe);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

