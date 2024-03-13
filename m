Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D1C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 09:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542910F025;
	Wed, 13 Mar 2024 09:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNXBhIzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C8510F10D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 09:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710322461; x=1741858461;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cYn1fSg5Lph7ayU4seHhbAkkkrMley45je4US1hbBGA=;
 b=YNXBhIzHXYoLxaUqlcsBOXTroWvFHUDiVtIyDxSt0C3Qb3/J7re818Vg
 yBAk/kTq8W7foEznlpJypLXcNGpaVtdRp29ooanZIjYd6MT/YGsAZlAhc
 9tECgci323s+yYsbw/MF7n8VfS/0gYLxKo7jWNJgdCEOZ1v7UPewpaQJS
 5lvij2bD2Zsn7Trw7mHtVmoWK7hDnGrPHkWAnYDI2DoLxOMONhKu/Ykhv
 vUGpNyN6zafns2ijRs2il16qel5Ba1l5o380MsnMb9n+tMCRc3jE8mRZs
 sGP125lOl8MlcNMBm2hOU4jQMaplHm/5k2Ex+AipSAvKxpNWM510lM8DA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16523106"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16523106"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 02:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11751480"
Received: from dut-dii-e5ff.iind.intel.com ([10.145.169.50])
 by fmviesa007.fm.intel.com with ESMTP; 13 Mar 2024 02:34:19 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, krishnaiah.bommu@intel.com,
 janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org
Subject: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Extend invalid va test
Date: Wed, 13 Mar 2024 15:02:49 +0530
Message-Id: <20240313093249.2257541-3-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313093249.2257541-1-priyanka.dandamudi@intel.com>
References: <20240313093249.2257541-1-priyanka.dandamudi@intel.com>
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

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 0914e221b..9701d32ad 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -32,12 +32,17 @@
 #define PREFETCH	(0x1 << 5)
 #define INVALID_FAULT	(0x1 << 6)
 #define INVALID_VA	(0x1 << 7)
+#define NOPAGEFAULT     (0x1 << 8)
 
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
+	if (flags & NOPAGEFAULT)
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+	else
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
 
@@ -386,6 +395,10 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, INVALID_VA);
 
+	igt_subtest("invalid-va-scratch-nopagefault")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, hwe, 1, 1, NOPAGEFAULT);
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.25.1

