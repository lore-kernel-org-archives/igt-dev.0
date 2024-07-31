Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4298C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E0B10E64A;
	Wed, 31 Jul 2024 14:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fG7c38Mg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AC710E64A
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437855; x=1753973855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zsSooP5/c9Cr8yG+d+XQrUKAfnGrqvOsXcUWQlzpZWY=;
 b=fG7c38Mgj9r/nHK+sPMTQA2mIoWkyd1HvoQgxG38/KKewuce79dFh47N
 Rb1zz4mflKWiZI9Gv0OL6Js8ICKn8NGTqKhX3ZaBoVpE3e1SXbQLl+7sU
 wjgepWmEFyKNJJE7oWKRwYrTUsazG2dd7dOgrPJwkOuubyLnhoDLOD7Nt
 UlkV4rAPDPFMHe5bzCfCFcxSRobIX/iJxFwdPwbU90kFMJ74DCDTraruK
 hRPMJ6N4LNfqrxSO0P02eh629V7vYBSuwbUvq0K2xTNgwtkjQ7UZ+ya/1
 Rp5arzqgixjSq+9wXlz/80975FArNwQmfaeDzpW2j/Y2ICukzrieQYejd g==;
X-CSE-ConnectionGUID: dy8vnzMtQZ6IWIjXpl01mA==
X-CSE-MsgGUID: TMhh3+KCQw27XAsC09rsBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="45739419"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="45739419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:57:34 -0700
X-CSE-ConnectionGUID: 2viQMtE8T7GUyuoOKCoSHw==
X-CSE-MsgGUID: UmzxlWUlTVe1Xl92nszFnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54375438"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:57:33 -0700
Date: Wed, 31 Jul 2024 16:57:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v3 i-g-t 3/6] benchmarks/gem_wsim: Introduce engine_idx
 to streamline engine selection
Message-ID: <20240731145730.apyajzoagr7nqx3q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
 <20240729175219.1636694-4-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729175219.1636694-4-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2024-07-29 at 19:52:16 +0200, Marcin Bernatowicz wrote:
