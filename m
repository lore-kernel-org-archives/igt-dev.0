Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FEFC021B8
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 06:52:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D8810E58C;
	Tue, 25 Feb 2025 06:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maEVMVsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6897E10E590
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 06:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740466334; x=1772002334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F928U0NTfShk3ugKUljlQ7lIkXyOM5es+CjGdg/PkmI=;
 b=maEVMVsl927K4ro59MPcVp5nuJXxI4OKoc3PUnLsjU9+VLxiLWeD1XWg
 lvE44CROAUuxc9dSQhMCh4BqrvbpBuxOdlJiWxNOYysI3zUPoIs7HxKbz
 deIX35Oo1Bu5GlarGU/qeIqubRyBYXYsWEGxxQSDPPyKKSYgVJZXqyFvc
 HrmgZEzd5gTeCZT4/Duap6yiPhJx3fZjVKZCU8NiaJ+TtNrWsOjJH07gk
 lxvJjLN2TInATqbNBBcUEXlTDpwHsb6tUYNcO2uqFMUgWjEQCm5rxO14R
 MYu6V9IhdH+RLlrFuw7qNVuFBw+AcpRUrPiD9O6bFir18f1uOGfFnTBQU w==;
X-CSE-ConnectionGUID: ZRj33+OGRRCQFlej6tXd1g==
X-CSE-MsgGUID: oAIHydXFQ/6fZjKJ9blzHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40442898"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40442898"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 22:52:14 -0800
X-CSE-ConnectionGUID: lrcNoxiZSnuRVC7PdQ6qUg==
X-CSE-MsgGUID: yPK42nqDRiKEp+RPEvx/Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120399757"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 22:52:13 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com
Subject: [PATCH i-g-t v4 3/3] tests/intel/xe_pmu: Add idle engine activity
 tests
Date: Tue, 25 Feb 2025 12:43:11 +0530
Message-ID: <20250225071311.2333393-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225071311.2333393-1-riana.tauro@intel.com>
References: <20250225071311.2333393-1-riana.tauro@intel.com>
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

Add two tests to validate engine activity counters
(engine-active-ticks, engine-total-ticks) when idle and
trailing idle (workload is ended before reading counters)

v2: add trailing idle test
    rename busy to load (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 692cc986f..4584fc7d3 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -21,6 +21,10 @@
 #include "xe/xe_spin.h"
 
 #define SLEEP_DURATION 2 /* in seconds */
+/* flag masks */
+#define TEST_LOAD		BIT(0)
+#define TEST_TRAILING_IDLE	BIT(1)
+
 const double tolerance = 0.1;
 
 #define test_each_engine(test, fd, hwe) \
@@ -122,11 +126,17 @@ static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_c
 }
 
 /**
+ * SUBTEST: engine-activity-idle
+ * Description: Test to validate engine activity shows no load when idle
+ *
+ * SUBTEST: engine-activity-load-idle
+ * Description: Test to validate engine activity with full load followed by trailing idle
+ *
  * SUBTEST: engine-activity-load
  * Description: Test to validate engine activity stats by running a workload and
  *              reading engine active ticks and engine total ticks PMU counters
  */
-static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
 	struct xe_cork *cork = NULL;
@@ -140,14 +150,20 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
 
 	vm = xe_vm_create(fd, 0, 0);
-	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
-	xe_cork_sync_start(fd, cork);
+
+	if (flags & TEST_LOAD) {
+		cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
+		xe_cork_sync_start(fd, cork);
+	}
 
 	pmu_read_multi(pmu_fd[0], 2, before);
 	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	if (flags & TEST_TRAILING_IDLE)
+		xe_cork_sync_end(fd, cork);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	xe_cork_sync_end(fd, cork);
+	if ((flags & TEST_LOAD) && !cork->ended)
+		xe_cork_sync_end(fd, cork);
 
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
@@ -165,7 +181,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
 	close(pmu_fd[0]);
 	close(pmu_fd[1]);
 
-	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+	if (flags & TEST_LOAD)
+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+	else
+		igt_assert(!engine_active_ticks);
 }
 
 /**
@@ -222,9 +241,17 @@ igt_main
 			test_gt_c6_idle(fd, gt);
 	}
 
+	igt_describe("Validate there is no engine activity when idle");
+	test_each_engine("engine-activity-idle", fd, eci)
+		engine_activity(fd, eci, 0);
+
+	igt_describe("Validate engine activity with load and trailing idle");
+	test_each_engine("engine-activity-load-idle", fd, eci)
+		engine_activity(fd, eci, TEST_LOAD | TEST_TRAILING_IDLE);
+
 	igt_describe("Validate engine activity with workload");
 	test_each_engine("engine-activity-load", fd, eci)
-		engine_activity(fd, eci);
+		engine_activity(fd, eci, TEST_LOAD);
 
 	igt_fixture {
 		close(fd);
-- 
2.47.1

