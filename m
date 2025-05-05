Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C69C3ABB0
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 10:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7854B10E3B4;
	Mon,  5 May 2025 10:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+Xn9c6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB2110E3B4
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 10:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746439606; x=1777975606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7LjgxbVmVFt4US1LAxa40+4cKEycM819spdB4HJ1vI=;
 b=B+Xn9c6ot7NrG/U06DvnNrnlYrtdiGElJlseOBKG6zYRdbfqLxbjUWBb
 IQhXTkKFSeZ4MaykjWXC5LgkTN7xqt3SdOWTbJvMTztZlu1YCuVoFeyRx
 Cq8n+CzHulL18Xvz+ve7lyUkcSIrhQ/RUw1UXCUeCYPmnSP4AoPBE5Yft
 Kn/cvgDr/+h9s3CmjmFFA6rQpp/drVPl79HdZGWaEh+woVc/8KoPyXrru
 9+5u+aLYNzfQemgmcJv2h2V7EMm4z2hf685sdFRO8U6u1st4iBTFpsM1T
 aJk/RQjGLwH2p9xNbgpKAYgLQNo4terZqeiNEN5Bgm7v50aBFqRKwJ+s7 g==;
X-CSE-ConnectionGUID: i5F7psybR9iGaSUH3eMCKg==
X-CSE-MsgGUID: 7jzul3IhQOW2lK6QrNas0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47947367"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="47947367"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:43 -0700
X-CSE-ConnectionGUID: 4gbUY8aWQ5+TCqHmvjx0HQ==
X-CSE-MsgGUID: dbcQtOjYQRmg1VzoTZxxAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="172437778"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:06:40 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t 2/5] tests/intel/xe_pmu: move descriptions of tests to
 the top of file
Date: Mon,  5 May 2025 15:59:43 +0530
Message-ID: <20250505102946.159655-3-riana.tauro@intel.com>
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

Move descriptions to the top of the file so they are in
a single place

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 58 +++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 03a966708..1ad927822 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -10,6 +10,31 @@
  * Mega feature: Performance Monitoring Unit
  * Sub-category: Telemetry
  * Test category: Functional tests
+ *
+ * SUBTEST: gt-c6-idle
+ * Description: Basic residency test to validate idle residency
+ *		measured over a time interval is within the tolerance
+ *
+ * SUBTEST: engine-activity-idle
+ * Description: Test to validate engine activity shows no load when idle
+ *
+ * SUBTEST: engine-activity-load-idle
+ * Description: Test to validate engine activity with full load and trailing idle
+ *
+ * SUBTEST: engine-activity-load
+ * Description: Test to validate engine activity stats by running a workload
+ *
+ * SUBTEST: all-fn-engine-activity-load
+ * Description: Test to validate engine activity by running load on all functions simultaneously
+ *
+ * SUBTEST: fn-engine-activity-load
+ * Description: Test to validate engine activity by running load on a function
+ *
+ * SUBTEST: fn-engine-activity-sched-if-idle
+ * Description: Test to validate engine activity by running load on a function
+ *
+ * SUBTEST: gt-frequency
+ * Description: Validate we can collect accurate frequency PMU stats while running a workload.
  */
 
 #include "igt.h"
@@ -140,18 +165,6 @@ static void check_and_end_cork(int fd, struct xe_cork *cork)
 		xe_cork_sync_end(fd, cork);
 }
 
-/**
- * SUBTEST: engine-activity-idle
- * Description: Test to validate engine activity shows no load when idle
- *
- * SUBTEST: engine-activity-load-idle
- * Description: Test to validate engine activity with full load followed by
- *		trailing idle
- *
- * SUBTEST: engine-activity-load
- * Description: Test to validate engine activity stats by running a workload and
- *              reading engine active ticks and engine total ticks PMU counters
- */
 static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
@@ -203,10 +216,6 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 		igt_assert(!engine_active_ticks);
 }
 
-/**
- * SUBTEST: all-fn-engine-activity-load
- * Description: Test to validate engine activity by running load on all functions simultaneously
- */
 static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks;
@@ -274,13 +283,6 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
 	}
 }
 
-/**
- * SUBTEST: fn-engine-activity-load
- * Description: Test to validate engine activity by running load on a function
- *
- * SUBTEST: fn-engine-activity-sched-if-idle
- * Description: Test to validate engine activity by running load on a function
- */
 static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
@@ -344,11 +346,6 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
 		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
 }
 
-/**
- * SUBTEST: gt-c6-idle
- * Description: Basic residency test to validate idle residency
- *		measured over a time interval is within the tolerance
- */
 static void test_gt_c6_idle(int xe, unsigned int gt)
 {
 	int pmu_fd;
@@ -382,11 +379,6 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 	close(pmu_fd);
 }
 
-/**
- * SUBTEST: gt-frequency
- * Description: Validate we can collect accurate frequency PMU stats
- *		while running a workload.
- */
 static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	struct xe_cork *cork = NULL;
-- 
2.47.1

