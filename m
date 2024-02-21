Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152A5C48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 16:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63B810E775;
	Wed, 21 Feb 2024 16:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O60gw37S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F0410E7ED
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708531709; x=1740067709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tyggd2UGoHcZ8xbYxR9/ss5B/GXoYZ7JiusZpjlO1NQ=;
 b=O60gw37ShBw+ZkYg1tP1y411eofM9g/o+s0BrrxpHRFXiPYLrlYtTTKr
 Rxx42DmgWw6p86TAZPeFvrVhNkr7aqpR09mZyAHbXFPZuJRlBOs8j2mDr
 vOYiSqfdRVfrihCErjaT7EZ4u9bBhR3hpI8m7fbBKSTXvWqGPGFz3xdZ7
 pCVAgdNRjnkJCQ8zhCV9BeHQm4ahSbBHQLlxhDP8O4oxBlyKnTf1ExjxR
 hj2SCvuXb4anrhrmMt8nl8EGljMAJfl+5OlIGln85Pbnjb8agkHzl0M/h
 bRbwVL0Ak1/fR8LzAFsYFVZOgt+cBU55YbpuQDgZ3D5jsgP8bfQBYuLbD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2570310"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2570310"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5119722"
Received: from tnienhux-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.221.55])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:08:27 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t,v2] drm-uapi/xe: Remove unused flags
Date: Wed, 21 Feb 2024 16:08:16 +0000
Message-Id: <20240221160816.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This aligns with kernel commit ("drm/xe/uapi: Remove unused flags"). As
a consequence, some tests which dependend on the removed flags are also
removed. Also, ensure that the removed flag values are no longer
accepted to prevent mismatch.

v2:
- Rebase after removal of persistent exec_queues (Francois Dugast)
- Update xe-fast-feedback.testlist (Rodrigo Vivi)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h                |  21 -----
 tests/intel-ci/xe-fast-feedback.testlist |  11 +--
 tests/intel/xe_access_counter.c          |  81 -----------------
 tests/intel/xe_exec_fault_mode.c         |  60 ++-----------
 tests/intel/xe_exec_queue_property.c     |  55 +++++++++---
 tests/intel/xe_exec_reset.c              | 110 ++---------------------
 tests/intel/xe_exec_threads.c            |  13 +--
 tests/intel/xe_vm.c                      |  69 ++++++++++++++
 tests/meson.build                        |   1 -
 9 files changed, 133 insertions(+), 288 deletions(-)
 delete mode 100644 tests/intel/xe_access_counter.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bacdca787..2417a9654 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -831,11 +831,6 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
  *
  * and the @flags can be:
- *  - %DRM_XE_VM_BIND_FLAG_READONLY
- *  - %DRM_XE_VM_BIND_FLAG_ASYNC
- *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
- *    MAP operation immediately rather than deferring the MAP to the page
- *    fault handler.
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
@@ -928,8 +923,6 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 	/** @flags: Bind flags */
 	__u32 flags;
