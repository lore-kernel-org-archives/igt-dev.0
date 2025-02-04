Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9C3C02194
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 18:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A886F10E370;
	Tue,  4 Feb 2025 18:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="db2P4hGf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B5410E370
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 18:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692138; x=1770228138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gup1qgbniMqQvtHdh1KQH4o2fjCSrGQryXhRldfDOJM=;
 b=db2P4hGfggXCQDBnxhcnvnqygfj1UigvtACqAuWg0WMz5qwBhDkkVo6X
 +eWNPQXCNkYFwkDbeZWsbQMJYsJjcXcgphocp+i7B9kyIVGdB3tlm3caY
 2n6QH6GGr8OpsW7yqCuS1uDoezpmsMxG/DATTECxkJDmDZbEjGP0pvz4F
 qGq10tYGyk1v3znV8MwUz3ydhPxc7DV5AQrtI56D5mB9S1q0h8fDrOg3D
 wyGAcJYtQCN+tkixj/SDLEo8cft/vA/LsndxmyHs/eeKTYMgzaMTCqtJ/
 /ePs65RS/4/VAk+GL9rFaO+h4AJZeGw7LNzK5i3Oo5DGlWIWcbH3K8Yeh A==;
X-CSE-ConnectionGUID: uZRq0o5vSt2EBMkkaVOIhg==
X-CSE-MsgGUID: eGnBM7Y/RAyrTjmBQORwwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39373153"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39373153"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:02:18 -0800
X-CSE-ConnectionGUID: qcqPMXklSK2l//FLXwUKEQ==
X-CSE-MsgGUID: eelbsGKRQAytyUtx7CARyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110653736"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:02:18 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	matthew.brost@intel.com
Subject: [i-g-t 2/2] tests/intel/xe_exec_fault_mode: Test scratch page under
 fault mode
Date: Tue,  4 Feb 2025 13:17:42 -0500
Message-Id: <20250204181742.4055152-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250204181742.4055152-1-oak.zeng@intel.com>
References: <20250204181742.4055152-1-oak.zeng@intel.com>
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

On certain HW (such as lunarlake and battlemage), driver now allows
scratch page be enabled under fault mode. Test this functionality

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 128 +++++++++++++++++++------------
 1 file changed, 79 insertions(+), 49 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ae40e099b..935e6c044 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -35,6 +35,7 @@
 #define INVALID_FAULT	(0x1 << 7)
 #define INVALID_VA	(0x1 << 8)
 #define ENABLE_SCRATCH  (0x1 << 9)
