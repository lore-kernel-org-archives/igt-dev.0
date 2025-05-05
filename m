Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228D8C3ABB6
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 10:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AED10E3C6;
	Mon,  5 May 2025 10:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMsMAbdY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3120510E3C6
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746439609; x=1777975609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MJzXYSpUMMmqVTZRiVoBh5T3lt1PGJH1gT+55DUciSI=;
 b=NMsMAbdY13rACOupcjnHn0GvdpRW3BgbYKDyZx4nd5arOIPdPsvpJ0SX
 Jf6OB30HdUpgX7IhU8s8wHUCUJiHRadod1T83fa+ympM/6y4IBhnaGNtd
 Rip0WhyPD5/f239+jGyKSpnL74AsOSQwpASnjMaHsLddiUkg0utsyzC/E
 ncBvfazaTlzZNVZEN6aYHnVrQPw/1FFxw2bqppvN1iDXcSUWSPlwOJ4CI
 sxsHW+pZM4aG/jz/rdx5iqdzf1UoUBufrRplOBGsGMhWpgCavpqHimLwM
 Bxv/HeNUFCp1UjmETh1QS1HMMn6MTnX/9zLiPYcfwU03AggLITwEOv7Ml w==;
X-CSE-ConnectionGUID: kYXcj09dQ9GVJb5ZnMUCQQ==
X-CSE-MsgGUID: jy5QP8j+RymuwceW+g2HmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47947382"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="47947382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:49 -0700
X-CSE-ConnectionGUID: s0FDQLcuQJqhvY3bsDEoJg==
X-CSE-MsgGUID: STpXUGLtSy63vsAoh5nztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="172437792"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:46 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t 4/5] tests/intel/xe_pmu: Add tests to validate engine
 activity on all engines
Date: Mon,  5 May 2025 15:59:45 +0530
Message-ID: <20250505102946.159655-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250505102946.159655-1-riana.tauro@intel.com>
References: <20250505102946.159655-1-riana.tauro@intel.com>
MIME-Version: 1.0
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

Add tests to validate engine activity by running workload on
all engines simultaneously.

Also add trailing idle test.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 777d20e7f..fe42eead0 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -32,6 +32,14 @@
  * Description: Test to validate engine activity by running workload and trailing idle on one engine
  *		and check if all other engines are idle
  *
+ * SUBTEST: engine-activity-all-load
+ * Description: Test to validate engine activity by running workload on all engines
+ *		simultaneously
+ *
+ * SUBTEST: engine-activity-all-load-idle
+ * Description: Test to validate engine activity by running workload on all engines
+ *		simultaneously and trailing idle
+ *
  * SUBTEST: all-fn-engine-activity-load
  * Description: Test to validate engine activity by running load on all functions simultaneously
  *
@@ -317,6 +325,55 @@ static void engine_activity_load_single(int fd, int num_engines,
 	log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
 }
 
+static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
+{
+	uint64_t config, before[2 * num_engines], after[2 * num_engines];
+	struct drm_xe_engine_class_instance *eci;
+	struct xe_cork *cork[num_engines];
+	int idx = 0, engine_idx = 0;
+	int pmu_fd[2 * num_engines];
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	vm = xe_vm_create(fd, 0, 0);
+
+	xe_for_each_engine(fd, eci) {
+		engine_idx = idx >> 1;
+
+		config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		if (flags & TEST_LOAD) {
+			cork[engine_idx] = xe_cork_create_opts(fd, eci, vm, 1, 1);
+			xe_cork_sync_start(fd, cork[engine_idx]);
+		}
+	}
+
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	if (flags & TEST_TRAILING_IDLE) {
+		for (idx = 0; idx < num_engines; idx++)
+			xe_cork_sync_end(fd, cork[idx]);
+	}
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	for (idx = 0; idx < num_engines; idx += 2) {
+		engine_idx = idx >> 1;
+		if (flags & TEST_LOAD)
+			check_and_end_cork(fd, cork[engine_idx]);
+		xe_cork_destroy(fd, cork[engine_idx]);
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+	}
+
+	xe_vm_destroy(fd, vm);
+
+	log_all_engines(num_engines, -1, TEST_LOAD, before, after);
+}
+
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks;
@@ -681,6 +738,14 @@ igt_main
 	test_each_engine("engine-activity-single-load-idle", fd, eci)
 		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
 
+	igt_describe("Validate engine activity by loading all engines simultaenously");
+	igt_subtest("engine-activity-all-load")
+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
+
+	igt_describe("Validate engine activity by loading all engines simultaenously and trailing idle");
+	igt_subtest("engine-activity-all-load-idle")
+		engine_activity_load_all(fd, num_engines, TEST_LOAD | TEST_TRAILING_IDLE);
+
 	igt_subtest_group {
 		unsigned int num_fns;
 
-- 
2.47.1

