Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E68C3ABB0
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 10:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B4210E04E;
	Mon,  5 May 2025 10:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEUpq4JL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AD610E2D6
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746439612; x=1777975612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UggGTobD1Ze2jD/rv5b12doEGhMUuz0R8kRmniViaBo=;
 b=OEUpq4JLFykqRKphY5jPsK+jySgsX3X3WU7CSrjogIVXmjuW2B1xXWIL
 7O6wEI/v6OLaAbDWHuwnYbA4pDzDTGRDH5w3XU3GtL7LvmCio2665OOpp
 2PRnWK6an3hxh73sGNiUjTuElzZHHLxTmf9cSR8krlChOJb2f4QexCMeA
 KOYjkcLBZZYRHxRj1EeIqQrSwm0z5iC9Byd9ovaACla3g04NqH+iWxPA1
 mzRSWs76aJVziwCf5bBtFrbt8mj6DxFIwNYZ9ZFH6o81rFlbOVAs09rsM
 W83xoN5sBUnX5We6d6IGsmbRjHkACOq1nlrEc3ck3QXjnSokgNkQEYmgB Q==;
X-CSE-ConnectionGUID: T/k+bIaJTUyugcYgysG8tA==
X-CSE-MsgGUID: Tvkd5ucGSduE8mIMqv54jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47947387"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="47947387"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:52 -0700
X-CSE-ConnectionGUID: l0C1Z0D7RAuNTNv1WxxMlg==
X-CSE-MsgGUID: /tK0g7oLRwWCy16iA5oGxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="172437799"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:49 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t 5/5] test/intel/xe_pmu: Add tests to validate engine
 activity by loading most engines
Date: Mon,  5 May 2025 15:59:46 +0530
Message-ID: <20250505102946.159655-6-riana.tauro@intel.com>
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

Add a test to validate engine activity by running load on all
engines except one.

Also add a trailing idle test.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 70 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fe42eead0..a39b53af4 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -40,6 +40,13 @@
  * Description: Test to validate engine activity by running workload on all engines
  *		simultaneously and trailing idle
  *
+ * SUBTEST: engine-activity-most-load
+ * Description: Test to validate engine activity by running workload on all engines except one
+ *
+ * SUBTEST: engine-activity-most-load-idle
+ * Description: Test to validate engine activity by running workload and trailing idle on all engines
+ * 		except one
+ *
  * SUBTEST: all-fn-engine-activity-load
  * Description: Test to validate engine activity by running load on all functions simultaneously
  *
@@ -325,6 +332,61 @@ static void engine_activity_load_single(int fd, int num_engines,
 	log_all_engines(num_engines, busy_idx, TEST_IDLE, before, after);
 }
 
+static void engine_activity_load_most(int fd, int num_engines, struct drm_xe_engine_class_instance *eci,
+				      unsigned int flags)
+{
+	uint64_t config, before[2 * num_engines], after[2 * num_engines];
+	struct drm_xe_engine_class_instance *eci_;
+	struct xe_cork *cork[num_engines];
+	int pmu_fd[num_engines * 2];
+	int idx = 0, idle_idx = 0, engine_idx = 0;
+	uint32_t vm;
+
+	pmu_fd[0] = -1;
+	vm = xe_vm_create(fd, 0, 0);
+	xe_for_each_engine(fd, eci_) {
+		engine_idx = idx >> 1;
+
+		if (eci_->engine_class == eci->engine_class &&
+		    eci_->engine_instance == eci->engine_instance) {
+			idle_idx = engine_idx;
+			cork[engine_idx] = NULL;
+		} else {
+			cork[engine_idx] = xe_cork_create_opts(fd, eci_, vm, 1, 1);
+			xe_cork_sync_start(fd, cork[engine_idx]);
+		}
+
+		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+
+		config = get_event_config(eci_->gt_id, eci_, "engine-total-ticks");
+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
+	}
+
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	if (flags & TEST_TRAILING_IDLE) {
+		for (idx = 0; idx < num_engines; idx++)
+			check_and_end_cork(fd, cork[engine_idx]);
+	}
+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
+
+	for (idx = 0; idx < num_engines * 2; idx += 2) {
+		engine_idx = idx >> 1;
+
+		if (flags & TEST_LOAD)
+			check_and_end_cork(fd, cork[engine_idx]);
+		if (cork[engine_idx])
+			xe_cork_destroy(fd, cork[engine_idx]);
+		close(pmu_fd[idx]);
+		close(pmu_fd[idx + 1]);
+	}
+
+	xe_vm_destroy(fd, vm);
+
+	log_all_engines(num_engines, idle_idx, TEST_LOAD, before, after);
+}
+
 static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
 {
 	uint64_t config, before[2 * num_engines], after[2 * num_engines];
@@ -738,6 +800,14 @@ igt_main
 	test_each_engine("engine-activity-single-load-idle", fd, eci)
 		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
 
+	igt_describe("Validate engine activity when all except one engine is loaded");
+	test_each_engine("engine-activity-most-load", fd, eci)
+		engine_activity_load_most(fd, num_engines, eci, TEST_LOAD);
+
+	igt_describe("Validate engine activity when all except one engine is loaded and trailing idle");
+	test_each_engine("engine-activity-most-load-idle", fd, eci)
+		engine_activity_load_most(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
+
 	igt_describe("Validate engine activity by loading all engines simultaenously");
 	igt_subtest("engine-activity-all-load")
 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
-- 
2.47.1

