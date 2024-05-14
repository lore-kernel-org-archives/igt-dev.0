Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC12C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 07:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F397A10E3BD;
	Tue, 14 May 2024 07:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAzkNsEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D552E10E3BD
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 07:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715670609; x=1747206609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eIaG+8EVikv1gBhYRnTNp45xRA7XgIdRQt8lU2CjIqs=;
 b=kAzkNsEZTC4LAeUnPryk+YmV0qKENCK+R9xv40Zd3tiC2FFq8d0EDKIc
 R9gIji0TanQI4NErhMArbIcp17PTG0PGBiS3x1fIQcAbRsy+hs9o6MrnK
 M7FvAcMBxsRrwhQamBAdaipIU/jtzZqIG4yCXerYK8YOKfKvx3eqYXmG3
 J2Xfbws0dSqXUYzVvtMUbR9cB8Z5gJie6z1j4V8KUXY5qooLlxrHvBz4I
 oG7S2l95T6r38OEN3DhxdSmbMJiiD2bC1HO0V52/5VRIKOVKVelCCYJb/
 /e4xs5Pq+jULvvBWEE06vs86xFd7O/ZEOfLYy9wDPg/lPvC6BKbltbpoD w==;
X-CSE-ConnectionGUID: tVwR5gjfTQKvyhSWAqAbhA==
X-CSE-MsgGUID: azQ3IKtVRwa3tkNZ7QLjOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15473019"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15473019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 00:10:09 -0700
X-CSE-ConnectionGUID: +QIwDeh8T12FUAfLOBW0Sw==
X-CSE-MsgGUID: gJ1hzP9+SKOqTJ9rgeaSgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30427799"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa010.jf.intel.com with ESMTP; 14 May 2024 00:10:08 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v2 05/10] tests/intel/xe_svm: svm-huge-page
Date: Tue, 14 May 2024 12:40:21 +0530
Message-Id: <20240514071026.748257-6-krishnaiah.bommu@intel.com>
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

Verify GPU can huge page access by using svm.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 52 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 1c90d2e10..4f2818cc8 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -27,8 +27,9 @@
  * SUBTEST: svm-basic-mmap
  * Description: verify SVM basic functionality by using mmap
  * SUBTEST: svm-random-access
- * Description: verify SVM basic functionality by using
- * randomly access any location in malloc'ed memory
+ * Description: verify SVM basic functionality by using randomly access any location in malloc'ed memory
+ * SUBTEST: svm-huge-page
+ * Description: verify SVM basic functionality by using huge page access
  */
 
 #include <fcntl.h>
@@ -145,6 +146,49 @@ static void svm_random_access(int fd, uint32_t vm, struct drm_xe_engine_class_in
 	free(dst);
 }
 
+/**
+ * Test the behavior of transparent huge page.
+ * Allocate 2MB of aligned memory so huge page
+ * is used. What happens if driver only migrate
+ * 1 4k page of that buffer to GPU?
+ *
+ * Test result shows that the huge page is splitted
+ * into small pages and only one 4k page is
+ * migrated.
+ */
+static void svm_thp(int fd, uint32_t vm, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t gpu_va = 0x1a0000;
+	size_t bo_size = xe_bb_size(fd, PAGE_ALIGN_UFENCE);
+	uint32_t size = 1<<21;
+	uint32_t *dst;
+	int ret;
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
+	ret = posix_memalign((void **)&dst, size, size);
+	igt_assert_eq(ret, 0);
+	/** TODO huge page advice cause the system hang
+	* when process exit...Very possible a hmm bug
+	**/
+	memset(dst, 0xbe, size);
+
+	xe_create_cmdbuf(&cmd_buf, insert_store, (uint64_t)dst, 0xc0ffee, eci);
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
@@ -175,6 +219,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			svm_random_access(fd, vm, hwe);
 
+	igt_subtest_f("svm-huge-page")
+		xe_for_each_engine(fd, hwe)
+			svm_thp(fd, vm, hwe);
+
 	igt_fixture {
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
-- 
2.25.1

