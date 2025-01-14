Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44663C02183
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 15:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0387910E384;
	Tue, 14 Jan 2025 15:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hy2GJ1ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3489910E384
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736867464; x=1768403464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ox1M+EEO28AQqhF4kSCqqN/JtLKFlLMA+4G58yLexRs=;
 b=hy2GJ1ht1xVl5pTYNkJm1nbg1xEXeg+uy7vym1XYdrhYYoTiS7mLeqtS
 TUZcYEEdbRDi3B6CJF5nZVyPTGq18q0O0xnctbY1Qzz+eN1gHVtjGNZXl
 5I3wUqXwoxbAbg18xrtur0VP6w4bLgoejIKwS9tWSc0jX9Mfkvh+tvSf2
 TcALQcykpHBQE9sfDFCiATM9sgeynvkv0o3SI85A7d9+VQgsaTx+CNlv7
 Zf9NMVDCptQr4u7I5bUPVEPNobBDKCBj7bHmn7jZPJ10Mpe8UnK1YorvJ
 y90RM344lPHApURvw0QNjIjGTizWMhrnoM3r/4svOzuKM7FcQoyc41jm2 w==;
X-CSE-ConnectionGUID: aBXwqNEVRCaoEdB0guFJEg==
X-CSE-MsgGUID: R2ipF6ZIQzWUO9lzFbXHAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="62540190"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="62540190"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:44 -0800
X-CSE-ConnectionGUID: FQIa2o/bTnmz9/cLP5Q8mQ==
X-CSE-MsgGUID: 6d8uVSxkSwqU9lkZ2B/upQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="105346254"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.29])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:41 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 i-g-t 6/7] tests/xe_sriov_auto_provisioning: Add tests for
 SR-IOV auto-provisioning
Date: Tue, 14 Jan 2025 16:08:47 +0100
Message-Id: <20250114150848.332708-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
References: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
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

Added subtests validating below scenarios:
- auto-provisioned resources are allocated by PF driver in fairly manner,
- auto-provisioned resources are released once VFs are disabled,
- verify that ranges of auto-provisioned resources are exclusive.

The tests rely on ggtt_provisioned, lmem_provisioned,
contexts_provisioned and doorbells_provisioned debugfs attributes.

v2:
- Simplify range validation by using
  xe_sriov_pf_debugfs_read_check_ranges (Lukasz)
