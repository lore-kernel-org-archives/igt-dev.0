Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F34CEDD85
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D861910E163;
	Wed,  9 Oct 2024 11:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQM3ZHRE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72910E163
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 11:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473453; x=1760009453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8lkMifSrGUpDa1q9HLQIb2dkNrLLpKpxiplEdwRZ3KY=;
 b=jQM3ZHREB/3H/6HCl42sotzJIBCqSiXDrsjAbACWhCYO/Ei4aDUIXTcD
 mtIdXsEhFas1IuQpTPK/Mh4yymhzrQZt5TX7pJ6daATQdP8masIlW8REZ
 fQX+P0T+lVoDaDULoQb56dkLIHLywOHY4V1+zDUunQldM0jW5iZJsn+ND
 VKVT+fuEqNHHUyXVXRYwu1fuI7MBbkDAuLyP9lIKMpYY2x8l8m/QXBTO8
 hSemRAmPb4i9YyKeCxRGO7p3IfbY/TJt9m+jW9XvsTr4yzYFrIpI6Mi7O
 w+KLOfqXNxH8NLc/y53d0lSW1tkjsv436c/1Ys7yKfakrAo9w8dZv38OR g==;
X-CSE-ConnectionGUID: uAizTairTWGiB0AhT/q7mw==
X-CSE-MsgGUID: 7vy6l2OMSeufrY7BtQWznQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45286309"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="45286309"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:46 -0700
X-CSE-ConnectionGUID: /xPydz+FSKyAaWRfSGrXbg==
X-CSE-MsgGUID: xBz7BhbvR4ibxNQqtgEaBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="113699956"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.16.246])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:30:42 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 C V Narasimha <narasimha.c.v@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 K V P Satyanarayana <satyanarayana.k.v.p@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 3/6] tests/intel/xe_sriov_flr: Add skeleton for clear
 and isolation tests
Date: Wed,  9 Oct 2024 13:30:15 +0200
Message-Id: <20241009113018.741371-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
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

Introduce a skeleton with basic structures for subchecks execution and
a `verify_flr` template method to orchestrate the verification of
Functional Level Reset (FLR) across multiple Virtual Functions (VFs).

The goal is to reduce runtime by limiting the total number of FLRs. Instead
of repeating the FLR process for each subcheck (clear-lmem, clear-ggtt,
clear-scratch-regs, clear-media-scratch-regs), a single FLR is issued.
Afterward, all subchecks verify if any failures occurred and report the
results accordingly. The proposed skeleton ensures that while one subcheck
may stop due to failure or a skip condition, other subchecks can continue
execution.

Concrete subcheck implementations (clear-lmem, clear-ggtt,
clear-scratch-regs, clear-media-scratch-regs) will be introduced
in subsequent patches.

