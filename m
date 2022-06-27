Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86AE11AA2C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 18:00:17 +0000 (UTC)
Date: Mon, 27 Jun 2022 20:00:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrnwLTqQ6PgqDGMY@kamilkon-desk1>
References: <20220627110801.30227-1-sai.gowtham.ch@intel.com>
 <20220627110801.30227-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220627110801.30227-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_sync: Added test
 description for test case.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2022-06-27 at 16:38:00 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Added test description for test and to all the subtests that are
> available.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_sync.c | 92 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 69 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 8c435845..8c9ad641 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -1208,32 +1208,60 @@ igt_main
>  			     int num_children, int timeout);
>  		int num_children;
>  		int timeout;
> +		const char *describe;
>  	} all[] = {
> -		{ "basic-each", sync_ring, 1, 2 },
> -		{ "basic-store-each", store_ring, 1, 2 },
> -		{ "basic-many-each", store_many, 0, 2 },
> -		{ "switch-each", switch_ring, 1, 20 },
> -		{ "forked-switch-each", switch_ring, ncpus, 20 },
> -		{ "forked-each", sync_ring, ncpus, 20 },
> -		{ "forked-store-each", store_ring, ncpus, 20 },
> -		{ "active-each", active_ring, 0, 20 },
> -		{ "wakeup-each", wakeup_ring, 20, 1 },
> -		{ "active-wakeup-each", active_wakeup_ring, 20, 1 },
> -		{ "double-wakeup-each", wakeup_ring, 20, 2 },
> +		{ "basic-each", sync_ring, 1, 2,
> +			"Check synchronisation of ring."},
------------------------------------------------------^ ^
Add space before '}' and remove dot (do it also on all following
lines). You may add dot later in igt_describe_f().

> +		{ "basic-store-each", store_ring, 1, 2,
> +			"Check that store synchronisation works."},
> +		{ "basic-many-each", store_many, 0, 2,
> +			"Try and create race condition see if we"

s/see/and see/

> +			" can catch interrupts."},
> +		{ "switch-each", switch_ring, 1, 20,
> +			"Check sync after context switch."},
> +		{ "forked-switch-each", switch_ring, ncpus, 20,
> +			"Check sync after context switch parallelly."},
> +		{ "forked-each", sync_ring, ncpus, 20,
> +			"Forked varient of sync_ring, which checks synchronisation"
------------------------------------^
s/varient/variant/

> +			" of ring with parallel executions."},
> +		{ "forked-store-each", store_ring, ncpus, 20,
> +			"Forked varient of store_ring, check parallel store"
------------------------------------^
s/varient/variant/
s/check/check if/

> +			" synchronisation works."},
> +		{ "active-each", active_ring, 0, 20,
> +			"Exercise waiting while keeping the GPU busy."},
> +		{ "wakeup-each", wakeup_ring, 20, 1,
> +			"Check Alternate stress for nop+sync."},
------------------------ ^
s/Check//
Also, s/nop+sync/nop + sync/

> +		{ "active-wakeup-each", active_wakeup_ring, 20, 1,
> +			"Measure wakeup latency while also scheduling the next batch."},
> +		{ "double-wakeup-each", wakeup_ring, 20, 2,
> +			"Stress test for nop+sync"},

What about moving this to wakeup-each, and change description
here into "Double stress test for nop + sync" ?

>  		{}
>  	}, individual[] = {
> -		{ "default", sync_ring, 1, 20 },
> -		{ "idle", idle_ring, 0, 20 },
> -		{ "active", active_ring, 0, 20 },
> -		{ "wakeup", wakeup_ring, 20, 1 },
> -		{ "active-wakeup", active_wakeup_ring, 20, 1 },
> -		{ "double-wakeup", wakeup_ring, 20, 2 },
> -		{ "store", store_ring, 1, 20 },
> -		{ "switch", switch_ring, 1, 20 },
> -		{ "forked-switch", switch_ring, ncpus, 20 },
> -		{ "many", store_many, 0, 20 },
> -		{ "forked", sync_ring, ncpus, 20 },
> -		{ "forked-store", store_ring, ncpus, 20 },
> +		{ "default", sync_ring, 1, 20,
> +			"Check synchronisation of rings for each engine."},
> +		{ "idle", idle_ring, 0, 20,
> +			"Exercise and measure idle requests."},
> +		{ "active", active_ring, 0, 20,
> +			"Exercise waiting while keeping the GPU busy."},
> +		{ "wakeup", wakeup_ring, 20, 1, 
---------------------------------------------- ^
Remove trailing space.
Please use checkpatch, it can help catch such errors.

> +			"Check Alternate stress for nop+sync."},
> +		{ "active-wakeup", active_wakeup_ring, 20, 1,
> +			"Measure wakeup latency while also scheduling the next batch."},
> +		{ "double-wakeup", wakeup_ring, 20, 2,
> +			"Stress test for nop + sync"},
> +		{ "store", store_ring, 1, 20,
> +			"Check that store synchronisation works."},
> +		{ "switch", switch_ring, 1, 20,
> +			"Check sync after context switch."},
> +		{ "forked-switch", switch_ring, ncpus, 20,
> +			"Check sync after context switch parallelly."},
> +		{ "many", store_many, 0, 20,
> +			"Try and create race condition and see if we catch interrupts."},
> +		{ "forked", sync_ring, ncpus, 20, 
------------------------------------------------ ^
Remove trailing space.

> +			"Check synchronisation of ring with parallel executions."},
> +		{ "forked-store", store_ring, ncpus, 20,
> +			"Check store synchronisation works with parallel multiple"
> +			" executions."},
>  		{}
>  	};
>  #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
> @@ -1255,6 +1283,7 @@ igt_main
>  
>  	/* Legacy for selecting rings. */
>  	for_each_test(t, individual) {
> +		igt_describe_f("For each legacy engine %s", t->describe);
------------------------------- ^
Put that after description, like: "%s for legacy engines."

>  		igt_subtest_with_dynamic_f("legacy-%s", t->name) {
>  			for (const struct intel_execution_ring *l = intel_execution_rings; l->name; l++) {
>  				igt_dynamic_f("%s", l->name) {
> @@ -1265,27 +1294,38 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Basic test to wait upon a batch on all rings.");
>  	igt_subtest("basic-all")
>  		sync_all(fd, ctx, 1, 2);
> +
> +	igt_describe("Extended version of store synchronisation test.");
>  	igt_subtest("basic-store-all")
>  		store_all(fd, ctx, 1, 2);
>  
> +	igt_describe("Extended version of existing basic-all test.");
>  	igt_subtest("all")
>  		sync_all(fd, ctx, 1, 20);
> +	igt_describe("Extended version of existing basic-store-all test.");
>  	igt_subtest("store-all")
>  		store_all(fd, ctx, 1, 20);
> +
> +	igt_describe("Parallel execution of batch on all rings and then wait.");
>  	igt_subtest("forked-all")
>  		sync_all(fd, ctx, ncpus, 20);
> +
> +	igt_describe("Parallel execution of store synchronisation.");
>  	igt_subtest("forked-store-all")
>  		store_all(fd, ctx, ncpus, 20);
>  
>  	for_each_test(t, all) {
> +		igt_describe(t->describe);

Here use igt_describe_f() and add dot at end.

>  		igt_subtest_f("%s", t->name)
>  			t->func(fd, ctx, ALL_ENGINES, t->num_children, t->timeout);
>  	}
>  
>  	/* New way of selecting engines. */
>  	for_each_test(t, individual) {
> +		igt_describe_f("For each engine %s", t->describe);
------------------------------- ^ --------------- ^
Drop this and add dot, you can use "%s." or
"%s on each engine." (see which one fits better).

Regards,
Kamil

>  		igt_subtest_with_dynamic_f("%s", t->name) {
>  			for_each_ctx_engine(fd, ctx, e) {
>  				igt_dynamic_f("%s", e->name) {
> @@ -1303,8 +1343,14 @@ igt_main
>  			igt_require(gem_scheduler_has_preemption(fd));
>  		}
>  
> +		igt_describe("Check and measure how well we can submit a second"
> +			     " high priority task when the engine is already"
> +			     " busy with a low priority task on all engines.");
>  		igt_subtest("preempt-all")
>  			preempt(fd, ctx, ALL_ENGINES, 1, 20);
> +
> +		igt_describe("For each context engine check how priority of task are"
> +			     " submitted when engine is already busy.");
>  		igt_subtest_with_dynamic("preempt") {
>  			for_each_ctx_engine(fd, ctx, e) {
>  				igt_dynamic_f("%s", e->name)
> -- 
> 2.35.1
> 
