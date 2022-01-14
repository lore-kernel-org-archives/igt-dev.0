Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 14 Jan 2022 08:44:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220114164425.GA9684@jons-linux-dev-box>
References: <20220113235118.1575410-1-John.C.Harrison@Intel.com>
 <20220113235118.1575410-5-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113235118.1575410-5-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [PATCH v4 i-g-t 04/15] tests/i915/i915_hangman:
 Explicitly test per engine reset vs full GPU reset
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

On Thu, Jan 13, 2022 at 03:51:07PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Although the hangman test was ensuring that *some* reset functionality
> was enabled, it did not differentiate what kind. The infrastructure
> required to choose between per engine reset or full GT reset was
> recently added. So update this test to use it as well.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/i915_hangman.c | 76 +++++++++++++++++++++++++--------------
>  1 file changed, 49 insertions(+), 27 deletions(-)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 280eac197..7b8390a6c 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -323,40 +323,26 @@ static void hangcheck_unterminated(const intel_ctx_t *ctx)
>  	}
>  }
>  
> -igt_main
> +static void do_tests(const char *name, const char *prefix,
> +		     const intel_ctx_t *ctx)
>  {
>  	const struct intel_execution_engine2 *e;
> -	const intel_ctx_t *ctx;
> -	igt_hang_t hang = {};
> -
> -	igt_fixture {
> -		device = drm_open_driver(DRIVER_INTEL);
> -		igt_require_gem(device);
> -
> -		ctx = intel_ctx_create_all_physical(device);
> -
> -		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE);
> -
> -		sysfs = igt_sysfs_open(device);
> -		igt_assert(sysfs != -1);
> -
> -		igt_require(has_error_state(sysfs));
> -	}
> +	char buff[256];
>  
> -	igt_describe("Basic error capture");
> -	igt_subtest("error-state-basic")
> -		test_error_state_basic();
> -
> -	igt_describe("Per engine error capture");
> -	igt_subtest_with_dynamic("error-state-capture") {
> +	snprintf(buff, sizeof(buff), "Per engine error capture (%s reset)", name);
> +	igt_describe(buff);
> +	snprintf(buff, sizeof(buff), "%s-error-state-capture", prefix);
> +	igt_subtest_with_dynamic(buff) {
>  		for_each_ctx_engine(device, ctx, e) {
>  			igt_dynamic_f("%s", e->name)
>  				test_error_state_capture(ctx, e);
>  		}
>  	}
>  
> -	igt_describe("Per engine hang recovery (spin)");
> -	igt_subtest_with_dynamic("engine-hang") {
> +	snprintf(buff, sizeof(buff), "Per engine hang recovery (spin, %s reset)", name);
> +	igt_describe(buff);
> +	snprintf(buff, sizeof(buff), "%s-engine-hang", prefix);
> +	igt_subtest_with_dynamic(buff) {
>                  int has_gpu_reset = 0;
>  		struct drm_i915_getparam gp = {
>  			.param = I915_PARAM_HAS_GPU_RESET,
> @@ -374,8 +360,10 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Per engine hang recovery (invalid CS)");
> -	igt_subtest_with_dynamic("engine-error") {
> +	snprintf(buff, sizeof(buff), "Per engine hang recovery (invalid CS, %s reset)", name);
> +	igt_describe(buff);
> +	snprintf(buff, sizeof(buff), "%s-engine-error", prefix);
> +	igt_subtest_with_dynamic(buff) {
>  		int has_gpu_reset = 0;
>  		struct drm_i915_getparam gp = {
>  			.param = I915_PARAM_HAS_GPU_RESET,
> @@ -391,11 +379,45 @@ igt_main
>  				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS);
>  		}
>  	}
> +}
> +
> +igt_main
> +{
> +	const intel_ctx_t *ctx;
> +	igt_hang_t hang = {};
> +
> +	igt_fixture {
> +		device = drm_open_driver(DRIVER_INTEL);
> +		igt_require_gem(device);
> +
> +		ctx = intel_ctx_create_all_physical(device);
> +
> +		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE);
> +
> +		sysfs = igt_sysfs_open(device);
> +		igt_assert(sysfs != -1);
> +
> +		igt_require(has_error_state(sysfs));
> +	}
> +
> +	igt_describe("Basic error capture");
> +	igt_subtest("error-state-basic")
> +		test_error_state_basic();
>  
>  	igt_describe("Check that executing unintialised memory causes a hang");
>  	igt_subtest("hangcheck-unterminated")
>  		hangcheck_unterminated(ctx);
>  
> +	do_tests("GT", "gt", ctx);
> +
> +	igt_fixture {
> +		igt_disallow_hang(device, hang);
> +
> +		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
> +	}
> +
> +	do_tests("engine", "engine", ctx);
> +
>  	igt_fixture {
>  		igt_disallow_hang(device, hang);
>  		intel_ctx_destroy(device, ctx);
> -- 
> 2.25.1
> 
