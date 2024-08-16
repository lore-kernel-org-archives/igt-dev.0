Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C317C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 06:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5829010E53A;
	Fri, 16 Aug 2024 06:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqqUpCIa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6310E53A
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723790916; x=1755326916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h9KlLHJ05Jlvxivlosqfkq3XxNTxXR5W7X70hsX9YdU=;
 b=WqqUpCIa3w+T+O6BsxvK2r8IBBppl1RKV1cgH71HiFdVBeEV8DG7QiLc
 BT3LTplKVuc/O/6+koaIufincl1VBua8Oz3o+OomqM1W0tWacJRK60bu+
 kVql8lPyYbXyE1zaCuA/GWujCFk9f/+xoyhiMPcSWMTmybfAUAFQdxlSo
 vP6vpZNqzHa0CPCNXk9FQbdpVxg4ZtZoMH3RvGfleQf3wPIzVValYIJ+A
 8V7qZGuT6EilO0CafGZZIyKB8g6CQHxJtGyb3bvq34+g1UhTRB9Dki6/i
 QKn6/es0Y7BuexmZ10lfiqa6t/ircdqaKb7ET8C3QRvrDfcWtVurMjnVK Q==;
X-CSE-ConnectionGUID: Hzjij0fNQO66AefhQgysJg==
X-CSE-MsgGUID: qq/TxfKwTMG7ve+P4cgCYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22251544"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="22251544"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 23:48:35 -0700
X-CSE-ConnectionGUID: U3BCxY+CQHy3TTQVkAIT1A==
X-CSE-MsgGUID: ImWCZgfXQDCnKzAEN2dx8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64436497"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa003.jf.intel.com with ESMTP; 15 Aug 2024 23:48:32 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, himanshu.girotra@intel.com,
 riana.tauro@intel.com
Subject: [PATCH i-g-t,
 v7] tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test
 in xe
Date: Fri, 16 Aug 2024 12:18:52 +0530
Message-Id: <20240816064852.3919814-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Adding preempt_timeout test in xe similar to i915 to check preemption
for different preemption_timeout like 50 ms, 100 ms

v6: correcting allignment and argument for subtest as per IGT
documentations

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_sysfs_preempt_timeout.c | 216 +++++++++++++++++++++++++
 tests/meson.build                      |   1 +
 2 files changed, 217 insertions(+)
 create mode 100644 tests/intel/xe_sysfs_preempt_timeout.c

diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
new file mode 100644
index 000000000..029da3cc4
--- /dev/null
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -0,0 +1,216 @@
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
+ * SUBTEST: preempt timeout us-timeout
+ * Description: Test to measure the delay from requesting the preemption to its
+ *      completion. Send down some non-preemptable workloads and then
+ *      request a switch to a higher priority context. The HW will not
+ *      be able to respond, so the kernel will be forced to reset the hog.
+ * Test category: functionality test
+ *
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_syncobj.h"
+#include "igt_sysfs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_spin.h"
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
+static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_t gt, int class)
+{
+	struct drm_xe_sync sync = {
+		.handle = syncobj_create(fd, 0),
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
+	struct drm_xe_engine_class_instance *hwe = NULL, *_hwe;
+	uint64_t ahnd[2];
+	uint32_t exec_queues[2];
+	uint32_t vm[2];
+	uint32_t bo[2];
+	size_t bo_size;
+	struct xe_spin *spin[2];
+	struct timespec ts = {};
+	double elapsed;
+	uint64_t addr1 = 0x1a0000, addr2 = 0x100000;
+
+	xe_for_each_engine(fd, _hwe)
+		if (_hwe->engine_class == class && _hwe->gt_id == gt)
+			hwe = _hwe;
+
+	if (!hwe)
+		return -1;
+
+	/* set preempt timeout*/
+	set_preempt_timeout(engine, timeout);
+	vm[0] = xe_vm_create(fd, 0, 0);
+	vm[1] = xe_vm_create(fd, 0, 0);
+	exec_queues[0] = xe_exec_queue_create(fd, vm[0], hwe, 0);
+	exec_queues[1] = xe_exec_queue_create(fd, vm[1], hwe, to_user_pointer(&ext));
+	ahnd[0] = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	bo_size = xe_bb_size(fd, sizeof(*spin));
+	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0), 0);
+	spin[0] = xe_bo_map(fd, bo[0], bo_size);
+	xe_vm_bind_async(fd, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
+	xe_spin_init_opts(spin[0], .addr = addr1,
+				.preempt = false);
+	exec.address = addr1;
+	exec.exec_queue_id = exec_queues[0];
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(spin[0]);
+
+	igt_nsec_elapsed(&ts);
+	ahnd[1] = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0), 0);
+	spin[1] = xe_bo_map(fd, bo[1], bo_size);
+	xe_vm_bind_sync(fd, vm[1], bo[1], 0, addr2, bo_size);
+	xe_spin_init_opts(spin[1], .addr = addr2);
+	exec.address = addr2;
+	exec.exec_queue_id = exec_queues[1];
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(spin[1]);
+	elapsed = igt_nsec_elapsed(&ts);
+	xe_spin_end(spin[1]);
+
+	xe_vm_unbind_async(fd, vm[0], 0, 0, addr1, bo_size, &sync, 1);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+
+	xe_spin_end(spin[0]);
+	xe_vm_unbind_sync(fd, vm[1], 0, addr2, bo_size);
+	syncobj_destroy(fd, sync.handle);
+
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+	xe_vm_destroy(fd, vm[0]);
+	xe_exec_queue_destroy(fd, exec_queues[1]);
+	xe_vm_destroy(fd, vm[1]);
+
+	put_ahnd(ahnd[1]);
+	put_ahnd(ahnd[0]);
+
+	return elapsed;
+}
+
+static void test_timeout(int fd, int engine, const char **property, uint16_t class, int gt)
+{
+	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
+	unsigned int saved;
+	uint64_t elapsed;
+	uint64_t epsilon;
+
+    /*
+     * Send down some non-preemptable workloads and then request a
+     * switch to a higher priority context. The HW will not be able to
+     * respond, so the kernel will be forced to reset the hog. This
+     * timeout should match our specification, and so we can measure
+     * the delay from requesting the preemption to its completion.
+     */
+
+	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
+	igt_debug("Initial %s:%u\n", property[0], saved);
+
+	elapsed = __test_timeout(fd, engine, 1000, gt, class);
+	epsilon = 2 * elapsed / 1000;
+	if (epsilon < 50000)
+		epsilon = 50000;
+	igt_info("Minimum timeout measured as %.3fus; setting error threshold to %" PRId64 "us\n",
+			 elapsed * 1e-3, epsilon);
+	igt_require(epsilon < 10000000);
+
+	for (int i = 0; i < ARRAY_SIZE(delays); i++) {
+		elapsed = __test_timeout(fd, engine, delays[i], gt, class);
+		igt_info("%s:%ld, elapsed=%.3fus\n",
+			property[0], delays[i], elapsed * 1e-3);
+
+		/*
+		 * We need to give a couple of jiffies slack for the scheduler
+		 * timeouts and then a little more slack for the overhead in
+		 * submitting and measuring.
+		 */
+			igt_assert_f(elapsed / 1000  < delays[i] + epsilon,
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
+		void (*fn)(int, int, const char **, uint16_t, int);
+	} tests[] = {
+		{ "timeout", test_timeout },
+		{ }
+	};
+	const char *property[][3] = { {"preempt_timeout_us",
+								   "preempt_timeout_min",
+								   "preempt_timeout_max"}, };
+	int count = sizeof(property) / sizeof(property[0]);
+	int fd = -1, sys_fd, gt;
+	int engines_fd = -1, gt_fd = -1;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+
+		sys_fd = igt_sysfs_open(fd);
+		igt_require(sys_fd != -1);
+		close(sys_fd);
+	}
+
+	for (int i = 0; i < count; i++) {
+		for (typeof(*tests) *t = tests; t->name; t++) {
+			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+				xe_for_each_gt(fd, gt) {
+					gt_fd = xe_sysfs_gt_open(fd, gt);
+					igt_require(gt_fd != -1);
+					engines_fd = openat(gt_fd, "engines", O_RDONLY);
+					igt_require(engines_fd != -1);
+
+					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i], t->fn);
+					close(engines_fd);
+					close(gt_fd);
+				}
+			}
+		}
+	}
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index e649466be..00556c9d6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -314,6 +314,7 @@ intel_xe_progs = [
 	'xe_waitfence',
 	'xe_spin_batch',
 	'xe_sysfs_defaults',
+	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
 ]
 
-- 
2.34.1

