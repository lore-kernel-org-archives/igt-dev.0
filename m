Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5B3D3B7F3
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EC710E495;
	Tue,  9 Dec 2025 03:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5Xhtni4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4810B10E37F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250544; x=1796786544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DkRb/8diYwPj/fNu36nqmnaUtRE/4RsbbPcxTMp1Uag=;
 b=g5Xhtni4v2OUGQeAOge4KrzyoTsn5+Y3Yx+RzSkafirsy6CtkmSxxl6e
 l7pEpBwNHlmPL6U80/c9vJRvqvP+EtsjNYWAE1Z6cpKC5LKY3hfSPd0vH
 j5OeW35nKtVA8rUpcMrKCxJc5RK7bgRE+YRDQFqTVxdwW64M8oZXiAgOT
 gqLMOWb4nGFLxIHW6aPGKI0JIXyxOjA1n6uZFul3uE3ZbCjRvERLYhste
 6iTuzpk/QdhStlZIqmIbFlBtGUQwX0RH0MZR+KhAH2577g1N6OMKL3DaO
 qhEmLGx+oV2ObDCGtAYeIEZLCrYr3ReY4j2FfLpzWl+1r8fIDJLCPVo/C w==;
X-CSE-ConnectionGUID: Jc0di3YeSRKNR2nGS1bOWw==
X-CSE-MsgGUID: AvG8vTOfTBOogdrvLqff5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164318"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164318"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:23 -0800
X-CSE-ConnectionGUID: aEaekOmhSgumwOD057BEYA==
X-CSE-MsgGUID: 5eFjU0YiT8GjCNyNX/iocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570897"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 03/18] tests/intel/xe_exec_multi_queue: Add
 xe_exec_multi_queue test
Date: Mon,  8 Dec 2025 19:22:09 -0800
Message-ID: <20251209032208.1540217-23-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add sanity test for the multi queue feature.

v2: Validate that queues are not vm_bind queues

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 177 ++++++++++++++++++++++++++++++
 tests/meson.build                 |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 tests/intel/xe_exec_multi_queue.c

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
new file mode 100644
index 000000000..1ecd01aa4
--- /dev/null
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for exec functionality with multi-queue feature
+ * Category: Hardware building block
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: multi-queue
+ */
+
+#include "igt.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define MAX_N_EXEC_QUEUES	64
+
+#define MAX_INSTANCE 9
+
+#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
+
+static void
+__test_sanity(int fd, int gt, int class)
+{
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	struct drm_xe_ext_set_property multi_queue = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+		.value = DRM_XE_MULTI_GROUP_CREATE,
+	};
+	struct drm_xe_engine_class_instance vm_bind_eci = {
+		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+	};
+	uint64_t invalid_flag = 0, ext = to_user_pointer(&multi_queue);
+	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
+	struct drm_xe_engine_class_instance *hwe;
+	uint32_t vm, vm2, val;
+	int i, n = 0;
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != class || hwe->gt_id != gt)
+			continue;
+
+		eci[n++] = *hwe;
+	}
+
+	if (!n)
+		return;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	/* Invalid flags */
+	while (!invalid_flag)
+		invalid_flag = (1ull << (rand() % 63)) & ~XE_MULTI_GROUP_VALID_FLAGS;
+	multi_queue.value |= invalid_flag;
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
+
+	/* Queues can't be a vm_bind queues */
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, &vm_bind_eci, ext, &val), -EINVAL);
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, 0);
+	multi_queue.value = exec_queues[0];
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, &vm_bind_eci, ext, &val), -EINVAL);
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+	exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
+	multi_queue.value = exec_queues[0];
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+
+	/* Q0 can't be a regular queue */
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, 0);
+	multi_queue.value = exec_queues[0];
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+
+	/* Multi-Queue can't be a parallel queue */
+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
+	if (n > 1)
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val), -EINVAL);
+
+	/* Specifying multiple MULTI_GROUP property is invalid */
+	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+
+	/* Adding queues to group after primary is destroyed is invalid */
+	multi_queue.base.next_extension = 0;
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+	multi_queue.value = exec_queues[0];
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -ENOENT);
+
+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
+
+	/* Upper 32 bits must be 0 while adding secondary queues */
+	multi_queue.value = exec_queues[0] | (1ull << (32 + (rand() % 32)));
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+
+	/* Invalid Q0 */
+	multi_queue.value = exec_queues[0] + 1;
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -ENOENT);
+
+	/* Queues in a queue group must share the same address space (vm) */
+	multi_queue.value = exec_queues[0];
+	vm2 = xe_vm_create(fd, 0, 0);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -EINVAL);
+	xe_vm_destroy(fd, vm2);
+
+	/* Secondary queues must map to same engine instances as primary queue */
+	if (n > 1)
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext, &val), -EINVAL);
+
+	for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+
+	/* Queue group limit check */
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+
+	/* Secondary queues can't be replaced once successfully created */
+	xe_exec_queue_destroy(fd, exec_queues[1]);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+
+	/* Primary queue can be destroyed before all secondary queues are destroyed */
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+
+	for (i = 2; i < MAX_N_EXEC_QUEUES; i++)
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+
+	/* Validate with multiple num_placements */
+	if (n > 1) {
+		multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
+		multi_queue.base.next_extension = 0;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext, &exec_queues[0]), 0);
+
+		multi_queue.value = exec_queues[0];
+		for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
+			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext, &exec_queues[i]), 0);
+
+		for (i = 0; i < MAX_N_EXEC_QUEUES; i++)
+			xe_exec_queue_destroy(fd, exec_queues[i]);
+	}
+
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * SUBTEST: sanity
+ * Description: Run sanity test
+ * Test category: functionality test
+ */
+static void
+test_sanity(int fd, int gt, int class)
+{
+	__test_sanity(fd, gt, class);
+}
+
+igt_main
+{
+	int fd, gt, class;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+	}
+
+	igt_subtest_f("sanity")
+		xe_for_each_gt(fd, gt)
+			xe_for_each_multi_queue_engine_class(class)
+				test_sanity(fd, gt, class);
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index c505ce5cc..884707025 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -298,6 +298,7 @@ intel_xe_progs = [
 	'xe_exec_compute_mode',
 	'xe_exec_fault_mode',
 	'xe_exec_mix_modes',
+	'xe_exec_multi_queue',
 	'xe_exec_queue_property',
 	'xe_exec_reset',
 	'xe_exec_sip',
-- 
2.43.0

