Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83221CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D6210EA10;
	Wed, 27 May 2026 20:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPTfzRpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D05C10EA12
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915440; x=1811451440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mt2JhmcgNYj3G2ycdiVhKv226mMy/BUiN5rU0DntgX8=;
 b=JPTfzRpHfejrREL2ze2zJd6fvlIBms2F2V5ChKy7JXu1lgyrEKZQjnsS
 TflNbLXw0tGGVkU5EgyjCwKUOalawmzOShRydYMS0U3EFu7PBOtU5mMJo
 mXX3pqJzx8MxmsLiBy2u9ei40gZeJpPkOqurPSYdJkyjguOsTEjyNsdYX
 ds1eYbTZCb6K5KZvBj/PVSmRYc+Y6kstE7zH3k5ZUNvD097baXO4vIrQa
 lpDh2K7JlsDI2Pnc/3A0LnOCftPLQ+8V63vzDe7eJjnjKs0J2tzq8YBIq
 AVrR2Bne1sZ6l+J+D5GBHNS3kKqRXNezPckvASHK7kA/IJN3MD+MF+Ujn A==;
X-CSE-ConnectionGUID: qSqUvNUUT32VJP5jbXSBJQ==
X-CSE-MsgGUID: b8vj2RCpRk2Hg0Xub5U6nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84383443"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="84383443"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:20 -0700
X-CSE-ConnectionGUID: lSNnQ4v2Rw65LSV8EL9MFQ==
X-CSE-MsgGUID: MgNO4Z9KQ+umoG1j3iTfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239347245"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:18 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 6/8] tests/intel/xe_sriov_scheduling: Refactor
 throughput_ratio and nonpreempt-engine-resets test
Date: Wed, 27 May 2026 22:56:39 +0200
Message-ID: <20260527205644.2801165-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
References: <20260527205644.2801165-1-marcin.bernatowicz@linux.intel.com>
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

Extract verify_applied_scheduling_behavior so equal-throughput and
default-enabled-fair-scheduling share common verification logic.

Increase coverage with verification across all GTs and both low/normal
scheduling priorities.

Strengthen confidence in results with PMU-based checks using
engine-active-ticks and engine-total-ticks metrics (when available).

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 373 ++++++++++++++++++++----------
 1 file changed, 255 insertions(+), 118 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 9550c8e58..692f92e76 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -158,6 +158,7 @@ static void subm_fini(struct subm *s)
 static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
 {
 	s->work = *work;
+
 	s->expected_ticks = xe_spin_nsec_to_ticks(s->fd, s->hwe.gt_id,
 						  s->work.duration_ms * 1000000);
 	for (unsigned int i = 0; i < s->slots; i++)
@@ -1093,48 +1094,35 @@ static void warn_active_ticks_mismatch(const struct runtime_metrics *metrics,
 	}
 }
 
