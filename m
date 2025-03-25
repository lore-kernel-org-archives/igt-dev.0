Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBB5C3600D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 17:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EBA10E5D1;
	Tue, 25 Mar 2025 17:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPqmNxcn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CB110E5C7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742923496; x=1774459496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TXMllhXv9GwMFiDSipYGqNvlcEG6FEZ30xzlUf1jGxU=;
 b=NPqmNxcnSZeLOXE3KpHITE/mEiBW5DZP15v2ufH2J1Ioev8z3lZt+Gg6
 qd1Aj3UrtxNsfXun2BKeFuHEj19OdOuCZuqvxzhw9PgW2m8feRjG9eyxW
 ELcSf0z0TfnURHkCEWwaveIEShAo3yoaBjk8NE7j5MdoZ6Oluv9u7/ydf
 8V9XENigHRCDKmZ94BL/BVJ0tOjqSbfoJzkb4ukEWsxQEVFtG0q8ymrRF
 DGug8FhkDNtKL9i6SDUkbrmrlYvuRBpOEld8laVHENaFUDCFb+NoFQ5IW
 dM2xEKqCMSjs/Ebwfb2LtPfdipwX7JWKJnh+l4LzK5/PhRrnK7QjI6tMo g==;
X-CSE-ConnectionGUID: T3VmicopTEadHnzODTw7ww==
X-CSE-MsgGUID: AtGvzu8oQoa70CqvAhFDWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44197762"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44197762"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 10:24:56 -0700
X-CSE-ConnectionGUID: WRwIWavPQi2By3K7Qhq4sw==
X-CSE-MsgGUID: Ds6c9heRTwCpj7kyAWzu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129288074"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 10:24:54 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 3/3] tests/intel/xe_pmu: Add a test to validate
 engine activity on a function
Date: Tue, 25 Mar 2025 23:16:22 +0530
Message-ID: <20250325174622.155975-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325174622.155975-1-riana.tauro@intel.com>
References: <20250325174622.155975-1-riana.tauro@intel.com>
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

Add two tests to run workload on one function at a time with different
scheduling policies. If sched-if-idle is set to true, then the functions
use the execution quantum even if idle

v2: add additional test for sched if idle (Umesh)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_pmu.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 66b21472c..175bbf374 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -30,6 +30,7 @@
 const double tolerance = 0.1;
 static char xe_device[NAME_MAX];
 static bool autoprobe;
+static int total_exec_quantum;
 
 #define test_each_engine(test, fd, hwe) \
 	igt_subtest_with_dynamic(test) \
@@ -267,6 +268,76 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
 	}
 }
 
+/**
+ * SUBTEST: fn-engine-activity-load
+ * Description: Test to validate engine activity by running load on a function
+ *
+ * SUBTEST: fn-engine-activity-sched-if-idle
+ * Description: Test to validate engine activity by running load on a function
+ */
+static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
+{
+	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
+	double busy_percent, exec_quantum_ratio;
+	struct xe_cork *cork = NULL;
+	int pmu_fd[2], fn_fd;
+	bool sched_if_idle;
+	uint32_t vm;
+
+	if (function > 0) {
+		fn_fd = igt_sriov_open_vf_drm_device(fd, function);
+		igt_assert_fd(fn_fd);
+	} else {
+		fn_fd = fd;
+	}
+
+	config = get_event_config_fn(eci->gt_id, function, eci, "engine-active-ticks");
+	pmu_fd[0] = open_group(fd, config, -1);
+
+	config = get_event_config_fn(eci->gt_id, function, eci, "engine-total-ticks");
+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
+
+	vm = xe_vm_create(fn_fd, 0, 0);
+	cork = xe_cork_create_opts(fn_fd, eci, vm, 1, 1);
+	xe_cork_sync_start(fn_fd, cork);
+
+	pmu_read_multi(pmu_fd[0], 2, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	pmu_read_multi(pmu_fd[0], 2, after);
+
+	xe_cork_sync_end(fn_fd, cork);
+
+	engine_active_ticks = after[0] - before[0];
+	engine_total_ticks = after[1] - before[1];
+
+	igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", function,
+		  after[0], before[0], engine_active_ticks);
+	igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", function,
+		  after[1], before[1], engine_total_ticks);
+
+	busy_percent = (double)engine_active_ticks / engine_total_ticks;
+	exec_quantum_ratio = (double)total_exec_quantum / xe_sriov_get_exec_quantum_ms(fd, function, eci->gt_id);
+
+	igt_debug("Percent %lf\n", busy_percent * 100);
+
+	if (cork)
+		xe_cork_destroy(fn_fd, cork);
+
+	xe_vm_destroy(fn_fd, vm);
+
+	close(pmu_fd[0]);
+	close(pmu_fd[1]);
+
+	if (function > 0)
+		close(fn_fd);
+
+	sched_if_idle = xe_sriov_get_sched_if_idle(fd, eci->gt_id);
+	if (sched_if_idle)
+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+	else
+		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
+}
+
 /**
  * SUBTEST: gt-c6-idle
  * Description: Basic residency test to validate idle residency
@@ -333,6 +404,8 @@ static unsigned int enable_and_provision_vfs(int fd)
 	for (vf = 1; vf <= num_vfs; vf++)
 		igt_sriov_bind_vf_drm_driver(fd, vf);
 
+	total_exec_quantum = pf_exec_quantum + (num_vfs * vf_exec_quantum);
+
 	return num_vfs;
 }
 
@@ -393,6 +466,18 @@ igt_main
 		test_each_engine("all-fn-engine-activity-load", fd, eci)
 			engine_activity_all_fn(fd, eci, num_fns);
 
+		igt_describe("Validate per-function engine activity");
+		test_each_engine("fn-engine-activity-load", fd, eci)
+			for (int fn = 0; fn < num_fns; fn++)
+				engine_activity_fn(fd, eci, fn);
+
+		igt_describe("Validate per-function engine activity when sched-if-idle is set");
+		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
+			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
+			for (int fn = 0; fn < num_fns; fn++)
+				engine_activity_fn(fd, eci, fn);
+		}
+
 		igt_fixture
 			disable_vfs(fd);
 	}
-- 
2.47.1

