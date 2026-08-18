Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BA5C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 12:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11EA10E3EB;
	Tue, 18 Aug 2026 12:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hqlfn1lZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236C210E3EB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787056799; x=1818592799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZKXA5grUq3uY/zFtoHES8nDr/nm5H6Dto73lcO/37M=;
 b=Hqlfn1lZylKOGUw2N+p361av0NxRQBt876JcOzfQgTlt2k15eVsTYsVv
 fI1Mb8JRPI9L64TYck7/eVf/hQ38K14OeHObZ+20ILiuX4pd0afaBMuSk
 bnbKJMfx9YU8zojL07H9HrXQw3l7uNLRacNPsr8yYAhvwMTIqvMUZQPIB
 V6jOxB2HP16y9mLUbXNT/wm+3j3BFypT9F2YjC3Bb7bq0R4+2UvSbrq3P
 /5tvGgPHaUIkTh8WSxSkIOyVnDz8+8JGl4Ikhx9Ez6sD3JeGOJ5yuF0dc
 RtBhqZcG0opFMBjfdEZiX11V2/aZ8DAbFb+7jeJFZoogcMQiNlHtdrtB1 g==;
X-CSE-ConnectionGUID: t9xDC70lQpetaZyQQ1Q0bg==
X-CSE-MsgGUID: AQgiTbtEQau4Bvm8BwL6Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87402353"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87402353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:59 -0700
X-CSE-ConnectionGUID: Een/Ad3LQDOpVr3mYhBI4A==
X-CSE-MsgGUID: Sc7QKNT1ReC+j2uQ6tgfZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262589690"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:57 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/xe_sriov_scheduling: Use safe
 scheduling params helpers
Date: Tue, 18 Aug 2026 14:39:29 +0200
Message-ID: <62fd6c4bbb320576d774d1752d5bf2da3d1b4af3.1787056235.git.marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
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

The test open coded provisioning as execution quantum, preemption timeout
and then priority, and reused the same helper for cleanup by passing an
all zero params struct. On the cleanup path that raised priority handling
last, so a function could be left with priority above LOW while
timeslicing was already infinite.

Drop the local helpers and use xe_sriov_admin_bulk_set_sched_params() for
provisioning and __xe_sriov_admin_bulk_restore_sched_defaults() for
cleanup, which apply the safe order for each direction. The invalid
combination of infinite timeslicing with priority above LOW is no longer
representable.

Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 86 +++++++++----------------------
 1 file changed, 23 insertions(+), 63 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 5e4001219..75f1b2322 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -369,44 +369,6 @@ static void init_vf_ids(uint8_t *array, size_t n,
 	}
 }
 
-struct vf_sched_params {
-	uint32_t exec_quantum_ms;
-	uint32_t preempt_timeout_us;
-	enum xe_sriov_sched_priority priority;
-};
-
-static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
-				       const struct vf_sched_params *p)
-{
-	int ret = 0;
-
-	ret = __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, p->exec_quantum_ms);
-	if (igt_warn_on_f(ret,
-			  "Failed to bulk set exec quantum=%u: %d\n",
-			  p->exec_quantum_ms, ret))
-		return ret;
-
-	ret = __xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, p->preempt_timeout_us);
-	if (igt_warn_on_f(ret,
-			  "Failed to bulk set preempt timeout=%u: %d\n",
-			  p->preempt_timeout_us, ret))
-		return ret;
-
-	ret = __xe_sriov_admin_bulk_set_sched_priority(pf_fd, p->priority);
-	if (igt_warn_on_f(ret,
-			  "Failed to bulk set sched priority=%d: %d\n",
-			  p->priority, ret))
-		return ret;
-
-	return ret;
-}
-
-static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
-				      const struct vf_sched_params *p)
-{
-	igt_assert_eq(0, __set_vfs_scheduling_params(pf_fd, num_vfs, p));
-}
-
 static bool check_within_epsilon(const double x, const double ref, const double tol)
 {
 	return x <= (1.0 + tol) * ref && x >= (1.0 - tol) * ref;
@@ -483,7 +445,7 @@ static void compute_common_time_frame_stats(struct subm_set *set)
 struct job_sched_params {
 	int duration_ms;
 	int num_repeats;
-	struct vf_sched_params sched_params;
+	struct xe_sriov_sched_params sched_params;
 };
 
 static uint32_t sysfs_get_job_timeout_ms(int fd, const struct drm_xe_engine_class_instance *eci)
@@ -566,15 +528,17 @@ static unsigned int select_inflight_k(unsigned int duration_ms,
 	return 2;
 }
 
-static struct vf_sched_params prepare_vf_sched_params(int num_threads,
-						      int min_num_repeats,
-						      int job_timeout_ms,
-						      const struct subm_opts *opts,
-						      enum xe_sriov_sched_priority priority)
+static struct xe_sriov_sched_params prepare_vf_sched_params(int num_threads,
+							    int min_num_repeats,
+							    int job_timeout_ms,
+							    const struct subm_opts *opts,
+							    enum xe_sriov_sched_priority priority)
 {
-	struct vf_sched_params params = { MIN_EXEC_QUANTUM_MS,
-					  derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS),
-						  priority };
+	struct xe_sriov_sched_params params = {
+		.exec_quantum_ms = MIN_EXEC_QUANTUM_MS,
+		.preempt_timeout_us = derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS),
+		.priority = priority,
+	};
 
 	if (opts->exec_quantum_ms || opts->preempt_timeout_us) {
 		if (opts->exec_quantum_ms)
@@ -617,7 +581,7 @@ prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_
 
 struct vf_config {
 	unsigned int vf_id;
-	struct vf_sched_params sched_params;
+	struct xe_sriov_sched_params sched_params;
 	bool run_workload;
 };
 
@@ -1154,8 +1118,8 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 							     job_timeout_ms,
 							     opts, priority);
 		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
