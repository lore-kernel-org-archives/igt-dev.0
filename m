Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F4ECA0EEB
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 16:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A174710E209;
	Tue, 19 Aug 2025 16:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9YCDc1X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D8010E63B
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755622326; x=1787158326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1CT0Ue3pLnYZ/FBWNelfnlOFx9k0K5RuNGiKt3k/w38=;
 b=M9YCDc1Xjukq5GXPyB9NGiy47n1Ew6kW8VkAfnOmqA2hI5VULB2/lHLP
 qzBv6FgiMiF8/zemotfEEZdRZAWMT4hPVDvvcp8pR7yyEevdUVq8RAie7
 iX7yz7zgPowouicRIiaiTB3+HSElrrm639t1f2QnQBsdyU0TOSs4cvEED
 Q5jL1IdXR8s0SMnQOVxrOy0f65oIIbK+rPhbzOqfxFdvMsXQ8mE+AJZnH
 uS2eM4LI0B/irZ+UHvCzcKNeeVfW8CiJDfYjIqLRSNGfkPUwfT/f96GMr
 4qXweMW44b2D/nDIeeKExeseyfeKVMzdzBha1ghE/IZLdUDDgMjTtt4do A==;
X-CSE-ConnectionGUID: 9cOyJD0+QwWdXicW1bJ8cA==
X-CSE-MsgGUID: X2h1l1ffReq0hmZa/IXhQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57732320"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57732320"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:52:06 -0700
X-CSE-ConnectionGUID: gDxv5ZZPQlaGZWdQr6yPdA==
X-CSE-MsgGUID: 5GYhi7z2QzaHFUVJ0n3g6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172146432"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.113.129])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:52:03 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 i-g-t 3/3] tests/intel/xe_sriov_scheduling: Make in-flight
 submissions configurable
Date: Tue, 19 Aug 2025 18:50:45 +0200
Message-Id: <20250819165045.467613-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
References: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
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
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 55 ++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 97263cbd2..2fc78f570 100644
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
@@ -496,9 +498,9 @@ static void log_sample_values(char *id, struct subm_stats *stats,
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
@@ -570,6 +572,25 @@ static int adjust_num_repeats(int duration_ms, int num_threads)
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
@@ -630,12 +651,14 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
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
@@ -664,7 +687,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
 		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
-			  xe_engine(vf_fd, 0)->instance, 1);
+			  xe_engine(vf_fd, 0)->instance, k);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
 					.duration_ms = job_sched_params.duration_ms,
@@ -729,10 +752,11 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
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
@@ -761,7 +785,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 		igt_assert_fd(vf_fd);
 		set->data[n].opts = opts;
 		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
-			  xe_engine(vf_fd, 0)->instance, 1);
+			  xe_engine(vf_fd, 0)->instance, k);
 		subm_workload_init(&set->data[n].subm,
 				   &(struct subm_work_desc){
 					.duration_ms = duration_ms,
@@ -799,6 +823,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 static struct subm_opts subm_opts = {
 	.sync_method = SYNC_BARRIER,
 	.outlier_treshold = 0.1,
+	.inflight = 0,
 };
 
 static bool extended_scope;
@@ -825,6 +850,16 @@ static int subm_opts_handler(int opt, int opt_index, void *data)
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
@@ -838,6 +873,7 @@ static const struct option long_opts[] = {
 	{ .name = "threshold", .has_arg = true, .val = 't', },
 	{ .name = "eq_ms", .has_arg = true, .val = 'q', },
 	{ .name = "pt_us", .has_arg = true, .val = 'p', },
+	{ .name = "inflight", .has_arg = true, .val = 'i', },
 	{}
 };
 
@@ -846,7 +882,8 @@ static const char help_str[] =
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

