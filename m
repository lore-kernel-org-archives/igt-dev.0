Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06BACFD37F
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A616510E39F;
	Tue, 25 Nov 2025 10:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGi1daaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D98910E3A6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066247; x=1795602247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WyCqvHXgAeqXBS/fjcArgSivzBqHxQVVEw946/L0/wE=;
 b=FGi1daaMDTUG4AauZuZB7XgvrMcGFmyyJ2zpOWPUhubvhrFylEDGKoqK
 zPkKXVCQhZ/AKDQlkctS2n4V1q+sTpPTGhfXhidxQ2aKv+za6jejpMv5o
 Ed4CczMwXd/EB4Av3fEUKYcE09FHO10KpZqrHeDR8Eh+KjPHHOkvIMkLw
 oLwqKEcfNT61GPvRxvZA1GHeuRbhyIWOxxfZ0IDoU5BybeT+O7VOsljTD
 +THN01dO9o6yMvQsgp0ac8dsKWl7JR229GX9eNQU2i00rLzGRoHzf/zPv
 eMLFF7tCcNxDbfG1wvBKRCnaMplv5c9pkjrBnW5YaJ02ngsS7R6UjqvNv Q==;
X-CSE-ConnectionGUID: UuUEjjOmSM6zW9Dx9Be6sg==
X-CSE-MsgGUID: a2nfy8etROaiqpfZ72xnNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65968458"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65968458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:24:07 -0800
X-CSE-ConnectionGUID: XmINkFIOQlmnj7NGiU7Qyg==
X-CSE-MsgGUID: Wa45NcluTOmP28i3YfiLKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="192235434"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:24:05 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 10/10] tests/intel/xe_sriov_admin_profile: Add SR-IOV
 admin sysfs scheduling attributes tests
Date: Tue, 25 Nov 2025 11:23:09 +0100
Message-ID: <20251125102312.43142-11-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
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

Add tests that exercise SR-IOV admin sysfs attributes for PF/VF functions
with VFs disabled, covering default values, write -> readback behavior, and
bulk updates for exec_quantum_ms, preempt_timeout_us, and sched_priority.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 tests/intel/xe_sriov_admin_profile.c | 414 +++++++++++++++++++++++++++
 tests/meson.build                    |   1 +
 2 files changed, 415 insertions(+)
 create mode 100644 tests/intel/xe_sriov_admin_profile.c

