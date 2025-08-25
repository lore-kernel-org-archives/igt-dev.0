Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131B1CA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 08:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00C210E22F;
	Mon, 25 Aug 2025 08:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGu83X6q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C30F10E22F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756110200; x=1787646200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JfJROzmRO6CejTCgbxwJY7GJK/8sro3IWdTZ12iOIqQ=;
 b=EGu83X6qBPm6mEeD227qG+ghH+qGuzxglw5bOgN43u+mojqs5N1Dfw1G
 DUpvubyojqd2nnqXwQlZ2TldiuxgHEFwxyPDBqAJX2dkdB9+MP75HCSNe
 ohrb6tGcOPtgZheku7LQEj0ULTySnHfkMnlj9RGmlScyUpqQy6MgjIFKC
 GQG2ekm7kwSxvnYyxDmEsD88NgRLdEOHsSm/MPdZK31ia77iqldgpIjOK
 n6P7OiRNiXIMzi5bMJ9ktPvJDumiqBjbw3DFpgba+sbNq1LdH1u007Eso
 VjuIh76AENCXmG98Zbhd6CwkKIWZ+Vwgz2tE47H9P+sIixwxr/lZ1t8CT w==;
X-CSE-ConnectionGUID: peZTrAgjQXWTlO9knkWbhQ==
X-CSE-MsgGUID: aU9HQrpwSWK9s9uHbzCJLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58375345"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58375345"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 01:23:19 -0700
X-CSE-ConnectionGUID: RPogC6Y0TRqN52trPZixlw==
X-CSE-MsgGUID: dGraE/z6TpmoBtFFENl+bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="170060450"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.101.99])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 01:23:17 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 i-g-t 3/3] tests/intel/xe_sriov_scheduling: Make in-flight
 submissions configurable
Date: Mon, 25 Aug 2025 10:22:54 +0200
Message-Id: <20250825082254.444880-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250825082254.444880-1-marcin.bernatowicz@linux.intel.com>
References: <20250825082254.444880-1-marcin.bernatowicz@linux.intel.com>
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

Allow controlling (or auto-selecting) the number of concurrent
submissions per VF to better saturate hardware, especially for short
jobs.

- Add --inflight option; 0 = auto (default), >=1 = explicit K.
- Select K via a small heuristic (non-preempt: 1; <=12ms: 4; <=20ms: 3;
  else 2).
- Plumb K into subm_init() and print inflight=K in the banner.
- Relax minimums to support short jobs: MIN_EXEC_QUANTUM_MS=1,
  MIN_JOB_DURATION_MS=2.
- Update CLI parsing and help text.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 55 ++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 314126404..f0f2f29e4 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -27,6 +27,8 @@ struct subm_opts {
 	uint32_t exec_quantum_ms;
 	uint32_t preempt_timeout_us;
 	double outlier_treshold;
+	/* --inflight=0 => auto; >=1 => explicit K */
+	unsigned int inflight;
 };
 
 struct subm_work_desc {
@@ -495,9 +497,9 @@ static void log_sample_values(char *id, struct subm_stats *stats,
 }
 
 #define MIN_NUM_REPEATS 25
-#define MIN_EXEC_QUANTUM_MS 8
+#define MIN_EXEC_QUANTUM_MS 1
 #define MAX_EXEC_QUANTUM_MS 32
-#define MIN_JOB_DURATION_MS 16
+#define MIN_JOB_DURATION_MS 2
 #define MAX_TOTAL_DURATION_MS 15000
 #define PREFERRED_TOTAL_DURATION_MS 10000
 #define MAX_PREFERRED_REPEATS 100
@@ -569,6 +571,25 @@ static int adjust_num_repeats(int duration_ms, int num_threads)
 	return max(optimal_repeats, MIN_NUM_REPEATS);
 }
 