+#define ENABLE_FAULT    (0x1 << 10)
 
 /**
  * SUBTEST: invalid-va
@@ -45,6 +46,10 @@
  * Description: Access invalid va without pageafault with scratch page enabled.
  * Test category: functionality test
  *
+ * SUBTEST: scratch-fault
+ * Description: Enable scratch page and page fault at the same time.
+ * Test category: functionality test
+ *
  * SUBTEST: once-%s
  * Description: Run %arg[1] fault mode test only once
  * Test category: functionality test
@@ -115,6 +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  int n_exec_queues, int n_execs, unsigned int flags)
 {
 	uint32_t vm;
+	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
 	uint64_t addr = 0x1a0000;
 	uint64_t sync_addr = 0x101a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
@@ -145,11 +151,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 
 	if (flags & ENABLE_SCRATCH)
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
-				  DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
-	else
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
-				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+		vm_flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
+	if (flags & ENABLE_FAULT)
+		vm_flags |= DRM_XE_VM_CREATE_FLAG_FAULT_MODE;
+	vm = xe_vm_create(fd, vm_flags, 0);
+
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
 	sync_size = sizeof(*exec_sync) * n_execs;
@@ -405,59 +411,76 @@ igt_main
 		const char *name;
 		unsigned int flags;
 	} sections[] = {
-		{ "basic", 0 },
-		{ "userptr", USERPTR },
-		{ "rebind", REBIND },
-		{ "userptr-rebind", USERPTR | REBIND },
-		{ "userptr-invalidate", USERPTR | INVALIDATE },
-		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
-		{ "bindexecqueue", BIND_EXEC_QUEUE },
-		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
-		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
+		{ "basic", ENABLE_FAULT },
+		{ "userptr", USERPTR | ENABLE_FAULT },
+		{ "rebind", REBIND | ENABLE_FAULT },
+		{ "userptr-rebind", USERPTR | REBIND | ENABLE_FAULT },
+		{ "userptr-invalidate", USERPTR | INVALIDATE | ENABLE_FAULT },
+		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE |
+			ENABLE_FAULT },
+		{ "bindexecqueue", BIND_EXEC_QUEUE | ENABLE_FAULT },
+		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR |
+			ENABLE_FAULT },
+		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND |
+			ENABLE_FAULT },
 		{ "bindexecqueue-userptr-rebind", BIND_EXEC_QUEUE | USERPTR |
-			REBIND },
-		{ "bindexecqueue-userptr-invalidate", BIND_EXEC_QUEUE | USERPTR |
-			INVALIDATE },
-		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
-			INVALIDATE | RACE },
-		{ "basic-imm", IMMEDIATE },
-		{ "userptr-imm", IMMEDIATE | USERPTR },
-		{ "rebind-imm", IMMEDIATE | REBIND },
-		{ "userptr-rebind-imm", IMMEDIATE | USERPTR | REBIND },
-		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR | INVALIDATE },
+			REBIND | ENABLE_FAULT },
+		{ "bindexecqueue-userptr-invalidate", BIND_EXEC_QUEUE |
+			USERPTR | INVALIDATE | ENABLE_FAULT },
+		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE |
+			USERPTR | INVALIDATE | RACE | ENABLE_FAULT },
+		{ "basic-imm", IMMEDIATE | ENABLE_FAULT },
+		{ "userptr-imm", IMMEDIATE | USERPTR | ENABLE_FAULT },
+		{ "rebind-imm", IMMEDIATE | REBIND | ENABLE_FAULT },
+		{ "userptr-rebind-imm", IMMEDIATE | USERPTR | REBIND |
+			ENABLE_FAULT },
+		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR | INVALIDATE |
+			ENABLE_FAULT },
 		{ "userptr-invalidate-race-imm", IMMEDIATE | USERPTR |
-			INVALIDATE | RACE },
-		{ "bindexecqueue-imm", IMMEDIATE | BIND_EXEC_QUEUE },
-		{ "bindexecqueue-userptr-imm", IMMEDIATE | BIND_EXEC_QUEUE | USERPTR },
-		{ "bindexecqueue-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE | REBIND },
-		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE |
-			USERPTR | REBIND },
+			INVALIDATE | RACE | ENABLE_FAULT },
+		{ "bindexecqueue-imm", IMMEDIATE | BIND_EXEC_QUEUE |
+			ENABLE_FAULT },
+		{ "bindexecqueue-userptr-imm", IMMEDIATE | BIND_EXEC_QUEUE |
+			USERPTR | ENABLE_FAULT },
+		{ "bindexecqueue-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE |
+			REBIND | ENABLE_FAULT },
+		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE |
+			BIND_EXEC_QUEUE | USERPTR | REBIND | ENABLE_FAULT },
 		{ "bindexecqueue-userptr-invalidate-imm", IMMEDIATE | BIND_EXEC_QUEUE |
-			USERPTR | INVALIDATE },
+			USERPTR | INVALIDATE | ENABLE_FAULT },
 		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE |
-			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
-
-		{ "basic-prefetch", PREFETCH },
-		{ "userptr-prefetch", PREFETCH | USERPTR },
-		{ "rebind-prefetch", PREFETCH | REBIND },
-		{ "userptr-rebind-prefetch", PREFETCH | USERPTR | REBIND },
-		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR | INVALIDATE },
+			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE |
+			ENABLE_FAULT },
+
+		{ "basic-prefetch", PREFETCH | ENABLE_FAULT },
+		{ "userptr-prefetch", PREFETCH | USERPTR | ENABLE_FAULT },
+		{ "rebind-prefetch", PREFETCH | REBIND | ENABLE_FAULT },
+		{ "userptr-rebind-prefetch", PREFETCH | USERPTR | REBIND |
+			ENABLE_FAULT },
+		{ "userptr-invalidate-prefetch", PREFETCH | USERPTR |
+			INVALIDATE | ENABLE_FAULT },
 		{ "userptr-invalidate-race-prefetch", PREFETCH | USERPTR |
-			INVALIDATE | RACE },
-		{ "bindexecqueue-prefetch", PREFETCH | BIND_EXEC_QUEUE },
-		{ "bindexecqueue-userptr-prefetch", PREFETCH | BIND_EXEC_QUEUE | USERPTR },
-		{ "bindexecqueue-rebind-prefetch", PREFETCH | BIND_EXEC_QUEUE | REBIND },
-		{ "bindexecqueue-userptr-rebind-prefetch", PREFETCH | BIND_EXEC_QUEUE |
-			USERPTR | REBIND },
-		{ "bindexecqueue-userptr-invalidate-prefetch", PREFETCH | BIND_EXEC_QUEUE |
-			USERPTR | INVALIDATE },
+			INVALIDATE | RACE | ENABLE_FAULT },
+		{ "bindexecqueue-prefetch", PREFETCH | BIND_EXEC_QUEUE |
+			ENABLE_FAULT },
+		{ "bindexecqueue-userptr-prefetch", PREFETCH | BIND_EXEC_QUEUE |
+			USERPTR | ENABLE_FAULT },
+		{ "bindexecqueue-rebind-prefetch", PREFETCH | BIND_EXEC_QUEUE |
+			REBIND | ENABLE_FAULT },
+		{ "bindexecqueue-userptr-rebind-prefetch", PREFETCH |
+			BIND_EXEC_QUEUE | USERPTR | REBIND | ENABLE_FAULT },
+		{ "bindexecqueue-userptr-invalidate-prefetch", PREFETCH |
+			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | ENABLE_FAULT },
 		{ "bindexecqueue-userptr-invalidate-race-prefetch", PREFETCH |
-			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
-		{ "invalid-fault", INVALID_FAULT },
-		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
+			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE |
+			ENABLE_FAULT },
+		{ "invalid-fault", INVALID_FAULT | ENABLE_FAULT },
+		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR |
+			ENABLE_FAULT },
 		{ NULL },
 	};
 	int fd;
+	uint16_t dev_id;
 
 	igt_fixture {
 		struct timespec tv = {};
@@ -466,6 +489,7 @@ igt_main
 		int timeout = igt_run_in_simulation() ? 20 : 2;
 
 		fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(fd);
 		do {
 			if (ret)
 				usleep(5000);
@@ -508,6 +532,12 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
 
+	igt_subtest("scratch-fault") {
+		igt_skip_on(!IS_LUNARLAKE(dev_id) && !IS_BATTLEMAGE(dev_id));
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | ENABLE_FAULT);
+	}
+
 	igt_fixture {
 		drm_close_driver(fd);
 	}
-- 
2.26.3

