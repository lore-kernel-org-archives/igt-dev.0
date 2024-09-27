Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411D5CEBF69
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 05:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76CC10EC11;
	Fri, 27 Sep 2024 05:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldEVsKvZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0E710EC11
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 05:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727413386; x=1758949386;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kO54VQtUG9ZWA0TzZyidVG4Ovl+hVkU8ph7Bv/48ByQ=;
 b=ldEVsKvZ5hbYMFd90GVa1VY9Z8x1JehrSnD/DaDKG8CGWkMAkhPWZIet
 TT4/96Ms6FClYeKCFw+cXN+W0xogJHdX/zxhK1uIw7USRSfaSgXr143xy
 9L/Ho5aIEdopQzrYDM3Uj+Y3Mc6SodJvzcINWBDWyXksh/SRbC0iXnD7u
 x+iavlV3AMI4tW0lCL+UjcYk1pDmZok0Ral09uWPrrR1kTmXzQq3oezLF
 aSgnE4KJM9+g33D7G7QgHwnPLA6y4UauxcyPpDzq7QOf1toWpZKTQjFfB
 Vm1KTAXn93oFzEhvgv+wuGmv+jfc2cz7QHFGg1Uk+wG+qRMMIMApx9ymy g==;
X-CSE-ConnectionGUID: 2/ArS3DXTGOvkTP/SDRN3A==
X-CSE-MsgGUID: 2IlOi39kQcW0kNeZtkeCBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26417791"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="26417791"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 22:03:06 -0700
X-CSE-ConnectionGUID: gdooz1KgTZ2xZNuTazYkWg==
X-CSE-MsgGUID: KkB81+eERrSq7bxlaOAaPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="72062210"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa007.fm.intel.com with ESMTP; 26 Sep 2024 22:03:03 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Add test to validate
 timeslice duration
Date: Fri, 27 Sep 2024 10:41:12 +0530
Message-Id: <20240927051112.1801791-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test checks if the execution time of a ctx is within the given timslice duration.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_sysfs_timeslice_duration.c | 194 ++++++++++++++++++++++
 tests/meson.build                         |   1 +
 2 files changed, 195 insertions(+)
 create mode 100644 tests/intel/xe_sysfs_timeslice_duration.c

diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
new file mode 100644
index 000000000..1a5dbfe3c
--- /dev/null
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: sysfs timeslice duration
+ * Category: Core
+ * Mega feature: SysMan
+ * Sub-category: SysMan tests
+ * Functionality: sysfs timslice duration
+ * Feature: SMI, context
+ * Test category: SysMan
+ *
+ * SUBTEST: timeslice_duration_us-timeout
+ * Description: Test to check if the execution time of a ctx is
+ * 		within the given timslice duration.
+ * Test category: functionality test
+ *
+ */
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_syncobj.h"
+#include "igt_sysfs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_spin.h"
+
+#define ATTR "timeslice_duration_us"
+
+static void set_timeslice_duration(int engine, unsigned int value)
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
+	uint32_t exec_queues[2];
+	uint32_t vm[2];
+	uint32_t bo[2];
+	size_t bo_size;
+	struct xe_spin *spin[2];
+	struct timespec ts = {};
+	uint64_t elapsed;
+	uint64_t addr1 = 0x1a0000, addr2 = 0x100000;
+
+	xe_for_each_engine(fd, _hwe)
+		if (_hwe->engine_class == class && _hwe->gt_id == gt)
+			hwe = _hwe;
+	if (!hwe)
+		return -1;
+
+	/* set timeslice duration*/
+	set_timeslice_duration(engine, timeout);
+	vm[0] = xe_vm_create(fd, 0, 0);
+	vm[1] = xe_vm_create(fd, 0, 0);
+	exec_queues[0] = xe_exec_queue_create(fd, vm[0], hwe, 0);
+	exec_queues[1] = xe_exec_queue_create(fd, vm[1], hwe, to_user_pointer(&ext));
+	bo_size = xe_bb_size(fd, sizeof(*spin));
+	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0), 0);
+	spin[0] = xe_bo_map(fd, bo[0], bo_size);
+	xe_vm_bind_async(fd, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
+	xe_spin_init_opts(spin[0], .addr = addr1, .preempt = false);
+	exec.address = addr1;
+	exec.exec_queue_id = exec_queues[0];
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(spin[0]);
+
+	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0), 0);
+	spin[1] = xe_bo_map(fd, bo[1], bo_size);
+	xe_vm_bind_sync(fd, vm[1], bo[1], 0, addr2, bo_size);
+	xe_spin_init_opts(spin[1], .addr = addr2);
+	exec.address = addr2;
+	exec.exec_queue_id = exec_queues[1];
+	igt_nsec_elapsed(&ts);
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
+	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) == 1);
+	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
+	igt_debug("Initial %s:%u\n", property[0], saved);
+
+	elapsed = __test_timeout(fd, engine, 1000, gt, class);
+	epsilon = 2 * elapsed / 1000;
+	if (epsilon < 50000)
+		epsilon = 50000;
+	igt_info("Minimum timeout measured as %.3fus; setting error threshold to %" PRId64 "us\n",
+									elapsed * 1e-3, epsilon);
+	igt_require(epsilon < 10000000);
+
+	for (int i = 0; i < ARRAY_SIZE(delays); i++) {
+		elapsed = __test_timeout(fd, engine, delays[i], gt, class);
+		igt_info("%s:%ld, elapsed=%.3fus\n",
+				property[0], delays[i], elapsed * 1e-3);
+		igt_assert_f(elapsed / 1000  < delays[i] + epsilon,
+				"Timeslice exceeded request!!\n");
+	}
+
+	set_timeslice_duration(engine, saved);
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
+	const char *property[][3] = { {"timeslice_duration_us",
+				       "timeslice_duration_min",
+				       "timeslice_duration_max"}, };
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
+					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
+										 t->fn);
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
+
+
diff --git a/tests/meson.build b/tests/meson.build
index e5d8852f3..62bde353b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -316,6 +316,7 @@ intel_xe_progs = [
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
+        'xe_sysfs_timeslice_duration',
 ]
 
 intel_xe_eudebug_progs = [
-- 
2.25.1

