Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>
Date: Wed, 6 Jan 2021 06:22:41 +0000
Message-ID: <e23a47877414426ca157eb3c5f36d4e7@intel.com>
References: <20210105112536.3284632-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210105112536.3284632-1-chris@chris-wilson.co.uk>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/2] i915/gem_ctx_isolation: Protect
 inject_reset_context() from banning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Tuesday, January 5, 2021 4:56 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: igt-dev@lists.freedesktop.org; Chris Wilson <chris@chris-wilson.co.uk>;
> Nayana, Venkata Ramana <venkata.ramana.nayana@intel.com>
> Subject: [PATCH i-g-t 1/2] i915/gem_ctx_isolation: Protect
> inject_reset_context() from banning
> 
> Disable banning as we deliberately inject GPU resets to test isolation.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> ---
>  tests/i915/gem_ctx_isolation.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 58a35b487..4f1742685 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -762,10 +762,21 @@ static void isolation(int fd,  #define S4 (4 << 8)
> #define SLEEP_MASK (0xf << 8)
> 
> +static uint32_t create_reset_context(int i915) {
> +	struct drm_i915_gem_context_param param = {
> +		.ctx_id = gem_context_clone_with_engines(i915, 0),
> +		.param = I915_CONTEXT_PARAM_BANNABLE,
> +	};
> +
> +	gem_context_set_param(i915, &param);
> +	return param.ctx_id;
> +}
> +
>  static void inject_reset_context(int fd, const struct intel_execution_engine2
> *e)  {
>  	struct igt_spin_factory opts = {
> -		.ctx = gem_context_clone_with_engines(fd, 0),
> +		.ctx = create_reset_context(fd),
>  		.engine = e->flags,
>  		.flags = IGT_SPIN_FAST,
>  	};
> --
> 2.30.0

Reviewed-by:  Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
