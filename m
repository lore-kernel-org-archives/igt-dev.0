Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BB4C6FD1F
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 09:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3D510E6CE;
	Mon, 25 Mar 2024 09:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POOEyz2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ECE10E6CE
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711358410; x=1742894410;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ib5gOYeMyuYnlsdwwIODPTAVpoQeTYWQdPms+oZ/4do=;
 b=POOEyz2Ymckoudy48UEQllbh6UIqKpoWmYdA8XUU3EKsPuzKxWlapBXj
 TivVqNH/TgJvb8PuCe4Xgg7patQ/A0mrPDqxQDpzPbwCVlRV6BwZmlhUt
 S3IFmVnSs/YrS8hyIsF8w7tBxPQT5tu9w8FBPc/fm4Ca5XNU6u9WWuId0
 y46EPcmQVUNBUu5uHmp6b/rRELHTxdzA0fC+HUMM53NzLyBsX1kHHCrAx
 A2916HskkI87WQ8uLYifC7lV2k+NetpGoYmg8/1OeGmkfK5qq8leUKpTk
 khC5lydG6H9qRJVfWAFthD9CWYKHQBmmqnEcOeVop5JJM1QcZAVsEwDUp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="31786257"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="31786257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 02:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="20294295"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by orviesa005.jf.intel.com with ESMTP; 25 Mar 2024 02:20:08 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, krishnaiah.bommu@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va
 test
Date: Mon, 25 Mar 2024 14:48:10 +0530
Message-Id: <20240325091810.2942038-3-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240325091810.2942038-1-priyanka.dandamudi@intel.com>
References: <20240325091810.2942038-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Extend invalid va test by enabling scratch page without pagefault
and check for success of userfence.

v2: Rename flag NOPAGEFAULT to ENABLE_SCRATCH and
add INVALID_VA to test.(Rahul)

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 8b1040103..050d2c782 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -32,12 +32,17 @@
 #define PREFETCH	(0x1 << 5)
 #define INVALID_FAULT	(0x1 << 6)
 #define INVALID_VA	(0x1 << 7)
+#define ENABLE_SCRATCH  (0x1 << 8)
 
 /**
  * SUBTEST: invalid-va
  * Description: Access invalid va and check for EIO through user fence.
  * Test category: functionality test
  *
+ * SUBTEST: invalid-va-scratch-nopagefault
+ * Description: Access invalid va without pageafault with scratch page enabled.
+ * Test category: functionality test
+ *
  * SUBTEST: once-%s
  * Description: Run %arg[1] fault mode test only once
  * Test category: functionality test
@@ -120,8 +125,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
-			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	if (flags & ENABLE_SCRATCH)
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+	else
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
 
@@ -269,7 +278,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		j = flags & INVALIDATE ? n_execs - 1 : 0;
 
 		for (i = j; i < n_execs; i++) {
-			if (flags & INVALID_VA)
+			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
 				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 							       exec_queues[i % n_exec_queues], &timeout), EIO);
 			else
@@ -385,6 +394,10 @@ igt_main
 			test_exec(fd, hwe, 1, 1, INVALID_VA);
 		}
 
+	igt_subtest("invalid-va-scratch-nopagefault")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.25.1

