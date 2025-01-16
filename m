Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB99C02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 19:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA1110E227;
	Thu, 16 Jan 2025 19:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNFPHuWg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D810A10E227
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 19:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737055761; x=1768591761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XoC2kXVlqISFwRSqPxcKdxEoJeg+xapjEGfUOiREf00=;
 b=mNFPHuWgKfpkewy8L17u+KZA+KCDLVVZWzoguGdThMr3qbjvDfuiA7Vl
 k5bSwuJoJpTxCsJiR+WpbrFE7v+vks4WrMxBj0iHzBALlXWggfM7yKYIq
 p8Xk/nNOwOTER+4b7CCYqlEcjCPzqCNqzOZa5TqBkjgBD7ZAy/qtzD8r4
 1CEZkeHAkg6m39GZx1yoElsaT0g0xYXp23GGp8C88+M26flCbIgtMbFQD
 8i9knEb6PXa5FAOE3d9RPl8iFQ/ZMxewumZWj31r7rrOPUkYAfYdZ9x5I
 WOWjj1gGKtmyna2zbAtRFzgogbgyHdOpYRt9Cyi+aDabkiZaUqWQmF8fg A==;
X-CSE-ConnectionGUID: kuX8ELBaTveAlgoSnL0log==
X-CSE-MsgGUID: Eu/wh5m2RDWy74p63SnigA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="47955177"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="47955177"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:29:21 -0800
X-CSE-ConnectionGUID: NVQhpA33Q92AW/QevmKMHQ==
X-CSE-MsgGUID: 7FbBcKbOR+qKy8j1YcEBlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105439378"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.125])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:29:18 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v3 i-g-t 1/2] tests/intel/xe_sriov_flr: Add parallel FLR
 subtest for SR-IOV VFs
Date: Thu, 16 Jan 2025 20:29:05 +0100
Message-Id: <20250116192906.636031-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250116192906.636031-1-marcin.bernatowicz@linux.intel.com>
References: <20250116192906.636031-1-marcin.bernatowicz@linux.intel.com>
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

v2: Reintroduce condition to reinitialize test data only if more VFs
    remain to be tested (omitted when extracting execute_sequential_flr).
v3: Introduce threaded FLR initiation to achieve better parallelism
    by mitigating 100ms reset delays.(Lukasz)

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
 tests/intel/xe_sriov_flr.c | 210 ++++++++++++++++++++++++++++++++-----
 1 file changed, 186 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 550d58bb9..a8d35be31 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -4,6 +4,7 @@
  */
 
 #include <fcntl.h>
+#include <pthread.h>
 #include <sys/stat.h>
 #include "drmtest.h"
 #include "igt_core.h"
@@ -35,6 +36,11 @@
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
@@ -210,6 +216,26 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
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
@@ -222,18 +248,20 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
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
@@ -242,6 +270,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
 	igt_sriov_enable_vfs(pf_fd, num_vfs);
 	if (igt_warn_on(!igt_sriov_device_reset_exists(pf_fd, 1)))
 		goto disable_vfs;
+
 	/* Refresh PCI state */
 	if (igt_warn_on(igt_pci_system_reinit()))
 		goto disable_vfs;
@@ -257,14 +286,34 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
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
@@ -272,28 +321,132 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_
 				if (subcheck_can_proceed(&checks[i]))
 					checks[i].verify_vf(vf_id, flr_vf_id, checks[i].data);
 
-		/* reinitialize test data for FLRed VF */
+		/* Reinitialize test data for the FLRed VF */
 		if (flr_vf_id < num_vfs)
 			for (i = 0; i < num_checks; ++i)
 				if (subcheck_can_proceed(&checks[i]))
 					checks[i].prepare_vf(flr_vf_id, checks[i].data);
 
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
+pthread_mutex_t signal_mutex = PTHREAD_MUTEX_INITIALIZER;
+pthread_cond_t signal_cond = PTHREAD_COND_INITIALIZER;
 