> This patch introduces a new member, engine_idx, to the w_step structure.
> This index is populated during the workload preparation phase and is
> designed to reference an engine within the context's dynamic engine map
> or legacy/static engine list.
> 
> The introduction of engine_idx significantly simplifies the engine
> selection process during the run phase of the benchmark. By directly
> associating each workload step with a specific engine index, the patch
> eliminates the need for engine identification and mapping logic that was
> previously required. This change not only streamlines the execution flow
> but also lays the groundwork for supporting dynamic engine lists in
> coming patches.
> 
> v2: Correct indentation.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/gem_wsim.c | 140 +++++++++++++++++++++++++-----------------
>  1 file changed, 82 insertions(+), 58 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 0445e9942..04340fa5d 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -159,6 +159,7 @@ struct w_step {
>  	enum w_type type;
>  	unsigned int context;
>  	unsigned int engine;
> +	unsigned int engine_idx;
>  	struct duration duration;
>  	struct deps data_deps;
>  	struct deps fence_deps;
> @@ -529,6 +530,41 @@ static int str_to_engine(const char *str)
>  	return -1;
>  }
>  
> +static unsigned int
> +engine_to_i915_legacy_ring(const enum intel_engine_id *engine)
> +{
> +	static const unsigned int eb_engine_map[NUM_ENGINES] = {
> +		[DEFAULT] = I915_EXEC_DEFAULT,
> +		[RCS] = I915_EXEC_RENDER,
> +		[BCS] = I915_EXEC_BLT,
> +		[VCS] = I915_EXEC_BSD,
> +		[VCS1] = I915_EXEC_BSD | I915_EXEC_BSD_RING1,
> +		[VCS2] = I915_EXEC_BSD | I915_EXEC_BSD_RING2,
> +		[VECS] = I915_EXEC_VEBOX
> +	};
> +
> +	return eb_engine_map[*engine];
> +}
> +
> +static bool are_equal_engines(const enum intel_engine_id *e1,
> +			      const enum intel_engine_id *e2)
> +{
> +	return *e1 == *e2;
> +}
> +
> +static bool find_engine_in_map(const enum intel_engine_id *engine,
> +			       struct intel_engines *engines, unsigned int *idx)
> +{
> +	igt_assert(idx);
> +	for (unsigned int i = 0; i < engines->nr_engines; ++i)
> +		if (are_equal_engines(engine, &engines->engines[i])) {
> +			*idx = i;
> +			return true;
> +		}
> +
> +	return false;
> +}
> +
>  static struct intel_engine_data *query_engines(void)
>  {
>  	static struct intel_engine_data engines = {};
> @@ -1587,47 +1623,10 @@ static unsigned int create_bb(struct w_step *w, int self)
>  	return r;
>  }
>  
> -static const unsigned int eb_engine_map[NUM_ENGINES] = {
> -	[DEFAULT] = I915_EXEC_DEFAULT,
> -	[RCS] = I915_EXEC_RENDER,
> -	[BCS] = I915_EXEC_BLT,
> -	[VCS] = I915_EXEC_BSD,
> -	[VCS1] = I915_EXEC_BSD | I915_EXEC_BSD_RING1,
> -	[VCS2] = I915_EXEC_BSD | I915_EXEC_BSD_RING2,
> -	[VECS] = I915_EXEC_VEBOX
> -};
> -
>  static void
> -eb_set_engine(struct drm_i915_gem_execbuffer2 *eb, enum intel_engine_id engine)
> -{
> -	eb->flags = eb_engine_map[engine];
> -}
> -
> -static unsigned int
> -find_engine_in_map(struct ctx *ctx, enum intel_engine_id engine)
> +eb_update_flags(struct workload *wrk, struct w_step *w)
>  {
> -	unsigned int i;
> -
> -	for (i = 0; i < ctx->engine_map.nr_engines; i++) {
> -		if (ctx->engine_map.engines[i] == engine)
> -			return i + 1;
> -	}
> -
> -	igt_assert(ctx->load_balance);
> -	return 0;
> -}
> -
> -static void
> -eb_update_flags(struct workload *wrk, struct w_step *w,
> -		enum intel_engine_id engine)
> -{
> -	struct ctx *ctx = __get_ctx(wrk, w);
> -
> -	if (ctx->engine_map.nr_engines)
> -		w->i915.eb.flags = find_engine_in_map(ctx, engine);
> -	else
> -		eb_set_engine(&w->i915.eb, engine);
> -
> +	w->i915.eb.flags = w->engine_idx;
>  	w->i915.eb.flags |= I915_EXEC_HANDLE_LUT;
>  	w->i915.eb.flags |= I915_EXEC_NO_RELOC;
>  
> @@ -1646,19 +1645,9 @@ static struct xe_exec_queue *
>  xe_get_eq(struct workload *wrk, const struct w_step *w)
>  {
>  	struct ctx *ctx = __get_ctx(wrk, w);
> -	struct xe_exec_queue *eq;
>  
> -	if (ctx->engine_map.nr_engines) {
> -		igt_assert_eq(ctx->xe.nr_queues, 1);
> -		igt_assert(ctx->xe.queue_list[0].id);
> -		eq = &ctx->xe.queue_list[0];
> -	} else {
> -		igt_assert(w->engine >= 0 && w->engine < ctx->xe.nr_queues);
> -		igt_assert(ctx->xe.queue_list[w->engine].id);
> -		eq = &ctx->xe.queue_list[w->engine];
> -	}
> -
> -	return eq;
> +	igt_assert_lt(w->engine_idx, ctx->xe.nr_queues);
> +	return &ctx->xe.queue_list[w->engine_idx];
>  }
>  
>  static struct vm *
> @@ -1682,7 +1671,6 @@ static uint32_t alloc_bo(int i915, unsigned long *size)
>  static void
>  alloc_step_batch(struct workload *wrk, struct w_step *w)
>  {
> -	enum intel_engine_id engine = w->engine;
>  	struct dep_entry *dep;
>  	unsigned int j = 0;
>  	unsigned int nr_obj = 2 + w->data_deps.nr;
> @@ -1770,7 +1758,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>  	w->i915.eb.buffer_count = j + 1;
>  	w->i915.eb.rsvd1 = get_ctxid(wrk, w);
>  
> -	eb_update_flags(wrk, w, engine);
> +	eb_update_flags(wrk, w);
>  #ifdef DEBUG
>  	printf("%u: %u:|", w->idx, w->i915.eb.buffer_count);
>  	for (i = 0; i <= j; i++)
> @@ -2175,7 +2163,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  	/*
>  	 * Create and configure contexts.
>  	 */
> -	for_each_ctx(ctx, wrk) {
> +	__for_each_ctx(ctx, wrk, ctx_idx) {
>  		struct drm_i915_gem_context_create_ext_setparam ext = {
>  			.base.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
>  			.param.param = I915_CONTEXT_PARAM_VM,
> @@ -2238,6 +2226,22 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  			};
>  			struct i915_context_engines_bond *last = NULL;
>  
> +			/* update engine_idx */
> +			for_each_w_step(w, wrk) {
> +				if (w->context != ctx_idx)
> +					continue;
> +				if (w->type == BATCH) {
> +					unsigned int map_idx = 0;
> +
> +					if (find_engine_in_map(&w->engine, &ctx->engine_map,
> +							       &map_idx))
> +						/* 0 is virtual, map indexes are shifted by one */
> +						w->engine_idx = map_idx + 1;
> +					else
> +						igt_assert(ctx->load_balance);
> +				}
> +			}
> +
>  			if (ctx->load_balance) {
>  				set_engines->extensions =
>  					to_user_pointer(load_balance);
> @@ -2293,6 +2297,15 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  			load_balance->base.next_extension = to_user_pointer(last);
>  
>  			gem_context_set_param(fd, &param);
> +		} else {
> +			/* update engine_idx */
> +			for_each_w_step(w, wrk) {
> +				if (w->context != ctx_idx)
> +					continue;
> +				if (w->type == BATCH) {
> +					w->engine_idx = engine_to_i915_legacy_ring(&w->engine);
> +				}
> +			}
>  		}
>  
>  		if (wrk->sseu) {
> @@ -2379,6 +2392,14 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>  						eq->hwe_list[i].gt_id);
>  			}
>  
> +			/* update engine_idx */
> +			for_each_w_step(w, wrk) {
> +				if (w->context != ctx_idx)
> +					continue;
> +				if (w->type == BATCH)
> +					w->engine_idx = 0;
> +			}
> +
>  			xe_exec_queue_create_(ctx, eq);
>  		} else {
>  			int engine_classes[NUM_ENGINES] = {};
> @@ -2389,8 +2410,11 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>  			for_each_w_step(w, wrk) {
>  				if (w->context != ctx_idx)
>  					continue;
> -				if (w->type == BATCH)
> +				if (w->type == BATCH) {
>  					engine_classes[w->engine]++;
> +					/* update engine_idx */
> +					w->engine_idx = w->engine;
> +				}
>  			}
>  
>  			for (i = 0; i < NUM_ENGINES; i++) {
> @@ -2627,12 +2651,12 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
>  }
>  
>  static void
> -do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine)
> +do_eb(struct workload *wrk, struct w_step *w)
>  {
>  	struct dep_entry *dep;
>  	unsigned int i;
>  
> -	eb_update_flags(wrk, w, engine);
> +	eb_update_flags(wrk, w);
>  	update_bb_start(wrk, w);
>  
>  	for_each_dep(dep, w->fence_deps) {
> @@ -2825,7 +2849,7 @@ static void *run_workload(void *data)
>  			if (is_xe)
>  				do_xe_exec(wrk, w);
>  			else
> -				do_eb(wrk, w, engine);
> +				do_eb(wrk, w);
>  
>  			if (w->request != -1) {
>  				igt_list_del(&w->rq_link);
> -- 
> 2.31.1
> 
