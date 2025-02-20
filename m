Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52402C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 11:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F46610E944;
	Thu, 20 Feb 2025 11:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F23SvZnm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E2B10E93E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 11:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740049508; x=1771585508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RXveuHNPkvb6nfV1buP9SKNKnc3qH8XeKyjm/xdSfG0=;
 b=F23SvZnmMOmg3aKL2A2x7t4566osqdV5WM2AZq7NI88matCY4IDzjW7/
 Nu3JNtPTVhYQQ8cUE7NrZRJNCwf/T/fcmzX0YquLTgVuxxR+Zb/AvlzOp
 ugCe3pTVvTqXpOPsu2cIdCZRFPXTjIghPvCfbI5VnA/vhZEoYHrITG1TT
 Xir6oiVXGxdDNyeDk9VngwmXFt6kweZwSd5xxGHSaMwsv4soExpuObrfK
 aRV2YgIHBtMxw0pNDsniLVVPdhhJbOjsEFNnsB2SWU0309txtE2UKDPT9
 AbaiYPCoyBJ1+z6Vzhm5nnQhD4iyfCKdQ7mCfYQFqbzRQPxOdchhRjS9u g==;
X-CSE-ConnectionGUID: kTkphUEpTZ2BTvz2jyvwEQ==
X-CSE-MsgGUID: F4I/wm5rT72OdmpZPrxg2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41079323"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="41079323"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:05:08 -0800
X-CSE-ConnectionGUID: rT6kA0LQRW61/SMJ5wk3Ww==
X-CSE-MsgGUID: a82KjUcJRFSfthxWJZfLOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115904456"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:05:05 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add PMU test to validate
 engine activity stats
Date: Thu, 20 Feb 2025 16:55:55 +0530
Message-ID: <20250220112556.1585555-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220112556.1585555-1-riana.tauro@intel.com>
References: <20250220112556.1585555-1-riana.tauro@intel.com>
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

Add a test to validate engine activity by reading PMU counters
(engine-active-ticks, engine-total-ticks) when running
workload on every engine

v2: rename busy to active
    add assert to format events (Umesh)
    add a helper macro

v3: initialize config (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 130 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 110 insertions(+), 20 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index d408d0f99..692cc986f 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -12,24 +12,23 @@
  * Test category: Functional tests
  */
 
-#include <fcntl.h>
-#include <limits.h>
-#include <time.h>
-#include <errno.h>
-#include <dirent.h>
-#include <string.h>
-#include <sys/time.h>
-
 #include "igt.h"
-#include "igt_device.h"
 #include "igt_perf.h"
 #include "igt_sysfs.h"
 
 #include "xe/xe_gt.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_spin.h"
 
 #define SLEEP_DURATION 2 /* in seconds */
 const double tolerance = 0.1;
 
+#define test_each_engine(test, fd, hwe) \
+	igt_subtest_with_dynamic(test) \
+		xe_for_each_engine(fd, hwe) \
+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
+				      hwe->engine_instance)
+
 static int open_pmu(int xe, uint64_t config)
 {
 	int fd;
@@ -41,6 +40,17 @@ static int open_pmu(int xe, uint64_t config)
 	return fd;
 }
 
+static int open_group(int xe, uint64_t config, int group)
+{
+	int fd;
+
+	fd = igt_perf_open_group(xe_perf_type_id(xe), config, group);
+	igt_skip_on(fd < 0 && errno == ENODEV);
+	igt_assert(fd >= 0);
+
+	return fd;
+}
+
 static uint64_t __pmu_read_single(int fd, uint64_t *ts)
 {
 	uint64_t data[2];
@@ -52,6 +62,19 @@ static uint64_t __pmu_read_single(int fd, uint64_t *ts)
 	return data[0];
 }
 