@@ -1045,20 +1038,6 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
-/* Monitor 128KB contiguous region with 4K sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_128K				0
-/* Monitor 2MB contiguous region with 64KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_2M				1
-/* Monitor 16MB contiguous region with 512KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_16M				2
-/* Monitor 64MB contiguous region with 2M sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_64M				3
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 6c01374c1..17863b6b1 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -75,6 +75,7 @@ igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
 igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
 igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
 igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
+igt@xe_exec_queue_property@invalid-property
 igt@xe_exec_reset@close-fd-no-exec
 igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
@@ -244,16 +245,6 @@ igt@xe_exec_fault_mode@twice-bindexecqueue-userptr
 igt@xe_exec_fault_mode@twice-bindexecqueue-rebind
 igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind
 igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate
-igt@xe_exec_fault_mode@twice-basic-imm
-igt@xe_exec_fault_mode@twice-userptr-imm
-igt@xe_exec_fault_mode@twice-rebind-imm
-igt@xe_exec_fault_mode@twice-userptr-rebind-imm
-igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
 igt@xe_exec_fault_mode@twice-basic-prefetch
 igt@xe_exec_fault_mode@twice-userptr-prefetch
 igt@xe_exec_fault_mode@twice-rebind-prefetch
diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
deleted file mode 100644
index 91367f560..000000000
--- a/tests/intel/xe_access_counter.c
+++ /dev/null
@@ -1,81 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-/**
- * TEST: Basic tests for access counter functionality
- * Category: Software building block
- * Run type: FULL
- * Sub-category: access counter
- * Functionality: access counter
- * Test category: functionality test
- * SUBTEST: invalid-param
- * Description: Giving invalid granularity size parameter and checks for invalid error.
- */
-
-#include "igt.h"
-#include "lib/igt_syncobj.h"
-#include "lib/intel_reg.h"
-#include "xe_drm.h"
-
-#include "xe/xe_ioctl.h"
-#include "xe/xe_query.h"
-#include <string.h>
-
-#define SIZE_64M  3
-igt_main
-{
-	int fd;
-
-	igt_fixture {
-		uint16_t devid;
-
-		fd = drm_open_driver(DRIVER_XE);
-		devid = intel_get_drm_devid(fd);
-		igt_require(xe_supports_faults(fd));
-		igt_require(IS_PONTEVECCHIO(devid));
-	}
-
-	igt_subtest("invalid-param") {
-		struct drm_xe_engine_class_instance instance = {
-			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
-		 };
-
-		int ret;
-		const int expected = -EINVAL;
-
-		struct drm_xe_ext_set_property ext = {
-			.base.next_extension = 0,
-			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY,
-			.value = SIZE_64M + 1,
-		};
-
-		struct drm_xe_exec_queue_create create = {
-			.extensions = to_user_pointer(&ext),
-			.vm_id = xe_vm_create(fd, 0, 0),
-			.width = 1,
-			.num_placements = 1,
-			.instances = to_user_pointer(&instance),
-		};
-
-		if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
-			ret = -errno;
-			errno = 0;
-		}
-
-		igt_assert_eq(ret, expected);
-		ext.value = -1;
-
-		if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
-			ret = -errno;
-			errno = 0;
-		}
-
-		igt_assert_eq(ret, expected);
-	}
-
-	igt_fixture
-		drm_close_driver(fd);
-}
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index dae0e8ac3..20a7cf8fe 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -29,9 +29,8 @@
 #define INVALIDATE	(0x1 << 2)
 #define RACE		(0x1 << 3)
 #define BIND_EXEC_QUEUE	(0x1 << 4)
