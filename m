Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7DDC25B77
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 11:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B600410EE8B;
	Fri, 17 May 2024 11:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVp3wxnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00DC910EE89
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715946400; x=1747482400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HROobRKuw0AKjLmgUWppyq8IGcH8wARJVrhrmomc7FE=;
 b=CVp3wxnr4CCfhTOGeUzCWcWaFtneKOiD5S0YlwACCMBax5lA59rZTAj0
 h7cgxAOBP2WQph56ILWaLp6WTn19WYuOmJINkyGQj1O1QH6sDdvf+e3xR
 aoSwCjjgH6dcAlOV4PKLfuh5C2Sm3n1kEfX9WZbbYqkSX4hZotPxEXMNF
 gpCAOMaLUWRs6IGl76Pkru0ta5fzhX0Vzkn56MJMN8NFtTVmbN9AKGBgs
 fljF/7vtgCXZ7DSOUWmGbmcCMNfiteLM2QsVaDXeJAvcGtSGLsE/3xYaG
 wUsbOIArS+TGrNfyz6cW+BGj4e0YaVcYoHymC1OHm8AVWrVUuO0Ysj1Fy w==;
X-CSE-ConnectionGUID: PPqtjs9CQoWT/FNqvy7gvA==
X-CSE-MsgGUID: 9rMmbDdvS3CvHHKIcVUKdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29619985"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29619985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 04:46:39 -0700
X-CSE-ConnectionGUID: 7NDjng6OQxeir2ODRc/yaw==
X-CSE-MsgGUID: KPKq9NvIQZOKpeOoqxx3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="54977316"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by fmviesa002.fm.intel.com with ESMTP; 17 May 2024 04:46:37 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Oak Zeng <oak.zeng@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3 05/10] tests/intel/xe_svm: add huge page access test
 for SVM
Date: Fri, 17 May 2024 17:16:53 +0530
Message-Id: <20240517114658.810283-6-krishnaiah.bommu@intel.com>
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

svm-huge-page verifies the Shared Virtual Memory (SVM) functionality
by using huge page access. The test allocates 2MB of aligned memory
to utilize huge pages and verifies GPU access to this memory.

Subtest:
- svm-huge-page: Verifies that the GPU can correctly access memory allocated
  as huge pages (2MB aligned).

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/intel/xe_svm.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/intel/xe_svm.c b/tests/intel/xe_svm.c
index 73a232c47..d9629246c 100644
--- a/tests/intel/xe_svm.c
+++ b/tests/intel/xe_svm.c
@@ -30,6 +30,9 @@
  *
  * SUBTEST: svm-random-access
  * Description: Verifies that the GPU can randomly access and correctly store values in malloc'ed memory.
+ *
+ * SUBTEST: svm-huge-page
+ * Description: verify SVM basic functionality by using huge page access
  */
 
 #include <fcntl.h>
@@ -156,6 +159,49 @@ static void svm_random_access(int fd, uint32_t vm, struct drm_xe_engine_class_in
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
+	uint32_t size = 1<<21; //2MB
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
@@ -184,6 +230,10 @@ igt_main
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

