Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22A0CCA476
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 16:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6444810E6ED;
	Tue,  7 Oct 2025 16:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PT24MJNS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB71A10E6ED
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759854139; x=1791390139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ba5zvEu3pHeNvANjP0bs4jJk5o8x+vWBx6GxMG5vios=;
 b=PT24MJNSag9u3z3AcnZrkH6qeJOxYeLQX7ABewXkFs0S1RpZwCDi2Fta
 HOIvpOtwtZX8Dx0IjkewH0BcGedfmJJyYb18QNV2GBSWKsIEgqvxXIawh
 l/cOjcNee3TVJ9eFcyc3U9VvvwUrCUUSC4RR0jd0FPrvUXBw/VtbHV7Oz
 PNsrbll+SGlhnlCPg2vPXnbFVCL3ryl01F0/QHQhP2jsWfhS0H06hnb5r
 ICfhbhO3FSf2bv8S+XxgeAR7l2bxc4yfNgYNCsTyOa9Ih2ifob1v6YNje
 pzSelsVgOiEjr3WyWh7TdwoOibJ6iE0hdUknMTcVBNW+OTInj+HTOEwJq g==;
X-CSE-ConnectionGUID: XHHWBh8CSCOONiKOcwOKLA==
X-CSE-MsgGUID: LuP4+WTiT+yJnz8yO8+haw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="72653722"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="72653722"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 09:22:18 -0700
X-CSE-ConnectionGUID: 4dg7JqzmSvqSgM18CAda5w==
X-CSE-MsgGUID: CKdgwzTmS36BxA+wJefjIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184229431"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 09:22:17 -0700
Date: Tue, 7 Oct 2025 18:22:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t 2/2] benchmarks/gem_wsim: Verify Xe spinner batch
 completion
Message-ID: <20251007162214.j7xw45flw5tcwbv4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250924110607.563913-1-marcin.bernatowicz@linux.intel.com>
 <20250924110607.563913-3-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250924110607.563913-3-marcin.bernatowicz@linux.intel.com>
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
On 2025-09-24 at 13:06:07 +0200, Marcin Bernatowicz wrote:
> Introduce an opt-in post-sync check for bounded Xe BATCH steps to
> detect premature finishes. Store the per-step requested_ticks and, when
> -V is set, assert after sync that completion did not occur early.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  benchmarks/gem_wsim.c | 41 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 098415b53..bebb59f28 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -110,6 +110,7 @@ static const char *intel_engine_class_string(uint16_t engine_class)
>  struct duration {
>  	unsigned int min, max;
>  	bool unbound;
> +	uint32_t requested_ticks;

Looks simple but is it safe to have uint32 here?

Otherwise looks good, if above is not a problem
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  };
>  
>  enum w_type {
> @@ -325,6 +326,7 @@ static struct drm_i915_gem_context_param_sseu device_sseu = {
>  #define FLAG_SYNCEDCLIENTS	(1<<1)
>  #define FLAG_DEPSYNC		(1<<2)
>  #define FLAG_SSEU		(1<<3)
> +#define FLAG_VERIFY_COMPLETION	(1 << 4)
>  
>  static void w_step_sync(struct w_step *w)
>  {
> @@ -1796,10 +1798,12 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
>  						    0, ALLOC_STRATEGY_LOW_TO_HIGH);
>  	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, w->bb_size);
> -	xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
> -				   .preempt = (w->preempt_us > 0),
> -				   .ctx_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
> -								      1000LL * get_duration(wrk, w)));
> +	w->duration.requested_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
> +							    1000LL * get_duration(wrk, w));
> +	xe_spin_init_opts(&w->xe.data->spin,
> +			  .addr = w->xe.exec.address,
> +			  .preempt = (w->preempt_us > 0),
> +			  .ctx_ticks = w->duration.requested_ticks);
>  	w->xe.exec.exec_queue_id = eq->id;
>  	w->xe.exec.num_batch_buffer = 1;
>  	/* always at least one out fence */
> @@ -2652,15 +2656,30 @@ static void do_xe_exec(struct workload *wrk, struct w_step *w)
>  		syncobj_reset(fd, &w->xe.syncs[0].handle, 1);
>  
>  	/* update duration if random */
> -	if (w->duration.max != w->duration.min)
> +	if (w->duration.max != w->duration.min) {
> +		w->duration.requested_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
> +								    1000LL * get_duration(wrk, w));
>  		xe_spin_init_opts(&w->xe.data->spin,
>  				  .addr = w->xe.exec.address,
>  				  .preempt = (w->preempt_us > 0),
> -				  .ctx_ticks = xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
> -								     1000LL * get_duration(wrk, w)));
> +				  .ctx_ticks = w->duration.requested_ticks);
> +	}
>  	xe_exec(fd, &w->xe.exec);
>  }
>  
> +static void xe_w_step_sync_and_verify(struct w_step *w)
> +{
> +	if (!is_xe && w->type != BATCH)
> +		return;
> +
> +	w_step_sync(w);
> +
> +	if (!w->duration.unbound) {
> +		igt_assert(w->duration.requested_ticks && w->xe.data->spin.ticks_delta);
> +		igt_assert_lte(w->duration.requested_ticks, ~w->xe.data->spin.ticks_delta);
> +	}
> +}
> +
>  static void
>  do_eb(struct workload *wrk, struct w_step *w)
>  {
> @@ -2910,6 +2929,9 @@ static void *run_workload(void *data)
>  				close(w->emit_fence);
>  				w->emit_fence = -1;
>  			}
> +
> +			if (wrk->flags & FLAG_VERIFY_COMPLETION)
> +				xe_w_step_sync_and_verify(w);
>  		}
>  	}
>  
> @@ -3108,7 +3130,7 @@ int main(int argc, char **argv)
>  	master_prng = time(NULL);
>  
>  	while ((c = getopt(argc, argv,
> -			   "LlhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
> +			   "LlhqvVsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
>  		switch (c) {
>  		case 'L':
>  			list_devices_arg = true;
> @@ -3153,6 +3175,9 @@ int main(int argc, char **argv)
>  		case 'v':
>  			verbose++;
>  			break;
> +		case 'V':
> +			flags |= FLAG_VERIFY_COMPLETION;
> +			break;
>  		case 'S':
>  			flags |= FLAG_SYNCEDCLIENTS;
>  			break;
> -- 
> 2.31.1
> 
