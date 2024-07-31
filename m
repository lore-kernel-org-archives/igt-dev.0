Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A656BC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 15:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EB710E648;
	Wed, 31 Jul 2024 15:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EP8dcGHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB9810E648
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437998; x=1753973998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=udEM7iOKBo7sTKpXYkCmAu5dSkarY166h/rjsLXb1rU=;
 b=EP8dcGHMkEY3xgGwqV1gJ5wNMTAicTYqsMDgERBwiiCeCQGPlNk/a+9C
 8MUt8Mb5uDyZ5fVhtbpc3DP4TcTbwerAfIFmW7LZK1zZW379xU0lOJLWM
 TTkgbKFeoBa/bVPqUbQYmfoKoYH+o6wottQA/oR1eWZ02pZyiQc1PanQJ
 YJWxxgVHIcEReilkDPbQEgDEJcWXu1aL49JjW8ORX/J69n0m/agiK1jtW
 3SexZPf1oaF+oL0t1Q1JGDssuGSMFjz6FwDYBlL+MEQgwAXOnAQ+ST1GA
 Vy2Hk727xfIb8Ru35uHd6vYsw8BWiK82hGL9Khm2o0RaL7xvA9ghrFsQC A==;
X-CSE-ConnectionGUID: E57MDAxrRQaR7Yw8EKV7HA==
X-CSE-MsgGUID: ucYoG6S8TUW0xXrT8C1Bvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="30953175"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="30953175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:59:58 -0700
X-CSE-ConnectionGUID: Ir7ZTXIQRqCnhRjWzvJZug==
X-CSE-MsgGUID: wt83VKx+SEmcupy7sTwV2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="55300592"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:59:57 -0700
Date: Wed, 31 Jul 2024 16:59:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v3 i-g-t 4/6] benchmarks/gem_wsim: Update request_idx in
 prepare phase
Message-ID: <20240731145953.eikt5ctcuux2b66g@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
 <20240729175219.1636694-5-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729175219.1636694-5-marcin.bernatowicz@linux.intel.com>
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
On 2024-07-29 at 19:52:17 +0200, Marcin Bernatowicz wrote:
> Renamed `request` to `request_idx` for consistency with `engine_idx`.
> The index references an element of device's physical engines array.
> Similar to engine_idx the field is initialized in workload's preparation
> phase. Field is used for throttling functionality, enabling control over
> the rate of requests on a given engine.
> 
> v2: Avoid multiple assignments.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/gem_wsim.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 04340fa5d..85f722985 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -181,7 +181,7 @@ struct w_step {
>  	/* Implementation details */
>  	unsigned int idx;
>  	struct igt_list_head rq_link;
> -	unsigned int request;
> +	unsigned int request_idx;
>  	unsigned int preempt_us;
>  
>  	union {
> @@ -1300,7 +1300,8 @@ add_step:
>  			step.delay = __duration(step.delay, scale_time);
>  
>  		step.idx = nr_steps++;
> -		step.request = -1;
> +		step.rq_link.next = NULL;
> +		step.rq_link.prev = NULL;
>  		steps = realloc(steps, sizeof(step) * nr_steps);
>  		igt_assert(steps);
>  
> @@ -2226,7 +2227,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  			};
>  			struct i915_context_engines_bond *last = NULL;
>  
> -			/* update engine_idx */
> +			/* update engine_idx and request_idx */
>  			for_each_w_step(w, wrk) {
>  				if (w->context != ctx_idx)
>  					continue;
> @@ -2239,6 +2240,8 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  						w->engine_idx = map_idx + 1;
>  					else
>  						igt_assert(ctx->load_balance);
> +
> +					w->request_idx = ctx->engine_map.engines[map_idx];
>  				}
>  			}
>  
> @@ -2298,12 +2301,13 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  
>  			gem_context_set_param(fd, &param);
>  		} else {
> -			/* update engine_idx */
> +			/* update engine_idx and request_idx */
>  			for_each_w_step(w, wrk) {
>  				if (w->context != ctx_idx)
>  					continue;
>  				if (w->type == BATCH) {
>  					w->engine_idx = engine_to_i915_legacy_ring(&w->engine);
> +					w->request_idx = w->engine;
>  				}
>  			}
>  		}
> @@ -2396,8 +2400,10 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>  			for_each_w_step(w, wrk) {
>  				if (w->context != ctx_idx)
>  					continue;
> -				if (w->type == BATCH)
> +				if (w->type == BATCH) {
>  					w->engine_idx = 0;
> +					w->request_idx = ctx->engine_map.engines[w->engine_idx];
> +				}
>  			}
>  
>  			xe_exec_queue_create_(ctx, eq);
> @@ -2412,8 +2418,9 @@ static int xe_prepare_contexts(unsigned int id, struct workload *wrk)
>  					continue;
>  				if (w->type == BATCH) {
>  					engine_classes[w->engine]++;
> -					/* update engine_idx */
> +					/* update engine_idx and request_idx */
>  					w->engine_idx = w->engine;
> +					w->request_idx = w->engine;
>  				}
>  			}
>  
> @@ -2730,7 +2737,6 @@ static void *run_workload(void *data)
>  		clock_gettime(CLOCK_MONOTONIC, &repeat_start);
>  
>  		for_each_w_step(w, wrk) {
> -			enum intel_engine_id engine = w->engine;
>  			int do_sleep = 0;
>  
>  			if (!wrk->run)
> @@ -2851,13 +2857,12 @@ static void *run_workload(void *data)
>  			else
>  				do_eb(wrk, w);
>  
> -			if (w->request != -1) {
> +			if (w->rq_link.next) {
>  				igt_list_del(&w->rq_link);
> -				wrk->nrequest[w->request]--;
> +				wrk->nrequest[w->request_idx]--;
>  			}
> -			w->request = engine;
> -			igt_list_add_tail(&w->rq_link, &wrk->requests[engine]);
> -			wrk->nrequest[engine]++;
> +			igt_list_add_tail(&w->rq_link, &wrk->requests[w->request_idx]);
> +			wrk->nrequest[w->request_idx]++;
>  
>  			if (!wrk->run)
>  				break;
> @@ -2866,17 +2871,16 @@ static void *run_workload(void *data)
>  				w_step_sync(w);
>  
>  			if (qd_throttle > 0) {
> -				while (wrk->nrequest[engine] > qd_throttle) {
> +				while (wrk->nrequest[w->request_idx] > qd_throttle) {
>  					struct w_step *s;
>  
> -					s = igt_list_first_entry(&wrk->requests[engine],
> +					s = igt_list_first_entry(&wrk->requests[w->request_idx],
>  								 s, rq_link);
>  
>  					w_step_sync(s);
>  
> -					s->request = -1;
>  					igt_list_del(&s->rq_link);
> -					wrk->nrequest[engine]--;
> +					wrk->nrequest[w->request_idx]--;
>  				}
>  			}
>  		}
> -- 
> 2.31.1
> 
