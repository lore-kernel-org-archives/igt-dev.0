Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3FAC021AA
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 13:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED8910E4E3;
	Mon, 17 Feb 2025 13:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ln4v+ic9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BB110E4CD
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739800779; x=1771336779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UPt0hBDoZQ6n6gb1Y2GdYPJsuWN2DC/VE4qaBrcs+cQ=;
 b=ln4v+ic99z8Y3PWSN00X+ySzHRrmM1a3eC989sE2h+fmu2VGGsCbW22j
 n2xjQkyBdXnPFHCrVo+RH7kyM/RiiwXln7Dv+yp5RU0fqDk/nTBkl4isk
 GLHI7BTyjsJaGu1dhRQVJ1xQPPb+GMG54ljCe/r98cFnYWj0bKCntlJgN
 JbhFblqVYTac2ii7CBF58ZcweLAtY/m6tnOzPMmHC+1Ev5sE54cLWDPDq
 1gFtIQojJf0em+ZmYcfZn8zaeD4SmfnkMKGxT8fNwnRhZv4CRHF/CAqVY
 rrl9KM9IUvbxENF36cWJGaMF8UbnJ+Eo+Wydekb280kHoECysbHo5GTep w==;
X-CSE-ConnectionGUID: UpeY6ZObRZS4iHR4uWbyXA==
X-CSE-MsgGUID: 5j2wvDqLTVqYXGg9Hz4xDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65836666"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="65836666"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:59:38 -0800
X-CSE-ConnectionGUID: qdfLu9XmQeahasPnjkafFA==
X-CSE-MsgGUID: 2QPhPjPdSJqPVGQLXNP3Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="119128090"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:59:36 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 kamil.konieczny@linux.intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 3/3] tests/intel/xe_pmu: Add idle engine activity
 tests
Date: Mon, 17 Feb 2025 19:50:18 +0530
Message-ID: <20250217142021.951467-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250217142021.951467-1-riana.tauro@intel.com>
References: <20250217142021.951467-1-riana.tauro@intel.com>
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
---
 tests/intel/xe_pmu.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index aa7d53523..5d2178b62 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -11,6 +11,12 @@
  * Sub-category: Telemetry
  * Test category: Functional tests
  *
+ * SUBTEST: engine-activity-idle
+ * Description: Test to validate engine activity shows no load when idle
+ *
+ * SUBTEST: engine-activity-load-idle
+ * Description: Test to validate engine activity with full load followed by trailing idle
+ *
  * SUBTEST: engine-activity-load
  * Description: Test to validate engine activity stats by running a workload and
  *              reading engine active ticks and engine total ticks PMU counters
@@ -24,6 +30,10 @@
 #define SLEEP_DURATION 2 /* in seconds */
 const double tolerance = 0.1;
 
+/* flag masks */
+#define TEST_LOAD		BIT(0)
+#define TEST_TRAILING_IDLE	BIT(1)
+
 #define assert_within_epsilon(x, ref, tolerance) \
 	igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
 		     (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
@@ -95,7 +105,7 @@ static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_c
 	return pmu_config;
 }
 
-static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
 	struct xe_cork *cork = NULL;
@@ -109,14 +119,20 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
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
@@ -134,7 +150,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
 	close(pmu_fd[0]);
 	close(pmu_fd[1]);
 
-	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+	if (flags & TEST_LOAD)
+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+	else
+		igt_assert(!engine_active_ticks);
 }
 
 igt_main
@@ -146,9 +165,18 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
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
+
 
 	igt_fixture {
 		close(fd);
-- 
2.47.1

