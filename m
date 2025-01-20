Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D82C02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 20:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A8510E029;
	Mon, 20 Jan 2025 20:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ka3rK4Uq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171A810E0F9
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 20:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737405321; x=1768941321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6N05hZ5ASjIghHnTikFJsQ+kmXx5YxoShFJFmQUgyWg=;
 b=Ka3rK4UqRVvUbsx0Bb5Kci30z0q8FMVp4Vj9otvRWzX0g66Tgw2d3DW2
 lgI0tllT3CjPfya1v3QsbHUGbZgu5/AbD1Q13ZIaidim1gK/tO7Htf+Ib
 X46uY6E6DSLKjskaUKxfNRJMZvHlZCvnkFLqvk+X1D5MPNDh2BY6O1pSl
 1Hc0DVOs8Hjg/ZtyF93GY71ILpcnoYFAsG0izvzv2CwelqCZHPD7ODrCS
 +CTRgk4+rd1qExDLAXbSjs2Q8lU6botM1UGAiYXvaaxNc3VTHd3Kg7CNL
 QOQUhQ2jRwWLBzAcMBmhbnDbMKKtIHp1A6UJAntFvxyLFMkKVrtbO9hjL g==;
X-CSE-ConnectionGUID: oDXii2FLSF6iH74kna8dyw==
X-CSE-MsgGUID: mi/jBioqSuuM2exsM1BsJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37723121"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; d="scan'208";a="37723121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 12:35:20 -0800
X-CSE-ConnectionGUID: 8MOEsk4SQN2IecXu00okGw==
X-CSE-MsgGUID: MzYYIcj5RBGbg6eYSqVRig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107519794"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.103])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 12:35:18 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 4/4] tests/xe_sriov_scheduling: nonpreempt-engine-resets
 subtest
Date: Mon, 20 Jan 2025 21:34:45 +0100
Message-Id: <20250120203445.16285-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
References: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Verify the occurrence of engine resets
when non-preemptible workloads surpass the combined
duration of execution quantum and preemption timeout.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 126 ++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 20ec15b22..5999c3f98 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -605,6 +605,119 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 	igt_sriov_disable_vfs(pf_fd);
 }
 
+static unsigned int select_random_exec_quantum_value(unsigned int min,
+						     unsigned int num_vfs,
+						     unsigned int job_timeout)
+{
+	int max = min(64u, job_timeout / (3 * (num_vfs + 1)));
+
+	igt_skip_on(max <= min);
+	/* random between min (inclusive) and max (exclusive) */
+	return rand() % (max - min) + min;
+}
+
+static struct vf_sched_params prepare_vf_sched_params(int num_vfs,
+						      const struct subm_opts *opts)
+{
+	struct vf_sched_params params = {};
+
+	if (opts->exec_quantum_ms || opts->preempt_timeout_us) {
+		if (opts->exec_quantum_ms)
+			params.exec_quantum_ms = opts->exec_quantum_ms;
+		if (opts->preempt_timeout_us)
+			params.preempt_timeout_us = opts->preempt_timeout_us;
+	} else {
+		params.exec_quantum_ms =
+			select_random_exec_quantum_value(8, num_vfs, 5000);
+		params.preempt_timeout_us = 2 * params.exec_quantum_ms * 1000;
+	}
+
+	return params;
+}
+
+/**
+ * SUBTEST: nonpreempt-engine-resets
+ * Description:
+ *   Check all VFs running a non-preemptible workload with a duration
+ *   exceeding the sum of its execution quantum and preemption timeout,
+ *   will experience engine reset due to preemption timeout.
+ */
+static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
+				     const struct subm_opts *opts)
+{
+	struct subm_set set_ = {}, *set = &set_;
+	struct vf_sched_params vf_sched_params =
+		prepare_vf_sched_params(num_vfs, opts);
+	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
+			       vf_sched_params.preempt_timeout_us / 1000;
+	int preemptible_end = 1;
+	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+
+	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d\n",
+		 vf_sched_params.exec_quantum_ms,
+		 vf_sched_params.preempt_timeout_us, duration_ms, num_vfs);
+	igt_assert(duration_ms);
+	igt_assert_lt(duration_ms, 2000);
+
+	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
+		    &(struct init_vf_ids_opts){ .shuffle = true,
+						.shuffle_pf = true });
+	xe_sriov_require_default_scheduling_attributes(pf_fd);
+	/* enable VFs */
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	/* set scheduling params (PF and VFs) */
+	set_vfs_scheduling_params(pf_fd, num_vfs, &vf_sched_params);
+	/* probe VFs */
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+	for (int vf = 1; vf <= num_vfs; ++vf)
+		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
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
+					.duration_ms = duration_ms,
+					.preempt = (n < preemptible_end),
+					.repeats = 2000 / duration_ms });
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
+		if (n < preemptible_end) {
+			igt_assert_eq(0, set->data[n].stats.num_early_finish);
+			igt_assert_eq(set->data[n].subm.work.repeats,
+				      set->data[n].stats.samples.n_values);
+		} else {
+			igt_assert_eq(1, set->data[n].stats.num_early_finish);
+		}
+	}
+
+	/* cleanup */
+	subm_set_fini(set);
+	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
+	igt_sriov_disable_vfs(pf_fd);
+}
+
 static struct subm_opts subm_opts = {
 	.sync_method = SYNC_BARRIER,
 	.outlier_treshold = 0.1,
@@ -682,6 +795,19 @@ igt_main_args("s:e:p:", long_opts, help_str, subm_opts_handler, NULL)
 				throughput_ratio(pf_fd, vf, &subm_opts);
 	}
 
+	igt_describe("Check VFs experience engine reset due to preemption timeout");
+	igt_subtest_with_dynamic("nonpreempt-engine-resets") {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, vf)
+				igt_dynamic_f("numvfs-%d", vf)
+					nonpreempt_engine_resets(pf_fd, vf,
+								 &subm_opts);
+
+		for_random_sriov_vf(pf_fd, vf)
+			igt_dynamic("numvfs-random")
+				nonpreempt_engine_resets(pf_fd, vf, &subm_opts);
+	}
+
 	igt_fixture {
 		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
 					  &(struct vf_sched_params){});
-- 
2.31.1

