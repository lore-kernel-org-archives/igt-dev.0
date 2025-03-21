Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF81CC36000
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 10:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DAD10E788;
	Fri, 21 Mar 2025 10:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFZzyIAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1D510E788
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 10:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742554119; x=1774090119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3+Z6G+AKJUL9vZXT0C2apYI+Tt/0BEMQDK21ikM8G9Q=;
 b=JFZzyIApgvDeCIRJ8CKwCXZ6IBCazit2Eaj0ACyF10c5lrVTZGr0Y5qh
 sJU+3xKcP/ZeKZwvoKzeAVaH6M/vjhQxuNlcE4V0EpOpLydpW5Fa+G9yF
 UJkF4gQfp+pil9UibgCvJwuEJi+oWlHDi/Fm6yBVYVnLVCU5+6ECUnEID
 0FV4hBeuuDUN5mXPPI1qw1qXXBrh5uZWss4XteQp2GMiSO3RBc+q2t1Ey
 CFFRn0MFlmROx+Yvj+mTK2CF1nUcHRbwApqrhcJgWPnPbSxAK2YkRImrL
 vRLmrwwQEHYqu+C65eh0zIMIeSLJD+IsLEwI6779OwB4YCM4YXx+YXNT7 Q==;
X-CSE-ConnectionGUID: wrqdtcfFQp2q2imtYw1ytw==
X-CSE-MsgGUID: JWsEIsd8RNWwoqyW/NBIPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43980318"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43980318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:48:39 -0700
X-CSE-ConnectionGUID: NMTfrgrESCCThsMftzoy6Q==
X-CSE-MsgGUID: diMjCb6wS+GB1ICjiOE8KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123542926"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:48:37 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, satyanarayana.k.v.p@intel.com
Subject: [PATCH i-g-t v3 3/3] tests/intel/xe_pmu: Add a test to validate
 engine activity on a function
Date: Fri, 21 Mar 2025 16:39:58 +0530
Message-ID: <20250321110958.3557106-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250321110958.3557106-1-riana.tauro@intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
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
---
 tests/intel/xe_pmu.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9a1f9b39e..5aa3ea332 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -29,6 +29,7 @@
 
 const double tolerance = 0.1;
 static char xe_device[NAME_MAX];
+static int total_exec_quantum;
 
 #define test_each_engine(test, fd, hwe) \
 	igt_subtest_with_dynamic(test) \
@@ -262,6 +263,76 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
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
@@ -324,6 +395,8 @@ static unsigned int enable_and_provision_vfs(int fd)
 	for (vf = 1; vf <= num_vfs; vf++)
 		igt_sriov_bind_vf_drm_driver(fd, vf);
 
+	total_exec_quantum = pf_exec_quantum + (num_vfs * vf_exec_quantum);
+
 	return num_vfs;
 }
 
@@ -371,6 +444,18 @@ igt_main
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
 		igt_fixture {
 			igt_sriov_disable_vfs(fd);
 			/* abort to avoid execution of next tests with enabled VFs */
-- 
2.47.1