-/**
- * SUBTEST: equal-throughput
- * Description:
- *   Check all VFs with same scheduling settings running same workload
- *   achieve the same throughput.
- */
-static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opts)
+static void verify_applied_scheduling_behavior(int pf_fd,
+					       const uint8_t *vf_ids,
+					       size_t num_functions,
+					       const struct subm_opts *opts,
+					       bool verify_with_perf_counters,
+					       const struct drm_xe_engine_class_instance *eci,
+					       const struct job_sched_params *job_sched_params)
 {
 	struct subm_set set_ = {}, *set = &set_;
-	uint8_t vf_ids[num_vfs + 1 /*PF*/];
-	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
-	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
-									    job_timeout_ms,
-								    opts,
-								    XE_SRIOV_SCHED_PRIORITY_LOW);
-	const unsigned int k = select_inflight_k(job_sched_params.duration_ms,
-						 opts->inflight, false);
-
-	igt_info("eq=%ums pt=%uus prio=%s duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
-		 job_sched_params.sched_params.exec_quantum_ms,
-		 job_sched_params.sched_params.preempt_timeout_us,
-		 xe_sriov_sched_priority_to_string(job_sched_params.sched_params.priority),
-		 job_sched_params.duration_ms, job_sched_params.num_repeats,
-		 k, num_vfs + 1, job_timeout_ms);
-
-	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
-		    &(struct init_vf_ids_opts){ .shuffle = true,
-						.shuffle_pf = true });
-	xe_sriov_require_default_scheduling_attributes(pf_fd);
-	/* enable VFs */
-	igt_sriov_disable_driver_autoprobe(pf_fd);
-	igt_sriov_enable_vfs(pf_fd, num_vfs);
-	/* set scheduling params (PF and VFs) */
-	set_vfs_scheduling_params(pf_fd, num_vfs, &job_sched_params.sched_params);
-	/* probe VFs */
-	igt_sriov_enable_driver_autoprobe(pf_fd);
-	for (int vf = 1; vf <= num_vfs; ++vf)
-		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
-
-	/* init subm_set */
-	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
+	struct vf_config *vf_configs = NULL;
+	struct runtime_metrics *metrics = NULL;
+	uint64_t measurement_start_ns = 0;
+	uint64_t measurement_end_ns = 0;
+	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, eci);
+	unsigned int k = select_inflight_k(job_sched_params->duration_ms,
+					   opts->inflight, false);
+
+	igt_info("eq=%ums pt=%uus prio=%s duration=%ums repeats=%d inflight=%u num_functions=%zu job_timeout=%ums\n",
+		 job_sched_params->sched_params.exec_quantum_ms,
+		 job_sched_params->sched_params.preempt_timeout_us,
+		 xe_sriov_sched_priority_to_string(job_sched_params->sched_params.priority),
+		 job_sched_params->duration_ms, job_sched_params->num_repeats,
+		 k, num_functions, job_timeout_ms);
+
+	subm_set_alloc_data(set, num_functions);
 	subm_set_init_sync_method(set, opts->sync_method);
+	vf_configs = calloc(set->ndata, sizeof(*vf_configs));
+	metrics = calloc(set->ndata, sizeof(*metrics));
+	igt_assert(vf_configs && metrics);
 
 	for (int n = 0; n < set->ndata; ++n) {
 		int vf_fd =
@@ -1144,94 +1132,145 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
-		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
-			  xe_engine(vf_fd, 0)->instance, k);
+		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0, *eci, k);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
-					.duration_ms = job_sched_params.duration_ms,
+					.duration_ms = job_sched_params->duration_ms,
 					.preempt = true,
-					.repeats = job_sched_params.num_repeats });
+					.repeats = job_sched_params->num_repeats });
 		igt_stats_init_with_size(&set->data[n].stats.samples,
 					 set->data[n].subm.work.repeats);
 		set->data[n].stats.complete_ts = calloc(set->data[n].subm.work.repeats,
 							sizeof(uint64_t));
+		igt_assert(set->data[n].stats.complete_ts);
 		if (set->sync_method == SYNC_BARRIER)
 			set->data[n].barrier = &set->barrier;
 	}
 
-	/* dispatch spinners, wait for results */
-	subm_set_dispatch_and_wait_threads(set);
-	subm_set_close_handles(set);
+	run_subm_set_and_collect_metrics(pf_fd, set, vf_configs, metrics,
+					 verify_with_perf_counters,
+					 &measurement_start_ns,
+					 &measurement_end_ns);
 
