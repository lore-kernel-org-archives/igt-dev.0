Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CF810E0C2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 11:19:43 +0000 (UTC)
Message-ID: <cb55a6e6-ec68-05b4-f209-4200ad794d0a@linux.intel.com>
Date: Fri, 6 Oct 2023 12:19:38 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231005185745.3056219-1-marcin.bernatowicz@linux.intel.com>
 <20231005185745.3056219-17-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231005185745.3056219-17-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 16/17] benchmarks/gem_wsim:
 for_each_w_step macro
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


On 05/10/2023 19:57, Marcin Bernatowicz wrote:
> for_each_w_step macro to easy traverse workload steps.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 80 +++++++++++++++++++++++--------------------
>   1 file changed, 42 insertions(+), 38 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 03a86b39c..e86519614 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -238,6 +238,10 @@ struct workload {
>   #define for_each_ctx(__ctx, __wrk) \
>   	for_each_ctx_ctx_idx(__ctx, __wrk, igt_unique(__ctx_idx))
>   
> +#define for_each_w_step(__w_step, __wrk) \
> +	for (typeof(__wrk->nr_steps) igt_unique(idx) = ({__w_step = __wrk->steps; 0; }); \
> +	     igt_unique(idx) < __wrk->nr_steps; igt_unique(idx)++, __w_step++)

Hm two igt_unique(idx) are on different lines - how does that work? 
Macro ends up on single line after the C pre-processor?

The rest looks good, a nice improvement in readability!

Regards,

Tvrtko

> +
>   static unsigned int master_prng;
>   
>   static int verbose = 1;
> @@ -1183,14 +1187,14 @@ add_step:
>   	/*
>   	 * Check no duplicate working set ids.
>   	 */
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		struct w_step *w2;
>   
>   		if (w->type != WORKINGSET)
>   			continue;
>   
> -		for (j = 0, w2 = wrk->steps; j < wrk->nr_steps; w2++, j++) {
> -			if (j == i)
> +		for_each_w_step(w2, wrk) {
> +			if (w->idx == w2->idx)
>   				continue;
>   			if (w2->type != WORKINGSET)
>   				continue;
> @@ -1203,7 +1207,7 @@ add_step:
>   	/*
>   	 * Allocate shared working sets.
>   	 */
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		if (w->type == WORKINGSET && w->working_set.shared) {
>   			unsigned long total =
>   				allocate_working_set(wrk, &w->working_set);
> @@ -1215,7 +1219,7 @@ add_step:
>   	}
>   
>   	wrk->max_working_set_id = -1;
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		if (w->type == WORKINGSET &&
>   		    w->working_set.shared &&
>   		    w->working_set.id > wrk->max_working_set_id)
> @@ -1226,7 +1230,7 @@ add_step:
>   				   sizeof(*wrk->working_sets));
>   	igt_assert(wrk->working_sets);
>   
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		if (w->type == WORKINGSET && w->working_set.shared)
>   			wrk->working_sets[w->working_set.id] = &w->working_set;
>   	}
> @@ -1238,6 +1242,7 @@ static struct workload *
>   clone_workload(struct workload *_wrk)
>   {
>   	struct workload *wrk;
> +	struct w_step *w;
>   	int i;
>   
>   	wrk = malloc(sizeof(*wrk));
> @@ -1265,8 +1270,8 @@ clone_workload(struct workload *_wrk)
>   	}
>   
>   	/* Check if we need a sw sync timeline. */
> -	for (i = 0; i < wrk->nr_steps; i++) {
> -		if (wrk->steps[i].type == SW_FENCE) {
> +	for_each_w_step(w, wrk) {
> +		if (w->type == SW_FENCE) {
>   			wrk->sync_timeline = sw_sync_timeline_create();
>   			igt_assert(wrk->sync_timeline >= 0);
>   			break;
> @@ -1722,13 +1727,13 @@ static void measure_active_set(struct workload *wrk)
>   {
>   	unsigned long total = 0, batch_sizes = 0;
>   	struct dep_entry *dep, *deps = NULL;
> -	unsigned int nr = 0, i;
> +	unsigned int nr = 0;
>   	struct w_step *w;
>   
>   	if (verbose < 3)
>   		return;
>   
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		if (w->type != BATCH)
>   			continue;
>   
> @@ -1781,12 +1786,11 @@ static void allocate_contexts(unsigned int id, struct workload *wrk)
>   {
>   	int max_ctx = -1;
>   	struct w_step *w;
> -	int i;
>   
>   	/*
>   	 * Pre-scan workload steps to allocate context list storage.
>   	 */
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		int ctx = w->context + 1;
>   		int delta;
>   
> @@ -1812,13 +1816,13 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>   	uint32_t share_vm = 0;
>   	struct w_step *w;
>   	struct ctx *ctx, *ctx2;
> -	unsigned int i, j;
> +	unsigned int j;
>   
>   	/*
>   	 * Transfer over engine map configuration from the workload step.
>   	 */
>   	for_each_ctx_ctx_idx(ctx, wrk, ctx_idx) {
> -		for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +		for_each_w_step(w, wrk) {
>   			if (w->context != ctx_idx)
>   				continue;
>   
> @@ -1985,12 +1989,11 @@ static void prepare_working_sets(unsigned int id, struct workload *wrk)
>   	struct working_set **sets;
>   	unsigned long total = 0;
>   	struct w_step *w;
> -	int i;
>   
>   	/*
>   	 * Allocate working sets.
>   	 */
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		if (w->type == WORKINGSET && !w->working_set.shared)
>   			total += allocate_working_set(wrk, &w->working_set);
>   	}
> @@ -2002,7 +2005,7 @@ static void prepare_working_sets(unsigned int id, struct workload *wrk)
>   	 * Map of working set ids.
>   	 */
>   	wrk->max_working_set_id = -1;
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		if (w->type == WORKINGSET &&
>   		    w->working_set.id > wrk->max_working_set_id)
>   			wrk->max_working_set_id = w->working_set.id;
> @@ -2013,7 +2016,7 @@ static void prepare_working_sets(unsigned int id, struct workload *wrk)
>   				   sizeof(*wrk->working_sets));
>   	igt_assert(wrk->working_sets);
>   
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		struct working_set *set;
>   
>   		if (w->type != WORKINGSET)
> @@ -2039,7 +2042,6 @@ static void prepare_working_sets(unsigned int id, struct workload *wrk)
>   static int prepare_workload(unsigned int id, struct workload *wrk)
>   {
>   	struct w_step *w;
> -	int i, j;
>   	int ret = 0;
>   
>   	wrk->id = id;
> @@ -2054,23 +2056,22 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
>   		return ret;
>   
>   	/* Record default preemption. */
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk)
>   		if (w->type == BATCH)
>   			w->preempt_us = 100;
> -	}
>   
>   	/*
>   	 * Scan for contexts with modified preemption config and record their
>   	 * preemption period for the following steps belonging to the same
>   	 * context.
>   	 */
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		struct w_step *w2;
>   
>   		if (w->type != PREEMPTION)
>   			continue;
>   
> -		for (j = i + 1; j < wrk->nr_steps; j++) {
> +		for (int j = w->idx + 1; j < wrk->nr_steps; j++) {
>   			w2 = &wrk->steps[j];
>   
>   			if (w2->context != w->context)
> @@ -2087,7 +2088,7 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
>   	/*
>   	 * Scan for SSEU control steps.
>   	 */
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		if (w->type == SSEU) {
>   			get_device_sseu();
>   			break;
> @@ -2099,7 +2100,7 @@ static int prepare_workload(unsigned int id, struct workload *wrk)
>   	/*
>   	 * Allocate batch buffers.
>   	 */
> -	for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
> +	for_each_w_step(w, wrk) {
>   		if (w->type != BATCH)
>   			continue;
>   
> @@ -2223,7 +2224,6 @@ static void *run_workload(void *data)
>   	int qd_throttle = -1;
>   	int count, missed = 0;
>   	unsigned long time_tot = 0, time_min = ULONG_MAX, time_max = 0;
> -	int i;
>   
>   	clock_gettime(CLOCK_MONOTONIC, &t_start);
>   
> @@ -2233,11 +2233,13 @@ static void *run_workload(void *data)
>   
>   		clock_gettime(CLOCK_MONOTONIC, &repeat_start);
>   
> -		for (i = 0, w = wrk->steps; wrk->run && (i < wrk->nr_steps);
> -		     i++, w++) {
> +		for_each_w_step(w, wrk) {
>   			enum intel_engine_id engine = w->engine;
>   			int do_sleep = 0;
>   
> +			if (!wrk->run)
> +				break;
> +
>   			if (w->type == DELAY) {
>   				do_sleep = w->delay;
>   			} else if (w->type == PERIOD) {
> @@ -2256,13 +2258,13 @@ static void *run_workload(void *data)
>   					missed++;
>   					if (verbose > 2)
>   						printf("%u: Dropped period @ %u/%u (%dus late)!\n",
> -						       wrk->id, count, i, do_sleep);
> +						       wrk->id, count, w->idx, do_sleep);
>   					continue;
>   				}
>   			} else if (w->type == SYNC) {
> -				unsigned int s_idx = i + w->target;
> +				unsigned int s_idx = w->idx + w->target;
>   
> -				igt_assert(s_idx >= 0 && s_idx < i);
> +				igt_assert(s_idx >= 0 && s_idx < w->idx);
>   				igt_assert(wrk->steps[s_idx].type == BATCH);
>   				w_step_sync(&wrk->steps[s_idx]);
>   				continue;
> @@ -2283,7 +2285,7 @@ static void *run_workload(void *data)
>   				int tgt = w->idx + w->target;
>   				int inc;
>   
> -				igt_assert(tgt >= 0 && tgt < i);
> +				igt_assert(tgt >= 0 && tgt < w->idx);
>   				igt_assert(wrk->steps[tgt].type == SW_FENCE);
>   				cur_seqno += wrk->steps[tgt].idx;
>   				inc = cur_seqno - wrk->sync_seqno;
> @@ -2303,9 +2305,9 @@ static void *run_workload(void *data)
>   				}
>   				continue;
>   			} else if (w->type == TERMINATE) {
> -				unsigned int t_idx = i + w->target;
> +				unsigned int t_idx = w->idx + w->target;
>   
> -				igt_assert(t_idx >= 0 && t_idx < i);
> +				igt_assert(t_idx >= 0 && t_idx < w->idx);
>   				igt_assert(wrk->steps[t_idx].type == BATCH);
>   				igt_assert(wrk->steps[t_idx].duration.unbound);
>   
> @@ -2339,7 +2341,7 @@ static void *run_workload(void *data)
>   				sync_deps(wrk, w);
>   
>   			if (throttle > 0)
> -				w_sync_to(wrk, w, i - throttle);
> +				w_sync_to(wrk, w, w->idx - throttle);
>   
>   			do_eb(wrk, w, engine);
>   
> @@ -2382,8 +2384,10 @@ static void *run_workload(void *data)
>   		}
>   
>   		/* Cleanup all fences instantiated in this iteration. */
> -		for (i = 0, w = wrk->steps; wrk->run && (i < wrk->nr_steps);
> -		     i++, w++) {
> +		for_each_w_step(w, wrk) {
> +			if (!wrk->run)
> +				break;
> +
>   			if (w->emit_fence > 0) {
>   				close(w->emit_fence);
>   				w->emit_fence = -1;
> @@ -2391,7 +2395,7 @@ static void *run_workload(void *data)
>   		}
>   	}
>   
> -	for (i = 0; i < NUM_ENGINES; i++) {
> +	for (int i = 0; i < NUM_ENGINES; i++) {
>   		if (!wrk->nrequest[i])
>   			continue;
>   
