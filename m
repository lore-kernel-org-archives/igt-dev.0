Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F466C28B2E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 06:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0390A10E6D3;
	Wed, 12 Mar 2025 06:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8WHDG5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACC610E6D3
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 06:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741759398; x=1773295398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xwkhEuqKvULgQAWJuoRjyFyWaFR93BFBKcXUZZYgL+o=;
 b=X8WHDG5WYs8AVAoKkLs2V5X96g/iuhv5qlzsgDGrRkqC6VQXe2EUJO4c
 8FNDaM4df9j9sHB8iiRyShUfI3xwK0bxQ6khIpen/MgOAJBo9O3iIWnk0
 CmPQx9XYNC7OncgSSfU5uqaHs0FxVC5L5X7IdynHi32wRFjdcn9XQc2z6
 so757CDNOV7/71eddOzElmtdy0hMJ2cO1x6Uu+hXSePnsKJ5AT+j2itIU
 WVjCHfPo+XU78HWncjO/NVQQtXVhW6JoroAblp/7wVjBlcHO8KPt8vsEh
 4RveJvnR++2H8klwwzjHJxRK7r/rQn1+6nYadBWgBAFImUVkiyWEwdN1X g==;
X-CSE-ConnectionGUID: UMOkkG1/RkGRAALH/DZT2A==
X-CSE-MsgGUID: WnYCFbQ+RyesgCzLdtAXsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65284477"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="65284477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:03:18 -0700
X-CSE-ConnectionGUID: 84C3gdfXTjyH2a4W78exbA==
X-CSE-MsgGUID: MU2t2zyLQC+MvcMczsBkBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="151354405"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:03:16 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_pmu: Add engine activity test for
 all functions
Date: Wed, 12 Mar 2025 11:54:30 +0530
Message-ID: <20250312062431.2238409-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250312062431.2238409-1-riana.tauro@intel.com>
References: <20250312062431.2238409-1-riana.tauro@intel.com>
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

Add a test that runs workload on all functions simultaneously and
validates that all engines are equally and fully loaded for the
entire execution quantum of the function

v2: add a different function for function config
    add function details to log
    move pmu_fd to struct
    enable and provision VF's (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 130 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 120 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 66edf24ad..a95ee1777 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -14,18 +14,22 @@
 
 #include "igt.h"
 #include "igt_perf.h"
+#include "igt_sriov_device.h"
 #include "igt_sysfs.h"
 
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_sriov_provisioning.h"
 
 #define SLEEP_DURATION 2 /* in seconds */
+#define TOTAL_EXEC_QUANTUM 128 /* in ms */
 /* flag masks */
 #define TEST_LOAD		BIT(0)
 #define TEST_TRAILING_IDLE	BIT(1)
 
 const double tolerance = 0.1;
+char xe_device[NAME_MAX];
 
 #define test_each_engine(test, fd, hwe) \
 	igt_subtest_with_dynamic(test) \
@@ -92,7 +96,7 @@ static unsigned long read_idle_residency(int fd, int gt)
 	return residency;
 }
 
-static uint64_t add_format_config(const char *xe_device, const char *format, uint64_t val)
+static uint64_t add_format_config(const char *format, uint64_t val)
 {
 	int ret;
 	uint32_t shift;
@@ -105,26 +109,30 @@ static uint64_t add_format_config(const char *xe_device, const char *format, uin
 	return config;
 }
 
-static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
+static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_instance *eci,
 				 const char *event)
 {
-	char xe_device[100];
 	uint64_t pmu_config = 0;
 	int ret;
 
-	xe_perf_device(xe, xe_device, sizeof(xe_device));
 	ret = perf_event_config(xe_device, event, &pmu_config);
 	igt_assert(ret >= 0);
-	pmu_config |= add_format_config(xe_device, "gt", gt);
+	pmu_config |= add_format_config("gt", gt);
 
 	if (eci) {
-		pmu_config |= add_format_config(xe_device, "engine_class", eci->engine_class);
-		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
+		pmu_config |= add_format_config("engine_class", eci->engine_class);
+		pmu_config |= add_format_config("engine_instance", eci->engine_instance);
 	}
 
 	return pmu_config;
 }
 
