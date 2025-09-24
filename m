Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9A1CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 11:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8E510E6FB;
	Wed, 24 Sep 2025 11:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hxn9dtET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638AB10E6FB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758711985; x=1790247985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0kA2RD51txELcQoRXunf2GTV4zt4Ibhhm1VhK5dcP1w=;
 b=Hxn9dtETILcckS8K41EvMuzT/Sse+QcGAqO0UFhb/Bx8ov8x95R0UQxy
 CM59eMex5AQLzmU61BQnnWOm8OXGs384ObURaAUgt7h3GXgEsmiSS1mgB
 pF8Nv17QaE3pGsXcoy/p4waQ4K+DTJFJPT1jMzbshXPrUuhx2tyQtAsy4
 N4yNgQUAF0CjE4347iQ052/KxhVsm0AVZiFk+6bRpXP7bGbJcQFg23W7v
 PxXjL+vfKuS+5maXT4yWm06jgdVRHD6QGONJR8p75AsYNpqV/C73XybiD
 JC7oO9UHpcsGIxuGRiWVRWcs9MxS66s//PDnT5pdc3uvTLMwWDXA8hCLu g==;
X-CSE-ConnectionGUID: 0c3fuea+Q6GujPnbSQkONA==
X-CSE-MsgGUID: UEMviUsOQ2Shc3PxtzHBvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72362645"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72362645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:06:25 -0700
X-CSE-ConnectionGUID: 4+PJIwpHQlKwkl5sqQSDgA==
X-CSE-MsgGUID: j0sThGgiSt6WVlh9zg3S3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181299035"
Received: from unknown (HELO localhost) ([172.28.180.114])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:06:23 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t 2/2] benchmarks/gem_wsim: Verify Xe spinner batch
 completion
Date: Wed, 24 Sep 2025 13:06:07 +0200
Message-Id: <20250924110607.563913-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250924110607.563913-1-marcin.bernatowicz@linux.intel.com>
References: <20250924110607.563913-1-marcin.bernatowicz@linux.intel.com>
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

Introduce an opt-in post-sync check for bounded Xe BATCH steps to
detect premature finishes. Store the per-step requested_ticks and, when
-V is set, assert after sync that completion did not occur early.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 benchmarks/gem_wsim.c | 41 +++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 098415b53..bebb59f28 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -110,6 +110,7 @@ static const char *intel_engine_class_string(uint16_t engine_class)
 struct duration {
 	unsigned int min, max;
 	bool unbound;
+	uint32_t requested_ticks;
 };
 
 enum w_type {
@@ -325,6 +326,7 @@ static struct drm_i915_gem_context_param_sseu device_sseu = {
 #define FLAG_SYNCEDCLIENTS	(1<<1)
 #define FLAG_DEPSYNC		(1<<2)
 #define FLAG_SSEU		(1<<3)
+#define FLAG_VERIFY_COMPLETION	(1 << 4)
 
 static void w_step_sync(struct w_step *w)
 {
@@ -1796,10 +1798,12 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
 						    0, ALLOC_STRATEGY_LOW_TO_HIGH);
 	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, w->bb_size);
-	xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
-				   .preempt = (w->preempt_us > 0),
-				   .ctx_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
-								      1000LL * get_duration(wrk, w)));
+	w->duration.requested_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
+							    1000LL * get_duration(wrk, w));
+	xe_spin_init_opts(&w->xe.data->spin,
+			  .addr = w->xe.exec.address,
+			  .preempt = (w->preempt_us > 0),
+			  .ctx_ticks = w->duration.requested_ticks);
 	w->xe.exec.exec_queue_id = eq->id;
 	w->xe.exec.num_batch_buffer = 1;
 	/* always at least one out fence */
@@ -2652,15 +2656,30 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
 		syncobj_reset(fd, &w->xe.syncs[0].handle, 1);
 
 	/* update duration if random */
-	if (w->duration.max != w->duration.min)
+	if (w->duration.max != w->duration.min) {
+		w->duration.requested_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
+								    1000LL * get_duration(wrk, w));
 		xe_spin_init_opts(&w->xe.data->spin,
 				  .addr = w->xe.exec.address,
 				  .preempt = (w->preempt_us > 0),
-				  .ctx_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
-								     1000LL * get_duration(wrk, w)));
+				  .ctx_ticks = w->duration.requested_ticks);
+	}
 	xe_exec(fd, &w->xe.exec);
 }
 
+static void xe_w_step_sync_and_verify(struct w_step *w)
+{
+	if (!is_xe && w->type != BATCH)
+		return;
+
+	w_step_sync(w);
+
+	if (!w->duration.unbound) {
+		igt_assert(w->duration.requested_ticks && w->xe.data->spin.ticks_delta);
+		igt_assert_lte(w->duration.requested_ticks, ~w->xe.data->spin.ticks_delta);
+	}
+}
+
 static void
 do_eb(struct workload *wrk, struct w_step *w)
 {
@@ -2910,6 +2929,9 @@ static void *run_workload(void *data)
 				close(w->emit_fence);
 				w->emit_fence = -1;
 			}
+
+			if (wrk->flags & FLAG_VERIFY_COMPLETION)
+				xe_w_step_sync_and_verify(w);
 		}
 	}
 
@@ -3108,7 +3130,7 @@ int main(int argc, char **argv)
 	master_prng = time(NULL);
 
 	while ((c = getopt(argc, argv,
-			   "LlhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
+			   "LlhqvVsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
 		switch (c) {
 		case 'L':
 			list_devices_arg = true;
@@ -3153,6 +3175,9 @@ int main(int argc, char **argv)
 		case 'v':
 			verbose++;
 			break;
+		case 'V':
+			flags |= FLAG_VERIFY_COMPLETION;
+			break;
 		case 'S':
 			flags |= FLAG_SYNCEDCLIENTS;
 			break;
-- 
2.31.1

