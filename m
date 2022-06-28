Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABA811B645
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 18:20:54 +0000 (UTC)
Date: Tue, 28 Jun 2022 20:20:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrtGg1tuxbtllvGP@kamilkon-desk1>
References: <20220614052420.2453118-1-janga.rahul.kumar@intel.com>
 <20220614052420.2453118-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614052420.2453118-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/i915/gem_exec_fence : Added
 subtests description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

On 2022-06-14 at 10:54:19 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Added test description to basic subtests.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/i915/gem_exec_fence.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index b7ce425d..7de639d1 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -3012,8 +3012,15 @@ igt_main
>  			igt_fork_hang_detector(i915);
>  		}
>  
> +		igt_describe("Execute same batch on all engines and check that the composite fence "
----------------------------- ^ --------------------------------- ^
You do not need to write this.

> +			     "across all engines completes only after the batch is completed on "
> +			     "every engine.");

You do not need to explicitly write down about every line of
code (also it has some value in it), it's better to describe
what is purpose of subtest, maybe use something like
"Basic check for composite fence on all busy engines."

>  		igt_subtest("basic-busy-all")
>  			test_fence_busy_all(i915, ctx, 0);
> +
> +		igt_describe("Execute same batch on all engines and check that the composite fence "
----------------------------- ^ --------------------------------- ^
Same here.

> +			     "with additional wait across all engines completes only after the "
> +			     "batch is completed on every engine.");

This is too long, please change this.

>  		igt_subtest("basic-wait-all")
>  			test_fence_busy_all(i915, ctx, WAIT);
>  
> @@ -3022,8 +3029,15 @@ igt_main
>  			hang = igt_allow_hang(i915, ctx->id, 0);
>  		}
>  
> +		igt_describe("Execute same batch which causes hang on all engines and check that "
----------------------------- ^ --------------------------------- ^
Same here.

> +			     "the composite fence across all engines completes only after the "
> +			     "batch is completed on every engine.");

It is unclear, how hanged engine can complete ?

>  		igt_subtest("busy-hang-all")
>  			test_fence_busy_all(i915, ctx, HANG);
> +
> +		igt_describe("Execute same batch which causes hang on all engines and check that "
----------------------------- ^ --------------------------------- ^
Same here.

> +			     "the composite fence with additional wait across all engines "
> +			     "completes only after the batch is completed on every engine.");
>  		igt_subtest("wait-hang-all")
>  			test_fence_busy_all(i915, ctx, WAIT | HANG);
>  
> @@ -3044,24 +3058,37 @@ igt_main
>  				intel_allocator_multiprocess_start();
>  			}
>  
> +			igt_describe("Check execbuf2 explicit fencing support.");
------------------------------------------- ^
Drop this, add also "Basic" at begin, 
so s/Check execbuf2/Basic check of/
Put also "busy" word in description.

>  			igt_subtest_with_dynamic("basic-busy") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
>  						test_fence_busy(i915, ctx, e, 0);
>  				}
>  			}
> +

Remove one empty line from here.

> +
> +			igt_describe("Check execbuf2 explicit fencing support with "
> +				     "additinal wait time.");
>  			igt_subtest_with_dynamic("basic-wait") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
>  						test_fence_busy(i915, ctx, e, WAIT);
>  				}
>  			}
> +

Remove one empty line from here.

> +
> +			igt_describe("Check execbuf2 fencing support in parallel "
------------------------------------------- ^
Same here.
await = async wait (or async waiting)

> +				     "execution scenarios with waiting time.");
>  			igt_subtest_with_dynamic("basic-await") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
>  						test_fence_await(i915, ctx, e, 0);
>  				}
>  			}
> +

Remove one empty line from here.

> +
> +			igt_describe("Check execbuf2 fencing support with waiting for "
------------------------------------------- ^
Same here.

> +				     "batch execution.");

nb = non-blocking

Regards,
Kamil

>  			igt_subtest_with_dynamic("nb-await") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
> -- 
> 2.25.1
> 
