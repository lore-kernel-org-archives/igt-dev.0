Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373CBC2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 22:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAA010EDB9;
	Fri, 12 Jul 2024 22:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHtXKKWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4DB10EDB9
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 22:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720822158; x=1752358158;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B9JOUmer4tlZpu8ulE7eYq2rW3n7dRtvN4+k5L3TZCQ=;
 b=BHtXKKWTC4gLYbMA9T2QNZ0BcOjsMNlz4NHak8CaEPqj2RA62Wg2ld00
 rGjR6j/HO5muYlOycJNxWXm0OPtMYS+FCNgLXZUkXbQ8CcbonSiSlXbfT
 ordRf/qlFpb+y6cU7RD8rkDR4CN5GU+qbpRVHWHdMHJGibbr6PkSZdF5c
 Rlyj3zj+GvJByrhld4Oi0d2aY4ohV+kpktmTWRN5Rg9voG7ihzm1b932N
 Zneej/QzdhDyPKHIVZe0mpAhM8eGGB48AG4kF0rbZVxL+0XeDXQ3HXq44
 D37wBMvohwUe6NQVbdBhYyPNbse/KqK7WJ7Lt6jdFfe0FJAS4/qE9x5sv g==;
X-CSE-ConnectionGUID: CtD7LOfJTA+Tof+RnjQ58w==
X-CSE-MsgGUID: i0MdBmziRMuOv5pxO3Uicw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18422374"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="18422374"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 15:09:17 -0700
X-CSE-ConnectionGUID: noSAfDjgRWW7W9PTtR6WEA==
X-CSE-MsgGUID: jk9M6wOsTdWGX5bPxuT/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="49121058"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 15:09:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] xe_exec_reset: Enhance spin test
Date: Fri, 12 Jul 2024 15:10:01 -0700
Message-Id: <20240712221001.1279651-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Let's make spin test a bit moe robust by doing multiple iterations and
passing in an already singaled sync-obj.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_reset.c | 48 ++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index dcb22f275f..87661a950b 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -22,11 +22,17 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
+#define SYNC_OBJ_SIGNALED	(0x1 << 0)
+
 /**
  * SUBTEST: spin
  * Description: test spin
+ *
+ * SUBTEST: spin-signaled
+ * Description: test spin with signaled sync obj
  */
-static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
+static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
+		      unsigned int flags)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -45,6 +51,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t bo = 0;
 	struct xe_spin *spin;
 	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
+	int i;
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*spin);
@@ -56,28 +63,33 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	spin = xe_bo_map(fd, bo, bo_size);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
-	syncobj = syncobj_create(fd, 0);
+	syncobj = syncobj_create(fd, (flags & SYNC_OBJ_SIGNALED) ?
+				 DRM_SYNCOBJ_CREATE_SIGNALED : 0);
 
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-	xe_spin_init(spin, &spin_opts);
+#define N_TIMES 4
+	for (i = 0; i < N_TIMES; ++i) {
+		xe_spin_init(spin, &spin_opts);
 
-	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
-	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-	sync[1].handle = syncobj;
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobj;
 
-	exec.exec_queue_id = exec_queue;
-	exec.address = addr;
-	xe_exec(fd, &exec);
+		exec.exec_queue_id = exec_queue;
+		exec.address = addr;
+		xe_exec(fd, &exec);
 
-	xe_spin_wait_started(spin);
-	usleep(50000);
-	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
-	xe_spin_end(spin);
+		xe_spin_wait_started(spin);
+		usleep(50000);
+		igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
+		xe_spin_end(spin);
 
-	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	}
+#undef N_TIMES
 
 	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
@@ -729,7 +741,11 @@ igt_main
 
 	igt_subtest("spin")
 		xe_for_each_engine(fd, hwe)
-			test_spin(fd, hwe);
+			test_spin(fd, hwe, 0);
+
+	igt_subtest("spin-signaled")
+		xe_for_each_engine(fd, hwe)
+			test_spin(fd, hwe, SYNC_OBJ_SIGNALED);
 
 	igt_subtest("cat-error")
 		xe_for_each_engine(fd, hwe)
-- 
2.34.1