-	/* verify results */
-	compute_common_time_frame_stats(set);
-	for (int n = 0; n < set->ndata; ++n) {
-		struct subm_stats *stats = &set->data[n].stats;
-		const double ref_rate = set->data[0].stats.concurrent_rate;
-
-		igt_assert_eq(0, stats->num_early_finish);
-		if (!check_within_epsilon(stats->concurrent_rate, ref_rate,
-					  opts->outlier_treshold)) {
-			log_sample_values(set->data[0].subm.id,
-					  &set->data[0].stats,
-					  set->data[0].stats.concurrent_mean,
-					  opts->outlier_treshold);
-			log_sample_values(set->data[n].subm.id, stats,
-					  set->data[0].stats.concurrent_mean,
-					  opts->outlier_treshold);
-			igt_assert_f(false,
-				     "Throughput=%.3f execs/s not within +-%.0f%% of expected=%.3f execs/s\n",
-				     stats->concurrent_rate,
-				     opts->outlier_treshold * 100, ref_rate);
-		}
+	for (int n = 0; n < set->ndata; ++n)
+		igt_assert_eq(0, set->data[n].stats.num_early_finish);
+
+	assert_share_matches_expected(metrics, set->ndata,
+				      opts->outlier_treshold, false);
+
+	if (verify_with_perf_counters) {
+		warn_active_ticks_mismatch(metrics, set->ndata,
+					   opts->outlier_treshold);
+		assert_share_matches_expected(metrics, set->ndata,
+					      opts->outlier_treshold, true);
+		assert_throughput_share_matches_total_tick(metrics,
+							   set->ndata,
+							   opts->outlier_treshold);
 	}
 
-	/* cleanup */
+	free(vf_configs);
+	free(metrics);
 	subm_set_fini(set);
-	__set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
-	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
 }
 
 /**
- * SUBTEST: nonpreempt-engine-resets
+ * SUBTEST: equal-throughput-%s-priority
+ * Description:
+ *   Check all VFs with same scheduling settings running same workload
+ *   achieve the same throughput.
+ *
+ * arg[1]:
+ *
+ * @normal: normal
+ * @low: low
+ */
+static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opts,
+			     bool verify_with_perf_counters,
+			     struct job_sched_params *job_sched_params,
+			     enum xe_sriov_sched_priority priority,
+			     const struct drm_xe_engine_class_instance *eci)
+{
+	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+
+	igt_assert(job_sched_params);
+
+	if (!job_sched_params->num_repeats) {
+		uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, eci);
+
+		*job_sched_params = prepare_job_sched_params(num_vfs + 1,
+							     job_timeout_ms,
+							     opts, priority);
+		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
+		set_vfs_scheduling_params(pf_fd, num_vfs,
+					  &job_sched_params->sched_params);
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, num_vfs);
+	}
+
+	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
+		    &(struct init_vf_ids_opts){ .shuffle = true,
+						.shuffle_pf = true });
+
+	verify_applied_scheduling_behavior(pf_fd, vf_ids, ARRAY_SIZE(vf_ids), opts,
+					   verify_with_perf_counters, eci,
+					   job_sched_params);
+}
+
+/**
+ * SUBTEST: nonpreempt-engine-resets-%s-priority
  * Description:
  *   Check all VFs running a non-preemptible workload with a duration
  *   exceeding the sum of its execution quantum and preemption timeout,
  *   will experience engine reset due to preemption timeout.
+ *
+ * arg[1]:
+ *
+ * @normal: normal
+ * @low: low
  */
 static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
-				     const struct subm_opts *opts)
+				     const struct subm_opts *opts,
+				     struct job_sched_params *job_sched_params,
+				     enum xe_sriov_sched_priority priority,
+				     const struct drm_xe_engine_class_instance *eci)
 {
 	struct subm_set set_ = {}, *set = &set_;
-	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
-	enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
-	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
-									 job_timeout_ms, opts,
-									 priority);
-	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
-			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
+	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, eci);
 	int preemptible_end = 1;
 	uint8_t vf_ids[num_vfs + 1 /*PF*/];
-	const unsigned int k = select_inflight_k(duration_ms, opts->inflight, true);
+	unsigned int k;
 