+static uint64_t get_event_config_fn(unsigned int gt, int function,
+				    struct drm_xe_engine_class_instance *eci, const char *event)
+{
+	return get_event_config(gt, eci, event) | add_format_config("function", function);
+}
+
 /**
  * SUBTEST: engine-activity-idle
  * Description: Test to validate engine activity shows no load when idle
@@ -144,10 +152,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 	uint32_t vm;
 	int pmu_fd[2];
 
-	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
 	pmu_fd[0] = open_group(fd, config, -1);
 
-	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
 
 	vm = xe_vm_create(fd, 0, 0);
@@ -188,6 +196,73 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
 		igt_assert(!engine_active_ticks);
 }
 
+/**
+ * SUBTEST: all-fn-engine-activity-load
+ * Description: Test to validate engine activity by running load on all functions simultaneously
+ */
+static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
+{
+	uint64_t config, engine_active_ticks, engine_total_ticks;
+	uint64_t after[2 * num_fns], before[2 * num_fns];
+	struct pmu_function {
+		struct xe_cork *cork;
+		uint32_t vm;
+		uint64_t pmu_fd[2];
+		int fd;
+	} fn[num_fns];
+	int i;
+
+	fn[0].pmu_fd[0] = -1;
+	for (i = 0; i < num_fns; i++) {
+		config = get_event_config_fn(eci->gt_id, i, eci, "engine-active-ticks");
+		fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
+
+		config = get_event_config_fn(eci->gt_id, i, eci, "engine-total-ticks");
+		fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
+
+		if (i > 0)
+			fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
+		else
+			fn[i].fd = fd;
+
+		igt_assert_fd(fn[i].fd);
+
+		fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
+		fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
+		xe_cork_sync_start(fn[i].fd, fn[i].cork);
+	}
+
+	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
+
+	for (i = 0; i < num_fns; i++) {
+		int idx = i * 2;
+
+		xe_cork_sync_end(fn[i].fd, fn[i].cork);
+		engine_active_ticks = after[idx] - before[idx];
+		engine_total_ticks = after[idx + 1] - before[idx + 1];
+
+		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", i,
+			  after[idx], before[idx], engine_active_ticks);
+		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", i,
+			  after[idx + 1], before[idx + 1], engine_total_ticks);
+
+		if (fn[i].cork)
+			xe_cork_destroy(fn[i].fd, fn[i].cork);
+
+		xe_vm_destroy(fn[i].fd, fn[i].vm);
+
+		close(fn[i].pmu_fd[0]);
+		close(fn[i].pmu_fd[1]);
+
+		if (i > 0)
+			close(fn[i].fd);
+
+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+	}
+}
+
 /**
  * SUBTEST: gt-c6-idle
  * Description: Basic residency test to validate idle residency
@@ -202,7 +277,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 	uint64_t val;
 
 	/* Get the PMU config for the gt-c6 event */
-	pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
+	pmu_config = get_event_config(gt, NULL, "gt-c6-residency");
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
@@ -226,13 +301,34 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
 	close(pmu_fd);
 }
 
+static unsigned int enable_and_provision_vfs(int fd)
+{
+	unsigned int gt, num_vfs;
+
+	igt_sriov_enable_vfs(fd, 2);
+	num_vfs = igt_sriov_get_enabled_vfs(fd);
+	igt_require(num_vfs);
+
+	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
+	xe_for_each_gt(fd, gt) {
+		xe_sriov_set_sched_if_idle(fd, gt, 0);
+		for (int fn = 0; fn <= num_vfs; fn++)
+			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? TOTAL_EXEC_QUANTUM / 4 :
+						     TOTAL_EXEC_QUANTUM / 2);
+	}
+
+	return num_vfs;
+}
+
 igt_main
 {
 	int fd, gt;
+	unsigned int num_fns;
 	struct drm_xe_engine_class_instance *eci;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		xe_perf_device(fd, xe_device, sizeof(xe_device));
 	}
 
 	igt_describe("Validate PMU gt-c6 residency counters when idle");
@@ -254,6 +350,20 @@ igt_main
 	test_each_engine("engine-activity-load", fd, eci)
 		engine_activity(fd, eci, TEST_LOAD);
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(igt_sriov_is_pf(fd));
+			num_fns = enable_and_provision_vfs(fd) + 1;
+		}
+
+		igt_describe("Validate engine activity on all functions");
+		test_each_engine("all-fn-engine-activity-load", fd, eci)
+			engine_activity_all_fn(fd, eci, num_fns);
+
+		igt_fixture
+			igt_sriov_disable_vfs(fd);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.47.1