Proposed IGT tests (will report each subcheck's status):

flr-vf1-clear
    Verifies that LMEM, GGTT, and SCRATCH_REGS are properly cleared on VF1
    (with only VF1 enabled) following a Function Level Reset (FLR). This
    test can be included in the BAT (Basic Acceptance Test) suite.

flr-each-isolation
    Sequentially performs FLR on each VF to verify isolation and
    clearing of LMEM, GGTT, and SCRATCH_REGS on the reset VF only.
    This test is better suited for FULL runs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: C V Narasimha <narasimha.c.v@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 290 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 2 files changed, 291 insertions(+)
 create mode 100644 tests/intel/xe_sriov_flr.c

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
new file mode 100644
index 000000000..26b59101f
--- /dev/null
+++ b/tests/intel/xe_sriov_flr.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_sriov_device.h"
+
+/**
+ * TEST: xe_sriov_flr
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: Reset tests
+ * Functionality: FLR
+ * Run type: FULL
+ * Description: Examine behavior of SR-IOV VF FLR
+ *
+ * SUBTEST: flr-vf1-clear
+ * Description:
+ *   Verifies that LMEM, GGTT, and SCRATCH_REGS are properly cleared
+ *   on VF1 following a Function Level Reset (FLR).
+ *
+ * SUBTEST: flr-each-isolation
+ * Description:
+ *   Sequentially performs FLR on each VF to verify isolation and
+ *   clearing of LMEM, GGTT, and SCRATCH_REGS on the reset VF only.
+ */
+
+IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
+
+const char *SKIP_REASON = "SKIP";
+
+/**
+ * struct subcheck_data - Base structure for subcheck data.
+ *
+ * This structure serves as a foundational data model for various subchecks. It is designed
+ * to be extended by more specific subcheck structures as needed. The structure includes
+ * essential information about the subcheck environment and conditions, which are used
+ * across different testing operations.
+ *
+ * @pf_fd: File descriptor for the Physical Function.
+ * @num_vfs: Number of Virtual Functions (VFs) enabled and under test. This count is
+ *           used to iterate over and manage the VFs during the testing process.
+ * @gt: Gt under test. This identifier is used to specify a particular gt
+ *      for operations when gt-specific testing is required.
+ * @stop_reason: Pointer to a string that indicates why a subcheck should skip or fail.
+ *               This field is crucial for controlling the flow of subcheck execution.
+ *               If set, it should prevent further execution of the current subcheck,
+ *               allowing subcheck operations to check this field and return early if
+ *               a skip or failure condition is indicated. This mechanism ensures
+ *               that while one subcheck may stop due to a failure or a skip condition,
+ *               other subchecks can continue execution.
+ *
+ * Example usage:
+ * A typical use of this structure involves initializing it with the necessary test setup
+ * parameters, checking the `stop_reason` field before proceeding with each subcheck operation,
+ * and using `pf_fd`, `num_vfs`, and `gt` as needed based on the specific subcheck requirements.
+ */
+struct subcheck_data {
+	int pf_fd;
+	int num_vfs;
+	int gt;
+	char *stop_reason;
+};
+
+/**
+ * struct subcheck - Defines operations for managing a subcheck scenario.
+ *
+ * This structure holds function pointers for the key operations required
+ * to manage the lifecycle of a subcheck scenario. It is used by the `verify_flr`
+ * function, which acts as a template method, to call these operations in a
+ * specific sequence.
+ *
+ * @data: Shared data necessary for all operations in the subcheck.
+ *
+ * @name: Name of the subcheck operation, used for identification and reporting.
+ *
+ * @init: Initialize the subcheck environment.
+ *   Sets up the initial state required for the subcheck, including preparing
+ *   resources and ensuring the system is ready for testing.
+ *   @param data: Shared data needed for initialization.
+ *
+ * @prepare_vf: Prepare subcheck data for a specific VF.
+ *   Called for each VF before FLR is performed. It might involve marking
+ *   specific memory regions or setting up PTE addresses.
+ *   @param vf_id: Identifier of the VF being prepared.
+ *   @param data: Shared common data.
+ *
+ * @verify_vf: Verify the state of a VF after FLR.
+ *   Checks the VF's state post FLR to ensure the expected results,
+ *   such as verifying that only the FLRed VF has its state reset.
+ *   @param vf_id: Identifier of the VF to verify.
+ *   @param flr_vf_id: Identifier of the VF that underwent FLR.
+ *   @param data: Shared common data.
+ *
+ * @cleanup: Clean up the subcheck environment.
+ *   Releases resources and restores the system to its original state
+ *   after the subchecks, ensuring no resource leaks and preparing the system
+ *   for subsequent tests.
+ *   @param data: Shared common data.
+ */
+struct subcheck {
+	struct subcheck_data *data;
+	const char *name;
+	void (*init)(struct subcheck_data *data);
+	void (*prepare_vf)(int vf_id, struct subcheck_data *data);
+	void (*verify_vf)(int vf_id, int flr_vf_id, struct subcheck_data *data);
+	void (*cleanup)(struct subcheck_data *data);
+};
+
+static bool subcheck_can_proceed(const struct subcheck *check)
+{
+	return !check->data->stop_reason;
+}
+
+static int count_subchecks_with_stop_reason(struct subcheck *checks, int num_checks)
+{
+	int subchecks_with_stop_reason = 0;
+
+	for (int i = 0; i < num_checks; ++i)
+		if (!subcheck_can_proceed(&checks[i]))
+			subchecks_with_stop_reason++;
+
+	return subchecks_with_stop_reason;
+}
+
+static bool no_subchecks_can_proceed(struct subcheck *checks, int num_checks)
+{
+	return count_subchecks_with_stop_reason(checks, num_checks) == num_checks;
+}
+
+static bool is_subcheck_skipped(struct subcheck *subcheck)
+{
+	return subcheck->data && subcheck->data->stop_reason &&
+	       !strncmp(SKIP_REASON, subcheck->data->stop_reason, strlen(SKIP_REASON));
+}
+
+static void subchecks_report_results(struct subcheck *checks, int num_checks)
+{
+	int fails = 0, skips = 0;
+
+	for (int i = 0; i < num_checks; ++i) {
+		if (checks[i].data->stop_reason) {
+			if (is_subcheck_skipped(&checks[i])) {
+				igt_info("%s: %s\n", checks[i].name,
+					 checks[i].data->stop_reason);
+				skips++;
+			} else {
+				igt_critical("%s: FAIL : %s\n", checks[i].name,
+					     checks[i].data->stop_reason);
+				fails++;
+			}
+		} else {
+			igt_info("%s: SUCCESS\n", checks[i].name);
+		}
+	}
+
+	igt_fail_on_f(fails, "%d out of %d checks failed\n", fails, num_checks);
+	igt_skip_on(skips == num_checks);
+}
+
+/**
+ * verify_flr - Orchestrates the verification of Function Level Reset (FLR)
+ *              across multiple Virtual Functions (VFs).
+ *
+ * This function performs FLR on each VF to ensure that only the reset VF has
+ * its state cleared, while other VFs remain unaffected. It handles initialization,
+ * preparation, verification, and cleanup for each test operation defined in `checks`.
+ *
+ * @pf_fd: File descriptor for the Physical Function (PF).
+ * @num_vfs: Total number of Virtual Functions (VFs) to test.
+ * @checks: Array of subchecks.
+ * @num_checks: Number of subchecks.
+ *
+ * Detailed Workflow:
+ * - Initializes and prepares VFs for testing.
+ * - Iterates through each VF, performing FLR, and verifies that only
+ *   the reset VF is affected while others remain unchanged.
+ * - Reinitializes test data for the FLRed VF if there are more VFs to test.
+ * - Continues the process until all VFs are tested.
+ * - Handles any test failures or early exits, cleans up, and reports results.
+ *
+ * A timeout is used to wait for FLR operations to complete.
+ */
+static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_checks)
+{
+	const int wait_flr_ms = 200;
+	int i, vf_id, flr_vf_id = -1;
+
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	if (igt_warn_on(!igt_sriov_device_reset_exists(pf_fd, 1)))
+		goto disable_vfs;
+	/* Refresh PCI state */
+	if (igt_warn_on(igt_pci_system_reinit()))
+		goto disable_vfs;
+
+	for (i = 0; i < num_checks; ++i)
+		checks[i].init(checks[i].data);
+
+	for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
+		for (i = 0; i < num_checks; ++i)
+			if (subcheck_can_proceed(&checks[i]))
+				checks[i].prepare_vf(vf_id, checks[i].data);
+
+	if (no_subchecks_can_proceed(checks, num_checks))
+		goto cleanup;
+
+	flr_vf_id = 1;
+
+	do {
+		if (igt_warn_on_f(!igt_sriov_device_reset(pf_fd, flr_vf_id),
+				  "Initiating VF%u FLR failed\n", flr_vf_id))
+			goto cleanup;
+
+		/* assume FLR is finished after wait_flr_ms */
+		usleep(wait_flr_ms * 1000);
+
+		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
+			for (i = 0; i < num_checks; ++i)
+				if (subcheck_can_proceed(&checks[i]))
+					checks[i].verify_vf(vf_id, flr_vf_id, checks[i].data);
+
+		/* reinitialize test data for FLRed VF */
+		if (flr_vf_id < num_vfs)
+			for (i = 0; i < num_checks; ++i)
+				if (subcheck_can_proceed(&checks[i]))
+					checks[i].prepare_vf(flr_vf_id, checks[i].data);
+
+		if (no_subchecks_can_proceed(checks, num_checks))
+			goto cleanup;
+
+	} while (++flr_vf_id <= num_vfs);
+
+cleanup:
+	for (i = 0; i < num_checks; ++i)
+		checks[i].cleanup(checks[i].data);
+
+disable_vfs:
+	igt_sriov_disable_vfs(pf_fd);
+
+	if (flr_vf_id > 1 || no_subchecks_can_proceed(checks, num_checks))
+		subchecks_report_results(checks, num_checks);
+	else
+		igt_skip("No checks executed\n");
+}
+
+static void clear_tests(int pf_fd, int num_vfs)
+{
+	verify_flr(pf_fd, num_vfs, NULL, 0);
+}
+
+igt_main
+{
+	int pf_fd;
+	bool autoprobe;
+
+	igt_fixture {
+		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+	}
+
+	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
+	igt_subtest("flr-vf1-clear") {
+		clear_tests(pf_fd, 1);
+	}
+
+	igt_describe("Perform sequential FLR on each VF, verifying that LMEM, GGTT, and SCRATCH_REGS are cleared only on the reset VF.");
+	igt_subtest("flr-each-isolation") {
+		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+		igt_require(total_vfs > 1);
+
+		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs);
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
+		close(pf_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2d8cb87d5..49740d11d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -314,6 +314,7 @@ intel_xe_progs = [
 	'xe_vm',
 	'xe_waitfence',
 	'xe_spin_batch',
+	'xe_sriov_flr',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
-- 
2.31.1

