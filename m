Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AACD41C1A
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 08:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3463A10E6B4;
	Wed, 13 Nov 2024 08:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKgqHjl2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB6610E6B4
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731487941; x=1763023941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5tlyZIPHkyBXA9uWVIT53f2sMjTwS6Hg09w6HPPUMHo=;
 b=YKgqHjl2VnbU6vioaAwD5/ZbDaqrgXT6ffW1baKNqYP70/8I9EyLJjHt
 ih326BzKefGoDuUA+ZMr00+Jd7DThinpWNNqg9MfAo1bEb6CET3t367Ea
 ROJLL9SlQEZYd5YHV9zr5yiQuZ4TxdHrub88wTqr4iGNczQNuXxqg+hS+
 5shdwxT+LwFgqn7smQ+ckuJKPVlExxwVbJz6By0N4yhEz4cg7W4Kz1Uhj
 o2I4ik2WCLxDoJ4HELBxyNJNxbllckgwk2Ounk3V0fCwF423Ra5rljOvJ
 kW9Em3YZtoeHIUmAtR09WZuYeTZAMZuRaH4OHRYEj9EXQ5orBXK7POw8r Q==;
X-CSE-ConnectionGUID: RRg1sk1GSG6TBzgwK8SYlg==
X-CSE-MsgGUID: R9EvrZkIQM+vTtpCPdUORw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31335366"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31335366"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 00:52:21 -0800
X-CSE-ConnectionGUID: a/AJ+pNjRn+d6kiaoCTqYA==
X-CSE-MsgGUID: OjIwFy6bR7SlUHYyuQl0jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="92579683"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.180])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 00:52:19 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 3/3] tests/xe_eudebug: Validate exec queue placements
Date: Wed, 13 Nov 2024 09:51:55 +0100
Message-Id: <20241113085155.209198-3-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
References: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
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

Add test which validates exec_queue_placement uAPI. It requires
ccs_mode, which is present only on platforms with multiple ccs engines.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 123 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 8d45d59f3..39db16457 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -20,6 +20,7 @@
 #include <sys/prctl.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "xe/xe_eudebug.h"
@@ -61,6 +62,7 @@ static void test_sysfs_toggle(int fd)
 #define VM_METADATA		(1 << 5)
 #define VM_BIND_METADATA	(1 << 6)
 #define VM_BIND_OP_MAP_USERPTR	(1 << 7)
+#define EXEC_QUEUES_PLACEMENTS	(1 << 8)
 #define TEST_DISCOVERY		(1 << 31)
 
 #define PAGE_SIZE SZ_4K
@@ -420,6 +422,80 @@ static void vm_bind_client(int fd, struct xe_eudebug_client *c)
 	xe_eudebug_client_vm_destroy(c, fd, vm);
 }
 
