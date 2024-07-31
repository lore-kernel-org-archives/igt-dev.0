Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35330C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E808E10E63B;
	Wed, 31 Jul 2024 14:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdZUWwfB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3EE10E63B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722436213; x=1753972213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yetHTLUcv74XmY1dvhOYNm36C7sG+sK4Amh0TaBgXfw=;
 b=QdZUWwfBkdPtbD7+OB72j/93bnGhin3rCuSiNzHMzBuFkC4hvj0eZ0ra
 d6Jkd9CtJccswQFCUxkkaE94EW3kf8+gub6jmfEjDZDWCqPmcegWStBa+
 npIn4K5AGV6b6je4l63AHeL1uV4i24dnkTMyuHGx7FQjMrgxNZhQ/E+gz
 NZ9jACl/3plA7nmgINhK2pIZr+s6pDr6+HiwFeAwLdsRT+6apCm+y3pz8
 d+ovJa8sOzlK5W14eto7IXrQQ5EWJDsboOn9v4Epdyn3EtHJ2QrmtgXYq
 4iCxxeb5BJrprNrxOv9jI6aE3RZGQILgsxCnzNf2kImxKnk5dWQMn3omk g==;
X-CSE-ConnectionGUID: yxy+vSZoQySdGiq56RWsTA==
X-CSE-MsgGUID: 9PGZqfpgSeKl9mOrsnkKiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20166073"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20166073"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:30:13 -0700
X-CSE-ConnectionGUID: TejmgLm0QjSGVq88OK0qDw==
X-CSE-MsgGUID: UzKlC7e3TYGP5R4hhLEi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54631907"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa010.jf.intel.com with ESMTP; 31 Jul 2024 07:30:11 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com,
	sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t,
 v4 1/2] tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt
 test in xe
Date: Wed, 31 Jul 2024 20:00:28 +0530
Message-Id: <20240731143029.3661149-2-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
References: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Using single exec, removing unnecessary headers,using variables of same
type in single line according to comments in v3

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_sysfs_preempt_timeout.c | 221 +++++++++++++++++++++++++
 tests/meson.build                      |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 tests/intel/xe_sysfs_preempt_timeout.c

diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
new file mode 100644
index 000000000..a77741fcf
--- /dev/null
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: sysfs preempt timeout
+ * Category: Core
+ * Mega feature: SysMan
+ * Sub-category: SysMan tests
+ * Functionality: sysfs preempt timeout
+ * Feature: SMI, context
+ * Test category: SysMan
+ *
+ * SUBTEST: %s-timeout
+ * Description: Test to measure the delay from requestion the preemption to its
+ *      completion. Send down some non-preemptable workloads and then
+ *      request a switch to a higher priority context. The HW will not
+ *      be able to respond, so the kernel will be forced to reset the hog.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @preempt_timeout_us:		preempt timeout us
+ */
+
+#include "xe/xe_spin.h"
+#include "igt_syncobj.h"
+#include "xe/xe_ioctl.h"
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#define ATTR "preempt_timeout_us"
+
+static void set_preempt_timeout(int engine, unsigned int value)
+{
+	unsigned int delay;
+
+	igt_assert_lte(0, igt_sysfs_printf(engine, ATTR, "%u", value));
+	igt_sysfs_scanf(engine, ATTR, "%u", &delay);
+	igt_assert_eq(delay, value);
+}
+
+static uint64_t __test_timeout(int xe, int engine, unsigned int timeout)
+{
+	struct drm_xe_sync sync = {
+		.handle = syncobj_create(xe, 0),
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+/* high priority property */
+	struct drm_xe_ext_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+		.value = 2, /* High priority */
+	};
+	struct drm_xe_engine_class_instance *hwe;
+	uint64_t ahnd = 0;
+	uint32_t exec_queues[2];
+	uint32_t vm[2];
+	uint32_t bo[2];
+	size_t bo_size;
+	struct xe_spin *spin[2];
+	struct timespec ts = {};
+	double elapsed;
+	uint64_t addr1 = 0x1a0000, addr2 = 0x100000;
+	int i, n_engines;
+
+	n_engines = 0;
+	/* select an random engine */
+	i = rand() % xe_number_engines(xe);
+	xe_for_each_engine(xe, hwe) {
+		if (i == n_engines++)
+			break;
+	}
+
+	/* set preempt timeout*/
+	set_preempt_timeout(engine, timeout);
+	vm[0] = xe_vm_create(xe, 0, 0);
+	vm[1] = xe_vm_create(xe, 0, 0);
+	exec_queues[0] = xe_exec_queue_create(xe, vm[0], hwe, 0);
+	exec_queues[1] = xe_exec_queue_create(xe, vm[1], hwe, to_user_pointer(&ext));
+	ahnd = intel_allocator_open(xe, 0, INTEL_ALLOCATOR_RELOC);
+	bo_size = xe_bb_size(xe, sizeof(*spin));
+	bo[0] = xe_bo_create(xe, vm[0], bo_size, vram_if_possible(xe, 0), 0);
+	spin[0] = xe_bo_map(xe, bo[0], bo_size);
+	xe_vm_bind_async(xe, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
+	xe_spin_init_opts(spin[0], .addr = addr1,
+				.preempt = false);
+	exec.address = addr1;
+	exec.exec_queue_id = exec_queues[0];
+	xe_exec(xe, &exec);
+	xe_spin_wait_started(spin[0]);
+
+	igt_nsec_elapsed(&ts);
+	bo[1] = xe_bo_create(xe, vm[1], bo_size, vram_if_possible(xe, 0), 0);
+	spin[1] = xe_bo_map(xe, bo[1], bo_size);
+	xe_vm_bind_sync(xe, vm[1], bo[1], 0, addr2, bo_size);
+	xe_spin_init_opts(spin[1], .addr = addr2);
+	exec.address = addr2;
+	exec.exec_queue_id = exec_queues[1];
+	xe_exec(xe, &exec);
+	xe_spin_wait_started(spin[1]);
+	elapsed = igt_nsec_elapsed(&ts);
+	xe_spin_end(spin[1]);
+
+	xe_vm_unbind_async(xe, vm[0], 0, 0, addr1, bo_size, &sync, 1);
+	igt_assert(syncobj_wait(xe, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	xe_spin_end(spin[0]);
+	xe_vm_unbind_sync(xe, vm[1], 0, addr2, bo_size);
+	syncobj_destroy(xe, sync.handle);
+
+	xe_exec_queue_destroy(xe, exec_queues[0]);
+	xe_vm_destroy(xe, vm[0]);
+	xe_exec_queue_destroy(xe, exec_queues[1]);
+	xe_vm_destroy(xe, vm[1]);
+
+	put_ahnd(ahnd);
+	return elapsed;
+}
+
+static void test_timeout(int xe, int engine, const char **property)
+{
+	int delays[] = { 1000, 50000, 100000, 500000 };
+	unsigned int saved;
+	uint64_t elapsed;
+	int epsilon;
+
+    /*
+     * Send down some non-preemptable workloads and then request a
+     * switch to a higher priority context. The HW will not be able to
+     * respond, so the kernel will be forced to reset the hog. This
+     * timeout should match our specification, and so we can measure
+     * the delay from requesting the preemption to its completion.
+     */
+
+	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
+	igt_debug("Initial %s:%u\n", ATTR, saved);
+
+	elapsed = __test_timeout(xe, engine, 1000);
+	epsilon = 2 * elapsed / 1000;
+	if (epsilon < 50000)
+		epsilon = 50000;
+	igt_info("Minimum timeout measured as %.3fus; setting error threshold to %dus\n",
+		 elapsed * 1e-3, epsilon);
+	igt_require(epsilon < 10000000);
+
+	for (int i = 0; i < ARRAY_SIZE(delays); i++) {
+		elapsed = __test_timeout(xe, engine, delays[i]);
+		igt_info("%s:%d, elapsed=%.3fus\n",
+			ATTR, delays[i], elapsed * 1e-3);
+
+		/*
+		 * We need to give a couple of jiffies slack for the scheduler
+		 * timeouts and then a little more slack fr the overhead in
+		 * submitting and measuring.
+		 */
+		igt_assert_f(elapsed / 1000 / 1000 < delays[i] + epsilon,
+				 "Forced preemption timeout exceeded request!\n");
+	}
+
+	set_preempt_timeout(engine, saved);
+}
+
+igt_main
+{
+	static const struct {
+		const char *name;
+		void (*fn)(int, int, const char **);
+	} tests[] = {
+		{ "timeout", test_timeout },
+		{ }
+	};
+
+	const char *property[][3] = { {"preempt_timeout_us",
+								   "preempt_timeout_min",
+								   "preempt_timeout_max"}, };
+	int count = sizeof(property) / sizeof(property[0]);
+	int xe = -1, sys_fd, gt;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+		xe_device_get(xe);
+
+		sys_fd = igt_sysfs_open(xe);
+		igt_require(sys_fd != -1);
+		close(sys_fd);
+	}
+	int engines_fd = -1, gt_fd = -1;
+
+	for (int i = 0; i < count; i++) {
+		for (typeof(*tests) *t = tests; t->name; t++) {
+			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+				xe_for_each_gt(xe, gt) {
+
+					gt_fd = xe_sysfs_gt_open(xe, gt);
+					igt_require(gt_fd != -1);
+					engines_fd = openat(gt_fd, "engines", O_RDONLY);
+					igt_require(engines_fd != -1);
+
+					igt_sysfs_engines(xe, engines_fd, property[i], t->fn);
+					close(engines_fd);
+					close(gt_fd);
+				}
+			}
+		}
+	}
+	igt_fixture {
+		xe_device_put(xe);
+		close(xe);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index e649466be..335c8b837 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -315,6 +315,7 @@ intel_xe_progs = [
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
 	'xe_sysfs_scheduler',
+	'xe_sysfs_preempt_timeout',
 ]
 
 chamelium_progs = [
-- 
2.34.1

