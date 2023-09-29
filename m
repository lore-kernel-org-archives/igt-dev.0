Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE76B10E0F5
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Sep 2023 09:37:19 +0000 (UTC)
Message-ID: <fada7889-a763-4896-c54f-023e5ae02ffd@linux.intel.com>
Date: Fri, 29 Sep 2023 10:37:15 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
 <20230928174535.2074462-17-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230928174535.2074462-17-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 16/17] benchmarks/gem_wsim: for_each_dep
 macro
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


On 28/09/2023 18:45, Marcin Bernatowicz wrote:
> Utility macro to easy traverse dependencies.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 45 ++++++++++++++++++++++++-------------------
>   1 file changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index d22d66aeb..d447dced4 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -109,6 +109,10 @@ struct deps {
>   	struct dep_entry *list;
>   };
>   
> +#define for_each_dep(__dep, __deps) \
> +	for (int __i = 0; __i < __deps.nr && \
> +	     (__dep = &__deps.list[__i]); ++__i)
> +
>   struct w_arg {
>   	char *filename;
>   	char *desc;
> @@ -1150,8 +1154,10 @@ add_step:
>   	 * referencing them as a sync fence dependency.
>   	 */
>   	for (i = 0; i < nr_steps; i++) {
> -		for (j = 0; j < steps[i].fence_deps.nr; j++) {
> -			tmp = steps[i].idx + steps[i].fence_deps.list[j].target;
> +		struct dep_entry *dep;
> +
> +		for_each_dep(dep, steps[i].fence_deps) {
> +			tmp = steps[i].idx + dep->target;
>   			check_arg(tmp < 0 || tmp >= i ||
>   				  (steps[tmp].type != BATCH &&
>   				   steps[tmp].type != SW_FENCE),
> @@ -1478,9 +1484,9 @@ static void
>   alloc_step_batch(struct workload *wrk, struct w_step *w)
>   {
>   	enum intel_engine_id engine = w->engine;
> +	struct dep_entry *dep;
>   	unsigned int j = 0;
>   	unsigned int nr_obj = 2 + w->data_deps.nr;
> -	unsigned int i;
>   
>   	w->bb_size = 4096;
>   	w->i915.obj = calloc(nr_obj, sizeof(*w->i915.obj));
> @@ -1491,14 +1497,13 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>   	j++;
>   	igt_assert(j < nr_obj);
>   
> -	for (i = 0; i < w->data_deps.nr; i++) {
> -		struct dep_entry *entry = &w->data_deps.list[i];
> +	for_each_dep(dep, w->data_deps) {
>   		uint32_t dep_handle;
>   
> -		if (entry->working_set == -1) {
> -			int dep_idx = w->idx + entry->target;
> +		if (dep->working_set == -1) {
> +			int dep_idx = w->idx + dep->target;
>   
> -			igt_assert(entry->target <= 0);
> +			igt_assert(dep->target <= 0);
>   			igt_assert(dep_idx >= 0 && dep_idx < w->idx);
>   			igt_assert(wrk->steps[dep_idx].type == BATCH);
>   
> @@ -1506,19 +1511,19 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>   		} else {
>   			struct working_set *set;
>   
> -			igt_assert(entry->working_set <=
> +			igt_assert(dep->working_set <=
>   				   wrk->max_working_set_id);
>   
> -			set = wrk->working_sets[entry->working_set];
> +			set = wrk->working_sets[dep->working_set];
>   
>   			igt_assert(set->nr);
> -			igt_assert(entry->target < set->nr);
> -			igt_assert(set->sizes[entry->target].size);
> +			igt_assert(dep->target < set->nr);
> +			igt_assert(set->sizes[dep->target].size);
>   
> -			dep_handle = set->handles[entry->target];
> +			dep_handle = set->handles[dep->target];
>   		}
>   
> -		w->i915.obj[j].flags = entry->write ? EXEC_OBJECT_WRITE : 0;
> +		w->i915.obj[j].flags = dep->write ? EXEC_OBJECT_WRITE : 0;
>   		w->i915.obj[j].handle = dep_handle;
>   		j++;
>   		igt_assert(j < nr_obj);
> @@ -1713,8 +1718,8 @@ find_dep(struct dep_entry *deps, unsigned int nr, struct dep_entry dep)
>   static void measure_active_set(struct workload *wrk)
>   {
>   	unsigned long total = 0, batch_sizes = 0;
> -	struct dep_entry *deps = NULL;
> -	unsigned int nr = 0, i, j;
> +	struct dep_entry *dep, *deps = NULL;
> +	unsigned int nr = 0, i;
>   	struct w_step *w;
>   
>   	if (verbose < 3)
> @@ -1726,8 +1731,7 @@ static void measure_active_set(struct workload *wrk)
>   
>   		batch_sizes += w->bb_size;
>   
> -		for (j = 0; j < w->data_deps.nr; j++) {
> -			struct dep_entry *dep = &w->data_deps.list[j];
> +		for_each_dep(dep, w->data_deps) {
>   			struct dep_entry _dep = *dep;
>   
>   			if (dep->working_set == -1 && dep->target < 0) {
> @@ -2150,13 +2154,14 @@ static void w_sync_to(struct workload *wrk, struct w_step *w, int target)
>   static void
>   do_eb(struct workload *wrk, struct w_step *w, enum intel_engine_id engine)
>   {
> +	struct dep_entry *dep;
>   	unsigned int i;
>   
>   	eb_update_flags(wrk, w, engine);
>   	update_bb_start(wrk, w);
>   
> -	for (i = 0; i < w->fence_deps.nr; i++) {
> -		int tgt = w->idx + w->fence_deps.list[i].target;
> +	for_each_dep(dep, w->fence_deps) {
> +		int tgt = w->idx + dep->target;
>   
>   		/* TODO: fence merging needed to support multiple inputs */
>   		igt_assert(i == 0);

Smooth sailing.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin.com>

Regards,

Tvrtko
