Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E52A10E3BB
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 11:37:07 +0000 (UTC)
Message-ID: <14410f53-909b-21ba-6c18-ad602bc9e445@linux.intel.com>
Date: Tue, 26 Sep 2023 12:37:01 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-12-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230926084451.1732748-12-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 11/14] benchmarks/gem_wsim: introduce
 w_step_sync function
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
> Added w_step_sync function for workload step synchronization.
> Change will allow cleaner xe integration.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 0222c6c71..2c6ccd3a9 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -245,6 +245,11 @@ static const char *ring_str_map[NUM_ENGINES] = {
>   	[VECS] = "VECS",
>   };
>   
> +static void w_step_sync(struct w_step *w)
> +{
> +	gem_sync(fd, w->obj[0].handle);
> +}
> +
>   static int read_timestamp_frequency(int i915)
>   {
>   	int value = 0;
> @@ -2106,7 +2111,7 @@ static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
>   	igt_assert(target < wrk->nr_steps);
>   	igt_assert(wrk->steps[target].type == BATCH);
>   
> -	gem_sync(fd, wrk->steps[target].obj[0].handle);
> +	w_step_sync(&wrk->steps[target]);
>   }
>   
>   static void
> @@ -2165,7 +2170,7 @@ static void sync_deps(struct workload *wrk, struct w_step *w)
>   		igt_assert(dep_idx >= 0 && dep_idx < w->idx);
>   		igt_assert(wrk->steps[dep_idx].type == BATCH);
>   
> -		gem_sync(fd, wrk->steps[dep_idx].obj[0].handle);
> +		w_step_sync(&wrk->steps[dep_idx]);
>   	}
>   }
>   
> @@ -2219,7 +2224,7 @@ static void *run_workload(void *data)
>   
>   				igt_assert(s_idx >= 0 && s_idx < i);
>   				igt_assert(wrk->steps[s_idx].type == BATCH);
> -				gem_sync(fd, wrk->steps[s_idx].obj[0].handle);
> +				w_step_sync(&wrk->steps[s_idx]);
>   				continue;
>   			} else if (w->type == THROTTLE) {
>   				throttle = w->throttle;
> @@ -2310,7 +2315,7 @@ static void *run_workload(void *data)
>   				break;
>   
>   			if (w->sync)
> -				gem_sync(fd, w->obj[0].handle);
> +				w_step_sync(w);
>   
>   			if (qd_throttle > 0) {
>   				while (wrk->nrequest[engine] > qd_throttle) {
> @@ -2319,7 +2324,7 @@ static void *run_workload(void *data)
>   					s = igt_list_first_entry(&wrk->requests[engine],
>   								 s, rq_link);
>   
> -					gem_sync(fd, s->obj[0].handle);
> +						w_step_sync(s);

Indentation looks broken here.

Otherwise cleanup looks good so with this fixed:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

>   
>   					s->request = -1;
>   					igt_list_del(&s->rq_link);
> @@ -2351,7 +2356,7 @@ static void *run_workload(void *data)
>   			continue;
>   
>   		w = igt_list_last_entry(&wrk->requests[i], w, rq_link);
> -		gem_sync(fd, w->obj[0].handle);
> +		w_step_sync(w);
>   	}
>   
>   	clock_gettime(CLOCK_MONOTONIC, &t_end);
