Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6045510E39B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 10:24:04 +0000 (UTC)
Message-ID: <2889f03f-9649-1455-c89f-19cc63c58226@linux.intel.com>
Date: Tue, 26 Sep 2023 11:23:58 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-3-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230926084451.1732748-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 02/14] benchmarks/gem_wsim: reposition
 the unbound duration boolean
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 26/09/2023 09:44, Marcin Bernatowicz wrote:
> All duration info is now in struct duration of w_step.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 7b5e62a3b..90a36f7de 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -73,6 +73,7 @@ enum intel_engine_id {
>   
>   struct duration {
>   	unsigned int min, max;
> +	bool unbound_duration;

I guess '_duration' suffix is now redundant so with it removed:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

P.S. I trust the patch is useful for later in the series, haven't gotten 
that far yet.

>   };
>   
>   enum w_type
> @@ -145,7 +146,6 @@ struct w_step
>   	unsigned int context;
>   	unsigned int engine;
>   	struct duration duration;
> -	bool unbound_duration;
>   	struct deps data_deps;
>   	struct deps fence_deps;
>   	int emit_fence;
> @@ -1130,7 +1130,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>   				check_arg(intel_gen(intel_get_drm_devid(fd)) < 8,
>   					  "Infinite batch at step %u needs Gen8+!\n",
>   					  nr_steps);
> -				step.unbound_duration = true;
> +				step.duration.unbound_duration = true;
>   			} else {
>   				tmpl = strtol(field, &sep, 10);
>   				check_arg(tmpl <= 0 || tmpl == LONG_MIN ||
> @@ -2172,8 +2172,8 @@ update_bb_start(struct workload *wrk, struct w_step *w)
>   
>   	/* ticks is inverted for MI_DO_COMPARE (less-than comparison) */
>   	ticks = 0;
> -	if (!w->unbound_duration)
> -		ticks = ~ns_to_ctx_ticks(1000 * get_duration(wrk, w));
> +	if (!w->duration.unbound_duration)
> +		ticks = ~ns_to_ctx_ticks(1000LL * get_duration(wrk, w));
>   
>   	*w->bb_duration = ticks;
>   }
> @@ -2349,7 +2349,7 @@ static void *run_workload(void *data)
>   
>   				igt_assert(t_idx >= 0 && t_idx < i);
>   				igt_assert(wrk->steps[t_idx].type == BATCH);
> -				igt_assert(wrk->steps[t_idx].unbound_duration);
> +				igt_assert(wrk->steps[t_idx].duration.unbound_duration);
>   
>   				*wrk->steps[t_idx].bb_duration = 0xffffffff;
>   				__sync_synchronize();
