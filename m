Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C90FC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457B10E2F9;
	Tue, 14 May 2024 07:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mfi6cRg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6531210E2F9
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670617; x=1747206617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xkrv58SDkd6A7ioyd0HXrcnxFqBNuqybRfWlfXgZqRw=;
 b=Mfi6cRg+AtflSo5WC2CC6UCnfnopCcum0wKtNdgLAkK3oiUFF7nTHncv
 esusAMwM1vZT5oUsWsSdDKVOb+x8sMrwhEFWbT3b4HGUoIKNhoxza/VZw
 JxZzkTQevFCl36i1RPQuKBvFpExcqFAXHczMQflaGW8IVWlnTuCuIHv1y
 s/Cm0hPivC87elPNtjUKiYZxftJwpeOkT4AVnYU+zfAWw45tbW+k+/bKC
 Ufpm0ETgiF54m+kl+LJ6PSt44XrGZBBctWDfdonKlkWgpnzJorx1lxAlR
 tdVX3UaMVZ73JPo+cRR7lW00Dl/y1YEqDjNEme37WWTEAU8QpZAjxQGbB Q==;
X-CSE-ConnectionGUID: lZjIi4EOSOu8opdLOvYYkw==
X-CSE-MsgGUID: q4E3MgEOQP6jKD0FODnuMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473033"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473033"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:17 -0700
X-CSE-ConnectionGUID: nZ6TMnWFRuuq3Vrp+A0vHA==
X-CSE-MsgGUID: K5ZJTpvVQLm0sU1ssxcmtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427990"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:16 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 09/10] tests/intel/xe_svm: svm_mprotect
Date: Tue, 14 May 2024 12:40:25 +0530
Message-Id: <20240514071026.748257-10-krishnaiah.bommu@intel.com>
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

Verify SVM functionality while accessing read only memory

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 0b573e0c9..e8989afaa 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -34,6 +34,8 @@
  * Description: verify SVM basic functionality by using GPU atomic access any location in malloc'ed memory
  * SUBTEST: svm_invalid_va
  * Description: verify SVM functionality while accessing invalid address
+ * SUBTEST: svm-mprotect
+ * Description: verify SVM functionality while accessing read only memory
  * SUBTEST: svm-benchmark
  * Description: verify SVM performance with simple benchmark test
  */
@@ -256,6 +258,38 @@ static void svm_invalid_va(int fd, uint32_t vm, struct drm_xe_engine_class_insta
 	free(dst);
 }
 
+/**
+ * Use mprotect to mark a chunk of memory to be read only and submit
+ * GPU command to write to this read only memory. GPU write should
+ * fail and driver should detect an invalid access error.
+ */
+static void svm_mprotect(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t *dst;
+	uint32_t size = 65536;
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
+	dst = aligned_alloc(size, size);
+	mprotect(dst, size, PROT_READ);
+
+	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
+
+	igt_assert_eq(__xe_submit_cmd(&cmd_buf), -EIO);
+
+	xe_destroy_cmdbuf(&cmd_buf);
+	free(dst);
+}
+
 /**
  * A simple benchmark test.
  * Use GPU to memset a buffer with specific value and
@@ -338,6 +372,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_invalid_va(fd, vm, hwe);
 
+	igt_subtest_f("svm-mprotect")
+		xe_for_each_engine(fd, hwe)
+			svm_mprotect(fd, vm, hwe);
+
 	igt_subtest_f("svm-benchmark")
 		xe_for_each_engine(fd, hwe)
 			svm_benchmark(fd, vm, hwe);
-- 
2.25.1

