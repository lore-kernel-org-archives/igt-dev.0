Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3831FC0219D
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 11:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7DF10EAF3;
	Fri,  7 Feb 2025 11:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQaBqubv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9834210EAF2
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738928972; x=1770464972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ttBZCfIo1NvXHftHweqnk9dMgGfWagvYpmZ/thsA2m0=;
 b=MQaBqubvnGQipXh9pFjoyHmRUUhb1GOFKT+CHc5xsDAp4gv+N121l0EI
 blaf0LRcV8YteC5od+XfW7URJdTBqlX9rWhURcN4n8OwsQUnXRktPoa5e
 CHIaT1M09HcX+TvBSQ9ugg0Ku5npXjoHHNz7LNpH+pXE/kw2WEFi0npNz
 UMeL70vJVdjxwBsB2ZpxsajjmnzBC0cnXiABw4Y9eE3f2kJxFdaw+UWfV
 JnOfCuaHg/n3uEKs7p9yTm1EtIDH/Kmow6nHVAI3bO6zJPNqssSFBYgdY
 ukt0s4Roqd/0THra7OIqVg9Va20R07/lcS+qLW6Rs7u3DFbPEIqTD4dvG Q==;
X-CSE-ConnectionGUID: 9ECeEtYERx++Li2KqbW3aA==
X-CSE-MsgGUID: ela1Ok5gR52qjL/9tAf+2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39683416"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39683416"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:31 -0800
X-CSE-ConnectionGUID: fq0b40FORHWwjfVwQbkLpg==
X-CSE-MsgGUID: lRIjnpZ4SFKUfu2qCyCjWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="116506761"
Received: from unknown (HELO mkuoppal-desk.fi.intel.com) ([10.237.72.193])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:49:24 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 1/4] Revert "tests/xe_eudebug: Validate exec queue
 placements"
Date: Fri,  7 Feb 2025 13:49:32 +0200
Message-ID: <20250207114935.1996323-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
References: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
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

Exec queue placements support was dropped as unused.

This reverts commit 05659c7f2840938c4977668143e6c60a46ca509d.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 129 ++-------------------------------------
 1 file changed, 4 insertions(+), 125 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index da53aa881..76870805c 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -20,7 +20,6 @@
 #include <sys/prctl.h>
 
 #include "igt.h"
-#include "igt_sysfs.h"
 #include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "xe/xe_eudebug.h"
@@ -62,10 +61,9 @@ static void test_sysfs_toggle(int fd)
 #define VM_METADATA			(1 << 5)
 #define VM_BIND_METADATA		(1 << 6)
 #define VM_BIND_OP_MAP_USERPTR		(1 << 7)
-#define EXEC_QUEUES_PLACEMENTS		(1 << 8)
-#define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
-#define VM_BIND_UFENCE_RECONNECT	(1 << 10)
-#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 11)
+#define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
+#define VM_BIND_UFENCE_RECONNECT	(1 << 9)
+#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
 #define TEST_DISCOVERY			(1 << 31)
 
 #define PAGE_SIZE SZ_4K
@@ -426,80 +424,6 @@ static void vm_bind_client(int fd, struct xe_eudebug_client *c)
 	xe_eudebug_client_vm_destroy(c, fd, vm);
 }
 
