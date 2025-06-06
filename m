Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546BCC5AD49
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 09:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA4D10EA0C;
	Fri,  6 Jun 2025 09:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXFUo04O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C0B10EA14
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749203170; x=1780739170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DDY6HTf5N0i3lHhrVnYLKLUN/MFf8EvQr5nKVI9m+qQ=;
 b=WXFUo04OCFWL/hoTB0yJofedZoY8LC/I+YQKXJ+IsZmXWnGmqJ3SEI3P
 9RMzSjCzlUeZqCkviKzp9rwGav3OF/dZBxMgZ5CpltXIPXQNc3q1uj9G8
 qbMqZjZykANNuDl1eDjl4k7naVEdwSLw616zqzndJx9/C9SIdwqszPt71
 30LT0UMvZrZAfIVptcU/UDZhDcCkDVcSeyOXHA4dA9ySi7ea2VbdOG881
 thtvvYGNnszzV++EAhN30zyruaAj9kaoHG+0RCvM8Ym8btmyIjHiIOmQ/
 ZgnRojZTDBKGd+s5fqIyLy1f5jUlU9mXlEs7JFDFxliiOt7lKw+9Skb2v A==;
X-CSE-ConnectionGUID: MIgucPf7SqiGfaCTZnTj0Q==
X-CSE-MsgGUID: /K9PxuKARgaEJachTCcEYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62745035"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="62745035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:09 -0700
X-CSE-ConnectionGUID: f2w9PBh1ScOOkda8xvp3UA==
X-CSE-MsgGUID: ocsvqs6MSren9qe4BqKDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="182974799"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:46:07 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t v3 1/5] tests/intel/xe_pmu: Validate engine activity on
 gt reset
Date: Fri,  6 Jun 2025 15:40:04 +0530
Message-ID: <20250606101008.1949955-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250606101008.1949955-1-riana.tauro@intel.com>
References: <20250606101008.1949955-1-riana.tauro@intel.com>
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

Add a test to validate engine activity is idle/showing load after gt reset.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 47 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 02f23bd7d..d9b0d2c96 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -40,6 +40,12 @@
  * Description: Test to validate engine activity by running workload on all engines
  *		simultaneously and trailing idle
  *
+ * SUBTEST: engine-activity-gt-reset-idle
+ * Description: Test to validate engine activity is idle after gt reset
+ *
+ * SUBTEST: engine-activity-gt-reset
+ * Description: Test to validate engine activity on all engines before and after gt reset
+ *
  * SUBTEST: engine-activity-most-load
  * Description: Test to validate engine activity by running workload on all engines except one
  *
@@ -75,6 +81,7 @@
 #define TEST_LOAD		BIT(0)
 #define TEST_TRAILING_IDLE	BIT(1)
 #define TEST_IDLE		BIT(2)
+#define TEST_GT_RESET		BIT(3)
 
 const double tolerance = 0.1;
 static char xe_device[NAME_MAX];
@@ -238,7 +245,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 		end_cork(fd, cork);
 	pmu_read_multi(pmu_fd[0], 2, after);
 
-	end_cork(fd, cork);
+	if (flags & TEST_GT_RESET)
+		xe_force_gt_reset_sync(fd, eci->gt_id);
+	else
+		end_cork(fd, cork);
 
 	engine_active_ticks = after[0] - before[0];
 	engine_total_ticks = after[1] - before[1];
@@ -248,6 +258,24 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
 		  engine_total_ticks);
 
+	if (flags & TEST_LOAD)
+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+	else
+		igt_assert(!engine_active_ticks);
+
+	if (flags & TEST_GT_RESET) {
+		pmu_read_multi(pmu_fd[0], 2, before);
+		usleep(SLEEP_DURATION * USEC_PER_SEC);
+		pmu_read_multi(pmu_fd[0], 2, after);
+
+		engine_active_ticks = after[0] - before[0];
+
+		igt_debug("Engine active ticks after gt reset:  after %ld, before %ld delta %ld\n",
+			  after[0], before[0], engine_active_ticks);
+
+		igt_assert(!engine_active_ticks);
+	}
+
 	if (cork)
 		xe_cork_destroy(fd, cork);
 
@@ -255,11 +283,6 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 
 	close(pmu_fd[0]);
 	close(pmu_fd[1]);
-
-	if (flags & TEST_LOAD)
-		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
-	else
-		igt_assert(!engine_active_ticks);
 }
 
 static void engine_activity_load_single(int fd, int num_engines,
@@ -812,6 +835,18 @@ igt_main
 	igt_subtest("engine-activity-all-load-idle")
 		engine_activity_load_all(fd, num_engines, TEST_LOAD | TEST_TRAILING_IDLE);
 
+	igt_describe("Validate engine activity is idle after gt reset");
+	test_each_engine("engine-activity-gt-reset-idle", fd, eci)
+		engine_activity(fd, eci, TEST_LOAD | TEST_GT_RESET);
+
+	igt_describe("Validate engine activity before and after gt reset");
+	igt_subtest("engine-activity-gt-reset") {
+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
+		xe_for_each_gt(fd, gt)
+			xe_force_gt_reset_sync(fd, gt);
+		engine_activity_load_all(fd, num_engines, TEST_LOAD);
+	}
+
 	igt_subtest_group {
 		unsigned int num_fns;
 
-- 
2.47.1

