Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC33E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 12:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B6F10E26C;
	Wed, 18 Dec 2024 12:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7RKEoQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA39E10E26C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734523308; x=1766059308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FoWikpBwvtx/yHE+3FUURsMLZByG2Ryz8NyrBhfTrXg=;
 b=i7RKEoQaXrkJy4wPry4w+VwbZ/f7L8+PgqDBzE2eJxqkU6U8Q9xOF73d
 ONgJgq/Kf5B3+K180lRV0aZG8dqXcMJXYau8HZYbHIysdOEM2DNkYbXiG
 ehvTP0X5mCNH0+yJia6Sfx++K3jjSZoNk92TYci+sMSn6hrNUGbnb8JjO
 nqu7IuGnJq4MwEgQej3UIRg4T6Ioq07e42KPLRgsw46bx6LS66XjmDnFj
 OaUsEZ6w+SSbhldd63OZMYy0jsEZK4k0zEqIUXi6WJqmBPb/ei1w4tLaw
 zebXXm4XNmGMbYxJaMfLUd2U/l+jtWZGKZ9rICgnBVbv/OyDW4/tLeO7E g==;
X-CSE-ConnectionGUID: Y5v1eMZ/TJCz4racYeTkPA==
X-CSE-MsgGUID: ok90xR5KThSqqBst1KLvfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35143200"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35143200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:01:48 -0800
X-CSE-ConnectionGUID: UVQY+kU6TbezLC0TWVtRDA==
X-CSE-MsgGUID: RxqQVgb0RH6vMyzFcb22jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98076349"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:01:41 -0800
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
Subject: [PATCH i-g-t 5/5] tests/xe_sriov_auto_provisioning: Add tests for
 SR-IOV auto-provisioning
