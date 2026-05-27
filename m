Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BD2CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087E010E2A6;
	Wed, 27 May 2026 20:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kamLlBZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A476110EA10
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915450; x=1811451450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eIhARcQyHrMxLx675hk97YXWna8HGf8l6tkrlne+oEU=;
 b=kamLlBZOMu2dD0ZeJgkxOaMlynDE3VWstpN+88m72NnLImAe+o9IN+to
 ircrjP9N9xHvO0cZNIvCfGiEN7Ss4+aSXucX68LABIH2N3wDanENQXDyX
 AiFChl8bgMpMOwHp8AZkU7OL/vEC8Puh1gWJVgyySdhql3wp5Uonq4O5b
 ApwRVU1OpufoaGIPFtAQUJKXbx6tuV/GzUWIZTjhu3NzhHzoxaHbaT8Qe
 1+1bm6H0XPWXwJvQ6wF8yKOA3sm2IFTv6dWcQ3ONgX/iTij9e1rgVuH0I
 RIukdQqjgScDF0tsDM7cuP1LiHPuibmw9w3OBgwtgNff1S5Y/QqePGsvt w==;
X-CSE-ConnectionGUID: vz2/ZvY0T3+sQ51Vf62P0A==
X-CSE-MsgGUID: +DVPRsvIQLaZ03/LjxGxoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103432193"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="103432193"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:30 -0700
X-CSE-ConnectionGUID: ImYHWSDBTfSF35auZ6foPA==
X-CSE-MsgGUID: bTpnCcLJROqgxqQ8cG0NWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="241317743"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:28 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 8/8] tests/intel/xe_sriov_scheduling: Add default fair
 scheduling test
Date: Wed, 27 May 2026 22:56:41 +0200
Message-ID: <20260527205644.2801165-9-marcin.bernatowicz@linux.intel.com>
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

Verify PF and enabled VFs keep a fair share with the driver-applied
default scheduling settings, without overriding scheduling parameters.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 145 ++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 915442380..aa3e5fccc 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -1271,6 +1271,112 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 	subm_set_fini(set);
 }
 
