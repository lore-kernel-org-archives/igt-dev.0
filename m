Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA1F6EAAB
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 09:51:47 +0000 (UTC)
References: <20200124081339.10518-1-krishnaiah.bommu@intel.com>
 <20200124081339.10518-2-krishnaiah.bommu@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <3021b94f-7d4e-eef9-2474-5c4b334be067@linux.intel.com>
Date: Mon, 27 Jan 2020 09:48:30 +0000
MIME-Version: 1.0
In-Reply-To: <20200124081339.10518-2-krishnaiah.bommu@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/1] tests/i915/gem_ctx_persistence:
 Set context with supported engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 24/01/2020 08:13, Bommu Krishnaiah wrote:
> Update the context with supported engines on the platform with set_property
> I915_CONTEXT_PARAM_ENGINES to make sure the work load is submitted to
> the available engines only.
> 
> v2: addressed the review comments.
> v3: addressed v2 review comments.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   tests/i915/gem_ctx_persistence.c | 91 +++++++++++++++++++++-----------
>   1 file changed, 60 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index d68431ae..65c2b4f2 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -145,7 +145,18 @@ static void test_clone(int i915)
>   	gem_context_destroy(i915, clone);
>   }
>   
> -static void test_persistence(int i915, unsigned int engine)
> +static int create_context(int i915, bool persistent, bool set_engine_map)
> +{
> +        uint32_t ctx;
> +
> +        ctx = gem_context_create(i915);
> +        gem_context_set_persistence(i915, ctx, persistent);
> +        if (set_engine_map)
> +                gem_context_set_all_engines(i915, ctx);
> +        return ctx;

Can you respin using gem_context_clone_with_engines? You can drop the 
cool set_engine_map as well. Like:

static int create_context(int i915, bool persistent)
{
         uint32_t ctx;

         ctx = gem_context_clone_with_engines(i915, 0);
         gem_context_set_persistence(i915, ctx, persistent);

	return ctx;
}

Thanks,

Tvrtko

> +}
> +
> +static void test_persistence(int i915, unsigned int engine, bool set_engine_map)
>   {
>   	igt_spin_t *spin;
>   	int64_t timeout;
> @@ -156,8 +167,7 @@ static void test_persistence(int i915, unsigned int engine)
>   	 * request is retired -- no early termination.
>   	 */
>   
> -	ctx = gem_context_create(i915);
> -	gem_context_set_persistence(i915, ctx, true);
> +	ctx = create_context(i915, true, set_engine_map);
>   
>   	spin = igt_spin_new(i915, ctx,
>   			    .engine = engine,
> @@ -177,7 +187,7 @@ static void test_persistence(int i915, unsigned int engine)
>   	gem_quiescent_gpu(i915);
>   }
>   
> -static void test_nonpersistent_cleanup(int i915, unsigned int engine)
> +static void test_nonpersistent_cleanup(int i915, unsigned int engine, bool set_engine_map)
>   {
>   	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
>   	igt_spin_t *spin;
> @@ -188,8 +198,7 @@ static void test_nonpersistent_cleanup(int i915, unsigned int engine)
>   	 * any inflight request is cancelled.
>   	 */
>   
> -	ctx = gem_context_create(i915);
> -	gem_context_set_persistence(i915, ctx, false);
> +	ctx = create_context(i915, false, set_engine_map);
>   
>   	spin = igt_spin_new(i915, ctx,
>   			    .engine = engine,
> @@ -203,7 +212,7 @@ static void test_nonpersistent_cleanup(int i915, unsigned int engine)
>   	gem_quiescent_gpu(i915);
>   }
>   
> -static void test_nonpersistent_mixed(int i915, unsigned int engine)
> +static void test_nonpersistent_mixed(int i915, unsigned int engine, bool set_engine_map)
>   {
>   	int fence[3];
>   
> @@ -217,8 +226,7 @@ static void test_nonpersistent_mixed(int i915, unsigned int engine)
>   		igt_spin_t *spin;
>   		uint32_t ctx;
>   
> -		ctx = gem_context_create(i915);
> -		gem_context_set_persistence(i915, ctx, i & 1);
> +		ctx = create_context(i915, i & 1, set_engine_map);
>   
>   		spin = igt_spin_new(i915, ctx,
>   				    .engine = engine,
> @@ -241,7 +249,7 @@ static void test_nonpersistent_mixed(int i915, unsigned int engine)
>   	gem_quiescent_gpu(i915);
>   }
>   
> -static void test_nonpersistent_hostile(int i915, unsigned int engine)
> +static void test_nonpersistent_hostile(int i915, unsigned int engine, bool set_engine_map)
>   {
>   	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
>   	igt_spin_t *spin;
> @@ -253,8 +261,7 @@ static void test_nonpersistent_hostile(int i915, unsigned int engine)
>   	 * the requests and cleanup the context.
>   	 */
>   
> -	ctx = gem_context_create(i915);
> -	gem_context_set_persistence(i915, ctx, false);
> +	ctx = create_context(i915, false, set_engine_map);
>   
>   	spin = igt_spin_new(i915, ctx,
>   			    .engine = engine,
> @@ -267,7 +274,7 @@ static void test_nonpersistent_hostile(int i915, unsigned int engine)
>   	gem_quiescent_gpu(i915);
>   }
>   
> -static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
> +static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine, bool set_engine_map)
>   {
>   	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
>   	igt_spin_t *spin[2];
> @@ -284,8 +291,7 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
>   
>   	igt_require(gem_scheduler_has_preemption(i915));
>   
> -	ctx = gem_context_create(i915);
> -	gem_context_set_persistence(i915, ctx, true);
> +	ctx = create_context(i915, true, set_engine_map);
>   	gem_context_set_priority(i915, ctx, 0);
>   	spin[0] = igt_spin_new(i915, ctx,
>   			       .engine = engine,
> @@ -295,8 +301,7 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
>   
>   	igt_spin_busywait_until_started(spin[0]);
>   
> -	ctx = gem_context_create(i915);
> -	gem_context_set_persistence(i915, ctx, false);
> +	ctx = create_context(i915, false, set_engine_map);
>   	gem_context_set_priority(i915, ctx, 1); /* higher priority than 0 */
>   	spin[1] = igt_spin_new(i915, ctx,
>   			       .engine = engine,
> @@ -371,7 +376,7 @@ static void test_nonpersistent_file(int i915)
>   	igt_spin_free(-1, spin);
>   }
>   
> -static void test_nonpersistent_queued(int i915, unsigned int engine)
> +static void test_nonpersistent_queued(int i915, unsigned int engine, bool set_engine_map)
>   {
>   	const int count = gem_measure_ring_inflight(i915, engine, 0);
>   	igt_spin_t *spin;
> @@ -385,8 +390,7 @@ static void test_nonpersistent_queued(int i915, unsigned int engine)
>   
>   	gem_quiescent_gpu(i915);
>   
> -	ctx = gem_context_create(i915);
> -	gem_context_set_persistence(i915, ctx, false);
> +	ctx = create_context(i915, false, set_engine_map);
>   	spin = igt_spin_new(i915, ctx,
>   			    .engine = engine,
>   			    .flags = IGT_SPIN_FENCE_OUT);
> @@ -492,7 +496,7 @@ static void test_process(int i915)
>   	gem_quiescent_gpu(i915);
>   }
>   
> -static void test_process_mixed(int i915, unsigned int engine)
> +static void test_process_mixed(int i915, unsigned int engine, bool set_engine_map)
>   {
>   	int fence[2], sv[2];
>   
> @@ -512,8 +516,7 @@ static void test_process_mixed(int i915, unsigned int engine)
>   			igt_spin_t *spin;
>   			uint32_t ctx;
>   
> -			ctx = gem_context_create(i915);
> -			gem_context_set_persistence(i915, ctx, persists);
> +			ctx = create_context(i915, persists, set_engine_map);
>   
>   			spin = igt_spin_new(i915, ctx,
>   					    .engine = engine,
> @@ -727,7 +730,33 @@ igt_main
>   	igt_subtest("hangcheck")
>   		test_nohangcheck_hostile(i915);
>   
> -	__for_each_static_engine(e) {
> +	for_each_engine(e, i915) {
> +		igt_subtest_group {
> +			igt_fixture {
> +				gem_require_ring(i915, e->flags);
> +				gem_require_contexts(i915);
> +			}
> +
> +			igt_subtest_f("legacy-%s-persistence", e->name)
> +				test_persistence(i915, e->flags, 0);
> +			igt_subtest_f("legacy-%s-cleanup", e->name)
> +				test_nonpersistent_cleanup(i915, e->flags, 0);
> +			igt_subtest_f("legacy-%s-queued", e->name)
> +				test_nonpersistent_queued(i915, e->flags, 0);
> +			igt_subtest_f("legacy-%s-mixed", e->name)
> +				test_nonpersistent_mixed(i915, e->flags, 0);
> +			igt_subtest_f("legacy-%s-mixed-process", e->name)
> +				test_process_mixed(i915, e->flags, 0);
> +			igt_subtest_f("legacy-%s-hostile", e->name)
> +				test_nonpersistent_hostile(i915, e->flags, 0);
> +			igt_subtest_f("legacy-%s-hostile-preempt", e->name)
> +				test_nonpersistent_hostile_preempt(i915,
> +								   e->flags, 0);
> +		}
> +	}
> +
> +	__for_each_physical_engine(i915, e) {
> +		bool set_engine_map = gem_context_has_engine_map(i915, 0);
>   		igt_subtest_group {
>   			igt_fixture {
>   				gem_require_ring(i915, e->flags);
> @@ -735,26 +764,26 @@ igt_main
>   			}
>   
>   			igt_subtest_f("%s-persistence", e->name)
> -				test_persistence(i915, e->flags);
> +				test_persistence(i915, e->flags, set_engine_map);
>   
>   			igt_subtest_f("%s-cleanup", e->name)
> -				test_nonpersistent_cleanup(i915, e->flags);
> +				test_nonpersistent_cleanup(i915, e->flags, set_engine_map);
>   
>   			igt_subtest_f("%s-queued", e->name)
> -				test_nonpersistent_queued(i915, e->flags);
> +				test_nonpersistent_queued(i915, e->flags, set_engine_map);
>   
>   			igt_subtest_f("%s-mixed", e->name)
> -				test_nonpersistent_mixed(i915, e->flags);
> +				test_nonpersistent_mixed(i915, e->flags, set_engine_map);
>   
>   			igt_subtest_f("%s-mixed-process", e->name)
> -				test_process_mixed(i915, e->flags);
> +				test_process_mixed(i915, e->flags, set_engine_map);
>   
>   			igt_subtest_f("%s-hostile", e->name)
> -				test_nonpersistent_hostile(i915, e->flags);
> +				test_nonpersistent_hostile(i915, e->flags, set_engine_map);
>   
>   			igt_subtest_f("%s-hostile-preempt", e->name)
>   				test_nonpersistent_hostile_preempt(i915,
> -								   e->flags);
> +								   e->flags, set_engine_map);
>   		}
>   	}
>   
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
