Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C10CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 16:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1805C10E2C8;
	Wed,  5 Nov 2025 16:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbcMKDzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAF010E2C8
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 16:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762359149; x=1793895149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e6OsF/Ye7A5Ayg28OgMPkWkwg8lqXAnqYlDWKW03ekM=;
 b=HbcMKDzchSx71h/UaIzOfmek1JGWsZV7z/Qt+GkMqBFZHfn+QksusIc4
 SX58rReUAvy1aJKr9vc//6B4V755v8XcaCs/79A8pVDsVz13BDwBIeZoM
 m87iUZxStA9DbOJCR1XMfAbEzfVgUd6bnwDUVbuZfw6+crHGp/fFb7MZr
 6D8DmQKyU5Dy7OsEmfOu4SYu83xOywzv03mN8q5bL52UGGkuLDqK+RRwy
 bAl+WBlbUV+yOQo7TorzX4RQnM+NO4EvdyIlHGUJBOiO4vXEHuVZnIEXp
 Z6QpdSgGwUp4M26OV1hCy/16U7lPZbZiuA3sX0J3ByeOceUT8H41s7Zw3 A==;
X-CSE-ConnectionGUID: VLPbauDuQw+mEwhsNt8rJA==
X-CSE-MsgGUID: IiqqLtbsTzyn5Ni3yNyHqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89940247"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="89940247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 08:12:28 -0800
X-CSE-ConnectionGUID: anskbqVmQd2U/DSehKoJSA==
X-CSE-MsgGUID: W7kgk75yRA2Rm97AY0y66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="188216852"
Received: from lburylo-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.246.19.11])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 08:12:28 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_scheduling: Optional PF in
 comparison set (default on)
Date: Wed,  5 Nov 2025 17:12:21 +0100
Message-ID: <20251105161221.1920727-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Add an option to control whether the PF (id=0) participates in the
comparison set. By default PF is included for backward compatibility;
use --no-pf to compare VFs only.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 73 +++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 3a0c0d438..bb0622288 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -29,6 +29,8 @@ struct subm_opts {
 	double outlier_treshold;
 	/* --inflight=0 => auto; >=1 => explicit K */
 	unsigned int inflight;
+	/* compare set includes PF (id=0) when true */
+	bool include_pf;
 };
 
 struct subm_work_desc {
@@ -663,24 +665,27 @@ prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_
  */
 static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opts)
 {
+	const int participants = opts->include_pf ? (num_vfs + 1) : num_vfs;
 	struct subm_set set_ = {}, *set = &set_;
-	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+	uint8_t _ids[num_vfs + 1 /*PF*/];
+	uint8_t *ids = opts->include_pf ? &_ids[0] : &_ids[1];
 	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
-	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
+	struct job_sched_params job_sched_params = prepare_job_sched_params(participants,
 									    job_timeout_ms,
 									    opts);
 	const unsigned int k = select_inflight_k(job_sched_params.duration_ms,
 						 opts->inflight, false);
 
-	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
+	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d inflight=%u participants=%d%s job_timeout=%ums\n",
 		 job_sched_params.sched_params.exec_quantum_ms,
 		 job_sched_params.sched_params.preempt_timeout_us,
 		 job_sched_params.duration_ms, job_sched_params.num_repeats,
-		 k, num_vfs + 1, job_timeout_ms);
+		 k, participants, opts->include_pf ? " (including PF)" : " (VFs only)",
+		 job_timeout_ms);
 
-	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
+	init_vf_ids(_ids, ARRAY_SIZE(_ids),
 		    &(struct init_vf_ids_opts){ .shuffle = true,
-						.shuffle_pf = true });
+						.shuffle_pf = opts->include_pf });
 	xe_sriov_require_default_scheduling_attributes(pf_fd);
 	/* enable VFs */
 	igt_sriov_disable_driver_autoprobe(pf_fd);
@@ -693,18 +698,23 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
 
 	/* init subm_set */