-	igt_info("eq=%ums pt=%uus prio=%s duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
-		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
-		 xe_sriov_sched_priority_to_string(vf_sched_params.priority),
-		 duration_ms, k, num_vfs, job_timeout_ms);
+	igt_assert(job_sched_params);
+
+	if (!job_sched_params->num_repeats) {
+		struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
+										 job_timeout_ms,
+										 opts,
+										 priority);
+
+		*job_sched_params = (struct job_sched_params) {
+			.sched_params = vf_sched_params,
+			.duration_ms = 2 * vf_sched_params.exec_quantum_ms +
+				       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC,
+			.num_repeats = 1,
+		};
+		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
+		set_vfs_scheduling_params(pf_fd, num_vfs,
+					  &job_sched_params->sched_params);
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, num_vfs);
+	}
+	k = select_inflight_k(job_sched_params->duration_ms, opts->inflight, true);
+
+	igt_info("eq=%ums pt=%uus prio=%s duration=%dms inflight=%u num_functions=%d job_timeout=%ums\n",
+		 job_sched_params->sched_params.exec_quantum_ms,
+		 job_sched_params->sched_params.preempt_timeout_us,
+		 xe_sriov_sched_priority_to_string(job_sched_params->sched_params.priority),
+		 job_sched_params->duration_ms, k, num_vfs + 1, job_timeout_ms);
 
 	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
 		    &(struct init_vf_ids_opts){ .shuffle = true,
 						.shuffle_pf = true });
-	xe_sriov_require_default_scheduling_attributes(pf_fd);
-	/* enable VFs */
-	igt_sriov_disable_driver_autoprobe(pf_fd);
-	igt_sriov_enable_vfs(pf_fd, num_vfs);
-	/* set scheduling params (PF and VFs) */
-	set_vfs_scheduling_params(pf_fd, num_vfs, &vf_sched_params);
-	/* probe VFs */
-	igt_sriov_enable_driver_autoprobe(pf_fd);
-	for (int vf = 1; vf <= num_vfs; ++vf)
-		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
 
 	/* init subm_set */
 	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
@@ -1246,10 +1285,10 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
 		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
