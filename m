Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D87C10F15
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325C0113235;
	Tue, 23 Apr 2024 08:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDylJ4V5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF6011322B
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862676; x=1745398676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MICrH+bA1h+s8iMGL7x9b+AS4V3tqMHuuJyhbkwUetQ=;
 b=dDylJ4V58Mt9UfWXq8BXrfOm2NndGtRyT/7Akd0XUwIU/p9b2WdBYmDW
 980rS/NTrgOzVPi6LOSeMRuKTqpTKKKhMP/TSj02Td7uXlJi4samoBr8u
 3TZWYASqfWsf7tPwm9CNDjj5uz+rCFUyejlbFHB8ml3NBbUAf1zWVOvVA
 4GCgl5ElbVMm34Em8e3z4zxetufUKMWP+k54PBNy2G315mR41FfW9W+N2
 W6tcPay9JvJFpc8u61cP2fxhWd+JNcSR8U3o0fdVi5gNGDyTBgt8ID1HO
 45OUYtvE683OeNYPKJLk8shrTpsxao81io/C7r6ek8FoSndSO5SgbeGjX g==;
X-CSE-ConnectionGUID: SFssp7a3Q+WZ1FaAKBa/EQ==
X-CSE-MsgGUID: K6HVNoOnQFWHzHCVq4T5og==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9602680"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9602680"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:57:56 -0700
X-CSE-ConnectionGUID: 8d51rElPSOCYBjlR84LPEg==
X-CSE-MsgGUID: M8KN4t8bS2WsHwiOXvaTNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="47587921"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:57:54 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 i-g-t 3/6] benchmarks/gem_wsim: Introduce engine_idx to
 streamline engine selection
Date: Tue, 23 Apr 2024 10:56:43 +0200
Message-Id: <20240423085646.6672-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
References: <20240423085646.6672-1-marcin.bernatowicz@linux.intel.com>
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

This patch introduces a new member, engine_idx, to the w_step structure.
This index is populated during the workload preparation phase and is
designed to reference an engine within the context's dynamic engine map
or legacy/static engine list.

The introduction of engine_idx significantly simplifies the engine
selection process during the run phase of the benchmark. By directly
associating each workload step with a specific engine index, the patch
eliminates the need for engine identification and mapping logic that was
previously required. This change not only streamlines the execution flow
but also lays the groundwork for supporting dynamic engine lists in
coming patches.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 140 +++++++++++++++++++++++++-----------------
 1 file changed, 82 insertions(+), 58 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 98e8fe55c..b50de78ec 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -159,6 +159,7 @@ struct w_step {
 	enum w_type type;
 	unsigned int context;
 	unsigned int engine;
+	unsigned int engine_idx;
 	struct duration duration;
 	struct deps data_deps;
 	struct deps fence_deps;
@@ -529,6 +530,41 @@ static int str_to_engine(const char *str)
 	return -1;
 }
 
+static unsigned int
+engine_to_i915_legacy_ring(const enum intel_engine_id *engine)
+{
+	static const unsigned int eb_engine_map[NUM_ENGINES] = {
+		[DEFAULT] = I915_EXEC_DEFAULT,
+		[RCS] = I915_EXEC_RENDER,
+		[BCS] = I915_EXEC_BLT,
+		[VCS] = I915_EXEC_BSD,
+		[VCS1] = I915_EXEC_BSD | I915_EXEC_BSD_RING1,
+		[VCS2] = I915_EXEC_BSD | I915_EXEC_BSD_RING2,
+		[VECS] = I915_EXEC_VEBOX
+	};
+
+	return eb_engine_map[*engine];
+}
+
+static bool are_equal_engines(const enum intel_engine_id *e1,
+			      const enum intel_engine_id *e2)
+{
+	return *e1 == *e2;
+}
+
+static bool find_engine_in_map(const enum intel_engine_id *engine,
+			       struct intel_engines *engines, unsigned int *idx)
+{
+	igt_assert(idx);
+	for (unsigned int i = 0; i < engines->nr_engines; ++i)
+		if (are_equal_engines(engine, &engines->engines[i])) {
+			*idx = i;
+			return true;
+		}
+
+	return false;
+}
+
 static struct intel_engine_data *query_engines(void)
 {
 	static struct intel_engine_data engines = {};
@@ -1587,47 +1623,10 @@ static unsigned int create_bb(struct w_step *w, int self)
 	return r;
 }
 
-static const unsigned int eb_engine_map[NUM_ENGINES] = {
-	[DEFAULT] = I915_EXEC_DEFAULT,
-	[RCS] = I915_EXEC_RENDER,
-	[BCS] = I915_EXEC_BLT,
-	[VCS] = I915_EXEC_BSD,
-	[VCS1] = I915_EXEC_BSD | I915_EXEC_BSD_RING1,
-	[VCS2] = I915_EXEC_BSD | I915_EXEC_BSD_RING2,
-	[VECS] = I915_EXEC_VEBOX
-};
-
 static void
