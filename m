Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E96C28B2E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 06:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D194610E29D;
	Wed, 12 Mar 2025 06:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0H4bRfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1C910E6D4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 06:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741759401; x=1773295401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5+LQwGXgV4w2yD+YY1NttcJQ443s4Z2vWO/y8JVl/4=;
 b=k0H4bRflERIV7SASvuaUyK9FcJ/Ogn8H6CJeVbovZ7JRkovUHAcjS53g
 ge702qhHmbd1QvC8/jGWU44jv/KksldSCi5PFvcj9Qnr9BGzZImkppIg9
 rs9busxK7Ywcb/36+xEwJEpoyKqRylCBwRe4/EtiFKNq3EJhQxEFwi6HW
 RJ1aUONBvbyQyGpHqFZs7SrWxqJZ3JEO74Cezdb0thylZBnfXrXA4D/IJ
 vS7F8CzfWuTyp+6asUsRSWB//Ig/bD0MMw1EDuUgnxRhxh5gMyA05Duch
 f6RFoAIqnyF44uRFtBRKqBiKtD4D+tMnjAOLHRmhuCiPokhVuz8PDfhXq Q==;
X-CSE-ConnectionGUID: SOBfKLa9Tx2n5NZVwZpK5g==
X-CSE-MsgGUID: ds/IYxZ6RMazx18rVRszJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65284480"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="65284480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:03:21 -0700
X-CSE-ConnectionGUID: /D/ZprZORYyDIJij0TPqQg==
X-CSE-MsgGUID: VfWj7tc2SdGgs/ZnNDPluw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="151354411"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:03:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_pmu: Add a test to validate
 engine activity on a function
Date: Wed, 12 Mar 2025 11:54:31 +0530
Message-ID: <20250312062431.2238409-3-riana.tauro@intel.com>
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

Provision and enable 2 VFs with execution quantum and scheduling policy
set. Run workload on one function at a time. With sched_if_idle set to
false, workload uses the execution quantum of idle functions.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 67 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index a95ee1777..be4d17ed2 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -263,6 +263,68 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
 	}
 }
 
+/**
+ * SUBTEST: fn-engine-activity-load
+ * Description: Test to validate engine activity by running load on a function
+ */
+static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
+{
+	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
+	struct xe_cork *cork = NULL;
+	uint32_t vm;
+	int pmu_fd[2], fn_fd;
+	double busy_percent, exec_quantum_ratio;
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
+	exec_quantum_ratio = (double)TOTAL_EXEC_QUANTUM / xe_sriov_get_exec_quantum_ms(fd, function, eci->gt_id);
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
+	assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
+}
+
 /**
  * SUBTEST: gt-c6-idle
  * Description: Basic residency test to validate idle residency
@@ -360,6 +422,11 @@ igt_main
 		test_each_engine("all-fn-engine-activity-load", fd, eci)
 			engine_activity_all_fn(fd, eci, num_fns);
 
+		igt_describe("Validate per-function engine activity");
+		test_each_engine("fn-engine-activity-load", fd, eci)
+			for (int fn = 0; fn < num_fns; fn++)
+				engine_activity_fn(fd, eci, fn);
+
 		igt_fixture
 			igt_sriov_disable_vfs(fd);
 	}
-- 
2.47.1