- Rename subtests for clarity (Lukasz)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_auto_provisioning.c | 290 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 2 files changed, 291 insertions(+)
 create mode 100644 tests/intel/xe_sriov_auto_provisioning.c

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
new file mode 100644
index 000000000..1d2aa8624
--- /dev/null
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#include <stdbool.h>
+
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_sriov_device.h"
+#include "igt_sysfs.h"
+#include "xe/xe_sriov_debugfs.h"
+#include "xe/xe_sriov_provisioning.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: xe_sriov_auto_provisioning
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: provisioning
+ * Functionality: auto-provisioning
+ * Run type: FULL
+ * Description: Examine behavior of SR-IOV auto-provisioning
+ *
+ * SUBTEST: fair-allocation
+ * Description:
+ *   Verify that auto-provisioned resources are allocated by PF driver in fairly manner
+ *
+ * SUBTEST: resources-released-on-vfs-disabling
+ * Description:
+ *   Verify that auto-provisioned resources are released once VFs are disabled
+ *
+ * SUBTEST: exclusive-ranges
+ * Description:
+ *   Verify that ranges of auto-provisioned resources are exclusive
+ */
+
+IGT_TEST_DESCRIPTION("Xe tests for SR-IOV auto-provisioning");
+
+/* Expects ranges sorted by VF IDs */
+static int ranges_fair_allocation(enum xe_sriov_shared_res res,
+				  struct xe_sriov_provisioned_range *ranges,
+				  unsigned int nr_ranges)
+{
+	uint64_t expected_allocation = ranges[0].end - ranges[0].start + 1;
+
+	for (unsigned int i = 1; i < nr_ranges; i++) {
+		uint64_t current_allocation = ranges[i].end - ranges[i].start + 1;
+
+		if (igt_debug_on_f(current_allocation != expected_allocation,
+				   "%s: Allocation mismatch, expected=%lu VF%u=%lu\n",
+				   xe_sriov_debugfs_provisioned_attr_name(res),
+				   expected_allocation, ranges[i].vf_id,
+				   current_allocation)) {
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
+static int check_fair_allocation(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
+				 enum xe_sriov_shared_res res)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt_id, &ranges, num_vfs);
+	if (igt_debug_on_f(ret, "%s: Failed ranges check on GT%u (%d)\n",
+			   xe_sriov_debugfs_provisioned_attr_name(res), gt_id, ret))
+		return ret;
+
+	ret = ranges_fair_allocation(res, ranges, num_vfs);
+	if (ret) {
+		free(ranges);
+		return ret;
+	}
+
+	free(ranges);
+
+	return 0;
+}
+
+static void fair_allocation(int pf_fd, unsigned int num_vfs)
+{
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	int fails = 0;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (igt_debug_on_f(check_fair_allocation(pf_fd, num_vfs, gt, res),
+					   "%s fair allocation failed on gt%u\n",
+					   xe_sriov_shared_res_to_string(res), gt))
+				fails++;
+		}
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	igt_fail_on_f(fails, "fair allocation failed\n");
+}
+
+static void resources_released_on_vfs_disabling(int pf_fd, unsigned int num_vfs)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	int fails = 0;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (igt_warn_on_f(xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res,
+										gt,
+										&ranges,
+										num_vfs),
+					  "%s: Failed ranges check on gt%u\n",
+					  xe_sriov_debugfs_provisioned_attr_name(res), gt))
+				continue;
+
+			free(ranges);
+		}
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (igt_debug_on_f(xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res,
+										 gt,
+										 &ranges,
+										 0),
+					   "%s: Failed ranges check on gt%u\n",
+					   xe_sriov_debugfs_provisioned_attr_name(res), gt))
+				fails++;
+		}
+	}
+
+	igt_fail_on_f(fails, "shared resource release check failed\n");
+}
+
+static int compare_ranges_by_start(const void *a, const void *b)
+{
+	const struct xe_sriov_provisioned_range *range_a = a;
+	const struct xe_sriov_provisioned_range *range_b = b;
+
+	if (range_a->start < range_b->start)
+		return -1;
+	if (range_a->start > range_b->start)
+		return 1;
+	return 0;
+}
+
+static int check_no_overlap(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
+			    enum xe_sriov_shared_res res)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt_id, &ranges, num_vfs);
+	if (ret)
+		return ret;
+
+	igt_assert(ranges);
+	qsort(ranges, num_vfs, sizeof(ranges[0]), compare_ranges_by_start);
+
+	for (unsigned int i = 0; i < num_vfs - 1; i++)
+		if (ranges[i].end >= ranges[i + 1].start) {
+			igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
+				  "Overlapping ranges: VF%u [%lx-%lx] and VF%u [%lx-%lx]\n" :
+				  "Overlapping ranges: VF%u [%lu-%lu] and VF%u [%lu-%lu]\n",
+				  ranges[i].vf_id, ranges[i].start, ranges[i].end,
+				  ranges[i + 1].vf_id, ranges[i + 1].start, ranges[i + 1].end);
+			free(ranges);
+			return -1;
+		}
+
+	free(ranges);
+
+	return 0;
+}
+
+static void exclusive_ranges(int pf_fd, unsigned int num_vfs)
+{
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	int fails = 0;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (res == XE_SRIOV_SHARED_RES_LMEM)
+				/*
+				 * lmem_provisioned is not applicable for this test,
+				 * as it does not expose ranges
+				 */
+				continue;
+
+			if (igt_debug_on_f(check_no_overlap(pf_fd, num_vfs, gt, res),
+					   "%s overlap check failed on gt%u\n",
+					   xe_sriov_shared_res_to_string(res), gt))
+				fails++;
+		}
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	igt_fail_on_f(fails, "exclusive ranges check failed\n");
+}
+
+igt_main
+{
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	bool autoprobe;
+	int pf_fd;
+
+	igt_fixture {
+		struct xe_sriov_provisioned_range *ranges;
+		int ret;
+
+		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+
+		xe_for_each_gt(pf_fd, gt) {
+			xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+				ret = xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt,
+									    &ranges, 0);
+				igt_skip_on_f(ret, "%s: Failed ranges check on gt%u (%d)\n",
+					      xe_sriov_debugfs_provisioned_attr_name(res),
+					      gt, ret);
+			}
+		}
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+	}
+
+	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
+	igt_subtest_with_dynamic("fair-allocation") {
+		for_random_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				igt_debug("numvfs=%u\n", num_vfs);
+				fair_allocation(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_describe("Verify that auto-provisioned resources are released once VFs are disabled");
+	igt_subtest_with_dynamic("resources-released-on-vfs-disabling") {
+		for_random_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				igt_debug("numvfs=%u\n", num_vfs);
+				resources_released_on_vfs_disabling(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_describe("Verify that ranges of auto-provisioned resources are exclusive");
+	igt_subtest_with_dynamic_f("exclusive-ranges") {
+		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+		igt_skip_on(total_vfs < 2);
+
+		for_random_sriov_vf_in_range(pf_fd, 2, total_vfs, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				igt_debug("numvfs=%u\n", num_vfs);
+				exclusive_ranges(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_sriov_disable_vfs(pf_fd);
+		/* abort to avoid execution of next tests with enabled VFs */
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       "Failed to restore sriov_drivers_autoprobe value\n");
+		drm_close_driver(pf_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a..01076f401 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -315,6 +315,7 @@ intel_xe_progs = [
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
+	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
-- 
2.31.1

