Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFBDC02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 07:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E5610E4E1;
	Wed, 15 Jan 2025 07:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LsqLluc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A6810E4E2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 07:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736925058; x=1768461058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rqMCNiOdhdQCDVBt8+iU4InEf2UnSRvRo6B9TNjq4oI=;
 b=LsqLluc5tluIBo2LKo07zXMcp0HYsafrA+s1HSVISJspa6qvpS1WrRB5
 IbASAposv2KXpyxpM4V1gHIV93tgpGszPW+iMBPxoFdJRzGVJtrmXfpch
 PnNTCfhoYJC9eQ2iz7LvYbH1Q6yY2BmrmVdPmd39/z2hRYKyjgtARMdOE
 3ck+T9DHsR1wBXQkudcmG5FT2S48a9xm5nVyLz87f41xoQ91O9WPImTd5
 VJkbmPEcmbINLbCh6f47wRKm4gv8WpMeQodiUzBFI+3gzf7tz8DhskAOt
 KG8zD7ERVq0pWZXMW+kbmnRHZZHTaIIsuC6wWHna0LjnE/ajicJxfqc5F A==;
X-CSE-ConnectionGUID: aPNJ5i3CSJ2ZJsUzYFrYNA==
X-CSE-MsgGUID: iJD4b+nIRnW/85zPzO9J3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40927166"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="40927166"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 23:10:51 -0800
X-CSE-ConnectionGUID: Svr6al56TgiWp+c1ZGtrJQ==
X-CSE-MsgGUID: jKFF3FaqRnu6TlSLCFnUww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="104881272"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 23:10:49 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pmu: Add test for per-engine-class
 activity
Date: Wed, 15 Jan 2025 13:00:40 +0530
Message-ID: <20250115073040.1852977-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115073040.1852977-1-riana.tauro@intel.com>
References: <20250115073040.1852977-1-riana.tauro@intel.com>
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

Add basic test to validate per-engine-class activity for
all engines

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 55 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 1f88e2560..de31e4dc1 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -35,7 +35,7 @@
 
 #define SLEEP_DURATION 2 /* in seconds */
 const double tolerance = 0.1;
-const unsigned long batch_duration_ns = 500e6;
+const unsigned long batch_duration_ns = 2000e6;
 const char *no_debug_data = "\0";
 
 #define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
@@ -308,6 +308,52 @@ static void end_workload(int fd, struct workload *wl)
 	xe_vm_destroy(fd, wl->vm);
 }
 
+/**
+ * SUBTEST: per-engine-class-activity
+ * Description: Test to validate engine busyness by running a workload and
+ *              reading the busy ticks and total ticks counters
+ */
+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t config, engine_class, engine_instance, gt_shift, param_config;
+	uint64_t busy_ticks, total_ticks, before[2], after[2];
+	struct workload wl;
+	int pmu_fd[2];
+
+	gt_shift = pmu_format_shift(fd, "gt_id");
+	engine_class = pmu_format_shift(fd, "engine_class");
+	engine_instance = pmu_format_shift(fd, "engine_instance");
+
+	param_config = (uint64_t)eci->gt_id << gt_shift | eci->engine_class << engine_class
+			| eci->engine_instance << engine_instance;
+	config = xe_perf_event_config(fd, "engine-active-ticks") | param_config;
+	pmu_fd[0] = open_group(fd, config, -1);
+
+	config = xe_perf_event_config(fd, "total-ticks") | param_config;
+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
+
+	run_workload(fd, eci->gt_id, eci, &wl);
+
+	pmu_read_multi(pmu_fd[0], 2, before);
+	measured_usleep(batch_duration_ns / 1000);
+	pmu_read_multi(pmu_fd[0], 2, after);
+
+	end_workload(fd, &wl);
+
+	busy_ticks = after[0] - before[0];
+	total_ticks = after[1] - before[1];
+
+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
+		  busy_ticks);
+	igt_debug("Total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
+		  total_ticks);
+
+	close(pmu_fd[0]);
+	close(pmu_fd[1]);
+
+	assert_within_epsilon(busy_ticks, total_ticks, tolerance);
+}
+
 static void test_frequency(int fd, int gt, struct drm_xe_engine_class_instance *eci)
 {
 	struct workload wl;
@@ -399,6 +445,13 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_frequency(fd, hwe->gt_id, hwe);
 
+	igt_describe("Validate per-engine-activity with workload running by reading pmu counters");
+	igt_subtest_with_dynamic("per-engine-class-activity")
+		xe_for_each_engine(fd, hwe)
+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),
+				      hwe->engine_instance)
+				engine_activity(fd, hwe);
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.47.1

