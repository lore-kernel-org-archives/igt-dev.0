Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F494E69E9D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 10:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4810510E313;
	Tue,  3 Dec 2024 10:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvddkyWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0195B10E313
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733222326; x=1764758326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DpQyJ0Yi5w1/pACnOVy5zYEjjpB923Mog+F818dpIe4=;
 b=IvddkyWhxG/qpAWCWeOwb+lQuPC14kMccW7Lzfe1/et6+X0VHI7kL7gO
 AfjSRcg/tz2yCInkcA+j72cjHlqWQh6VdHbR/3p6fRtVLo2y290WrvApr
 RWOvYb7m9xn8PAoYs/gdW0zUaFQB0QqBA37dnGFaOEVbP/bRhOvpQfz0h
 pHHcR1Nk2p4yVfQZp9MpnvHhVVzEntDEXH3k+9iKW6kIs64TSvGKAcPo2
 ii+dwf+m6RFsNmgI6UtTSSNT8BBqbMX5nUv0AYgfcNaSj4Gwg9NVdqPMp
 ZxhAbXPsff3ZdH3a19HxQsEaOhA0G3R+AHTgpQWRhSLlvzyeJ7QQZvBG5 Q==;
X-CSE-ConnectionGUID: y/6bs7nAQtmlmFflQGreqQ==
X-CSE-MsgGUID: TmhktPasRJm/2fVXc6yRhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33559288"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="33559288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 02:38:46 -0800
X-CSE-ConnectionGUID: le2LZmn5Rmm10+rzCPJYIw==
X-CSE-MsgGUID: 35PewHRESqSUD7J+0YQacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="97835185"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.113.95])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 02:38:42 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_flr: Add parallel FLR subtest for
 SR-IOV VFs
Date: Tue,  3 Dec 2024 11:38:38 +0100
Message-Id: <20241203103838.2074946-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Introduce a new subtest flr-vfs-parallel to validate parallel FLR
execution on all VFs. This subtest ensures correct behavior during
simultaneous resets.

Refactor verify_flr to accept an execution strategy function pointer,
allowing for both sequential and parallel FLR strategies.

Update clear_tests to use the new execution strategy approach and
modify existing subtests to utilize the sequential FLR strategy.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_flr.c | 127 +++++++++++++++++++++++++++++--------
 1 file changed, 99 insertions(+), 28 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 550d58bb9..253106856 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -35,6 +35,11 @@
  * Description:
  *   Sequentially performs FLR on each VF to verify isolation and
  *   clearing of LMEM, GGTT, and SCRATCH_REGS on the reset VF only.
+ *
+ * SUBTEST: flr-vfs-parallel
+ * Run type: FULL
+ * Description:
+ *   Executes FLR on all VFs simultaneously to validate correct behavior during parallel resets.
  */
 
 IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
@@ -210,6 +215,26 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
 	igt_skip_on(skips == num_checks);
 }
 
+/**
+ * flr_exec_strategy - Function pointer for FLR execution strategy
+ * @pf_fd: File descriptor for the Physical Function (PF).
+ * @num_vfs: Total number of Virtual Functions (VFs) to test.
+ * @checks: Array of subchecks.
+ * @num_checks: Number of subchecks.
+ * @wait_flr_ms: Time to wait (in milliseconds) for FLR to complete
+ *
+ * Defines a strategy for executing FLRs (Functional Level Resets)
+ * across multiple VFs. The strategy determines the order and
+ * manner (e.g., sequential or parallel) in which FLRs are performed.
+ * It is expected to initiate FLRs and handle related operations,
+ * such as verifying and preparing subchecks.
+ *
+ * Return: The ID of the last VF for which FLR was successfully initiated.
+ */
+typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
+				 struct subcheck *checks, int num_checks,
+				 const int wait_flr_ms);
+
 /**
  * verify_flr - Orchestrates the verification of Function Level Reset (FLR)
  *              across multiple Virtual Functions (VFs).
@@ -222,18 +247,20 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
  * @num_vfs: Total number of Virtual Functions (VFs) to test.
  * @checks: Array of subchecks.
  * @num_checks: Number of subchecks.
+ * @flr_exec_strategy: Execution strategy for FLR (e.g., sequential or parallel).
  *
  * Detailed Workflow:
  * - Initializes and prepares VFs for testing.
- * - Iterates through each VF, performing FLR, and verifies that only
- *   the reset VF is affected while others remain unchanged.
- * - Reinitializes test data for the FLRed VF if there are more VFs to test.
- * - Continues the process until all VFs are tested.
- * - Handles any test failures or early exits, cleans up, and reports results.
+ * - Executes the FLR operation using the provided execution strategy
+ *   (e.g., sequential or parallel) and validates that the reset VF behaves
+ *   as expected.
+ * - Cleans up resources and reports results after all VFs have been tested
+ *   or in the case of an early exit.
  *
  * A timeout is used to wait for FLR operations to complete.
  */
