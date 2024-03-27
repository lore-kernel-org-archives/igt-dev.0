Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F1CC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 08:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753AF10F92A;
	Wed, 27 Mar 2024 08:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWzELNQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3134C10F92A
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 08:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711526768; x=1743062768;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/DevXISbrUYlPwc54J1QI0+9cwTEcl2vNXviRBT9ydY=;
 b=gWzELNQa/SNSG3MG6bKmK7HtlGm7l86/45OKnkKaaweM8kK7lkS3S1wq
 1atmKdELCDkwWCOO1G8YjCoZvjB7BVHh5WTepe1hzRgDmXg3uj8a1lEM1
 0kq5BN2Rs0SU87zgMohB52wcvf2/s/UVa8JfgyizqlVtFR8TsBsQVwVad
 IRQ063BKb2ylDY/Mt8Yxo09M+Um+UVJAc4rIKNlGuDAOC/ADxzUrra8Bo
 fHQC96o4N8lvAwPw5eRpZlzDWjBltfqbhoNeBPLANcxNX2zuqtZXT1AGQ
 h+IKhwNwMPa0lZeiYFeU/xDXTqTda5hl+B5M/ZDGTvcDFakLeZCUtm+jZ A==;
X-CSE-ConnectionGUID: zUW7aLt/TCql8JDG4fpyBg==
X-CSE-MsgGUID: 1sEDJm98TMCHluCVvzrdrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6470035"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6470035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 01:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16282942"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2024 01:06:05 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, krishnaiah.bommu@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va
 test
Date: Wed, 27 Mar 2024 13:34:04 +0530
Message-Id: <20240327080404.3050140-3-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327080404.3050140-1-priyanka.dandamudi@intel.com>
References: <20240327080404.3050140-1-priyanka.dandamudi@intel.com>
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
index 800d581e5..8f87ac1a6 100644
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
 							       exec_queues[i % n_exec_queues], &timeout), -EIO);
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

