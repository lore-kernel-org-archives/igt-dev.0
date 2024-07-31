Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC8FC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D51510E63C;
	Wed, 31 Jul 2024 14:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PH9qaBjT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B74310E63C
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437606; x=1753973606;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fw3JNk4PpRuOyOVLPsMriD/zpDaXWVYH5e+O1Sf865Q=;
 b=PH9qaBjTDolr61GqaCroZ68kuVJ0PR6DdDNjrRjJqSLk745f64w6EL+B
 fJkqEunyxK5hoQ7XZCPnqUbbkiSdCsO0IQFr2nHGoIGZmE8OU2gyjgIqM
 gOsVgLE6PoefJn3UQgxPohB7mj8niSFRQdPYgd1rf7efx+HsmJy1s2nF0
 oSXCDDF5DhkRBD4wzf+bBNE1/+w+fDBNzTlrRa49nHRdJknQowkedVa61
 yjAvTwO9TsiSNgFLMJ1IMFZzWFvJwa5ejA6DDiDgv7UVkm8qRVeVtFxSh
 GH+qE7Gm2q4z5P7CsFl7XGUgwPQnh7B8UZTwWBVEuSgqr7xkKFd8dZJZ1 A==;
X-CSE-ConnectionGUID: CHizP/jlTLq5NckxDQdoXw==
X-CSE-MsgGUID: abcZSdBnTRKBnJZ8FYHl7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37838637"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37838637"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:53:25 -0700
X-CSE-ConnectionGUID: BBRQYpNUQYuSMRDMmUop0A==
X-CSE-MsgGUID: +HTiDb6GRUSKgMp/loqqEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54635498"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:53:24 -0700
Date: Wed, 31 Jul 2024 16:53:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v3 i-g-t 1/6] benchmarks/gem_wsim: Introduce
 intel_engines structure