+static struct job_sched_params
+prepare_default_enabled_job_sched_params(int pf_fd,
+					 const uint8_t *vf_ids,
+					 size_t num_functions,
+					 int job_timeout_ms)
+{
+	struct job_sched_params params = { };
+	uint32_t min_exec_quantum_ms = UINT32_MAX;
+
+	params.sched_params = (struct vf_sched_params) {
+		.exec_quantum_ms = xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_ids[0]),
+		.preempt_timeout_us = xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_ids[0]),
+		.priority = xe_sriov_admin_get_sched_priority(pf_fd, vf_ids[0], NULL),
+	};
+
+	for (size_t n = 0; n < num_functions; ++n) {
+		uint32_t exec_quantum_ms =
+			xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_ids[n]);
+
+		min_exec_quantum_ms = min(min_exec_quantum_ms,
+					  exec_quantum_ms);
+	}
+
+	params.duration_ms = calculate_job_duration_ms(min_exec_quantum_ms);
+	params.num_repeats = adjust_num_repeats(params.duration_ms, num_functions);
+
+	igt_require_f(params.duration_ms +
+		      (num_functions - 1) * params.sched_params.exec_quantum_ms <=
+		      job_timeout_ms,
+		      "Default scheduling eq=%ums across %zu functions exceeds job timeout=%dms\n",
+		      params.sched_params.exec_quantum_ms, num_functions, job_timeout_ms);
+
+	return params;
+}
+
+static void validate_default_enabled_sched_params(int pf_fd,
+						  const uint8_t *vf_ids,
+						  size_t num_functions)
+{
+	for (size_t n = 0; n < num_functions; ++n) {
+		uint32_t exec_quantum_ms =
+			xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_ids[n]);
+		uint32_t preempt_timeout_us =
+			xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_ids[n]);
+		enum xe_sriov_sched_priority priority =
+			xe_sriov_admin_get_sched_priority(pf_fd, vf_ids[n], NULL);
+
+		igt_require_f(exec_quantum_ms > 0,
+			      "%s exec_quantum_ms stayed at 0 after enabling VFs\n",
+			      igt_sriov_func_str(vf_ids[n]));
+		igt_require_f(preempt_timeout_us > 0,
+			      "%s preempt_timeout_us stayed at 0 after enabling VFs\n",
+			      igt_sriov_func_str(vf_ids[n]));
+		igt_warn_on_f(priority != XE_SRIOV_SCHED_PRIORITY_LOW,
+			      "%s expected LOW sched_priority after enabling VFs, got %s\n",
+			      igt_sriov_func_str(vf_ids[n]),
+			      xe_sriov_sched_priority_to_string(priority));
+	}
+}
+
+static void ensure_enabled_vfs(int pf_fd, int num_vfs)
+{
+	unsigned int enabled_vfs = igt_sriov_get_enabled_vfs(pf_fd);
+
+	if (enabled_vfs && enabled_vfs != (unsigned int)num_vfs) {
+		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
+		enabled_vfs = 0;
+	}
+
+	if (!enabled_vfs) {
+		xe_sriov_require_default_scheduling_attributes(pf_fd);
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, num_vfs);
+	}
+}
+
+/**
+ * SUBTEST: default-enabled-fair-scheduling
+ * Description:
+ *   Check PF and enabled VFs keep fair scheduling using the driver-applied
+ *   default scheduling settings established when VFs are enabled.
+ */
+static void default_enabled_fair_scheduling(int pf_fd, int num_vfs,
+					    const struct subm_opts *opts,
+					    bool verify_with_perf_counters,
+					    const struct drm_xe_engine_class_instance *eci)
+{
+	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, eci);
+	struct job_sched_params job_sched_params;
+
+	ensure_enabled_vfs(pf_fd, num_vfs);
+
+	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
+		    &(struct init_vf_ids_opts){ .shuffle = true,
+						.shuffle_pf = true });
+	validate_default_enabled_sched_params(pf_fd, vf_ids, ARRAY_SIZE(vf_ids));
+	job_sched_params = prepare_default_enabled_job_sched_params(pf_fd, vf_ids,
+								    ARRAY_SIZE(vf_ids),
+								    job_timeout_ms);
+
+	verify_applied_scheduling_behavior(pf_fd, vf_ids, ARRAY_SIZE(vf_ids), opts,
+					   verify_with_perf_counters, eci,
+					   &job_sched_params);
+}
+
 static bool skip_visited_gt(bool extended_scope, uint64_t *visited_gts,
 			    unsigned short gt_id)
 {
@@ -1370,6 +1476,45 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 				  has_perf_event(perf_device, "engine-total-ticks");
 	}
 
+	igt_describe("Check PF and VFs keep fair scheduling using driver defaults applied on VF enable");
+	igt_subtest_with_dynamic("default-enabled-fair-scheduling") {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, vf)
+				xe_for_each_engine(pf_fd, eci) {
+					ecls = eci->engine_class;
+					igt_dynamic_f("numvfs-%d-gt%u-%s%u", vf,
+						      eci->gt_id,
+						      xe_engine_class_short_string(ecls),
+						      eci->engine_instance)
+						default_enabled_fair_scheduling(pf_fd, vf,
+										&subm_opts,
+										has_perf_events,
+										eci);
+				}
+
+		for_random_sriov_vf(pf_fd, vf) {
+			uint64_t visited_gts = 0;
+
+			xe_for_each_engine(pf_fd, eci) {
+				if (skip_visited_gt(extended_scope, &visited_gts,
+						    eci->gt_id))
+					continue;
+
+				igt_dynamic_f("numvfs-random-gt%u-%s%u",
+					      eci->gt_id,
+					      xe_engine_class_short_string(eci->engine_class),
+					      eci->engine_instance)
+					default_enabled_fair_scheduling(pf_fd, vf, &subm_opts,
+									has_perf_events,
+									eci);
+			}
+		}
+	}
+
+	igt_fixture() {
+		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
+	}
+
 	for (enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
 	     priority <= XE_SRIOV_SCHED_PRIORITY_NORMAL;
 	     priority++) {
-- 
2.43.0