+/* inflight K selection:
+ *   user_k == 0  => auto
+ *   user_k >= 1  => explicit K
+ */
+static unsigned int select_inflight_k(unsigned int duration_ms,
+				      unsigned int user_k,
+				      bool nonpreempt)
+{
+	if (user_k)
+		return user_k >= 1 ? user_k : 1;
+	if (nonpreempt)
+		return 1;
+	if (duration_ms <= 12)
+		return 4;
+	if (duration_ms <= 20)
+		return 3;
+	return 2;
+}
+
 static struct vf_sched_params prepare_vf_sched_params(int num_threads,
 						      int min_num_repeats,
 						      int job_timeout_ms,
@@ -629,12 +650,14 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
 									    job_timeout_ms,
 									    opts);
+	const unsigned int k = select_inflight_k(job_sched_params.duration_ms,
+						 opts->inflight, false);
 
-	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d job_timeout=%ums\n",
+	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
 		 job_sched_params.sched_params.exec_quantum_ms,
 		 job_sched_params.sched_params.preempt_timeout_us,
 		 job_sched_params.duration_ms, job_sched_params.num_repeats,
-		 num_vfs + 1, job_timeout_ms);
+		 k, num_vfs + 1, job_timeout_ms);
 
 	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
 		    &(struct init_vf_ids_opts){ .shuffle = true,
@@ -663,7 +686,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
 		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
-			  xe_engine(vf_fd, 0)->instance, 1);
+			  xe_engine(vf_fd, 0)->instance, k);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
 					.duration_ms = job_sched_params.duration_ms,
@@ -728,10 +751,11 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
 	int preemptible_end = 1;
 	uint8_t vf_ids[num_vfs + 1 /*PF*/];
+	const unsigned int k = select_inflight_k(duration_ms, opts->inflight, true);
 
-	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms num_vfs=%d job_timeout=%ums\n",
+	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
 		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
-		 duration_ms, num_vfs, job_timeout_ms);
+		 duration_ms, k, num_vfs, job_timeout_ms);
 
 	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
 		    &(struct init_vf_ids_opts){ .shuffle = true,
@@ -760,7 +784,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
 		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
-			  xe_engine(vf_fd, 0)->instance, 1);
+			  xe_engine(vf_fd, 0)->instance, k);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
 					.duration_ms = duration_ms,
@@ -798,6 +822,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 static struct subm_opts subm_opts = {
 	.sync_method = SYNC_BARRIER,
 	.outlier_treshold = 0.1,
+	.inflight = 0,
 };
 
 static bool extended_scope;
@@ -824,6 +849,16 @@ static int subm_opts_handler(int opt, int opt_index, void *data)
 		subm_opts.outlier_treshold = atoi(optarg) / 100.0;
 		igt_info("Outlier threshold: %.2f\n", subm_opts.outlier_treshold);
 		break;
+	case 'i': {
+		int val = atoi(optarg);
+
+		subm_opts.inflight = val > 0 ? val : 0;
+		if (subm_opts.inflight)
+			igt_info("In-flight submissions: %u\n", subm_opts.inflight);
+		else
+			igt_info("In-flight submissions: auto (0)\n");
+		break;
+	}
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -837,6 +872,7 @@ static const struct option long_opts[] = {
 	{ .name = "threshold", .has_arg = true, .val = 't', },
 	{ .name = "eq_ms", .has_arg = true, .val = 'q', },
 	{ .name = "pt_us", .has_arg = true, .val = 'p', },
+	{ .name = "inflight", .has_arg = true, .val = 'i', },
 	{}
 };
 
@@ -845,7 +881,8 @@ static const char help_str[] =
 	"  --sync\tThreads synchronization method: 0 - none 1 - barrier (Default 1)\n"
 	"  --threshold\tSample outlier threshold (Default 0.1)\n"
 	"  --eq_ms\texec_quantum_ms\n"
-	"  --pt_us\tpreempt_timeout_us\n";
+	"  --pt_us\tpreempt_timeout_us\n"
+	"  --inflight\tNumber of submissions kept in flight per VF (0=auto)\n";
 
 igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
 {
-- 
2.31.1