-#define IMMEDIATE	(0x1 << 5)
-#define PREFETCH	(0x1 << 6)
-#define INVALID_FAULT	(0x1 << 7)
+#define PREFETCH	(0x1 << 5)
+#define INVALID_FAULT	(0x1 << 6)
 
 /**
  * SUBTEST: once-%s
@@ -66,21 +65,6 @@
  *					bindexecqueue userptr invalidate
  * @bindexecqueue-userptr-invalidate-race:
  *					bindexecqueue userptr invalidate race
- * @basic-imm:				basic imm
- * @userptr-imm:			userptr imm
- * @rebind-imm:				rebind imm
- * @userptr-rebind-imm:			userptr rebind imm
- * @userptr-invalidate-imm:		userptr invalidate imm
- * @userptr-invalidate-race-imm:	userptr invalidate race imm
- * @bindexecqueue-imm:			bindexecqueue imm
- * @bindexecqueue-userptr-imm:		bindexecqueue userptr imm
- * @bindexecqueue-rebind-imm:		bindexecqueue rebind imm
- * @bindexecqueue-userptr-rebind-imm:
- *					bindexecqueue userptr rebind imm
- * @bindexecqueue-userptr-invalidate-imm:
- *					bindexecqueue userptr invalidate imm
- * @bindexecqueue-userptr-invalidate-race-imm:
- *					bindexecqueue userptr invalidate race imm
  * @basic-prefetch:			basic prefetch
  * @userptr-prefetch:			userptr prefetch
  * @rebind-prefetch:			rebind prefetch
@@ -172,25 +156,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	};
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
-	if (flags & IMMEDIATE) {
-		if (bo)
-			xe_vm_bind_async_flags(fd, vm, bind_exec_queues[0], bo, 0,
-					       addr, bo_size, sync, 1,
-					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
-		else
-			xe_vm_bind_userptr_async_flags(fd, vm, bind_exec_queues[0],
-						       to_user_pointer(data),
-						       addr, bo_size, sync, 1,
-						       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
-	} else {
-		if (bo)
-			xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
+	if (bo)
+		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
+				 bo_size, sync, 1);
+	else
+		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
+					 to_user_pointer(data), addr,
 					 bo_size, sync, 1);
-		else
-			xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
-						 to_user_pointer(data), addr,
-						 bo_size, sync, 1);
-	}
 
 #define ONE_SEC	MS_TO_NS(1000)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
@@ -343,22 +315,6 @@ igt_main
 			INVALIDATE },
 		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
 			INVALIDATE | RACE },
-		{ "basic-imm", IMMEDIATE },
-		{ "userptr-imm", IMMEDIATE | USERPTR },
-		{ "rebind-imm", IMMEDIATE | REBIND },
-		{ "userptr-rebind-imm", IMMEDIATE | USERPTR | REBIND },
-		{ "userptr-invalidate-imm", IMMEDIATE | USERPTR | INVALIDATE },
-		{ "userptr-invalidate-race-imm", IMMEDIATE | USERPTR |
-			INVALIDATE | RACE },
-		{ "bindexecqueue-imm", IMMEDIATE | BIND_EXEC_QUEUE },
-		{ "bindexecqueue-userptr-imm", IMMEDIATE | BIND_EXEC_QUEUE | USERPTR },
-		{ "bindexecqueue-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE | REBIND },
-		{ "bindexecqueue-userptr-rebind-imm", IMMEDIATE | BIND_EXEC_QUEUE |
-			USERPTR | REBIND },
-		{ "bindexecqueue-userptr-invalidate-imm", IMMEDIATE | BIND_EXEC_QUEUE |
-			USERPTR | INVALIDATE },
-		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE |
-			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
 		{ "basic-prefetch", PREFETCH },
 		{ "userptr-prefetch", PREFETCH | USERPTR },
 		{ "rebind-prefetch", PREFETCH | REBIND },
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 4fdd4ceae..4e20cfd25 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -16,9 +16,7 @@
  *
  * arg[1]:
  *
- * @preempt_timeout_us:		preempt timeout us
  * @timeslice_duration_us:	timeslice duration us
- * @job_timeout_ms:		job timeout ms
  */
 
 #include <dirent.h>
@@ -40,11 +38,7 @@
 
 static int get_property_name(const char *property)
 {
-	if (strstr(property, "preempt"))
-		return DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT;
-	else if (strstr(property, "job_timeout"))
-		return DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT;
-	else if (strstr(property, "timeslice"))
+	if (strstr(property, "timeslice"))
 		return DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE;
 	else
 		return -1;
@@ -172,6 +166,46 @@ static void basic_get_property(int xe)
 	xe_vm_destroy(xe, vm);
 }
 
