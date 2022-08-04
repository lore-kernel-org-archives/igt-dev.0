Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DF9A0C72
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 16:57:35 +0000 (UTC)
Date: Thu, 4 Aug 2022 18:57:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yuv6fIKsQs9D7Ohq@kamilkon-desk1>
References: <20220729192741.3355557-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220729192741.3355557-1-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/hangman: Fix gt hang/error tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Umesh,

On 2022-07-29 at 12:27:41 -0700, Nerlige Ramappa, Umesh wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> gt-engine-hang and gt-engine-error tests were still using reset=2
> setting so that ended up just doing an engine reset. Fix the tests so
> that they actually do the gt specific reset and set the expectations
> correctly.
> 
> In some rare failures, some of the background spinners show up as
> innocent and keep spinning after the hang recovery. This can only happen
> if the spinners did not start for some reason. Check that the spinners
> actually started before submitting a hanging batch.

imho this is a fix, it is worth to split into separate patch.

> 
> For engine specific hang, only one context is marked guilty, but for a
> gt hang all contexts are marked guilty. Check for different expected
> behavior for engine vs. gt reset.

This is true only for GuC submission on new platforms.
When execlist is used, these tests are the same as engine-engine-*
as you noted at beginning.

> 
> v2:
> - gt-reset resets all contexts on all engines. The execlist implementation
>   of gt-engine-* tests expected that a preemptible background spinner
>   running on the target engine should be marked innocent. While i915 can
>   mark such a context for execlist mode, GuC scheduling does not guarantee
>   that the background spinner can be marked as innocent. Since the state
>   of the background spinner depends on the scheduling backend, do no
>   validate the state of the background spinner for the target engine.
> 
> v3:
> - omit checking background spinner state only for gt-reset case
> 
> v4: (Kamil)
> - check has_gpu_reset and gem_scheduler_has_preemption for the
>   gt-engine-hang and gt-engine-error tests.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  tests/i915/i915_hangman.c | 75 +++++++++++++++++++++++++++++++--------
>  1 file changed, 60 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index c7d69fdd..bdf47bc0 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -295,9 +295,15 @@ static void context_unban(int fd, unsigned ctx)
>  	gem_context_set_param(fd, &param);
>  }
>  
> +enum reset_type {
> +	GT_RESET = 1,
> +	ENGINE_RESET = 2,
> +};
> +
>  static void
>  test_engine_hang(const intel_ctx_t *ctx,
> -		 const struct intel_execution_engine2 *e, unsigned int flags)
> +		 const struct intel_execution_engine2 *e, unsigned int flags,
> +		 enum reset_type reset)

Using bool as param are no good, imho we should split this into
two functions, see below after your comment on
egine-engine-hang.