-static void placements_client(int fd, struct xe_eudebug_client *c)
-{
-	struct drm_xe_ext_set_property eq_ext = {
-		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
-		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
-	};
-	struct drm_xe_exec_queue_create create = {
-		.extensions = to_user_pointer(&eq_ext),
-	};
-	struct drm_xe_engine_class_instance *eci;
-	bool at_least_4_ccs = false;
-	uint32_t vm;
-	int i, gt;
-
-	xe_for_each_gt(fd, gt) {
-		int count = 0;
-
-		xe_for_each_engine(fd, eci)
-			if (eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE &&
-			    eci->gt_id == gt)
-				count++;
-
-		if (count < 4)
-			continue;
-
-		at_least_4_ccs = true;
-
-		vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-
-		eci = calloc(count * count - 2, sizeof(*eci));
-
-		for (i = 0; i < count * count - 2; i++) {
-			eci[i].engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
-			eci[i].gt_id = gt;
-		}
-
-		for (i = 0; i < count; i++)
-			eci[i].engine_instance = i;
-
-		create.instances = to_user_pointer(eci);
-		create.vm_id = vm;
-		create.width = 1;
-		create.num_placements = count;
-		xe_eudebug_client_exec_queue_create(c, fd, &create);
-		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
-
-		create.width = count;
-		create.num_placements = 1;
-		xe_eudebug_client_exec_queue_create(c, fd, &create);
-		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
-
-		/* every other instance (logical_mask ~ 1010, 0101) */
-		create.width = 2;
-		create.num_placements = count/2;
-		xe_eudebug_client_exec_queue_create(c, fd, &create);
-		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
-
-		/* logically contigous placement (logical_mask ~ 1100, 0110, 0011) */
-		for (i = 0; i < count * count - 2; i++)
-			eci[i].engine_instance = i / 2 + i % 2;
-
-		create.width = 2;
-		create.num_placements = count - 1;
-		xe_eudebug_client_exec_queue_create(c, fd, &create);
-		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
-
-		xe_eudebug_client_vm_destroy(c, fd, vm);
-		free(eci);
-	}
-
-	igt_require(at_least_4_ccs);
-}
-
 static void run_basic_client(struct xe_eudebug_client *c)
 {
 	int fd, i;
@@ -550,9 +474,6 @@ static void run_basic_client(struct xe_eudebug_client *c)
 		xe_eudebug_client_vm_destroy(c, fd, vm);
 	}
 
-	if (c->flags & EXEC_QUEUES_PLACEMENTS)
-		placements_client(fd, c);
-
 	if (c->flags & VM_BIND || c->flags & VM_BIND_METADATA)
 		basic_vm_bind_client(fd, c);
 
@@ -991,11 +912,6 @@ static void test_read_event(int fd)
  *	Attach the debugger to a process that performs bind, bind array, rebind,
  *	partial unbind, unbind and unbind all operations.
  *
- * SUBTEST: exec-queue-placements
- * Description:
- *	Create compute exec_queues with various placements and compare them against
- *	event sent to the debugger.
- *
  * SUBTEST: multigpu-basic-client
  * Description:
  *	Attach the debugger to process which opens and closes xe drm client on all Xe devices.
@@ -2794,40 +2710,14 @@ static void test_basic_exec_queues_enable(int fd)
 	xe_vm_destroy(fd, vm_non_lr);
 }
 
-static void ccs_mode_all_engines(int num_gt)
-{
-	int fd, gt, gt_fd, num_slices, ccs_mode;
-	int num_gts_with_ccs_mode = 0;
-
-	for (gt = 0; gt < num_gt; gt++) {
-		fd = drm_open_driver(DRIVER_XE);
-		gt_fd = xe_sysfs_gt_open(fd, gt);
-		close(fd);
-
-		if (igt_sysfs_scanf(gt_fd, "num_cslices", "%u", &num_slices) <= 0)
-			continue;
-
-		num_gts_with_ccs_mode++;
-
-		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
-		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
-		igt_assert(num_slices == ccs_mode);
-		close(gt_fd);
-	}
-
-	errno = 0;
-	igt_require(num_gts_with_ccs_mode > 0);
-}
-
 igt_main
 {
 	bool was_enabled;
 	bool *multigpu_was_enabled;
-	int fd, gpu_count, gt_count;
+	int fd, gpu_count;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		gt_count = xe_number_gt(fd);
 		was_enabled = xe_eudebug_enable(fd, true);
 	}
 
@@ -2936,17 +2826,6 @@ igt_main
 	igt_subtest("discovery-empty-clients")
 		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
 
-	igt_subtest_group {
-		igt_fixture {
-			drm_close_driver(fd);
-			ccs_mode_all_engines(gt_count);
-			fd = drm_open_driver(DRIVER_XE);
-		}
-
-		igt_subtest("exec-queue-placements")
-			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
-	}
-
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 		drm_close_driver(fd);
-- 
2.43.0