-	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
+	subm_set_alloc_data(set, participants);
 	subm_set_init_sync_method(set, opts->sync_method);
 
 	for (int n = 0; n < set->ndata; ++n) {
-		int vf_fd =
-			vf_ids[n] ?
-				igt_sriov_open_vf_drm_device(pf_fd, vf_ids[n]) :
-				drm_reopen_driver(pf_fd);
+		int vf_fd;
+		int id = ids[n];
+
+		if (opts->include_pf && id == 0) {
+			vf_fd = drm_reopen_driver(pf_fd);
+		} else {
+			igt_assert(id > 0);
+			vf_fd = igt_sriov_open_vf_drm_device(pf_fd, id);
+		}
 
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
-		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
+		subm_init(&set->data[n].subm, vf_fd, id, 0,
 			  xe_engine(vf_fd, 0)->instance, k);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
@@ -762,6 +772,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 				     const struct subm_opts *opts)
 {
+	const int participants = opts->include_pf ? (num_vfs + 1) : num_vfs;
 	struct subm_set set_ = {}, *set = &set_;
 	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
 	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
@@ -769,16 +780,18 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
 			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
 	int preemptible_end = 1;
-	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+	uint8_t _ids[num_vfs + 1 /*PF*/];
+	uint8_t *ids = opts->include_pf ? &_ids[0] : &_ids[1];
 	const unsigned int k = select_inflight_k(duration_ms, opts->inflight, true);
 
-	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
+	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms inflight=%u participants=%d%s job_timeout=%ums\n",
 		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
-		 duration_ms, k, num_vfs, job_timeout_ms);
+		 duration_ms, k, participants, opts->include_pf ? " (including PF)" : " (VFs only)",
+		 job_timeout_ms);
 
-	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
+	init_vf_ids(_ids, ARRAY_SIZE(_ids),
 		    &(struct init_vf_ids_opts){ .shuffle = true,
-						.shuffle_pf = true });
+						.shuffle_pf = opts->include_pf });
 	xe_sriov_require_default_scheduling_attributes(pf_fd);
 	/* enable VFs */
 	igt_sriov_disable_driver_autoprobe(pf_fd);
@@ -791,18 +804,23 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
 
 	/* init subm_set */
-	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
+	subm_set_alloc_data(set, participants);
 	subm_set_init_sync_method(set, opts->sync_method);
 
 	for (int n = 0; n < set->ndata; ++n) {
-		int vf_fd =
-			vf_ids[n] ?
-				igt_sriov_open_vf_drm_device(pf_fd, vf_ids[n]) :
-				drm_reopen_driver(pf_fd);
+		int vf_fd;
+		int id = ids[n];
+
+		if (opts->include_pf && id == 0) {
+			vf_fd = drm_reopen_driver(pf_fd);
+		} else {
+			igt_assert(id > 0);
+			vf_fd = igt_sriov_open_vf_drm_device(pf_fd, id);
+		}
 
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
-		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
+		subm_init(&set->data[n].subm, vf_fd, id, 0,
 			  xe_engine(vf_fd, 0)->instance, k);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
@@ -842,6 +860,7 @@ static struct subm_opts subm_opts = {
 	.sync_method = SYNC_BARRIER,
 	.outlier_treshold = 0.1,
 	.inflight = 0,
+	.include_pf = true,
 };
 
 static bool extended_scope;
@@ -878,6 +897,10 @@ static int subm_opts_handler(int opt, int opt_index, void *data)
 			igt_info("In-flight submissions: auto (0)\n");
 		break;
 	}
+	case 'N':
+		subm_opts.include_pf = false;
+		igt_info("Exclude PF from comparison set (VFs only)\n");
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -892,6 +915,7 @@ static const struct option long_opts[] = {
 	{ .name = "eq_ms", .has_arg = true, .val = 'q', },
 	{ .name = "pt_us", .has_arg = true, .val = 'p', },
 	{ .name = "inflight", .has_arg = true, .val = 'i', },
+	{ .name = "no-pf", .has_arg = false, .val = 'N', },
 	{}
 };
 
@@ -901,7 +925,8 @@ static const char help_str[] =
 	"  --threshold\tSample outlier threshold (Default 0.1)\n"
 	"  --eq_ms\texec_quantum_ms\n"
 	"  --pt_us\tpreempt_timeout_us\n"
-	"  --inflight\tNumber of submissions kept in flight per VF (0=auto)\n";
+	"  --inflight\tNumber of submissions kept in flight per VF (0=auto)\n"
+	"  --no-pf\tExclude PF (compare VFs only) (default: include PF)\n";
 
 igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 {
-- 
2.43.0