+/**
+ * SUBTEST: invalid-property
+ * Description: Ensure only valid values for property are accepted.
+ * Test category: functionality test
+ */
+static void invalid_property(int xe)
+{
+	uint32_t valid_property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY;
+	struct drm_xe_engine_class_instance instance = {
+			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+	};
+	struct drm_xe_ext_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = valid_property,
+		.value = 1,
+	};
+
+	struct drm_xe_exec_queue_create create = {
+		.extensions = to_user_pointer(&ext),
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&instance),
+		.vm_id = xe_vm_create(xe, 0, 0),
+	};
+	/* Correct value should pass */
+	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+
+	/* This will fail as soon as a new property is introduced. It is
+	 * expected and the test will have to be updated. */
+	for (int i = 2; i < 16; i++ ) {
+		ext.property = i;
+		do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+	}
+
+	/* Correct value should still pass */
+	ext.property = valid_property;
+	igt_assert_eq(igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create), 0);
+}
+
 igt_main
 {
 	static const struct {
@@ -179,9 +213,7 @@ igt_main
 		void (*fn)(int, int, const char **);
 	} tests[] = {{"property-min-max", test_property_min_max}, {} };
 
-	const char *property[][3] = { {"preempt_timeout_us", "preempt_timeout_min", "preempt_timeout_max"},
-				      {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
-				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
+	const char *property[][3] = { {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
 	};
 	int count = sizeof(property) / sizeof(property[0]);
 	int sys_fd;
@@ -249,6 +281,9 @@ igt_main
 	igt_subtest("basic-get-property")
 		basic_get_property(xe);
 
+	igt_subtest("invalid-property")
+		invalid_property(xe);
+
 	igt_fixture {
 		xe_device_put(xe);
 		drm_close_driver(xe);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a9206d7d2..a39e5860e 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -93,22 +93,14 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 
 #define MAX_N_EXECQUEUES	16
 #define MAX_INSTANCE		9
-#define CANCEL				(0x1 << 0)
-#define EXEC_QUEUE_RESET	(0x1 << 1)
-#define GT_RESET			(0x1 << 2)
-#define CLOSE_FD			(0x1 << 3)
-#define CLOSE_EXEC_QUEUES	(0x1 << 4)
-#define VIRTUAL				(0x1 << 5)
-#define PARALLEL			(0x1 << 6)
-#define CAT_ERROR			(0x1 << 7)
+#define GT_RESET			(0x1 << 0)
+#define CLOSE_FD			(0x1 << 1)
+#define CLOSE_EXEC_QUEUES	(0x1 << 2)
+#define VIRTUAL				(0x1 << 3)
+#define PARALLEL			(0x1 << 4)
+#define CAT_ERROR			(0x1 << 5)
 
 /**
- * SUBTEST: %s-cancel
- * Description: Test %arg[1] cancel
- *
- * SUBTEST: %s-execqueue-reset
- * Description: Test %arg[1] exec_queue reset
- *
  * SUBTEST: %s-cat-error
  * Description: Test %arg[1] cat error
  *
@@ -185,18 +177,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_set_property job_timeout = {
-			.base.next_extension = 0,
-			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT,
-			.value = 50,
-		};
-		struct drm_xe_ext_set_property preempt_timeout = {
-			.base.next_extension = 0,
-			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
-			.value = 1000,
-		};
 		struct drm_xe_exec_queue_create create = {
 			.vm_id = vm,
 			.width = flags & PARALLEL ? num_placements : 1,
@@ -204,11 +184,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			.instances = to_user_pointer(eci),
 		};
 
-		if (flags & CANCEL)
-			create.extensions = to_user_pointer(&job_timeout);
-		else if (flags & EXEC_QUEUE_RESET)
-			create.extensions = to_user_pointer(&preempt_timeout);
-
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
 					&create), 0);
 		exec_queues[i] = create.exec_queue_id;
@@ -219,8 +194,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	sync[0].handle = syncobj_create(fd, 0);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & EXEC_QUEUE_RESET ||
-				flags & GT_RESET))
+	if (flags & VIRTUAL && (flags & CAT_ERROR || flags & GT_RESET))
 		bad_batches = num_placements;
 
 	for (i = 0; i < n_execs; i++) {
@@ -309,12 +283,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 }
 
 /**
- * SUBTEST: cancel
- * Description: Test cancel
- *
- * SUBTEST: execqueue-reset
- * Description: Test exec_queue reset
- *
  * SUBTEST: cat-error
  * Description: Test cat error
  *
@@ -374,26 +342,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_set_property job_timeout = {
-			.base.next_extension = 0,
-			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT,
-			.value = 50,
-		};
-		struct drm_xe_ext_set_property preempt_timeout = {
-			.base.next_extension = 0,
-			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
-			.value = 1000,
-		};
-		uint64_t ext = 0;
-
-		if (flags & CANCEL)
-			ext = to_user_pointer(&job_timeout);
-		else if (flags & EXEC_QUEUE_RESET)
-			ext = to_user_pointer(&preempt_timeout);
-
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		syncobjs[i] = syncobj_create(fd, 0);
 	};
 
@@ -478,9 +427,6 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 }
 
 /**
- * SUBTEST: cm-execqueue-reset
- * Description: Test compute mode exec_queue reset
- *
  * SUBTEST: cm-cat-error
  * Description: Test compute mode cat-error
  *
@@ -543,20 +489,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	memset(data, 0, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_set_property preempt_timeout = {
-			.base.next_extension = 0,
-			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
-			.value = 1000,
-		};
-		uint64_t ext = 0;
-
-		if (flags & EXEC_QUEUE_RESET)
-			ext = to_user_pointer(&preempt_timeout);
-		else
-			ext = 0;
-
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 	};
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
@@ -803,14 +736,6 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_spin(fd, hwe);
 
-	igt_subtest("cancel")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(fd, hwe, 1, 1, CANCEL);
-
-	igt_subtest("execqueue-reset")
-		xe_for_each_engine(fd, hwe)
-			test_legacy_mode(fd, hwe, 2, 2, EXEC_QUEUE_RESET);
-
 	igt_subtest("cat-error")
 		xe_for_each_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
@@ -832,10 +757,6 @@ igt_main
 			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD |
 					 CLOSE_EXEC_QUEUES);
 
-	igt_subtest("cm-execqueue-reset")
-		xe_for_each_engine(fd, hwe)
-			test_compute_mode(fd, hwe, 2, 2, EXEC_QUEUE_RESET);
-
 	igt_subtest("cm-cat-error")
 		xe_for_each_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 2, 2, CAT_ERROR);
@@ -858,19 +779,6 @@ igt_main
 					  CLOSE_EXEC_QUEUES);
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("%s-cancel", s->name)
-			xe_for_each_gt(fd, gt)
-				xe_for_each_engine_class(class)
-					test_balancer(fd, gt, class, 1, 1,
-						      CANCEL | s->flags);
-
-		igt_subtest_f("%s-execqueue-reset", s->name)
-			xe_for_each_gt(fd, gt)
-				xe_for_each_engine_class(class)
-					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
-						      MAX_INSTANCE + 1,
-						      EXEC_QUEUE_RESET | s->flags);
-
 		igt_subtest_f("%s-cat-error", s->name)
 			xe_for_each_gt(fd, gt)
 				xe_for_each_engine_class(class)
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 1b2623045..55907e2b3 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -518,18 +518,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
-		struct drm_xe_ext_set_property preempt_timeout = {
-			.base.next_extension = 0,
-			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
-			.value = 1000,
-		};
-		uint64_t ext = to_user_pointer(&preempt_timeout);
-
-		if (flags & HANG && i == hang_exec_queue)
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
-		else
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
 									0);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fe667e64d..7c061c497 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1761,6 +1761,72 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: bind-flag-invalid
+ * Description:
+ *	Ensure invalid bind flags are rejected.
+ * Functionality: bind
+ * Test category: negative test
+ */
+static void bind_flag_invalid(int fd)
+{
+	uint32_t bo, bo_size = xe_get_default_alignment(fd);
+	uint64_t addr = 0x1a0000;
+	uint32_t vm;
+	struct drm_xe_vm_bind bind;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	sync[0].handle = syncobj_create(fd, 0);
+
+	memset(&bind, 0, sizeof(bind));
+	bind.vm_id = vm;
+	bind.num_binds = 1;
+	bind.bind.obj = bo;
+	bind.bind.range = bo_size;
+	bind.bind.addr = addr;
+	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
+	bind.num_syncs = 1;
+	bind.syncs = (uintptr_t)sync;
+
+	/* Using valid flags should work */
+	bind.bind.flags = 0;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &sync[0].handle, 1);
+
+	bind.bind.flags = DRM_XE_VM_BIND_FLAG_NULL;
+	bind.bind.obj = 0;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &sync[0].handle, 1);
+	bind.bind.obj = bo;
+
+	/* Using invalid flags should not work */
+	bind.bind.flags = 1 << 0;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
+
+	bind.bind.flags = 1 << 1;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
+
+	bind.bind.flags = 1 << 3;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
+
+	/* Using valid flags should still work */
+	bind.bind.flags = 0;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -1892,6 +1958,9 @@ igt_main
 	igt_subtest("userptr-invalid")
 		userptr_invalid(fd);
 
+	igt_subtest("bind-flag-invalid")
+		bind_flag_invalid(fd);
+
 	igt_subtest("shared-pte-page")
 		xe_for_each_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4,
diff --git a/tests/meson.build b/tests/meson.build
index d107d16fa..02cbc3780 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -274,7 +274,6 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
-	'xe_access_counter',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.34.1