-		set_vfs_scheduling_params(pf_fd, num_vfs,
-					  &job_sched_params->sched_params);
+		xe_sriov_admin_bulk_set_sched_params(pf_fd,
+						     &job_sched_params->sched_params);
 		igt_sriov_enable_driver_autoprobe(pf_fd);
 		igt_sriov_enable_vfs(pf_fd, num_vfs);
 	}
@@ -1196,10 +1160,9 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 	igt_assert(job_sched_params);
 
 	if (!job_sched_params->num_repeats) {
-		struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
-										 job_timeout_ms,
-										 opts,
-										 priority);
+		struct xe_sriov_sched_params vf_sched_params =
+			prepare_vf_sched_params(num_vfs, 1, job_timeout_ms,
+						opts, priority);
 
 		*job_sched_params = (struct job_sched_params) {
 			.sched_params = vf_sched_params,
@@ -1208,8 +1171,8 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 			.num_repeats = 1,
 		};
 		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
-		set_vfs_scheduling_params(pf_fd, num_vfs,
-					  &job_sched_params->sched_params);
+		xe_sriov_admin_bulk_set_sched_params(pf_fd,
+						     &job_sched_params->sched_params);
 		igt_sriov_enable_driver_autoprobe(pf_fd);
 		igt_sriov_enable_vfs(pf_fd, num_vfs);
 	}
@@ -1280,7 +1243,7 @@ prepare_default_enabled_job_sched_params(int pf_fd,
 	struct job_sched_params params = { };
 	uint32_t min_exec_quantum_ms = UINT32_MAX;
 
-	params.sched_params = (struct vf_sched_params) {
+	params.sched_params = (struct xe_sriov_sched_params) {
 		.exec_quantum_ms = xe_sriov_admin_get_exec_quantum_ms(pf_fd, vf_ids[0]),
 		.preempt_timeout_us = xe_sriov_admin_get_preempt_timeout_us(pf_fd, vf_ids[0]),
 		.priority = xe_sriov_admin_get_sched_priority(pf_fd, vf_ids[0], NULL),
@@ -1566,8 +1529,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 
 		igt_fixture() {
 			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
-			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
-						    &(struct vf_sched_params){});
+			__xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
 		}
 	}
 
@@ -1618,8 +1580,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 
 		igt_fixture() {
 			xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
-			__set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
-						    &(struct vf_sched_params){});
+			__xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
 		}
 	}
 
@@ -1627,8 +1588,7 @@ int igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 		int ret;
 
 		xe_sriov_disable_vfs_restore_auto_provisioning(pf_fd);
-		ret = __set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
-						  &(struct vf_sched_params){});
+		ret = __xe_sriov_admin_bulk_restore_sched_defaults(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
 			       "Failed to disable VF(s)");
-- 
2.43.0