-eb_set_engine(struct drm_i915_gem_execbuffer2 *eb, enum intel_engine_id engine)
-{
-	eb->flags = eb_engine_map[engine];
-}
-
-static unsigned int
-find_engine_in_map(struct ctx *ctx, enum intel_engine_id engine)
+eb_update_flags(struct workload *wrk, struct w_step *w)
 {
-	unsigned int i;
-
-	for (i = 0; i < ctx->engine_map.nr_engines; i++) {
-		if (ctx->engine_map.engines[i] == engine)
-			return i + 1;
-	}
-
-	igt_assert(ctx->load_balance);
-	return 0;
-}
-
-static void
-eb_update_flags(struct workload *wrk, struct w_step *w,
-		enum intel_engine_id engine)
-{
-	struct ctx *ctx = __get_ctx(wrk, w);
-
-	if (ctx->engine_map.nr_engines)
-		w->i915.eb.flags = find_engine_in_map(ctx, engine);
-	else
-		eb_set_engine(&w->i915.eb, engine);
-
+	w->i915.eb.flags = w->engine_idx;
 	w->i915.eb.flags |= I915_EXEC_HANDLE_LUT;
 	w->i915.eb.flags |= I915_EXEC_NO_RELOC;
 
@@ -1646,19 +1645,9 @@ static struct xe_exec_queue *
 xe_get_eq(struct workload *wrk, const struct w_step *w)
 {
 	struct ctx *ctx = __get_ctx(wrk, w);
-	struct xe_exec_queue *eq;
 
-	if (ctx->engine_map.nr_engines) {
-		igt_assert_eq(ctx->xe.nr_queues, 1);
-		igt_assert(ctx->xe.queue_list[0].id);
-		eq = &ctx->xe.queue_list[0];
-	} else {
-		igt_assert(w->engine >= 0 && w->engine < ctx->xe.nr_queues);
-		igt_assert(ctx->xe.queue_list[w->engine].id);
-		eq = &ctx->xe.queue_list[w->engine];
-	}
-
-	return eq;
+	igt_assert_lt(w->engine_idx, ctx->xe.nr_queues);
+	return &ctx->xe.queue_list[w->engine_idx];
 }
 
 static struct vm *
@@ -1686,7 +1675,6 @@ static uint32_t alloc_bo(int i915, unsigned long *size)
 static void
 alloc_step_batch(struct workload *wrk, struct w_step *w)
 {
-	enum intel_engine_id engine = w->engine;
 	struct dep_entry *dep;
 	unsigned int j = 0;
 	unsigned int nr_obj = 2 + w->data_deps.nr;
@@ -1774,7 +1762,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
 	w->i915.eb.buffer_count = j + 1;
 	w->i915.eb.rsvd1 = get_ctxid(wrk, w);
 
-	eb_update_flags(wrk, w, engine);
+	eb_update_flags(wrk, w);
 #ifdef DEBUG
 	printf("%u: %u:|", w->idx, w->i915.eb.buffer_count);
 	for (i = 0; i <= j; i++)
@@ -2179,7 +2167,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 	/*
 	 * Create and configure contexts.
 	 */
-	for_each_ctx(ctx, wrk) {
+	__for_each_ctx(ctx, wrk, ctx_idx) {
 		struct drm_i915_gem_context_create_ext_setparam ext = {
 			.base.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
 			.param.param = I915_CONTEXT_PARAM_VM,
@@ -2241,6 +2229,22 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 			};
 			struct i915_context_engines_bond *last = NULL;
 
+			/* update engine_idx */
+			for_each_w_step(w, wrk) {
+				if (w->context != ctx_idx)
+					continue;
+				if (w->type == BATCH) {
+					unsigned int map_idx = 0;
+
+					if (find_engine_in_map(&w->engine, &ctx->engine_map,
+								&map_idx))
+						/* 0 is virtual, map indexes are shifted by one */
+						w->engine_idx = map_idx + 1;
+					else
+						igt_assert(ctx->load_balance);
+				}
+			}
+
 			if (ctx->load_balance) {
 				set_engines->extensions =
 					to_user_pointer(load_balance);
@@ -2296,6 +2300,15 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
 			load_balance->base.next_extension = to_user_pointer(last);
 
 			gem_context_set_param(fd, &param);
+		} else {
+			/* update engine_idx */
+			for_each_w_step(w, wrk) {
+				if (w->context != ctx_idx)
+					continue;
+				if (w->type == BATCH) {
+					w->engine_idx = engine_to_i915_legacy_ring(&w->engine);
+				}
+			}
 		}
 
 		if (wrk->sseu) {
@@ -2382,6 +2395,14 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 						eq->hwe_list[i].gt_id);
 			}
 
+			/* update engine_idx */
+			for_each_w_step(w, wrk) {
+				if (w->context != ctx_idx)
+					continue;
+				if (w->type == BATCH)
+					w->engine_idx = 0;
+			}
+
 			xe_exec_queue_create_(ctx, eq);
 		} else {
 			int engine_classes[NUM_ENGINES] = {};
@@ -2392,8 +2413,11 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
 			for_each_w_step(w, wrk) {
 				if (w->context != ctx_idx)
 					continue;
-				if (w->type == BATCH)
+				if (w->type == BATCH) {
 					engine_classes[w->engine]++;
+					/* update engine_idx */
+					w->engine_idx = w->engine;
+				}
 			}
 
 			for (i = 0; i < NUM_ENGINES; i++) {
@@ -2630,12 +2654,12 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
 }
 
 static void
-do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine)
+do_eb(struct workload *wrk, struct w_step *w)
 {
 	struct dep_entry *dep;
 	unsigned int i;
 
-	eb_update_flags(wrk, w, engine);
+	eb_update_flags(wrk, w);
 	update_bb_start(wrk, w);
 
 	for_each_dep(dep, w->fence_deps) {
@@ -2828,7 +2852,7 @@ static void *run_workload(void *data)
 			if (is_xe)
 				do_xe_exec(wrk, w);
 			else
-				do_eb(wrk, w, engine);
+				do_eb(wrk, w);
 
 			if (w->request != -1) {
 				igt_list_del(&w->rq_link);
-- 
2.31.1