-			  xe_engine(vf_fd, 0)->instance, k);
+			  *eci, k);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
-					.duration_ms = duration_ms,
+					.duration_ms = job_sched_params->duration_ms,
 					.preempt = (n < preemptible_end),
 					.repeats = MIN_NUM_REPEATS });
 		igt_stats_init_with_size(&set->data[n].stats.samples,
@@ -1277,8 +1316,20 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 
 	/* cleanup */
 	subm_set_fini(set);
-	__set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
-	xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
+}
+
+static bool skip_visited_gt(bool extended_scope, uint64_t *visited_gts,
+			    unsigned short gt_id)
+{
+	if (extended_scope)
+		return false;
+
+	if (*visited_gts & (1ULL << gt_id))
+		return true;
+
+	*visited_gts |= (1ULL << gt_id);
+
+	return false;
 }
 
 static struct subm_opts subm_opts = {
@@ -1350,6 +1401,9 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 {
 	int pf_fd;
 	bool autoprobe;
+	bool has_perf_events;
+	struct drm_xe_engine_class_instance *eci;
+	unsigned short ecls;
 
 	igt_fixture() {
 		pf_fd = drm_open_driver(DRIVER_XE);
@@ -1358,31 +1412,114 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		igt_require(xe_sriov_admin_is_present(pf_fd));
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		xe_sriov_require_default_scheduling_attributes(pf_fd);
+		xe_perf_device(pf_fd, perf_device, sizeof(perf_device));
+		has_perf_events = has_perf_event(perf_device, "engine-active-ticks") &&
+				  has_perf_event(perf_device, "engine-total-ticks");
 	}
 
-	igt_describe("Check VFs achieve equal throughput");
-	igt_subtest_with_dynamic("equal-throughput") {
-		if (extended_scope)
-			for_each_sriov_num_vfs(pf_fd, vf)
-				igt_dynamic_f("numvfs-%d", vf)
-					throughput_ratio(pf_fd, vf, &subm_opts);
+	for (enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
+	     priority <= XE_SRIOV_SCHED_PRIORITY_NORMAL;
+	     priority++) {
+		igt_describe_f("Check VFs achieve equal throughput with %s priority provisioning applied before VF enable on each selected engine",
+			       xe_sriov_sched_priority_to_string(priority));
+		igt_subtest_with_dynamic_f("equal-throughput-%s-priority",
+					   xe_sriov_sched_priority_to_string(priority)) {
+			if (extended_scope)
+				for_each_sriov_num_vfs(pf_fd, vf) {
+					struct job_sched_params job_sched_params = { };
+
+					xe_for_each_engine(pf_fd, eci) {
+						ecls = eci->engine_class;
+						igt_dynamic_f("numvfs-%d-gt%u-%s%u", vf,
+							      eci->gt_id,
+							      xe_engine_class_short_string(ecls),
+							      eci->engine_instance)
+							throughput_ratio(pf_fd, vf, &subm_opts,
+									 has_perf_events,
+									 &job_sched_params,
+									 priority, eci);
+					}
+				}
+
+			for_random_sriov_vf(pf_fd, vf) {
+				struct job_sched_params job_sched_params = { };
+				uint64_t visited_gts = 0;
+
+				xe_for_each_engine(pf_fd, eci) {
+					if (skip_visited_gt(extended_scope, &visited_gts,
+							    eci->gt_id))
+						continue;
+
+					ecls = eci->engine_class;
+					igt_dynamic_f("numvfs-random-gt%u-%s%u",
+						      eci->gt_id,
+						      xe_engine_class_short_string(ecls),
+						      eci->engine_instance)
+						throughput_ratio(pf_fd, vf, &subm_opts,
+								 has_perf_events,
+								 &job_sched_params,
+								 priority, eci);
+				}
+			}
+		}
 
-		for_random_sriov_vf(pf_fd, vf)
-			igt_dynamic("numvfs-random")
-				throughput_ratio(pf_fd, vf, &subm_opts);
+		igt_fixture() {
+			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
+						    &(struct vf_sched_params){});
+			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
+		}
 	}
 
-	igt_describe("Check VFs experience engine reset due to preemption timeout");
-	igt_subtest_with_dynamic("nonpreempt-engine-resets") {
-		if (extended_scope)
-			for_each_sriov_num_vfs(pf_fd, vf)
-				igt_dynamic_f("numvfs-%d", vf)
-					nonpreempt_engine_resets(pf_fd, vf,
-								 &subm_opts);
-
-		for_random_sriov_vf(pf_fd, vf)
-			igt_dynamic("numvfs-random")
-				nonpreempt_engine_resets(pf_fd, vf, &subm_opts);
+	for (enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
+	     priority <= XE_SRIOV_SCHED_PRIORITY_NORMAL;
+	     priority++) {
+		igt_describe("Check VFs experience engine reset due to preemption timeout on each selected engine");
+		igt_subtest_with_dynamic_f("nonpreempt-engine-resets-%s-priority",
+					   xe_sriov_sched_priority_to_string(priority)) {
+			if (extended_scope)
+				for_each_sriov_num_vfs(pf_fd, vf) {
+					struct job_sched_params job_sched_params = { };
+
+					xe_for_each_engine(pf_fd, eci) {
+						ecls = eci->engine_class;
+						igt_dynamic_f("numvfs-%d-gt%u-%s%u", vf,
+							      eci->gt_id,
+							      xe_engine_class_short_string(ecls),
+							      eci->engine_instance)
+							nonpreempt_engine_resets(pf_fd, vf,
+										 &subm_opts,
+										 &job_sched_params,
+										 priority,
+										 eci);
+					}
+				}
+
+			for_random_sriov_vf(pf_fd, vf) {
+				struct job_sched_params job_sched_params = { };
+				uint64_t visited_gts = 0;
+
+				xe_for_each_engine(pf_fd, eci) {
+					if (skip_visited_gt(extended_scope, &visited_gts,
+							    eci->gt_id))
+						continue;
+
+					ecls = eci->engine_class;
+					igt_dynamic_f("numvfs-random-gt%u-%s%u",
+						      eci->gt_id,
+						      xe_engine_class_short_string(ecls),
+						      eci->engine_instance)
+						nonpreempt_engine_resets(pf_fd, vf, &subm_opts,
+									 &job_sched_params,
+									 priority, eci);
+				}
+			}
+		}
+
+		igt_fixture() {
+			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
+						    &(struct vf_sched_params){});
+			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
+		}
 	}
 
 	igt_fixture() {
-- 
2.43.0

