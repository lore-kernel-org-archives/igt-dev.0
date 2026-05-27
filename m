Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4CECD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 20:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DD510EA10;
	Wed, 27 May 2026 20:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdMxQ8UJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3358110EA1E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915422; x=1811451422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IBRInluU1PZfl7tmBRI2Ktr36GssEv9nt2s/8PDS8oc=;
 b=TdMxQ8UJmgW/kRZkDry6PosKgdkZQ8s/smOF0J011U8INP81Yr23H6/H
 nam9GlAMFXH+XL5iBa1W/GvYxTE0L+lOOXgFdZCUKGBTA+twsDvU7BY1d
 qRcGur8Wms6VwxTY7zLSvItESznBHaADxizGs/vfbBHI4E2C7iWbGQOOr
 MGRFu1q6gruMQmZ6Ejnq9yQujwkZ8n/eJlLckM87d4+/rg7i+8MpSEkPR
 Sk8UuoCildQds+EEOLXfW51x/Gur2ru6HjdhC+oDBe8WCup3eoqcxBr7Y
 4UWDLdrKzVAlLkyex0teC9cifK6z9Sr/SyYx0qDZpw27OltneexYFjcv6 Q==;
X-CSE-ConnectionGUID: 4EctqbLRRzCPo6vR/2Fg4Q==
X-CSE-MsgGUID: vs2DUekdTpKhE0IVJeaiTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84383426"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="84383426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:57:01 -0700
X-CSE-ConnectionGUID: ZaMyi6AlSYeF1eVpSBsiuA==
X-CSE-MsgGUID: yTZYUuJvQvmJ2WuOF6UeLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239347211"
Received: from kpleskax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.94.249.221])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:56:59 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/8] tests/intel/xe_sriov_scheduling: Add scheduling
 priority support
Date: Wed, 27 May 2026 22:56:35 +0200
Message-ID: <20260527205644.2801165-3-marcin.bernatowicz@linux.intel.com>
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

Extend vf_sched_params with scheduling priority and program it together
with exec quantum and preempt timeout. Also print the selected priority
in the test logs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_scheduling.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
index 509d6fd00..f4e674fe2 100644
--- a/tests/intel/xe_sriov_scheduling.c
+++ b/tests/intel/xe_sriov_scheduling.c
@@ -370,6 +370,7 @@ static void init_vf_ids(uint8_t *array, size_t n,
 struct vf_sched_params {
 	uint32_t exec_quantum_ms;
 	uint32_t preempt_timeout_us;
+	enum xe_sriov_sched_priority priority;
 };
 
 static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
@@ -389,6 +390,12 @@ static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
 			  p->preempt_timeout_us, ret))
 		return ret;
 
+	ret = __xe_sriov_admin_bulk_set_sched_priority(pf_fd, p->priority);
+	if (igt_warn_on_f(ret,
+			  "Failed to bulk set sched priority=%d: %d\n",
+			  p->priority, ret))
+		return ret;
+
 	return ret;
 }
 
@@ -607,10 +614,12 @@ static unsigned int select_inflight_k(unsigned int duration_ms,
 static struct vf_sched_params prepare_vf_sched_params(int num_threads,
 						      int min_num_repeats,
 						      int job_timeout_ms,
-						      const struct subm_opts *opts)
+						      const struct subm_opts *opts,
+						      enum xe_sriov_sched_priority priority)
 {
 	struct vf_sched_params params = { MIN_EXEC_QUANTUM_MS,
-					  derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS) };
+					  derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS),
+						  priority };
 
 	if (opts->exec_quantum_ms || opts->preempt_timeout_us) {
 		if (opts->exec_quantum_ms)
@@ -638,12 +647,13 @@ static struct vf_sched_params prepare_vf_sched_params(int num_threads,
 }
 
 static struct job_sched_params
-prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_opts *opts)
+prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_opts *opts,
+			 enum xe_sriov_sched_priority priority)
 {
 	struct job_sched_params params = { };
 
 	params.sched_params = prepare_vf_sched_params(num_threads, MIN_NUM_REPEATS,
-						      job_timeout_ms, opts);
+							      job_timeout_ms, opts, priority);
 	params.duration_ms = calculate_job_duration_ms(params.sched_params.exec_quantum_ms);
 	params.num_repeats = adjust_num_repeats(params.duration_ms, num_threads);
 
@@ -663,13 +673,15 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
 	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
 	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
 									    job_timeout_ms,
-									    opts);
+								    opts,
+								    XE_SRIOV_SCHED_PRIORITY_LOW);
 	const unsigned int k = select_inflight_k(job_sched_params.duration_ms,
 						 opts->inflight, false);
 
-	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
+	igt_info("eq=%ums pt=%uus prio=%s duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
 		 job_sched_params.sched_params.exec_quantum_ms,
 		 job_sched_params.sched_params.preempt_timeout_us,
+		 xe_sriov_sched_priority_to_string(job_sched_params.sched_params.priority),
 		 job_sched_params.duration_ms, job_sched_params.num_repeats,
 		 k, num_vfs + 1, job_timeout_ms);
 
@@ -759,16 +771,19 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
 {
 	struct subm_set set_ = {}, *set = &set_;
 	uint32_t job_timeout_ms = sysfs_get_job_timeout_ms(pf_fd, &xe_engine(pf_fd, 0)->instance);
+	enum xe_sriov_sched_priority priority = XE_SRIOV_SCHED_PRIORITY_LOW;
 	struct vf_sched_params vf_sched_params = prepare_vf_sched_params(num_vfs, 1,
-									 job_timeout_ms, opts);
+									 job_timeout_ms, opts,
+									 priority);
 	uint64_t duration_ms = 2 * vf_sched_params.exec_quantum_ms +
 			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
 	int preemptible_end = 1;
 	uint8_t vf_ids[num_vfs + 1 /*PF*/];
 	const unsigned int k = select_inflight_k(duration_ms, opts->inflight, true);
 
-	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
+	igt_info("eq=%ums pt=%uus prio=%s duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
 		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
+		 xe_sriov_sched_priority_to_string(vf_sched_params.priority),
 		 duration_ms, k, num_vfs, job_timeout_ms);
 
 	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
-- 
2.43.0

