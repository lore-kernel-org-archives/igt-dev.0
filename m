Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 12:48:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113204814.GA8816@jons-linux-dev-box>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <20220113195947.1536897-11-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113195947.1536897-11-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH v3 i-g-t 10/15]
 tests/i915/i915_hangman: Run background task on all engines
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

On Thu, Jan 13, 2022 at 11:59:42AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> As opposed to only on the non-target engines. This means that there is
> some other workload present for the scheduler to switch between and so
> detet the hang immediately.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/i915_hangman.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 6601db5f6..9f7f8062c 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -298,12 +298,14 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
>  		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
>  
> -	/* Fill all the other engines with background load */
> +	/*
> +	 * Fill all engines with background load.
> +	 * This verifies that independent engines are unaffected and gives
> +	 * the target engine something to switch between so it notices the
> +	 * hang.
> +	 */
>  	num_ctx = 0;
>  	for_each_ctx_engine(device, ctx, other) {
> -		if (other->flags == e->flags)
> -			continue;
> -
>  		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
>  		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
>  		spin = __igt_spin_new(device,
> -- 
> 2.25.1
> 
