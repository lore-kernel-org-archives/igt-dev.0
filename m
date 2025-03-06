Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8870AC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 07:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D5310E848;
	Thu,  6 Mar 2025 07:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPTiGAWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E61C10E848
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741246606; x=1772782606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=izVmnlbb3bDEym/Mfoa1KzkyL4MyGVu5AWyUfseC1Tw=;
 b=KPTiGAWbKcZlQ/V+nBS9v3mzxIaypu48e1y2vYA3T5xXn8z0u5UTpRzH
 CmdqZPmOS9oB5O3bMPG3nQhs2ln9IhbWaBtIuKO4miyb+gqacFaorRe2a
 MlRsHzjYR6NNenO/l4vD0ZjJjPvaQmpPPUklIt+RayC6AkQ2PQv//unxh
 qVxbsIb9LwzgTcbMHO5sYapS40y54ZpKBQN8ZPgfeiYRsKg7tQQ3KlU0/
 q0On008Vds3k+nMYBpMm7HmDNTDAc9YzCnDUvD/XbF0gmDJuXbF7jXpzv
 2TQBJ0EjVSCwn3UzCMDUlisi1dpkD7dfrx/wLN8kt5BQ1lkmVUJ0uGMMP Q==;
X-CSE-ConnectionGUID: uzwVdRpgQPeD1DFcRcx7VA==
X-CSE-MsgGUID: aJXZ7CQNQHm2uE5pZgWjhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52878283"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="52878283"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 23:36:45 -0800
X-CSE-ConnectionGUID: Bm/Oe3pXRmaz1TiBlqqgqw==
X-CSE-MsgGUID: XdzBKca4Sj6fhbQSKLTKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119121923"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 23:36:44 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, michal.wajdeczko@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/xe_sriov_scheduling: pf-priority subtest
Date: Thu,  6 Mar 2025 08:36:39 +0100
Message-Id: <20250306073639.3180-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Add a subtest to verify that PF gets scheduling priority over other VFs
running the same workload when configured with HIGH priority.

The verification is done by measuring the time PF takes to complete the
workload. This duration should match the workload time as PF should not
be preempted by VFs until it finishes its work.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com
---
 tests/intel/xe_sriov_scheduling.c | 111 ++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 89cdd8750..60d55688c 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -714,6 +714,105 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 	igt_sriov_disable_vfs(pf_fd);
 }
 
+/**
+ * SUBTEST: pf-priority
+ * Description:
+ *   Check that PF gets scheduling priority over other VFs running
+ *   the same workload when configured with HIGH priority.
+ */
+static void pf_priority(int pf_fd, unsigned int num_vfs, const struct subm_opts *opts)
+{
+	struct subm_set set_ = {}, *set = &set_;
+	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
+	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs + 1, 1,
+									 job_timeout_ms, opts);
+	struct job_sched_params job_sched_params;
+	unsigned int gt;
+
+	job_sched_params.sched_params = vf_sched_params;
+	job_sched_params.duration_ms = 1000;
+	job_sched_params.num_repeats = 1;
+
+	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d job_timeout=%ums\n",
+		 job_sched_params.sched_params.exec_quantum_ms,
+		 job_sched_params.sched_params.preempt_timeout_us,
+		 job_sched_params.duration_ms, job_sched_params.num_repeats,
+		 num_vfs + 1, job_timeout_ms);
+
+	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
+		    &(struct init_vf_ids_opts){ .shuffle = true,
+						.shuffle_pf = true });
+	xe_sriov_require_default_scheduling_attributes(pf_fd);
+	/* enable VFs */
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	/* set scheduling params (PF and VFs) */
+	set_vfs_scheduling_params(pf_fd, num_vfs, &job_sched_params.sched_params);
+	/* probe VF */
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+	for (int vf = 1; vf <= num_vfs; ++vf)
+		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
+	/* configure PF with high scheduling priority */
+	xe_for_each_gt(pf_fd, gt)
+		xe_sriov_set_sched_priority(pf_fd, 0, gt, XE_SRIOV_SCHED_PRIORITY_HIGH);
+
+	/* init subm_set */
+	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
+	subm_set_init_sync_method(set, opts->sync_method);
+
+	for (int n = 0; n < set->ndata; ++n) {
+		int vf_fd =
+			vf_ids[n] ?
+				igt_sriov_open_vf_drm_device(pf_fd, vf_ids[n]) :
+				drm_reopen_driver(pf_fd);
+
+		igt_assert_fd(vf_fd);
+		set->data[n].opts = opts;
+		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
+			  xe_engine(vf_fd, 0)->instance);
+		subm_workload_init(&set->data[n].subm,
+				   &(struct subm_work_desc){
+					.duration_ms = job_sched_params.duration_ms,
+					.preempt = true,
+					.repeats = job_sched_params.num_repeats });
+		igt_stats_init_with_size(&set->data[n].stats.samples,
+					 set->data[n].subm.work.repeats);
+		if (set->sync_method == SYNC_BARRIER)
+			set->data[n].barrier = &set->barrier;
+	}
+
+	/* dispatch spinners, wait for results */
+	subm_set_dispatch_and_wait_threads(set);
+
+	/* verify results */
+	for (int n = 0; n < set->ndata; ++n) {
+		struct subm_stats *stats = &set->data[n].stats;
+		uint64_t elapsed_ms = (stats->end_timestamp - stats->start_timestamp) /
+				      NSEC_PER_MSEC;
+		uint64_t expected_ms = set->data[n].subm.vf_num ?
+				       job_sched_params.duration_ms * (1 + num_vfs) :
+				       job_sched_params.duration_ms;
+
+		igt_debug("[%s] elapsed_ms: %lu, expected_ms: %lu\n",
+			  set->data[n].subm.id, elapsed_ms, expected_ms);
+
+		if (set->data[n].subm.vf_num)
+			continue;
+
+		igt_assert_f(check_within_epsilon(elapsed_ms, expected_ms, opts->outlier_treshold),
+			     "[%s] workload duration: %lu ms not within +-%.0f%% of expected=%lu ms\n",
+			     set->data[n].subm.id, elapsed_ms, opts->outlier_treshold * 100, expected_ms);
+	}
+
+	/* cleanup */
+	subm_set_fini(set);
+	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
+	xe_for_each_gt(pf_fd, gt)
+		xe_sriov_set_sched_priority(pf_fd, 0, gt, XE_SRIOV_SCHED_PRIORITY_LOW);
+	igt_sriov_disable_vfs(pf_fd);
+}
+
 static struct subm_opts subm_opts = {
 	.sync_method = SYNC_BARRIER,
 	.outlier_treshold = 0.1,
@@ -804,6 +903,18 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 				nonpreempt_engine_resets(pf_fd, vf, &subm_opts);
 	}
 
+	igt_describe("Check PF gets priority over other VFs when configured with HIGH priority");
+	igt_subtest_with_dynamic("pf-priority") {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, vf)
+				igt_dynamic_f("numvfs-%d", vf)
+					pf_priority(pf_fd, vf, &subm_opts);
+
+		for_random_sriov_vf(pf_fd, vf)
+			igt_dynamic("numvfs-random")
+				pf_priority(pf_fd, vf, &subm_opts);
+	}
+
 	igt_fixture {
 		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
 					  &(struct vf_sched_params){});
-- 
2.40.0

