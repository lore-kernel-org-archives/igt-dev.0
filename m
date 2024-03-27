Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3DFC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 08:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC9D10F921;
	Wed, 27 Mar 2024 08:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgws6tni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A72110F92F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711526766; x=1743062766;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=q+PpAfcTVCLggc240DyNTNqsbxED9ERAhndzA6WSvQI=;
 b=lgws6tniHR6IzGkwMPki60BBe9hqj/iT0IK6PxQRiYWXk6C7EQFpydsO
 7j6Ec9PCqFOrbBqo9aBXFvrULykta5V/DmtK7Pk4k5/LA3TKW4gI+jNMx
 Nxt7zqtRuUvRBCLdtfihAOzfi/t5ccv2yqNc+Lxp/05YiNeHpZh0AniqP
 qxsEmekZ5lxELZBOmABIlnIDvDyzSn8Tzv23+Xme6VAKgq0AfG084LCdu
 YOqxrNDZ+gB3ADXdvcx4TJArwc3slhhcN9NPxFnsAnJ6PRy7u678a7Im7
 PdqmzRlqmmua8qE3XwXExXsSzT/WxmuvEbOO7EMp4wn9KFZ1PlmBpmNz7 A==;
X-CSE-ConnectionGUID: MZJOcdXeS2qbanmH1MG90g==
X-CSE-MsgGUID: krucL0+kRKettHpB7nGoxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6470027"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6470027"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 01:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16282936"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmviesa009.fm.intel.com with ESMTP; 27 Mar 2024 01:06:03 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, krishnaiah.bommu@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/intel/xe_exec_fault_mode: Test to check the
 access of invalid va
Date: Wed, 27 Mar 2024 13:34:03 +0530
Message-Id: <20240327080404.3050140-2-priyanka.dandamudi@intel.com>
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

Added a test where it submits a batch to access invalid va (not binded)
Expected result to be -EIO from user fence ioctl caused due to CAT error.

v2: Remove assert condition specific to invalid va.(Rahul)

v3: Optimised code related to flag.(Rahul)
Added if loop to skip COPY engine.

TODO: if loop to skip COPY engine will be removed once related Kernel Bug gets resolved.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 42 +++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 20a7cf8fe..800d581e5 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -31,8 +31,13 @@
 #define BIND_EXEC_QUEUE	(0x1 << 4)
 #define PREFETCH	(0x1 << 5)
 #define INVALID_FAULT	(0x1 << 6)
+#define INVALID_VA	(0x1 << 7)
 
 /**
+ * SUBTEST: invalid-va
+ * Description: Access invalid va and check for EIO through user fence.
+ * Test category: functionality test
+ *
  * SUBTEST: once-%s
  * Description: Run %arg[1] fault mode test only once
  * Test category: functionality test
@@ -157,13 +162,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	if (bo)
-		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
-				 bo_size, sync, 1);
+		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr, bo_size, sync, 1);
 	else
 		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
 					 to_user_pointer(data), addr,
 					 bo_size, sync, 1);
-
 #define ONE_SEC	MS_TO_NS(1000)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], ONE_SEC);
@@ -186,6 +189,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		int e = i % n_exec_queues;
 
 		b = 0;
+		if (flags & INVALID_VA)
+			sdi_addr = 0x1fffffffffff000;
+
 		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
 		data[i].batch[b++] = sdi_addr;
 		data[i].batch[b++] = sdi_addr >> 32;
@@ -257,23 +263,29 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			igt_assert(data != MAP_FAILED);
 		}
 	}
-
 	if (!(flags & INVALID_FAULT)) {
+		int64_t timeout = ONE_SEC;
+
 		j = flags & INVALIDATE ? n_execs - 1 : 0;
-		for (i = j; i < n_execs; i++)
-			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       exec_queues[i % n_exec_queues], ONE_SEC);
-	}
 
+		for (i = j; i < n_execs; i++) {
+			if (flags & INVALID_VA)
+				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+							       exec_queues[i % n_exec_queues], &timeout), -EIO);
+			else
+				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+							       exec_queues[i % n_exec_queues], &timeout), 0);
+		}
+	}
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
 			   sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], ONE_SEC);
 
-	if (!(flags & INVALID_FAULT)) {
+	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
 		for (i = j; i < n_execs; i++)
-			igt_assert_eq(data[i].data, 0xc0ffee);
+				igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 
 	for (i = 0; i < n_exec_queues; i++) {
@@ -366,6 +378,14 @@ igt_main
 					  s->flags);
 	}
 
-	igt_fixture
+	igt_subtest("invalid-va")
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COPY)
+			       continue;	
+			test_exec(fd, hwe, 1, 1, INVALID_VA);
+		}
+
+	igt_fixture {
 		drm_close_driver(fd);
+	}
 }
-- 
2.25.1

