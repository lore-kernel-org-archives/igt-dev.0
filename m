Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D55C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C633210E8C5;
	Thu,  1 Aug 2024 15:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8vyidjQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB1B10E14B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722524900; x=1754060900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PjnnWUVsMedXzRjBrtC+TSyUq2NiUdg4Zijv4aDsS6Y=;
 b=M8vyidjQ3PA+ARrqwIHyqPwo3xRtSuBdzk6iLTmgA4jZqd1ypP2nWFvu
 pE8eEjujdPs5wG+ijXlFaxPNRYh+b0A/ro02G/hFNkALOWwzDsD0UkoyN
 bG7ijYhwirTpRrrsmPZ4DY7PIQCfa/8re+C7d6/UftkLw81jlMSTr6glo
 MXOjStvXGKbWT7pHzoHuK2SSXdL+LOw+I+Sv+N344UUHuHhcz3dyN2nUJ
 C+/AleZReuiyShfXc/QJc+/RcsZw5BdhTFhiP55GKvaIAnCVYV7PXhs+1
 Pj8xDHfsMjoh5AnZMDdey7wPvuyXrb2oAbdFU3oDsnzTdEc8iEAURXAqj w==;
X-CSE-ConnectionGUID: 3GaZujDtRz27O+l5w96asA==
X-CSE-MsgGUID: 5IIzy9G4RVO2Fv9X2pJE0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31135522"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="31135522"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 08:07:20 -0700
X-CSE-ConnectionGUID: 4WYL99ojQYmVkN0IFHCxuw==
X-CSE-MsgGUID: TEszV2blTF+WLmr4WvMvGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59712541"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2024 08:07:18 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t,
 v5 1/2] tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt
 test in xe
Date: Thu,  1 Aug 2024 20:37:36 +0530
Message-Id: <20240801150737.3700254-2-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
References: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
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

Changing variable type, sorting igt headers , adding space according to
commit messages in v3

Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_sysfs_preempt_timeout.c | 218 +++++++++++++++++++++++++
 tests/meson.build                      |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 tests/intel/xe_sysfs_preempt_timeout.c

diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
new file mode 100644
index 000000000..0f2d4a6f7
--- /dev/null
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -0,0 +1,218 @@
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
+
+	return elapsed;
+}
+
+static void test_timeout(int xe, int engine, const char **property)
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
+	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
+	igt_debug("Initial %s:%u\n", ATTR, saved);
+
+	elapsed = __test_timeout(xe, engine, 1000);
+	epsilon = 2 * elapsed / 1000;
+	if (epsilon < 50000)
+		epsilon = 50000;
+	igt_info("Minimum timeout measured as %.3fus; setting error threshold to %" PRId64 "us\n",
+		 elapsed * 1e-3, epsilon);
+	igt_require(epsilon < 10000000);
+
+	for (int i = 0; i < ARRAY_SIZE(delays); i++) {
+		elapsed = __test_timeout(xe, engine, delays[i]);
+		igt_info("%s:%ld, elapsed=%.3fus\n",
+			ATTR, delays[i], elapsed * 1e-3);
+
+		/*
+		 * We need to give a couple of jiffies slack for the scheduler
+		 * timeouts and then a little more slack for the overhead in
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
+	int engines_fd = -1, gt_fd = -1;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+
+		sys_fd = igt_sysfs_open(xe);
+		igt_require(sys_fd != -1);
+		close(sys_fd);
+	}
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
+		drm_close_driver(xe);
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