+static void placements_client(int fd, struct xe_eudebug_client *c)
+{
+	struct drm_xe_ext_set_property eq_ext = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG,
+		.value = DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE,
+	};
+	struct drm_xe_exec_queue_create create = {
+		.extensions = to_user_pointer(&eq_ext),
+	};
+	struct drm_xe_engine_class_instance *eci;
+	bool at_least_4_ccs = false;
+	uint32_t vm;
+	int i, gt;
+
+	xe_for_each_gt(fd, gt) {
+		int count = 0;
+
+		xe_for_each_engine(fd, eci)
+			if (eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE &&
+			    eci->gt_id == gt)
+				count++;
+
+		if (count < 4)
+			continue;
+
+		at_least_4_ccs = true;
+
+		vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+
+		eci = calloc(count * count - 2, sizeof(*eci));
+
+		for (i = 0; i < count * count - 2; i++) {
+			eci[i].engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
+			eci[i].gt_id = gt;
+		}
+
+		for (i = 0; i < count; i++)
+			eci[i].engine_instance = i;
+
+		create.instances = to_user_pointer(eci);
+		create.vm_id = vm;
+		create.width = 1;
+		create.num_placements = count;
+		xe_eudebug_client_exec_queue_create(c, fd, &create);
+		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
+
+		create.width = count;
+		create.num_placements = 1;
+		xe_eudebug_client_exec_queue_create(c, fd, &create);
+		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
+
+		// every other instance (logical_mask ~ 1010, 0101)
+		create.width = 2;
+		create.num_placements = count/2;
+		xe_eudebug_client_exec_queue_create(c, fd, &create);
+		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
+
+		// logically contigous placement (logical_mask ~ 1100, 0110, 0011)
+		for (i = 0; i < count * count - 2; i++)
+			eci[i].engine_instance = i / 2 + i % 2;
+
+		create.width = 2;
+		create.num_placements = count - 1;
+		xe_eudebug_client_exec_queue_create(c, fd, &create);
+		xe_eudebug_client_exec_queue_destroy(c, fd, &create);
+
+		xe_eudebug_client_vm_destroy(c, fd, vm);
+		free(eci);
+	}
+
+	igt_require(at_least_4_ccs);
+}
+
 static void run_basic_client(struct xe_eudebug_client *c)
 {
 	int fd, i;
@@ -470,6 +546,9 @@ static void run_basic_client(struct xe_eudebug_client *c)
 		xe_eudebug_client_vm_destroy(c, fd, vm);
 	}
 
+	if (c->flags & EXEC_QUEUES_PLACEMENTS)
+		placements_client(fd, c);
+
 	if (c->flags & VM_BIND || c->flags & VM_BIND_METADATA)
 		basic_vm_bind_client(fd, c);
 
@@ -908,6 +987,11 @@ static void test_read_event(int fd)
  *	Attach the debugger to a process that performs bind, bind array, rebind,
  *	partial unbind, unbind and unbind all operations.
  *
+ * SUBTEST: exec-queue-placements
+ * Description:
+ *	Create compute exec_queues with various placements and compare them against
+ *	event sent to the debugger.
+ *
  * SUBTEST: multigpu-basic-client
  * Description:
  *	Attach the debugger to process which opens and closes xe drm client on all Xe devices.
@@ -2644,14 +2728,40 @@ static void test_basic_exec_queues_enable(int fd)
 	xe_vm_destroy(fd, vm_non_lr);
 }
 
+static void ccs_mode_all_engines(int num_gt)
+{
+	int fd, gt, gt_fd, num_slices, ccs_mode;
+	int num_gts_with_ccs_mode = 0;
+
+	for (gt = 0; gt < num_gt; gt++) {
+		fd = drm_open_driver(DRIVER_XE);
+		gt_fd = xe_sysfs_gt_open(fd, gt);
+		close(fd);
+
+		if (igt_sysfs_scanf(gt_fd, "num_cslices", "%u", &num_slices) <= 0)
+			continue;
+
+		num_gts_with_ccs_mode++;
+
+		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
+		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
+		igt_assert(num_slices == ccs_mode);
+		close(gt_fd);
+	}
+
+	errno = 0;
+	igt_require(num_gts_with_ccs_mode > 0);
+}
+
 igt_main
 {
 	bool was_enabled;
 	bool *multigpu_was_enabled;
-	int fd, gpu_count;
+	int fd, gpu_count, gt_count;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		gt_count = xe_number_gt(fd);
 		was_enabled = xe_eudebug_enable(fd, true);
 	}
 
@@ -2745,6 +2855,17 @@ igt_main
 	igt_subtest("discovery-empty-clients")
 		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
 
+	igt_subtest_group {
+		igt_fixture {
+			drm_close_driver(fd);
+			ccs_mode_all_engines(gt_count);
+			fd = drm_open_driver(DRIVER_XE);
+		}
+
+		igt_subtest("exec-queue-placements")
+			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
+	}
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 		drm_close_driver(fd);
-- 
2.34.1