>  {
>  	const struct intel_execution_engine2 *other;
>  	const intel_ctx_t *local_ctx[GEM_MAX_ENGINES];
> @@ -309,6 +315,7 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
>  		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
>  
> +	igt_assert(reset == GT_RESET || reset == ENGINE_RESET);
>  	/*
>  	 * Fill all engines with background load.
>  	 * This verifies that independent engines are unaffected and gives
> @@ -324,7 +331,10 @@ test_engine_hang(const intel_ctx_t *ctx,
>  				      .ahnd = ahndN,
>  				      .ctx = local_ctx[num_ctx],
>  				      .engine = other->flags,
> -				      .flags = IGT_SPIN_FENCE_OUT);
> +				      .flags = IGT_SPIN_FENCE_OUT |
> +					       IGT_SPIN_POLL_RUN);
> +		igt_spin_busywait_until_started(spin);
> +

This is a fix, please split it to separate patch.

>  		num_ctx++;
>  
>  		igt_list_move(&spin->link, &list);
> @@ -344,14 +354,44 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	igt_assert_eq(sync_fence_status(spin->out_fence), -EIO);
>  	igt_spin_free(device, spin);
>  
> -	/* But no other engines/clients should be affected */
> -	igt_list_for_each_entry_safe(spin, next, &list, link) {
> +	/*
> +	 * engine-engine-hang: Other engines/clients should not be affected for
> +	 * engine reset, so innocent contexts complete successfully once the
> +	 * spinner is ended.
> +	 *
> +	 * gt-engine-hang: All engines/clients are guilty and complete with a
> +	 * -EIO fence status, however the background task that was submitted to
> +	 * the target engine is innocent and is expected to complete
> +	 * successfully.
> +	 */

From this description maybe it it worth to split this function
into two separate functions : gt_engine_hang and engine_engine_hang.
Latter one will be old and in former one we could add different
bahaviour. I will add Janusz to Cc for this topic.

> +	igt_list_for_each_entry_safe_reverse(spin, next, &list, link) {

Why do you change this into _reverse ?

> +		bool innocent = reset == ENGINE_RESET;

When we split functionality then we can remove this check.

> +		int expect = innocent ? 1 : -EIO;
> +
>  		ahndN = spin->opts.ahnd;
> -		igt_assert(sync_fence_wait(spin->out_fence, 0) == -ETIME);
> -		igt_spin_end(spin);
> +		if (innocent) {
> +			igt_assert_eq(sync_fence_wait(spin->out_fence, 0), -ETIME);
> +			igt_spin_end(spin);
> +		}
>  
> -		igt_assert(sync_fence_wait(spin->out_fence, 500) == 0);
> -		igt_assert_eq(sync_fence_status(spin->out_fence), 1);
> +		if (reset == GT_RESET && spin->opts.engine == e->flags) {
---------------------------------------  ^
Here you will check execlist or GuC ? This shows we need to split
functionality to avoid logic errors and further simplify our
checks.

> +			/*
> +			 * gt-reset resets everything. The execlist
> +			 * implementation of gt-engine-* tests expect that a
> +			 * preemptible background spinner running on the target
> +			 * engine should be marked innocent. While i915 can mark
> +			 * such a context innocent for execlist mode, GuC
> +			 * scheduling does not guarantee that the background
> +			 * spinner can be marked as innocent. Since the state of
> +			 * the background spinner depends on the scheduling
> +			 * backend, do no validate the state of the background
> +			 * spinner for the target engine when doing a gt-reset.
> +			 */
> +			igt_spin_end(spin);
> +		} else {
> +			igt_assert_eq(sync_fence_wait(spin->out_fence, 500), 0);
> +			igt_assert_eq(sync_fence_status(spin->out_fence), expect);
> +		}
>  		igt_spin_free(device, spin);
>  		put_ahnd(ahndN);
>  	}
> @@ -439,6 +479,10 @@ static void do_tests(const char *name, const char *prefix,
>  {
>  	const struct intel_execution_engine2 *e;
>  	char buff[256];
> +	enum reset_type reset = ENGINE_RESET;
> +
> +	if (!strncmp(prefix, "gt", 2))
> +		reset = GT_RESET;
>  
>  	snprintf(buff, sizeof(buff), "Per engine error capture (%s reset)", name);
>  	igt_describe(buff);
> @@ -461,13 +505,13 @@ static void do_tests(const char *name, const char *prefix,
>  		};
>  
>  		igt_require(gem_scheduler_has_preemption(device));
> -		igt_params_set(device, "reset", "%u", -1);
>                  ioctl(device, DRM_IOCTL_I915_GETPARAM, &gp);
> -		igt_require(has_gpu_reset > 1);
> +		igt_require((reset == GT_RESET && has_gpu_reset == 1) ||
> +			    (reset == ENGINE_RESET && has_gpu_reset > 1));

Move above checks into separate function (avoid code duplication),
so here:
		check_reset(reset);
and
check_reset(enum reset_type reset)
{
	...put data declarations here...

	ioctl(device, DRM_IOCTL_I915_GETPARAM, &gp);
	igt_require((reset == GT_RESET && has_gpu_reset == 1) ||
		    (reset == ENGINE_RESET && has_gpu_reset > 1));
}

>  
>  		for_each_ctx_engine(device, ctx, e) {
>  			igt_dynamic_f("%s", e->name)
> -				test_engine_hang(ctx, e, 0);
> +				test_engine_hang(ctx, e, 0, reset);

It is better to make this into:
				gt_reset ? gt_engine_hang(ctx, e, 0) : engine_engine_hang(ctx, e, 0);

and before that set:

	bool gt_reset = reset == GT_RESET && gem_using_guc_submission(device) &&
				 intel_gen(intel_get_drm_devid(i915)) >= 12;

imho we want to check both old execlist and new GuC behaviour.

>  		}
>  	}
>  
> @@ -481,13 +525,14 @@ static void do_tests(const char *name, const char *prefix,
>  			.value = &has_gpu_reset,
>  		};
>  
> -		igt_params_set(device, "reset", "%u", -1);
> -		ioctl(device, DRM_IOCTL_I915_GETPARAM, &gp);
> -		igt_require(has_gpu_reset > 1);
> +		igt_require(gem_scheduler_has_preemption(device));

Why is it needed here ?

> +                ioctl(device, DRM_IOCTL_I915_GETPARAM, &gp);
-- ^
Use tabs, not spaces here.

> +		igt_require((reset == GT_RESET && has_gpu_reset == 1) ||
> +			    (reset == ENGINE_RESET && has_gpu_reset > 1));

Instead of above use check_reset(reset) here.

>  
>  		for_each_ctx_engine(device, ctx, e) {
>  			igt_dynamic_f("%s", e->name)
> -				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS);
> +				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS, reset);

Same here, call gt_engine_hang or engine_engine_hang instead 
(see above). What happens when there are no preemption ?

>  		}
>  	}
>  }
> -- 
> 2.36.1
> 

Regards,
Kamil