-static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_checks)
+static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
+		       int num_checks, flr_exec_strategy exec_strategy)
 {
 	const int wait_flr_ms = 200;
 	int i, vf_id, flr_vf_id = -1;
@@ -242,6 +269,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
 	igt_sriov_enable_vfs(pf_fd, num_vfs);
 	if (igt_warn_on(!igt_sriov_device_reset_exists(pf_fd, 1)))
 		goto disable_vfs;
+
 	/* Refresh PCI state */
 	if (igt_warn_on(igt_pci_system_reinit()))
 		goto disable_vfs;
@@ -257,14 +285,34 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
 	if (no_subchecks_can_proceed(checks, num_checks))
 		goto cleanup;
 
-	flr_vf_id = 1;
+	/* Execute the chosen FLR strategy */
+	flr_vf_id = exec_strategy(pf_fd, num_vfs, checks, num_checks, wait_flr_ms);
+
+cleanup:
+	for (i = 0; i < num_checks; ++i)
+		checks[i].cleanup(checks[i].data);
+
+disable_vfs:
+	igt_sriov_disable_vfs(pf_fd);
+
+	if (flr_vf_id > 0 || no_subchecks_can_proceed(checks, num_checks))
+		subchecks_report_results(checks, num_checks);
+	else
+		igt_skip("No checks executed\n");
+}
+
+static int execute_sequential_flr(int pf_fd, int num_vfs,
+				  struct subcheck *checks, int num_checks,
+				  const int wait_flr_ms)
+{
+	int i, vf_id, flr_vf_id = 1;
 
 	do {
 		if (igt_warn_on_f(!igt_sriov_device_reset(pf_fd, flr_vf_id),
 				  "Initiating VF%u FLR failed\n", flr_vf_id))
-			goto cleanup;
+			break;
 
-		/* assume FLR is finished after wait_flr_ms */
+		/* Assume FLR is finished after wait_flr_ms */
 		usleep(wait_flr_ms * 1000);
 
 		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
@@ -272,28 +320,42 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
 				if (subcheck_can_proceed(&checks[i]))
 					checks[i].verify_vf(vf_id, flr_vf_id, checks[i].data);
 
-		/* reinitialize test data for FLRed VF */
-		if (flr_vf_id < num_vfs)
-			for (i = 0; i < num_checks; ++i)
-				if (subcheck_can_proceed(&checks[i]))
-					checks[i].prepare_vf(flr_vf_id, checks[i].data);
+		/* Reinitialize test data for the FLRed VF */
+		for (i = 0; i < num_checks; ++i)
+			if (subcheck_can_proceed(&checks[i]))
+				checks[i].prepare_vf(flr_vf_id, checks[i].data);
 
 		if (no_subchecks_can_proceed(checks, num_checks))
-			goto cleanup;
+			break;
 
 	} while (++flr_vf_id <= num_vfs);
 
-cleanup:
-	for (i = 0; i < num_checks; ++i)
-		checks[i].cleanup(checks[i].data);
+	return flr_vf_id - 1;
+}
 
-disable_vfs:
-	igt_sriov_disable_vfs(pf_fd);
+static int execute_parallel_flr(int pf_fd, int num_vfs, struct subcheck *checks,
+				int num_checks, const int wait_flr_ms)
+{
+	int i, vf_id, flr_vf_id = 1;
 
-	if (flr_vf_id > 1 || no_subchecks_can_proceed(checks, num_checks))
-		subchecks_report_results(checks, num_checks);
-	else
-		igt_skip("No checks executed\n");
+	for (; flr_vf_id <= num_vfs; ++flr_vf_id) {
+		if (igt_warn_on_f(!igt_sriov_device_reset(pf_fd, flr_vf_id),
+				  "Initiating VF%u FLR failed\n", flr_vf_id))
+			break;
+	}
+
+	/* At least one FLR initiated */
+	if (flr_vf_id > 1) {
+		/* Assume FLRs finished after wait_flr_ms */
+		usleep(wait_flr_ms * 1000);
+
+		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
+			for (i = 0; i < num_checks; ++i)
+				if (subcheck_can_proceed(&checks[i]))
+					checks[i].verify_vf(vf_id, vf_id, checks[i].data);
+	}
+
+	return flr_vf_id - 1;
 }
 
 #define GEN12_VF_CAP_REG			0x1901f8
@@ -817,7 +879,7 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
 				intel_register_access_fini(&rdata->mmio[i]);
 }
 
-static void clear_tests(int pf_fd, int num_vfs)
+static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 {
 	struct xe_mmio xemmio = { };
 	const unsigned int num_gts = xe_number_gt(pf_fd);
@@ -882,7 +944,7 @@ static void clear_tests(int pf_fd, int num_vfs)
 	};
 	igt_assert_eq(i, num_checks);
 
-	verify_flr(pf_fd, num_vfs, checks, num_checks);
+	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
 }
 
 igt_main
@@ -899,7 +961,7 @@ igt_main
 
 	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
 	igt_subtest("flr-vf1-clear") {
-		clear_tests(pf_fd, 1);
+		clear_tests(pf_fd, 1, execute_sequential_flr);
 	}
 
 	igt_describe("Perform sequential FLR on each VF, verifying that LMEM, GGTT, and SCRATCH_REGS are cleared only on the reset VF.");
@@ -908,7 +970,16 @@ igt_main
 
 		igt_require(total_vfs > 1);
 
-		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs);
+		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs, execute_sequential_flr);
+	}
+
+	igt_describe("Perform FLR on all VFs in parallel, ensuring correct behavior during simultaneous resets.");
+	igt_subtest("flr-vfs-parallel") {
+		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+		igt_require(total_vfs > 1);
+
+		clear_tests(pf_fd, total_vfs, execute_parallel_flr);
 	}
 
 	igt_fixture {
-- 
2.31.1

