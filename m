Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B332C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC48710E2F4;
	Tue, 14 May 2024 07:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C16rZJhs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC7810E2F4
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670606; x=1747206606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NaLwcqZU0xlQuaQ6so2FvufLSsTdv/RgySh5BLfsh1Y=;
 b=C16rZJhsS0A2MMip5vJ6JSScH6DSbWaUBBcat9Zg5PSDOoscMG2SGV1l
 6ov7MYWjx458keA28GCIEccboCB0HNUNu0+zAPtgujXhailcU8Paxis+B
 Uoc/M39a04sT/16nrJORJlCgizgQIXudO9+nsDMPDq2RBmBo9CAdCV5iN
 kAHVbjvesGWcBArSk5OGQE2juZvOChbbugwk8+KxhfjXBKa6BS2P+q8QA
 MDdvQnoB+qzj21UUdJbAFuX72hT9TufUsTObf90jI7NswX6PS44NVglJR
 9uIc0e2dxEWcqZbUCdLYI0sWoojaCoPkwMs5qEeapWm4E4xTnAz6DGKLG A==;
X-CSE-ConnectionGUID: KndKad6KTz6JzL7zRyjwDw==
X-CSE-MsgGUID: E44WePk7QEWqruHI0MUJfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473016"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473016"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:06 -0700
X-CSE-ConnectionGUID: Pi8vjswNQgyN5yTQRMyxVA==
X-CSE-MsgGUID: kTMCCv82RsCFklQPBnwBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427752"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:06 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 04/10] tests/intel/xe_svm: svm_random_access
Date: Tue, 14 May 2024 12:40:20 +0530
Message-Id: <20240514071026.748257-5-krishnaiah.bommu@intel.com>
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

Verify GPU can randomly access any location in malloc'ed memory by using svm.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 2daed1eff..1c90d2e10 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -26,6 +26,9 @@
  * Description: verify SVM basic functionality by using malloc
  * SUBTEST: svm-basic-mmap
  * Description: verify SVM basic functionality by using mmap
+ * SUBTEST: svm-random-access
+ * Description: verify SVM basic functionality by using
+ * randomly access any location in malloc'ed memory
  */
 
 #include <fcntl.h>
@@ -111,6 +114,37 @@ static void svm_basic(int fd, uint32_t vm, struct drm_xe_engine_class_instance *
 		free(dst);
 }
 
+/**
+ *  Verify GPU can randomly access any location in malloc'ed memory
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
@@ -137,6 +171,10 @@ igt_main
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

