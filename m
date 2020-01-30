Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <d295e6e3-7022-de90-ae9e-36ac2baeb750@linux.intel.com>
Date: Thu, 30 Jan 2020 20:44:57 +0000
MIME-Version: 1.0
In-Reply-To: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_persistence: Convert
 engine subtests to dynamic
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
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 30/01/2020 20:41, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Converts all per-engine tests into dynamic subtests and in the process:
> 
>   * Put back I915_EXEC_BSD legacy coverage.
>   * Remove one added static engine list usage.
>   * Compact code by driving two groups of the name/func table.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>   tests/i915/gem_ctx_persistence.c | 97 +++++++++++++-------------------
>   1 file changed, 39 insertions(+), 58 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 8b9633b214ff..0d5b22d2b162 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -759,7 +759,20 @@ static void smoketest(int i915)
>   
>   igt_main
>   {
> -	const struct intel_execution_engine2 *e;
> +	struct {
> +		const char *name;
> +		void (*func)(int fd, unsigned int engine);
> +	} *test, tests[] = {
> +		{ "persistence", test_persistence },
> +		{ "cleanup", test_nonpersistent_cleanup },
> +		{ "queued", test_nonpersistent_queued },
> +		{ "mixed", test_nonpersistent_mixed },
> +		{ "mixed-process", test_process_mixed },
> +		{ "hostile", test_nonpersistent_hostile },
> +		{ "hostile-preempt", test_nonpersistent_hostile_preempt },
> +		{ "hang", test_nonpersistent_hang },
> +		{ NULL, NULL },
> +	};
>   	int i915;
>   
>   	igt_fixture {
> @@ -792,72 +805,40 @@ igt_main
>   	igt_subtest("hang")
>   		test_nohangcheck_hang(i915);
>   
> -	__for_each_static_engine(e) {
> -		igt_subtest_group {
> -			igt_fixture {
> -				gem_require_ring(i915, e->flags);
> -				gem_require_contexts(i915);
> -			}
> -
> -			igt_subtest_f("legacy-%s-persistence", e->name)
> -				test_persistence(i915, e->flags);
> -
> -			igt_subtest_f("legacy-%s-cleanup", e->name)
> -				test_nonpersistent_cleanup(i915, e->flags);
> -
> -			igt_subtest_f("legacy-%s-queued", e->name)
> -				test_nonpersistent_queued(i915, e->flags);
> -
> -			igt_subtest_f("legacy-%s-mixed", e->name)
> -				test_nonpersistent_mixed(i915, e->flags);
> -
> -			igt_subtest_f("legacy-%s-mixed-process", e->name)
> -				test_process_mixed(i915, e->flags);
> -
> -			igt_subtest_f("legacy-%s-hostile", e->name)
> -				test_nonpersistent_hostile(i915, e->flags);
> +	igt_subtest("smoketest")
> +		smoketest(i915);
>   
> -			igt_subtest_f("legacy-%s-hostile-preempt", e->name)
> -				test_nonpersistent_hostile_preempt(i915,
> -								   e->flags);
> +	igt_subtest_group {
> +		igt_fixture
> +			gem_require_contexts(i915);
> +
> +		for (test = tests; test->name; test++) {
> +			igt_subtest_with_dynamic_f("legacy-engines-%s",
> +						   test->name) {
> +				for_each_engine(e, i915) {
> +					igt_dynamic_f("%s", e->name)
> +						test->func(i915, eb_ring(e));
> +				}
> +			}
>   		}
>   	}
>   
> -        __for_each_physical_engine(i915, e) {
> -                igt_subtest_group {
> -                        igt_fixture
> -                                gem_require_contexts(i915);
> -
> -			igt_subtest_f("%s-persistence", e->name)
> -				test_persistence(i915, e->flags);
> -
> -			igt_subtest_f("%s-cleanup", e->name)
> -				test_nonpersistent_cleanup(i915, e->flags);
> -
> -			igt_subtest_f("%s-queued", e->name)
> -				test_nonpersistent_queued(i915, e->flags);
> -
> -			igt_subtest_f("%s-mixed", e->name)
> -				test_nonpersistent_mixed(i915, e->flags);
> -
> -			igt_subtest_f("%s-mixed-process", e->name)
> -				test_process_mixed(i915, e->flags);
> +	igt_subtest_group {
> +		const struct intel_execution_engine2 *e;
>   
> -			igt_subtest_f("%s-hostile", e->name)
> -				test_nonpersistent_hostile(i915, e->flags);
> +		igt_fixture
> +			gem_require_contexts(i915);
>   
> -			igt_subtest_f("%s-hostile-preempt", e->name)
> -				test_nonpersistent_hostile_preempt(i915,
> -								   e->flags);
> -
> -			igt_subtest_f("%s-hang", e->name)
> -				test_nonpersistent_hang(i915, e->flags);
> +		for (test = tests; test->name; test++) {
> +			igt_subtest_with_dynamic_f("engines-%s", test->name) {
> +				__for_each_physical_engine(i915, e) {
> +					igt_dynamic_f("%s", e->name)
> +						test->func(i915, e->flags);
> +				}
> +			}
>   		}
>   	}
>   
> -	igt_subtest("smoketest")
> -		smoketest(i915);

I also moved this one to before the default context is configured with 
engine map, since it uses legacy for_each_physical_engine, and is 
therefore confused as to engine selection.

But perhaps better would be to leave it last and convert to 
__for_each_physical_engine. In the spirit of a smoke test is to exercise 
all engines after all.

Regards,

Tvrtko

> -
>   	igt_fixture {
>   		close(i915);
>   	}
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