Date: Wed, 18 Dec 2024 13:00:56 +0100
Message-Id: <20241218120056.779962-6-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
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
 tests/intel/xe_sriov_auto_provisioning.c | 399 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 2 files changed, 400 insertions(+)
 create mode 100644 tests/intel/xe_sriov_auto_provisioning.c

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
new file mode 100644
index 000000000..a5ae60525
--- /dev/null
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -0,0 +1,399 @@
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
+ * SUBTEST: auto-provisioning-fair
+ * Description:
+ *   Verify that auto-provisioned resources are allocated by PF driver in fairly manner
+ *
+ * SUBTEST: auto-provisioned-resources-released-on-vfs-disabling
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
+static int compare_ranges_by_vf_id(const void *a, const void *b)
+{
+	const struct xe_sriov_provisioned_range *range_a = a;
+	const struct xe_sriov_provisioned_range *range_b = b;
+
+	return (range_a->vf_id - range_b->vf_id);
+}
+
+static int validate_vf_ids(enum xe_sriov_shared_res res,
+			   struct xe_sriov_provisioned_range *ranges,
+			   unsigned int nr_ranges, unsigned int num_vfs)
+{
+	unsigned int current_vf_id = 0;
+
+	igt_assert(num_vfs);
+
+	if (igt_debug_on_f(nr_ranges == 0,
+			   "%s: No VF ranges\n",
+			   xe_sriov_debugfs_provisioned_attr_name(res)))
+		return -ENOENT;
+
+	igt_assert(ranges);
+	qsort(ranges, nr_ranges, sizeof(ranges[0]), compare_ranges_by_vf_id);
+
+	for (unsigned int i = 0; i < nr_ranges; i++) {
+		unsigned int vf_id = ranges[i].vf_id;
+
+		/* Skip duplicates */
+		if (vf_id == current_vf_id)
+			continue;
+
+		if (igt_debug_on_f(vf_id < 1 || vf_id > num_vfs,
+				   "%s: Out of range VF%u\n",
+				   xe_sriov_debugfs_provisioned_attr_name(res), vf_id))
+			return -ERANGE;
+
+		if (igt_debug_on_f(vf_id > current_vf_id + 1,
+				   "%s: Missing VF%u\n",
+				   xe_sriov_debugfs_provisioned_attr_name(res),
+				   current_vf_id + 1))
+			return -ESRCH;
+
+		current_vf_id = vf_id;
+	}
+
+	if (igt_debug_on_f(current_vf_id != num_vfs,
+			   "%s: Missing VF%u\n",
+			   xe_sriov_debugfs_provisioned_attr_name(res), num_vfs))
+		return -ESRCH;
+
+	return 0;
+}
+
+/* Expects ranges sorted by VF IDs */
+static int validate_fair_allocation(enum xe_sriov_shared_res res,
+				    struct xe_sriov_provisioned_range *ranges,
+				    unsigned int nr_ranges)
+{
+	uint64_t expected_allocation = 0;
+	uint64_t current_allocation = 0;
+	unsigned int current_vf_id;
+
+	igt_assert(nr_ranges);
+	current_vf_id = ranges[0].vf_id;
+
+	for (unsigned int i = 0; i <= nr_ranges; i++) {
+		if (i == nr_ranges || ranges[i].vf_id != current_vf_id) {
+			/* Check allocation consistency for the previous VF ID */
+			if (expected_allocation == 0)
+				expected_allocation = current_allocation;
+			else if (igt_debug_on_f(current_allocation != expected_allocation,
+						"%s: Allocation mismatch, expected=%lu VF%u=%lu\n",
+						xe_sriov_debugfs_provisioned_attr_name(res),
+						expected_allocation, current_vf_id,
+						current_allocation))
+				return -1;
+
+			/* Reset for the new VF ID (if not at the end) */
+			if (i < nr_ranges) {
+				current_vf_id = ranges[i].vf_id;
+				current_allocation = 0;
+			}
+		}
+
+		/* Accumulate allocation for the current VF ID */
+		if (i < nr_ranges)
+			current_allocation += ranges[i].end - ranges[i].start + 1;
+	}
+
+	return 0;
+}
+
+static int check_fair_allocation(int pf_fd, unsigned int num_vfs, unsigned int gt_id,
+				 enum xe_sriov_shared_res res)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	unsigned int nr_ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt_id, &ranges, &nr_ranges);
+	if (igt_debug_on_f(ret, "Failed read %s on GT%u (%d)\n",
+			   xe_sriov_debugfs_provisioned_attr_name(res), gt_id, ret))
+		return ret;
+
+	ret = validate_vf_ids(res, ranges, nr_ranges, num_vfs);
+	if (ret) {
+		free(ranges);
+		return ret;
+	}
+
+	ret = validate_fair_allocation(res, ranges, nr_ranges);
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
+static void auto_provisioning_fair(int pf_fd, unsigned int num_vfs)
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
+static void auto_provisioning_release(int pf_fd, unsigned int num_vfs)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	unsigned int nr_ranges;
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	int fails = 0;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (igt_warn_on_f(xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res,
+										      gt,
+										      &ranges,
+										      &nr_ranges),
+					  "Failed read %s on gt%u\n",
+					  xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
+				continue;
+			}
+
+			igt_warn_on_f(validate_vf_ids(res, ranges, nr_ranges, num_vfs),
+				      "%s: VF IDs validation failed on gt%u\n",
+				      xe_sriov_debugfs_provisioned_attr_name(res), gt);
+			free(ranges);
+		}
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			if (igt_debug_on_f(xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res,
+										       gt,
+										       &ranges,
+										       &nr_ranges),
+					   "Failed read %s on gt%u\n",
+					   xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
+				fails++;
+				continue;
+			}
+
+			if (igt_debug_on_f(nr_ranges,
+					   "%s contains unexpected ranges on gt%u\n",
+					   xe_sriov_debugfs_provisioned_attr_name(res), gt)) {
+				fails++;
+				for (unsigned int i = 0; i < nr_ranges; i++) {
+					igt_debug((res == XE_SRIOV_SHARED_RES_GGTT) ?
+							"%s:VF%u: %lx-%lx\n" :
+							"%s:VF%u %lu-%lu\n",
+						  xe_sriov_shared_res_to_string(res),
+						  ranges[i].vf_id, ranges[i].start, ranges[i].end);
+				}
+			}
+			free(ranges);
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
+	unsigned int nr_ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt_id, &ranges, &nr_ranges);
+	if (ret)
+		return ret;
+
+	ret = validate_vf_ids(res, ranges, nr_ranges, num_vfs);
+	if (ret) {
+		free(ranges);
+		return ret;
+	}
+
+	igt_assert(ranges);
+	qsort(ranges, nr_ranges, sizeof(ranges[0]), compare_ranges_by_start);
+
+	for (unsigned int i = 0; i < nr_ranges - 1; i++)
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
+static void auto_provisioning_exclusive_ranges(int pf_fd, unsigned int num_vfs)
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
+		unsigned int nr_ranges;
+		int ret;
+
+		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+
+		xe_for_each_gt(pf_fd, gt) {
+			xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+				ret = xe_sriov_pf_debugfs_read_provisioned_ranges(pf_fd, res, gt,
+										  &ranges,
+										  &nr_ranges);
+				igt_skip_on_f(ret, "Failed read %s on gt%u (%d)\n",
+					      xe_sriov_debugfs_provisioned_attr_name(res),
+					      gt, ret);
+				igt_skip_on_f(nr_ranges != 0, "Unexpected %s content on gt%u\n",
+					      xe_sriov_debugfs_provisioned_attr_name(res), gt);
+			}
+		}
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+	}
+
+	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
+	igt_subtest_with_dynamic("auto-provisioning-fair") {
+		for_random_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				igt_debug("numvfs=%u\n", num_vfs);
+				auto_provisioning_fair(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_describe("Verify that auto-provisioned resources are released once VFs are disabled");
+	igt_subtest_with_dynamic("auto-provisioned-resources-released-on-vfs-disabling") {
+		for_random_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				igt_debug("numvfs=%u\n", num_vfs);
+				auto_provisioning_release(pf_fd, num_vfs);
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
+				auto_provisioning_exclusive_ranges(pf_fd, num_vfs);
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

