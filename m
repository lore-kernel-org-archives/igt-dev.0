Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 14:30:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113223047.GA13936@jons-linux-dev-box>
References: <20220113195947.1536897-12-John.C.Harrison@Intel.com>
 <20220113212653.1554786-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113212653.1554786-1-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/i915/i915_hangman:
 Don't let background contexts cause a ban
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 01:26:53PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The global context used by all the subtests for causing hangs is
> marked as unbannable. However, some of the subtests set background
> spinners running on all engines using a freshly created context. If
> there is a test failure for any reason, all of those spinners can be
> killed off as hanging contexts. On systems with lots of engines, that
> can result in the test being banned from creating any new contexts.
> 
> So make the spinner contexts unbannable as well. That way if one
> subtest fails it won't necessarily bring down all subsequent subtests.
> 
> v2: Simplify anti-banning code (review feedback from Matthew Brost).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/i915_hangman.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 9f7f8062c..537ed35a5 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -284,6 +284,17 @@ static void test_error_state_capture(const intel_ctx_t *ctx,
>  	check_alive();
>  }
>  
> +static void context_unban(int fd, unsigned ctx)
> +{
> +	struct drm_i915_gem_context_param param = {
> +		.ctx_id = ctx,
> +		.param = I915_CONTEXT_PARAM_BANNABLE,
> +		.value = 0,
> +	};
> +
> +	gem_context_set_param(fd, &param);
> +}
> +
>  static void
>  test_engine_hang(const intel_ctx_t *ctx,
>  		 const struct intel_execution_engine2 *e, unsigned int flags)
> @@ -307,6 +318,7 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	num_ctx = 0;
>  	for_each_ctx_engine(device, ctx, other) {
>  		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
> +		context_unban(device, local_ctx[num_ctx]->id);
>  		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
>  		spin = __igt_spin_new(device,
>  				      .ahnd = ahndN,
> -- 
> 2.25.1
> 
