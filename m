Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65370C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 18:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2910E960;
	Wed, 12 Feb 2025 18:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+zTb8K/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8D910E960
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 18:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739386112; x=1770922112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BC5WJTGQp4vut7GH7sofDqT1HE5f7lkcGVZPqvCyQvA=;
 b=I+zTb8K/hnJB73las1R9VF328kKKwSSAe+UetJEcFH245bQrPK4rEm/t
 j/05MZqaH7BxjBQ5WvIL6supA9y0JVjvKHgL90f0tquq2R5z6fn9PuWqz
 vtmPVZTF7gUwCW3thB5S4dlRT4iFcZLyp6HJ8RcKKkHsfAz/h2A1PYrRH
 0O2mmnAh1rVaAyOPvqmXYLCNwuhlH2L3dZBbLWif8QPGRHW10mbvzBPJ2
 rYbigUkjN8WV87jVHA6L0lvhJVnlB2Fw9ZCmZT4WA78YXJ7rgWkLXZKQy
 RZy8KUH1Vgi7+SgrA9ofKoheDev67ZTvvCf6G0tJnS0/dAkUArfrDWCc1 Q==;
X-CSE-ConnectionGUID: yEVEA1wMQLa9Sx/Vg71S6A==
X-CSE-MsgGUID: pb5lwGnoRsCy7LW5LoFJYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40209805"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="40209805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:31 -0800
X-CSE-ConnectionGUID: 496Mz9tlSNqYBk1pP6XR6g==
X-CSE-MsgGUID: bV1or8ObT+Smy1dGz1xpQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117028661"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.17.221])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:28 -0800
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
Subject: [PATCH v2 i-g-t 4/5] tests/xe_sriov_scheduling:
 nonpreempt-engine-resets subtest
Date: Wed, 12 Feb 2025 19:47:56 +0100
Message-Id: <20250212184757.586071-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
References: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
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

v2:
- Replace magic numbers with defines (Lukasz)
- Reuse adjusted prepare_vf_sched_params
- Remove redundant asserts

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
 tests/intel/xe_sriov_scheduling.c | 94 +++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index a9ac950cf..fe037c1dc 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -620,6 +620,87 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 	igt_sriov_disable_vfs(pf_fd);
 }
 
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
+	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
+									 JOB_TIMEOUT_MS, opts);
+	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
+			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
+	int preemptible_end = 1;
+	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+
+	igt_info("eq=%ums pt=%uus duration=%lums num_vfs=%d\n",
+		 vf_sched_params.exec_quantum_ms,
+		 vf_sched_params.preempt_timeout_us, duration_ms, num_vfs);
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
+					.repeats = MIN_NUM_REPEATS });
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
@@ -697,6 +778,19 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
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

