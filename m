Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 11:58:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113195824.GA7322@jons-linux-dev-box>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <20220113195947.1536897-4-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113195947.1536897-4-John.C.Harrison@Intel.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH v3 i-g-t 03/15]
 tests/i915/i915_hangman: Update capture test to use engine structure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 11:59:35AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The capture test was still using old style ring_id and ring_name
> (derived from the engine structure at the higher level). Update it to
> just take the engine structure directly.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/i915_hangman.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index f64b8819d..280eac197 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -207,8 +207,8 @@ static void check_error_state(const char *expected_ring_name,
>  	igt_assert(found);
>  }
>  
> -static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
> -				     const char *ring_name)
> +static void test_error_state_capture(const intel_ctx_t *ctx,
> +				     const struct intel_execution_engine2 *e)
>  {
>  	uint32_t *batch;
>  	igt_hang_t hang;
> @@ -217,7 +217,7 @@ static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
>  
>  	clear_error_state();
>  
> -	hang = igt_hang_ctx_with_ahnd(device, ahnd, ctx->id, ring_id,
> +	hang = igt_hang_ctx_with_ahnd(device, ahnd, ctx->id, e->flags,
>  				      HANG_ALLOW_CAPTURE);
>  	offset = hang.spin->obj[IGT_SPIN_BATCH].offset;
>  
> @@ -226,7 +226,7 @@ static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
>  
>  	igt_post_hang_ring(device, hang);
>  
> -	check_error_state(ring_name, offset, batch);
> +	check_error_state(e->name, offset, batch);
>  	munmap(batch, 4096);
>  	put_ahnd(ahnd);
>  }
> @@ -351,7 +351,7 @@ igt_main
>  	igt_subtest_with_dynamic("error-state-capture") {
>  		for_each_ctx_engine(device, ctx, e) {
>  			igt_dynamic_f("%s", e->name)
> -				test_error_state_capture(ctx, e->flags, e->name);
> +				test_error_state_capture(ctx, e);
>  		}
>  	}
>  
> -- 
> 2.25.1
> 
