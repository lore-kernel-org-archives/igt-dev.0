Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5490610E05D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Aug 2022 15:01:34 +0000 (UTC)
Date: Tue, 30 Aug 2022 17:01:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yw4mN0nxCtN7UxIc@kamilkon-desk1>
References: <20220629210021.3961403-1-janga.rahul.kumar@intel.com>
 <20220629210021.3961403-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220629210021.3961403-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/i915/gem_exec_fence : Add subtests
 description
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

On 2022-06-30 at 02:30:20 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add test description to all the available subtests.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/i915/gem_exec_fence.c | 47 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index a6499a68..503faa98 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -2807,6 +2807,8 @@ static void teardown_timeline_chain_engines(struct inter_engine_context *context
>  	free(context->batches);
>  }
>  
> +static const char *test_syncobj_timeline_chain_engines_desc =
> +	"Engine chaining tests to verify ordering of timeline syncobjs through execbuf.";
>  static void test_syncobj_timeline_chain_engines(int fd, const intel_ctx_cfg_t *cfg)
>  {
>  	struct inter_engine_context ctx;
> @@ -2867,6 +2869,9 @@ static void test_syncobj_timeline_chain_engines(int fd, const intel_ctx_cfg_t *c
>  	teardown_timeline_chain_engines(&ctx);
>  }
>  
> +static const char *test_syncobj_stationary_timeline_chain_engines_desc =
> +	"Engine chaining tests to verify ordering of timeline syncobj with stationary timeline"
> +	" points.";
>  static void test_syncobj_stationary_timeline_chain_engines(int fd, const intel_ctx_cfg_t *cfg)
>  {
>  	struct inter_engine_context ctx;
> @@ -2928,6 +2933,9 @@ static void test_syncobj_stationary_timeline_chain_engines(int fd, const intel_c
>  	teardown_timeline_chain_engines(&ctx);
>  }
>  
> +static const char *test_syncobj_backward_timeline_chain_engines_desc =
> +	"Engine chaining tests to verify ordering of timeline syncobjs with backward timeline"
> +	" points.";
>  static void test_syncobj_backward_timeline_chain_engines(int fd, const intel_ctx_cfg_t *cfg)
>  {
>  	struct inter_engine_context ctx;
> @@ -3088,12 +3096,16 @@ igt_main
>  								 NONBLOCK);
>  				}
>  			}
> +			igt_describe("Check in-fence is not overwritten with out-fence on each"
> +				     " engine.");
>  			igt_subtest_with_dynamic("keep-in-fence") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
>  						test_keep_in_fence(i915, ctx, e);
>  				}
>  			}
> +			igt_describe("Check for EXCE_FENCE_SUBMIT in parallel execution scenarios"
----------------------------------------------- ^
s/EXCE/EXEC/

> +				     " on each engine.");
>  			igt_subtest_with_dynamic("parallel") {
>  				igt_require(has_submit_fence(i915));
>  				for_each_ctx_engine(i915, ctx, e) {
> @@ -3104,6 +3116,7 @@ igt_main
>  				}
>  			}
>  
> +			igt_describe("Check blocking bonded fences on each engine.");
>  			igt_subtest_with_dynamic("concurrent") {
>  				igt_require(has_submit_fence(i915));
>  				igt_require(gem_scheduler_has_semaphores(i915));
> @@ -3114,6 +3127,7 @@ igt_main
>  				}
>  			}
>  
> +			igt_describe("Check timeslicing on submit-fence.");
>  			igt_subtest_with_dynamic("submit") {
>  				igt_require(gem_scheduler_has_semaphores(i915));
>  				igt_require(gem_scheduler_has_preemption(i915));
> @@ -3125,6 +3139,8 @@ igt_main
>  				}
>  			}
>  
> +			igt_describe("Check timeslicing on submit-fence by submitting coupled"
> +				     " batches.");
>  			igt_subtest_with_dynamic("submit3") {
>  				igt_require(gem_scheduler_has_semaphores(i915));
>  				igt_require(gem_scheduler_has_preemption(i915));
> @@ -3136,6 +3152,8 @@ igt_main
>  				}
>  			}
>  
> +			igt_describe("Check timeslicing on submit-fence by submitting more"
> +				     " coupled batches than can possibly fit into the ELSP.");
>  			igt_subtest_with_dynamic("submit67") {
>  				igt_require(gem_scheduler_has_semaphores(i915));
>  				igt_require(gem_scheduler_has_preemption(i915));
> @@ -3147,6 +3165,8 @@ igt_main
>  				}
>  			}
>  
> +			igt_describe("Check launching a chain of spinners across all engines using"
> +				     " submit-fence.");
>  			igt_subtest("submit-chain") {
>  				igt_require(has_submit_fence(i915));
>  				test_submit_chain(i915, ctx);
> @@ -3166,24 +3186,32 @@ igt_main
>  				intel_allocator_multiprocess_start();
>  			}
>  
> +			igt_describe("Check for explicit fence on each busy engine with a pending"
> +				     " gpu hang.");
>  			igt_subtest_with_dynamic("busy-hang") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
>  						test_fence_busy(i915, ctx, e, HANG);
>  				}
>  			}
> +			igt_describe("Check for explicit fence with additional wait time on each"
> +				     " busy engine with a pending gpu hang.");
>  			igt_subtest_with_dynamic("wait-hang") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
>  						test_fence_busy(i915, ctx, e, HANG | WAIT);
>  				}
>  			}
> +			igt_describe("Check for explicit fence with async wait on each engine with"
> +				     " a pending gpu hang.");
>  			igt_subtest_with_dynamic("await-hang") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
>  						test_fence_await(i915, ctx, e, HANG);
>  				}
>  			}
> +			igt_describe("Check for explicit fence with non-blocking wait on each"
------------------------------------------------------------------------------- ^
insert async here, s/wait/async wait/

With that fixed you can add my r-b tag.

--
Kamil

> +				     " engine with a pending gpu hang.");
>  			igt_subtest_with_dynamic("nb-await-hang") {
>  				for_each_ctx_engine(i915, ctx, e) {
>  					igt_dynamic_f("%s", e->name)
> @@ -3209,9 +3237,11 @@ igt_main
>  			gem_require_contexts(i915);
>  		}
>  
> +		igt_describe("Verifies accumulation of long history of fences.");
>  		igt_subtest("long-history")
>  			test_long_history(i915, ctx, ring_size, 0);
>  
> +		igt_describe("Verifies long history of fences are expired.");
>  		igt_subtest("expired-history")
>  			test_long_history(i915, ctx, ring_size, EXPIRED);
>  	}
> @@ -3224,33 +3254,47 @@ igt_main
>  			intel_allocator_multiprocess_start();
>  		}
>  
> +		igt_describe("Verifies invalid fence-array pointers are rejected.");
>  		igt_subtest("invalid-fence-array")
>  			test_invalid_fence_array(i915);
>  
> +		igt_describe("Verifies that a syncobj passed into execbuf but with no signal/wait"
> +			     " flag is left untouched.");
>  		igt_subtest("syncobj-unused-fence")
>  			test_syncobj_unused_fence(i915);
>  
> +		igt_describe("Verifies that submitting an execbuf with a wait on a syncobj that"
> +			     " doesn't exists is rejected.");
>  		igt_subtest("syncobj-invalid-wait")
>  			test_syncobj_invalid_wait(i915);
>  
> +		igt_describe("Verifies that invalid fence flags in fence-array are rejected.");
>  		igt_subtest("syncobj-invalid-flags")
>  			test_syncobj_invalid_flags(i915);
>  
> +		igt_describe("Verifies proper signaling of a fence-array syncobj through execbuf.");
>  		igt_subtest("syncobj-signal")
>  			test_syncobj_signal(i915);
>  
> +		igt_describe("Verifies that waiting on a timeline syncobj point between engines"
> +			     " works.");
>  		igt_subtest("syncobj-wait")
>  			test_syncobj_wait(i915, ctx);
>  
> +		igt_describe("Verify exporting of fence-array syncobj signaled by i915.");
>  		igt_subtest("syncobj-export")
>  			test_syncobj_export(i915);
>  
> +		igt_describe("Verifies that waiting & signaling a same fence-array syncobj within"
> +			     " the same execbuf works.");
>  		igt_subtest("syncobj-repeat")
>  			test_syncobj_repeat(i915);
>  
> +		igt_describe("Verifies creating of a syncobj from explicit fence.");
>  		igt_subtest("syncobj-import")
>  			test_syncobj_import(i915);
>  
> +		igt_describe("Verifies two clients racing for syncobj using channel.");
>  		igt_subtest("syncobj-channel")
>  			test_syncobj_channel(i915);
>  
> @@ -3313,12 +3357,15 @@ igt_main
>  				igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
>  			}
>  
> +			igt_describe(test_syncobj_timeline_chain_engines_desc);
>  			igt_subtest("syncobj-timeline-chain-engines")
>  				test_syncobj_timeline_chain_engines(i915, &ctx->cfg);
>  
> +			igt_describe(test_syncobj_stationary_timeline_chain_engines_desc);
>  			igt_subtest("syncobj-stationary-timeline-chain-engines")
>  				test_syncobj_stationary_timeline_chain_engines(i915, &ctx->cfg);
>  
> +			igt_describe(test_syncobj_backward_timeline_chain_engines_desc);
>  			igt_subtest("syncobj-backward-timeline-chain-engines")
>  				test_syncobj_backward_timeline_chain_engines(i915, &ctx->cfg);
>  		}
> -- 
> 2.25.1
> 
