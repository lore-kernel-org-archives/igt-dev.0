Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A09E6ED5E
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 09:41:29 +0000 (UTC)
References: <20200128091217.27112-1-krishnaiah.bommu@intel.com>
 <20200128091217.27112-2-krishnaiah.bommu@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <2588e3fd-19ea-6cae-075b-33c4929f6ea2@linux.intel.com>
Date: Tue, 28 Jan 2020 09:41:25 +0000
MIME-Version: 1.0
In-Reply-To: <20200128091217.27112-2-krishnaiah.bommu@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/1] tests/i915/gem_ctx_persistence:
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


On 28/01/2020 09:12, Bommu Krishnaiah wrote:
> Update the context with supported engines on the platform with set_property
> I915_CONTEXT_PARAM_ENGINES to make sure the work load is submitted to
> the available engines only.
> 
> v2: addressed the review comments.
> v3: addressed v2 review comments.
> V4: Re-introduced the gem_context_set_all_engines() API,test_process_mixed()
> test creating new forked process, to set engine map to new forked process
> I added gem_context_set_all_engines() API.

I can remember two emails where I explained how we deliberately removed 
gem_context_set_all_engines and how gem_context_clone_with_engines 
should be used instead. Including a code sketch.

Regards,

Tvrtko

> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   lib/i915/gem_engine_topology.c   | 11 +++++++
>   lib/i915/gem_engine_topology.h   |  2 ++
>   tests/i915/gem_ctx_persistence.c | 52 ++++++++++++++++++++++++++------
>   3 files changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index 43a99e0f..ed6737ef 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -274,6 +274,17 @@ int gem_context_lookup_engine(int fd, uint64_t engine, uint32_t ctx_id,
>   	return 0;
>   }
>   
> +void gem_context_set_all_engines(int fd, uint32_t ctx)
> +{
> +        DEFINE_CONTEXT_ENGINES_PARAM(engines, param, ctx, GEM_MAX_ENGINES);
> +        struct intel_engine_data engine_data = { };
> +
> +        if (!gem_topology_get_param(fd, &param) && !param.size) {
> +                query_engine_list(fd, &engine_data);
> +                ctx_map_engines(fd, &engine_data, &param);
> +        }
> +}
> +
>   bool gem_has_engine_topology(int fd)
>   {
>   	struct drm_i915_gem_context_param param = {
> diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
> index e40d7ec8..525741cc 100644
> --- a/lib/i915/gem_engine_topology.h
> +++ b/lib/i915/gem_engine_topology.h
> @@ -51,6 +51,8 @@ void intel_next_engine(struct intel_engine_data *ed);
>   int gem_context_lookup_engine(int fd, uint64_t engine, uint32_t ctx_id,
>   			      struct intel_execution_engine2 *e);
>   
> +void gem_context_set_all_engines(int fd, uint32_t ctx);
> +
>   bool gem_context_has_engine_map(int fd, uint32_t ctx);
>   
>   bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index d68431ae..4e1004c8 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -156,7 +156,7 @@ static void test_persistence(int i915, unsigned int engine)
>   	 * request is retired -- no early termination.
>   	 */
>   
> -	ctx = gem_context_create(i915);
> +	ctx = gem_context_clone_with_engines(i915, 0);
>   	gem_context_set_persistence(i915, ctx, true);
>   
>   	spin = igt_spin_new(i915, ctx,
> @@ -188,7 +188,7 @@ static void test_nonpersistent_cleanup(int i915, unsigned int engine)
>   	 * any inflight request is cancelled.
>   	 */
>   
> -	ctx = gem_context_create(i915);
> +	ctx = gem_context_clone_with_engines(i915, 0);
>   	gem_context_set_persistence(i915, ctx, false);
>   
>   	spin = igt_spin_new(i915, ctx,
> @@ -217,7 +217,7 @@ static void test_nonpersistent_mixed(int i915, unsigned int engine)
>   		igt_spin_t *spin;
>   		uint32_t ctx;
>   
> -		ctx = gem_context_create(i915);
> +		ctx = gem_context_clone_with_engines(i915, 0);
>   		gem_context_set_persistence(i915, ctx, i & 1);
>   
>   		spin = igt_spin_new(i915, ctx,
> @@ -253,7 +253,7 @@ static void test_nonpersistent_hostile(int i915, unsigned int engine)
>   	 * the requests and cleanup the context.
>   	 */
>   
> -	ctx = gem_context_create(i915);
> +	ctx = gem_context_clone_with_engines(i915, 0);
>   	gem_context_set_persistence(i915, ctx, false);
>   
>   	spin = igt_spin_new(i915, ctx,
> @@ -284,7 +284,7 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
>   
>   	igt_require(gem_scheduler_has_preemption(i915));
>   
> -	ctx = gem_context_create(i915);
> +	ctx = gem_context_clone_with_engines(i915, 0);
>   	gem_context_set_persistence(i915, ctx, true);
>   	gem_context_set_priority(i915, ctx, 0);
>   	spin[0] = igt_spin_new(i915, ctx,
> @@ -295,7 +295,7 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
>   
>   	igt_spin_busywait_until_started(spin[0]);
>   
> -	ctx = gem_context_create(i915);
> +	ctx = gem_context_clone_with_engines(i915, 0);
>   	gem_context_set_persistence(i915, ctx, false);
>   	gem_context_set_priority(i915, ctx, 1); /* higher priority than 0 */
>   	spin[1] = igt_spin_new(i915, ctx,
> @@ -385,7 +385,7 @@ static void test_nonpersistent_queued(int i915, unsigned int engine)
>   
>   	gem_quiescent_gpu(i915);
>   
> -	ctx = gem_context_create(i915);
> +	ctx = gem_context_clone_with_engines(i915, 0);
>   	gem_context_set_persistence(i915, ctx, false);
>   	spin = igt_spin_new(i915, ctx,
>   			    .engine = engine,
> @@ -512,7 +512,8 @@ static void test_process_mixed(int i915, unsigned int engine)
>   			igt_spin_t *spin;
>   			uint32_t ctx;
>   
> -			ctx = gem_context_create(i915);
> +			ctx = gem_context_clone_with_engines(i915, 0);
> +			gem_context_set_all_engines(i915, ctx);
>   			gem_context_set_persistence(i915, ctx, persists);
>   
>   			spin = igt_spin_new(i915, ctx,
> @@ -727,13 +728,44 @@ igt_main
>   	igt_subtest("hangcheck")
>   		test_nohangcheck_hostile(i915);
>   
> -	__for_each_static_engine(e) {
> +	for_each_engine(e, i915) {
>   		igt_subtest_group {
>   			igt_fixture {
>   				gem_require_ring(i915, e->flags);
>   				gem_require_contexts(i915);
>   			}
>   
> +			igt_subtest_f("legacy-%s-persistence", e->name)
> +				test_persistence(i915, e->flags);
> +
> +			igt_subtest_f("legacy-%s-cleanup", e->name)
> +				test_nonpersistent_cleanup(i915, e->flags);
> +
> +			igt_subtest_f("legacy-%s-queued", e->name)
> +				test_nonpersistent_queued(i915, e->flags);
> +
> +			igt_subtest_f("legacy-%s-mixed", e->name)
> +				test_nonpersistent_mixed(i915, e->flags);
> +
> +			igt_subtest_f("legacy-%s-mixed-process", e->name)
> +				test_process_mixed(i915, e->flags);
> +
> +			igt_subtest_f("legacy-%s-hostile", e->name)
> +				test_nonpersistent_hostile(i915, e->flags);
> +
> +			igt_subtest_f("legacy-%s-hostile-preempt", e->name)
> +				test_nonpersistent_hostile_preempt(i915,
> +								   e->flags);
> +		}
> +	}
> +
> +        __for_each_physical_engine(i915, e) {
> +                igt_subtest_group {
> +                        igt_fixture {
> +                                gem_require_ring(i915, e->flags);
> +                                gem_require_contexts(i915);
> +                        }
> +
>   			igt_subtest_f("%s-persistence", e->name)
>   				test_persistence(i915, e->flags);
>   
> @@ -753,7 +785,7 @@ igt_main
>   				test_nonpersistent_hostile(i915, e->flags);
>   
>   			igt_subtest_f("%s-hostile-preempt", e->name)
> -				test_nonpersistent_hostile_preempt(i915,
> +				test_nonpersistent_hostile_preempt(i915,
>   								   e->flags);
>   		}
>   	}
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