-	if (flr_vf_id > 1 || no_subchecks_can_proceed(checks, num_checks))
-		subchecks_report_results(checks, num_checks);
-	else
-		igt_skip("No checks executed\n");
+enum thread_signal {
+	SIGNAL_WAIT,
+	SIGNAL_START,
+	SIGNAL_SKIP
+} thread_signal = SIGNAL_WAIT;
+
+struct flr_thread_data {
+	int pf_fd;
+	int vf_id;
+	int flr_instance;
+	int result;
+};
+
+static void *flr_thread(void *arg)
+{
+	struct flr_thread_data *data = (struct flr_thread_data *)arg;
+
+	pthread_mutex_lock(&signal_mutex);
+	while (thread_signal == SIGNAL_WAIT)
+		pthread_cond_wait(&signal_cond, &signal_mutex);
+	pthread_mutex_unlock(&signal_mutex);
+
+	if (thread_signal == SIGNAL_START &&
+	    igt_warn_on_f(!igt_sriov_device_reset(data->pf_fd, data->vf_id),
+			  "Initiating VF%u FLR failed (flr_instance=%u)\n",
+			  data->vf_id, data->flr_instance))
+		data->result = -1;
+
+	return NULL;
+}
+
+static int execute_parallel_flr_(int pf_fd, int num_vfs,
+				 struct subcheck *checks,
+				 int num_checks, const int wait_flr_ms,
+				 unsigned int num_flrs_per_vf)
+{
+	pthread_t threads[num_vfs * num_flrs_per_vf];
+	struct flr_thread_data thread_data[num_vfs * num_flrs_per_vf];
+	int vf_id = 0, last_vf_id = 0;
+	int i, j, k, created_threads = 0;
+
+	igt_assert(num_flrs_per_vf > 0);
+
+	for (i = 0; i < num_vfs; ++i) {
+		for (j = 0; j < num_flrs_per_vf; ++j) {
+			thread_data[created_threads].pf_fd = pf_fd;
+			thread_data[created_threads].vf_id = i + 1; // VF IDs are 1-based
+			thread_data[created_threads].flr_instance = j;
+			thread_data[created_threads].result = 0;
+
+			if (pthread_create(&threads[created_threads], NULL,
+					   flr_thread,
+					   &thread_data[created_threads])) {
+				last_vf_id = i + 1;
+
+				goto cleanup_threads;
+			} else {
+				created_threads++;
+			}
+		}
+	}
+
+cleanup_threads:
+	pthread_mutex_lock(&signal_mutex);
+	thread_signal = (created_threads == num_vfs * num_flrs_per_vf) ?
+				SIGNAL_START :
+				SIGNAL_SKIP;
+	pthread_cond_broadcast(&signal_cond);
+	pthread_mutex_unlock(&signal_mutex);
+
+	for (i = 0; i < created_threads; ++i)
+		pthread_join(threads[i], NULL);
+
+	if (last_vf_id) {
+		for (k = 0; k < num_checks; ++k)
+			set_skip_reason(checks[k].data,
+					"Thread creation failed for VF%u\n", last_vf_id);
+		return 0;
+	}
+
+	/* Assume FLRs finished after wait_flr_ms */
+	usleep(wait_flr_ms * 1000);
+
+	/* Verify results */
+	for (i = 0; i < created_threads; ++i) {
+		vf_id = thread_data[i].vf_id;
+
+		/* Skip already checked VF or if the FLR initiation failed */
+		if (vf_id == last_vf_id || thread_data[i].result != 0)
+			continue;
+
+		for (k = 0; k < num_checks; ++k)
+			if (subcheck_can_proceed(&checks[k]))
+				checks[k].verify_vf(vf_id, vf_id, checks[k].data);
+
+		if (no_subchecks_can_proceed(checks, num_checks))
+			break;
+
+		last_vf_id = vf_id;
+	}
+
+	return last_vf_id;
+}
+
+static int execute_parallel_flr(int pf_fd, int num_vfs, struct subcheck *checks,
+				int num_checks, const int wait_flr_ms)
+{
+	return execute_parallel_flr_(pf_fd, num_vfs, checks, num_checks,
+				     wait_flr_ms, 1);
 }
 
 #define GEN12_VF_CAP_REG			0x1901f8
@@ -817,7 +970,7 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
 				intel_register_access_fini(&rdata->mmio[i]);
 }
 
-static void clear_tests(int pf_fd, int num_vfs)
+static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 {
 	struct xe_mmio xemmio = { };
 	const unsigned int num_gts = xe_number_gt(pf_fd);
@@ -882,7 +1035,7 @@ static void clear_tests(int pf_fd, int num_vfs)
 	};
 	igt_assert_eq(i, num_checks);
 
-	verify_flr(pf_fd, num_vfs, checks, num_checks);
+	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
 }
 
 igt_main
@@ -899,7 +1052,7 @@ igt_main
 
 	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
 	igt_subtest("flr-vf1-clear") {
-		clear_tests(pf_fd, 1);
+		clear_tests(pf_fd, 1, execute_sequential_flr);
 	}
 
 	igt_describe("Perform sequential FLR on each VF, verifying that LMEM, GGTT, and SCRATCH_REGS are cleared only on the reset VF.");
@@ -908,7 +1061,16 @@ igt_main
 
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

