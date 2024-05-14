Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EACC25B78
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561F810E3CF;
	Tue, 14 May 2024 07:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dg71DKTF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1941510E3CF
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670613; x=1747206613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/QcpEiKPNwGLYbl+ol88Ro9BDzgdNZLx/nhGbQqwdAY=;
 b=Dg71DKTFZYLlMX/1aqfXSBXDsunhvYTopOiNMGZn9VT1+PRtVdB2U7Da
 hPJX3jTX4u77TzScurdAR0XZqtY0gsWC8Z0PL9/lrwL5xWVu77n1/Qkp6
 O8dqyP15zBt6eX+oopPxF1ShCJYdrAAD74AkBKJ/iL8Uhe97MnAJ4smyV
 S+UdT9vsY1U8Rmndgz6zqbyAQBpfzGmB2uHsWb+Pzuaxw7djVPvNP4TSW
 Qvb/piCl6IwrbCGqqYnVgjEFWjzL2qq/bInJ7YfpnW7LdZx9kz2CDT21K
 rvn/r97/bvnftNn9bgna0iot5i+SlsB6YRBl9umioIJ92vGolNboU8/sN A==;
X-CSE-ConnectionGUID: U44A2nVjS42pA4VUPfEsog==
X-CSE-MsgGUID: lDAh/TsQRoCL8b5UnDoPvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473028"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473028"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:13 -0700
X-CSE-ConnectionGUID: CHsRlshfTMudJKc+q4pyLQ==
X-CSE-MsgGUID: 1aZNoC4JSz+HZswTVtjM4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427894"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:12 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 07/10] tests/intel/xe_svm: svm-invalid-va
Date: Tue, 14 May 2024 12:40:23 +0530
Message-Id: <20240514071026.748257-8-krishnaiah.bommu@intel.com>
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

Verify SVM functionality while accessing invalid address

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 421d7fd1a..b846ca71a 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -32,6 +32,8 @@
  * Description: verify SVM basic functionality by using huge page access
  * SUBTEST: svm-atomic-access
  * Description: verify SVM basic functionality by using GPU atomic access any location in malloc'ed memory
+ * SUBTEST: svm_invalid_va
+ * Description: verify SVM functionality while accessing invalid address
  */
 
 #include <fcntl.h>
@@ -224,6 +226,34 @@ static void svm_atomic_access(int fd, uint32_t vm, struct drm_xe_engine_class_in
 	free(dst);
 }
 
+/**
+ * Submit a GPU command to access an invalid address.
+ * Driver should detect a catstrophic error.
+ */
+static void svm_invalid_va(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
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
+		.flag = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
+	};
+
+	dst = (uint32_t *)0x1fffffffffff000;
+
+	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
+	igt_assert_eq(__xe_submit_cmd(&cmd_buf), -EIO); // for invalid address __xe_wait_ufence will return -EIO
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	free(dst);
+}
+
 igt_main
 {
 	int fd;
@@ -262,6 +292,10 @@ igt_main
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