+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+{
+	uint64_t buf[2 + num];
+	unsigned int i;
+
+	igt_assert_eq(read(fd, buf, sizeof(buf)), sizeof(buf));
+
+	for (i = 0; i < num; i++)
+		val[i] = buf[2 + i];
+
+	return buf[1];
+}
+
 static unsigned long read_idle_residency(int fd, int gt)
 {
 	unsigned long residency = 0;
@@ -65,23 +88,86 @@ static unsigned long read_idle_residency(int fd, int gt)
 	return residency;
 }
 
-static uint64_t get_event_config(int xe, unsigned int gt, char *event)
+static uint64_t add_format_config(const char *xe_device, const char *format, uint64_t val)
 {
 	int ret;
-	char xe_device[100];
-	uint64_t pmu_config;
 	uint32_t shift;
+	uint64_t config;
+
+	ret = perf_event_format(xe_device, format, &shift);
+	igt_assert(ret >= 0);
+	config = val << shift;
+
+	return config;
+}
+
+static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
+				 const char *event)
+{
+	char xe_device[100];
+	uint64_t pmu_config = 0;
+	int ret;
 
 	xe_perf_device(xe, xe_device, sizeof(xe_device));
 	ret = perf_event_config(xe_device, event, &pmu_config);
 	igt_assert(ret >= 0);
-	ret = perf_event_format(xe_device, "gt", &shift);
-	igt_assert(ret >= 0);
-	pmu_config |= (uint64_t)gt << shift;
+	pmu_config |= add_format_config(xe_device, "gt", gt);
+
+	if (eci) {
+		pmu_config |= add_format_config(xe_device, "engine_class", eci->engine_class);
+		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
+	}
 
 	return pmu_config;
 }
 
+/**
+ * SUBTEST: engine-activity-load
+ * Description: Test to validate engine activity stats by running a workload and
+ *              reading engine active ticks and engine total ticks PMU counters
+ */
+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
+	struct xe_cork *cork = NULL;
+	uint32_t vm;
+	int pmu_fd[2];
+
+	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
+	pmu_fd[0] = open_group(fd, config, -1);
+
+	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
+
+	vm = xe_vm_create(fd, 0, 0);
+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
+	xe_cork_sync_start(fd, cork);
+
+	pmu_read_multi(pmu_fd[0], 2, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	pmu_read_multi(pmu_fd[0], 2, after);
+
+	xe_cork_sync_end(fd, cork);
+
+	engine_active_ticks = after[0] - before[0];
+	engine_total_ticks = after[1] - before[1];
+
+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
+		  engine_active_ticks);
+	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
+		  engine_total_ticks);
+
+	if (cork)
+		xe_cork_destroy(fd, cork);
+
+	xe_vm_destroy(fd, vm);
+
+	close(pmu_fd[0]);
+	close(pmu_fd[1]);
+
+	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+}
+
 /**
  * SUBTEST: gt-c6-idle
  * Description: Basic residency test to validate idle residency
@@ -91,14 +177,12 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 {
 	int pmu_fd;
 	uint64_t pmu_config;
-	char event[100];
 	uint64_t ts[2];
 	unsigned long slept, start, end;
 	uint64_t val;
 
 	/* Get the PMU config for the gt-c6 event */
-	sprintf(event, "gt-c6-residency");
-	pmu_config = get_event_config(xe, gt, event);
+	pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
@@ -125,16 +209,22 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 igt_main
 {
 	int fd, gt;
+	struct drm_xe_engine_class_instance *eci;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
 	}
 
 	igt_describe("Validate PMU gt-c6 residency counters when idle");
-	igt_subtest("gt-c6-idle")
+	igt_subtest("gt-c6-idle") {
+		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
 		xe_for_each_gt(fd, gt)
 			test_gt_c6_idle(fd, gt);
+	}
+
+	igt_describe("Validate engine activity with workload");
+	test_each_engine("engine-activity-load", fd, eci)
+		engine_activity(fd, eci);
 
 	igt_fixture {
 		close(fd);
-- 
2.47.1