Message-ID: <20240731145300.xzgul3oypkntjhhc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
 <20240729175219.1636694-2-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729175219.1636694-2-marcin.bernatowicz@linux.intel.com>
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
On 2024-07-29 at 19:52:14 +0200, Marcin Bernatowicz wrote:
> Introduction of struct intel_engines, which encapsulates the number of
> engines (nr_engines) and a pointer to an array of engine IDs (engines).
> This structural refactor replaces the previous ad-hoc approach of managing
> engine maps across various structures (w_step, ctx, etc.)
> This change is part of a series of preparatory steps for upcoming
> patches.
> 
> v2: Correct indentation.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/gem_wsim.c | 72 ++++++++++++++++++++++---------------------
>  1 file changed, 37 insertions(+), 35 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index af30a22b3..0cf93228a 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -126,6 +126,11 @@ struct w_arg {
>  	bool sseu;
>  };
>  
> +struct intel_engines {
> +	unsigned int nr_engines;
> +	enum intel_engine_id *engines;
> +};
> +
>  struct bond {
>  	uint64_t mask;
>  	enum intel_engine_id master;
> @@ -165,10 +170,7 @@ struct w_step {
>  		int target;
>  		int throttle;
>  		int priority;
> -		struct {
> -			unsigned int engine_map_count;
> -			enum intel_engine_id *engine_map;
> -		};
> +		struct intel_engines engine_map;
>  		bool load_balance;
>  		struct {
>  			uint64_t bond_mask;
> @@ -220,8 +222,7 @@ struct xe_exec_queue {
>  struct ctx {
>  	uint32_t id;
>  	int priority;
> -	unsigned int engine_map_count;
> -	enum intel_engine_id *engine_map;
> +	struct intel_engines engine_map;
>  	unsigned int bond_count;
>  	struct bond *bonds;
>  	bool load_balance;
> @@ -722,15 +723,17 @@ static int parse_engine_map(struct w_step *step, const char *_str)
>  			return -1; /* TODO */
>  
>  		add = engine == VCS ? num_engines_in_class(VCS) : 1;
> -		step->engine_map_count += add;
> -		step->engine_map = realloc(step->engine_map,
> -					   step->engine_map_count *
> -					   sizeof(step->engine_map[0]));
> +		step->engine_map.nr_engines += add;
> +		step->engine_map.engines = realloc(step->engine_map.engines,
> +						   step->engine_map.nr_engines *
> +						   sizeof(step->engine_map.engines[0]));
>  
>  		if (engine != VCS)
> -			step->engine_map[step->engine_map_count - add] = engine;
> +			step->engine_map.engines[step->engine_map.nr_engines - add] = engine;
>  		else
> -			fill_engines_id_class(&step->engine_map[step->engine_map_count - add], VCS);
> +			fill_engines_id_class(&step->engine_map.engines[step->engine_map
> +										.nr_engines - add],
> +					      VCS);
>  	}
>  
>  	return 0;
> @@ -1608,8 +1611,8 @@ find_engine_in_map(struct ctx *ctx, enum intel_engine_id engine)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < ctx->engine_map_count; i++) {
> -		if (ctx->engine_map[i] == engine)
> +	for (i = 0; i < ctx->engine_map.nr_engines; i++) {
> +		if (ctx->engine_map.engines[i] == engine)
>  			return i + 1;
>  	}
>  
> @@ -1623,7 +1626,7 @@ eb_update_flags(struct workload *wrk, struct w_step *w,
>  {
>  	struct ctx *ctx = __get_ctx(wrk, w);
>  
> -	if (ctx->engine_map)
> +	if (ctx->engine_map.nr_engines)
>  		w->i915.eb.flags = find_engine_in_map(ctx, engine);
>  	else
>  		eb_set_engine(&w->i915.eb, engine);
> @@ -1648,7 +1651,7 @@ xe_get_eq(struct workload *wrk, const struct w_step *w)
>  	struct ctx *ctx = __get_ctx(wrk, w);
>  	struct xe_exec_queue *eq;
>  
> -	if (ctx->engine_map) {
> +	if (ctx->engine_map.nr_engines) {
>  		igt_assert_eq(ctx->xe.nr_queues, 1);
>  		igt_assert(ctx->xe.queue_list[0].id);
>  		eq = &ctx->xe.queue_list[0];
> @@ -1937,7 +1940,7 @@ set_ctx_sseu(struct ctx *ctx, uint64_t slice_mask)
>  	if (slice_mask == -1)
>  		slice_mask = device_sseu.slice_mask;
>  
> -	if (ctx->engine_map && ctx->load_balance) {
> +	if (ctx->engine_map.nr_engines && ctx->load_balance) {
>  		sseu.flags = I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX;
>  		sseu.engine.engine_class = I915_ENGINE_CLASS_INVALID;
>  		sseu.engine.engine_instance = 0;
> @@ -2147,9 +2150,8 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  
>  			if (w->type == ENGINE_MAP) {
>  				ctx->engine_map = w->engine_map;
> -				ctx->engine_map_count = w->engine_map_count;
>  			} else if (w->type == LOAD_BALANCE) {
> -				if (!ctx->engine_map) {
> +				if (!ctx->engine_map.nr_engines) {
>  					wsim_err("Load balancing needs an engine map!\n");
>  					return 1;
>  				}
> @@ -2229,15 +2231,15 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  
>  		__configure_context(ctx_id, wrk->prio);
>  
> -		if (ctx->engine_map) {
> +		if (ctx->engine_map.nr_engines) {
>  			struct i915_context_param_engines *set_engines =
> -				alloca0(sizeof_param_engines(ctx->engine_map_count + 1));
> +				alloca0(sizeof_param_engines(ctx->engine_map.nr_engines + 1));
>  			struct i915_context_engines_load_balance *load_balance =
> -				alloca0(sizeof_load_balance(ctx->engine_map_count));
> +				alloca0(sizeof_load_balance(ctx->engine_map.nr_engines));
>  			struct drm_i915_gem_context_param param = {
>  				.ctx_id = ctx_id,
>  				.param = I915_CONTEXT_PARAM_ENGINES,
> -				.size = sizeof_param_engines(ctx->engine_map_count + 1),
> +				.size = sizeof_param_engines(ctx->engine_map.nr_engines + 1),
>  				.value = to_user_pointer(set_engines),
>  			};
>  			struct i915_context_engines_bond *last = NULL;
> @@ -2249,11 +2251,11 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  				load_balance->base.name =
>  					I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE;
>  				load_balance->num_siblings =
> -					ctx->engine_map_count;
> +					ctx->engine_map.nr_engines;
>  
> -				for (j = 0; j < ctx->engine_map_count; j++)
> +				for (j = 0; j < ctx->engine_map.nr_engines; j++)
>  					load_balance->engines[j] =
> -						get_engine(ctx->engine_map[j]);
> +						get_engine(ctx->engine_map.engines[j]);
>  			}
>  
>  			/* Reserve slot for virtual engine. */
> @@ -2262,9 +2264,9 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  			set_engines->engines[0].engine_instance =
>  				I915_ENGINE_CLASS_INVALID_NONE;
>  
> -			for (j = 1; j <= ctx->engine_map_count; j++)
> +			for (j = 1; j <= ctx->engine_map.nr_engines; j++)
>  				set_engines->engines[j] =
> -					get_engine(ctx->engine_map[j - 1]);
> +					get_engine(ctx->engine_map.engines[j - 1]);
>  
>  			last = NULL;
>  			for (j = 0; j < ctx->bond_count; j++) {
> @@ -2286,7 +2288,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  						continue;
>  
>  					idx = find_engine(&set_engines->engines[1],
> -							  ctx->engine_map_count,
> +							  ctx->engine_map.nr_engines,
>  							  e);
>  					bond->engines[b++] =
>  						set_engines->engines[1 + idx];
> @@ -2335,9 +2337,8 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>  				continue;
>  			if (w->type == ENGINE_MAP) {
>  				ctx->engine_map = w->engine_map;
> -				ctx->engine_map_count = w->engine_map_count;
>  			} else if (w->type == LOAD_BALANCE) {
> -				if (!ctx->engine_map) {
> +				if (!ctx->engine_map.nr_engines) {
>  					wsim_err("Load balancing needs an engine map!\n");
>  					return 1;
>  				}
> @@ -2346,15 +2347,15 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>  		}
>  
>  		/* create exec queue for each referenced engine */
> -		if (ctx->engine_map) {
> +		if (ctx->engine_map.nr_engines) {
>  			ctx->xe.nr_queues = 1;
>  			ctx->xe.queue_list = calloc(ctx->xe.nr_queues, sizeof(*ctx->xe.queue_list));
>  			igt_assert(ctx->xe.queue_list);
>  			eq = &ctx->xe.queue_list[ctx->xe.nr_queues - 1];
> -			eq->nr_hwes = ctx->engine_map_count;
> +			eq->nr_hwes = ctx->engine_map.nr_engines;
>  			eq->hwe_list = calloc(eq->nr_hwes, sizeof(*eq->hwe_list));
>  			for (i = 0; i < eq->nr_hwes; ++i) {
> -				eq->hwe_list[i] = xe_get_engine(ctx->engine_map[i]);
> +				eq->hwe_list[i] = xe_get_engine(ctx->engine_map.engines[i]);
>  
>  				/* check no mixing classes and no duplicates */
>  				for (int j = 0; j < i; ++j) {
> @@ -2377,7 +2378,8 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>  
>  				if (verbose > 3)
>  					printf("%u ctx[%d] %s [%u:%u:%u]\n",
> -						id, ctx_idx, ring_str_map[ctx->engine_map[i]],
> +						id, ctx_idx,
> +						ring_str_map[ctx->engine_map.engines[i]],
>  						eq->hwe_list[i].engine_class,
>  						eq->hwe_list[i].engine_instance,
>  						eq->hwe_list[i].gt_id);
> -- 
> 2.31.1
> 