diff --git a/tests/intel/xe_sriov_admin_profile.c b/tests/intel/xe_sriov_admin_profile.c
new file mode 100644
index 000000000..6f4ed31b1
--- /dev/null
+++ b/tests/intel/xe_sriov_admin_profile.c
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include "igt.h"
+#include "igt_sriov_device.h"
+#include "igt_sysfs.h"
+#include "igt_sysfs_choice.h"
+#include "xe_drm.h"
+#include "xe/xe_sriov_admin.h"
+
+/**
+ * TEST: Tests for SR-IOV admin sysfs.
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: sysfs
+ * Functionality: SR-IOV admin sysfs
+ * Description: Verify behavior of exposed SR-IOV admin sysfs attributes.
+ */
+
+/**
+ * SUBTEST: default-sched-attributes-vfs-disabled
+ * Description:
+ *   Verify default scheduling attributes under sriov_admin
+ *   with VFs disabled.
+ */
+static void default_sched_attributes(int pf_fd, int vf_num)
+{
+	igt_dynamic_f("%s-default-exec-quantum", igt_sriov_func_str(vf_num)) {
+		igt_assert_eq(0, xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num));
+	}
+
+	igt_dynamic_f("%s-default-preempt-timeout", igt_sriov_func_str(vf_num)) {
+		igt_assert_eq(0, xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num));
+	}
+
+	igt_dynamic_f("%s-default-sched-priority", igt_sriov_func_str(vf_num)) {
+		enum xe_sriov_sched_priority prio;
+		unsigned int prio_mask;
+		char mask_str[64];
+
+		prio = xe_sriov_profile_get_sched_priority(pf_fd, vf_num, &prio_mask);
+		igt_debug("PRIO=%s\n",
+			  xe_sriov_sched_priority_mask_to_string(prio_mask, prio, mask_str,
+								 sizeof(mask_str)));
+		igt_assert_eq(XE_SRIOV_SCHED_PRIORITY_LOW, prio);
+	}
+}
+
+/**
+ * SUBTEST: exec-quantum-write-readback-vfs-disabled
+ * Description:
+ *   Verify write -> readback of exec_quantum_ms under sriov_admin
+ *   for PF and all VFs with VFs disabled.
+ */
+static void exec_quantum_write_readback(int pf_fd, unsigned int vf_num,
+					uint32_t eq_ms)
+{
+	int ret_read, ret_restore;
+	uint32_t read_val;
+
+	igt_require(xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num) == 0);
+
+	xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, eq_ms);
+
+	ret_read = __xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num, &read_val);
+
+	ret_restore = __xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, 0);
+
+	igt_assert_eq(ret_read, 0);
+	igt_assert_eq(read_val, eq_ms);
+	igt_fail_on(ret_restore);
+}
+
+/**
+ * SUBTEST: preempt-timeout-write-readback-vfs-disabled
+ * Description:
+ *   Verify write -> readback of preempt_timeout_us under sriov_admin
+ *   for PF and all VFs with VFs disabled.
+ */
+static void preempt_timeout_write_readback(int pf_fd, unsigned int vf_num,
+					   uint32_t pt_us)
+{
+	int ret_read, ret_restore;
+	uint32_t read_val;
+
+	igt_require(xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num) == 0);
+
+	xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, pt_us);
+
+	ret_read = __xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num, &read_val);
+
+	ret_restore = __xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, 0);
+
+	igt_assert_eq(ret_read, 0);
+	igt_assert_eq(read_val, pt_us);
+	igt_fail_on(ret_restore);
+}
+
+/**
+ * SUBTEST: sched-priority-write-readback-vfs-disabled
+ * Description:
+ *   Verify write -> readback of sched_priority under sriov_admin
+ *   for PF and all VFs with VFs disabled.
+ */
+static void sched_priority_write_readback(int pf_fd, unsigned int vf_num)
+{
+	struct igt_sysfs_choice prio, now;
+	enum xe_sriov_sched_priority prio_enum;
+	int ret;
+
+	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &prio);
+	igt_assert_eq(ret, 0);
+
+	for (size_t n = prio.num_tokens; n-- > 0; ) {
+		igt_warn_on_f(xe_sriov_sched_priority_from_string(prio.tokens[n],
+								  &prio_enum),
+			      "Unrecognized sched_priority value '%s'\n",
+			      prio.tokens[n]);
+		igt_debug("Setting priority string '%s'\n", prio.tokens[n]);
+		ret = __xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num,
+								   prio.tokens[n]);
+
+		/* Not settable on VF */
+		if (igt_debug_on(vf_num && (ret == -EPERM || ret == -EACCES)))
+			break;
+
+		igt_assert_eq(ret, 0);
+		ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &now);
+		igt_assert_f(!strcmp(now.tokens[now.selected], prio.tokens[n]),
+			     "'%s' != '%s'", now.tokens[now.selected],
+			     prio.tokens[n]);
+		igt_assert_eq(now.selected, n);
+	}
+	__xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num,
+						     prio.tokens[prio.selected]);
+}
+
+/**
+ * SUBTEST: bulk-exec-quantum-vfs-disabled
+ * Description:
+ *   Verify that bulk setting exec_quantum_ms under sriov_admin applies
+ *   the expected value to the PF and all VFs when VFs are disabled.
+ */
+static void bulk_set_exec_quantum(int pf_fd, unsigned int total_vfs, uint32_t eq_ms)
+{
+	uint32_t read_val;
+	unsigned int id;
+	int fails = 0;
+
+	xe_sriov_bulk_set_exec_quantum_ms(pf_fd, eq_ms);
+
+	for (id = 0; id <= total_vfs; ++id) {
+		int ret = __xe_sriov_profile_get_exec_quantum_ms(pf_fd, id,
+								 &read_val);
+
+		if (ret) {
+			igt_debug("%s: failed to read exec_quantum_ms, ret=%d\n",
+				  igt_sriov_func_str(id), ret);
+			fails++;
+			continue;
+		}
+
+		if (read_val != eq_ms) {
+			igt_debug("%s: exec_quantum_ms=%u, expected=%u\n",
+				  igt_sriov_func_str(id), read_val, eq_ms);
+			fails++;
+		}
+	}
+
+	xe_sriov_bulk_set_exec_quantum_ms(pf_fd, 0);
+	igt_fail_on(fails);
+}
+
+/**
+ * SUBTEST: bulk-preempt-timeout-vfs-disabled
+ * Description:
+ *   Verify that bulk setting preempt_timeout_us under sriov_admin applies
+ *   the expected value to the PF and all VFs when VFs are disabled.
+ */
+static void bulk_set_preempt_timeout(int pf_fd, unsigned int total_vfs, uint32_t pt_us)
+{
+	uint32_t read_val;
+	unsigned int id;
+	int fails = 0;
+
+	xe_sriov_bulk_set_preempt_timeout_us(pf_fd, pt_us);
+
+	for (id = 0; id <= total_vfs; ++id) {
+		int ret = __xe_sriov_profile_get_preempt_timeout_us(pf_fd, id,
+								    &read_val);
+
+		if (ret) {
+			igt_debug("%s: failed to read preempt_timeout_us, ret=%d\n",
+				  igt_sriov_func_str(id), ret);
+			fails++;
+			continue;
+		}
+
+		if (read_val != pt_us) {
+			igt_debug("%s: preempt_timeout_us=%u, expected=%u\n",
+				  igt_sriov_func_str(id), read_val, pt_us);
+			fails++;
+		}
+	}
+
+	xe_sriov_bulk_set_preempt_timeout_us(pf_fd, 0);
+	igt_fail_on(fails);
+}
+
+static void build_common_sched_priority_choice(int pf_fd, int num_vfs,
+					       struct igt_sysfs_choice *common)
+{
+	int ret;
+
+	/* Start from PF */
+	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, 0, common);
+	igt_require_f(ret == 0,
+		      "Failed to read PF sched_priority (ret=%d)\n", ret);
+
+	igt_require_f(common->num_tokens > 0,
+		      "PF sched_priority exposes no tokens\n");
+
+	/* Intersect with every VF 1..num_vfs */
+	for (int vf = 1; vf <= num_vfs; vf++) {
+		struct igt_sysfs_choice prio = {};
+
+		ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf, &prio);
+		igt_require_f(ret == 0,
+			      "Failed to read VF%u sched_priority (ret=%d)\n",
+			      vf, ret);
+
+		ret = igt_sysfs_choice_intersect(common, &prio);
+		igt_require_f(ret == 0,
+			      "No common sched_priority between PF and VF%u\n",
+			      vf);
+	}
+
+	igt_require_f(common->num_tokens > 0,
+		      "No common sched_priority across PF and all VFs\n");
+
+	if (common->selected < 0) {
+		igt_debug("Common sched_priority has no selected token, "
+			  "defaulting to tokens[0]=\"%s\"\n",
+			  common->tokens[0]);
+		common->selected = 0;
+	}
+}
+
+/**
+ * SUBTEST: bulk-sched-priority-vfs-disabled
+ * Description: Verify bulk sched_priority modification with VFs disabled.
+ */
+static void bulk_set_sched_priority(int pf_fd, unsigned int total_vfs, const char *prio_str)
+{
+	struct igt_sysfs_choice read_val;
+	const char *selected;
+	unsigned int id;
+	int fails = 0;
+
+	xe_sriov_bulk_set_sched_priority_string(pf_fd, prio_str);
+
+	for (id = 0; id <= total_vfs; ++id) {
+		int ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, id,
+								       &read_val);
+
+		if (ret) {
+			igt_debug("%s: failed to read sched_priority, ret=%d\n",
+				  igt_sriov_func_str(id), ret);
+			fails++;
+			continue;
+		}
+
+		selected = igt_sysfs_choice_selected(&read_val);
+		if (!selected || strncmp(selected, prio_str, strlen(prio_str))) {
+			igt_debug("%s: sched_priority='%s', expected='%s'\n",
+				  igt_sriov_func_str(id), selected ?: "NULL", prio_str);
+			fails++;
+		}
+	}
+
+	igt_fail_on(fails);
+}
+
+/**
+ * SUBTEST: sched-priority-vf-write-denied
+ * Description:
+ *   Verify that sched_priority cannot be modified on a VF.
+ *   A write attempt must fail with -EPERM or -EACCES and the
+ *   current priority selection must remain unchanged.
+ */
+static void sched_priority_vf_write_denied(int pf_fd, unsigned int vf_num)
+{
+	struct igt_sysfs_choice before, after;
+	const char *new_token;
+	int ret;
+
+	igt_require(vf_num > 0);
+
+	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &before);
+	igt_require(ret == 0);
+	igt_require(before.num_tokens > 0);
+
+	new_token = before.tokens[(before.selected + 1) % before.num_tokens];
+
+	ret = __xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num, new_token);
+	igt_assert_f(ret == -EPERM || ret == -EACCES,
+		     "Expected -EPERM/-EACCES when writing VF sched_priority "
+		     "(token='%s'), got %d\n", new_token, ret);
+
+	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &after);
+	igt_assert_eq(ret, 0);
+
+	igt_assert_eq(after.selected, before.selected);
+	igt_assert(!strcmp(igt_sysfs_choice_selected(&before),
+			   igt_sysfs_choice_selected(&after)));
+}
+
+igt_main
+{
+	unsigned int total_vfs;
+	int pf_fd;
+
+	igt_fixture {
+		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		igt_require(xe_sriov_admin_is_present(pf_fd));
+		total_vfs = igt_sriov_get_total_vfs(pf_fd);
+	}
+
+	igt_subtest_with_dynamic("default-sched-attributes-vfs-disabled") {
+		for (unsigned int id = 0; id <= total_vfs; ++id)
+			default_sched_attributes(pf_fd, id);
+	}
+
+	igt_subtest_with_dynamic("exec-quantum-write-readback-vfs-disabled") {
+		uint32_t eq_ms = 10;
+
+		for (unsigned int id = 0; id <= total_vfs; ++id) {
+			igt_dynamic_f("%s-eq_ms-%u", igt_sriov_func_str(id), eq_ms) {
+				exec_quantum_write_readback(pf_fd, id, eq_ms);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("preempt-timeout-write-readback-vfs-disabled") {
+		uint32_t pt_us = 20000;
+
+		for (unsigned int id = 0; id <= total_vfs; ++id) {
+			igt_dynamic_f("%s-pt_us-%u", igt_sriov_func_str(id), pt_us) {
+				preempt_timeout_write_readback(pf_fd, id, pt_us);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("sched-priority-write-readback-vfs-disabled") {
+		for (unsigned int id = 0; id <= total_vfs; ++id) {
+			igt_dynamic_f("%s", igt_sriov_func_str(id)) {
+				sched_priority_write_readback(pf_fd, id);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("sched-priority-vf-write-denied") {
+		for_each_sriov_num_vfs(pf_fd, vf_num) {
+			igt_dynamic_f("%s", igt_sriov_func_str(vf_num)) {
+				sched_priority_vf_write_denied(pf_fd, vf_num);
+			}
+		}
+	}
+
+	igt_subtest("bulk-exec-quantum-vfs-disabled") {
+		const uint32_t eq_ms = 10;
+
+		bulk_set_exec_quantum(pf_fd, total_vfs, eq_ms);
+	}
+
+	igt_subtest("bulk-preempt-timeout-vfs-disabled") {
+		uint32_t pt_us = 10000;
+
+		bulk_set_preempt_timeout(pf_fd, total_vfs, pt_us);
+	}
+
+	igt_subtest_group {
+		struct igt_sysfs_choice prio = {};
+
+		igt_fixture {
+			build_common_sched_priority_choice(pf_fd, total_vfs,
+							   &prio);
+		}
+
+		igt_subtest_with_dynamic_f("bulk-sched-priority-vfs-disabled") {
+			for (size_t i = prio.num_tokens; i-- > 0; ) {
+				const char *prio_str = prio.tokens[i];
+
+				igt_dynamic_f("%s", prio_str)
+					bulk_set_sched_priority(pf_fd, 0, prio_str);
+			}
+		}
+	}
+
+	igt_fixture {
+		int ret;
+
+		ret = __xe_sriov_bulk_restore_defaults(pf_fd);
+		igt_sriov_disable_vfs(pf_fd);
+		/* abort to avoid execution of next tests with enabled VFs */
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
+			       "Failed to disable VF(s)");
+		igt_abort_on_f(ret, "Failed to restore default profile values\n");
+		drm_close_driver(pf_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index ecc0f4c7f..6516a0a9a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -327,6 +327,7 @@ intel_xe_progs = [
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
+	'xe_sriov_admin_profile',
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
 	'xe_sriov_scheduling',
-- 
2.43.0

