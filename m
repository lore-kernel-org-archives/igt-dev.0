Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AAE6E7FE
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 21:44:05 +0000 (UTC)
Date: Thu, 3 Jun 2021 17:43:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YLlNGnC4HwfWC9Lw@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-16-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518103344.2264397-16-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 15/17] Ensure RESET_STATS reports
 invalidated protected context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 18, 2021 at 03:33:42AM -0700, Alan Previn wrote:
> When protected contexts are created but get invalidated
> due to PXP session teardown (such as after a suspend-resume
> cycle), RESET_STATS ioctl for said context will report it
> as I915_CONTEXT_INVALIDATED.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/i915/gem_pxp.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> index e3c21c70..69a3143a 100644
> --- a/tests/i915/gem_pxp.c
> +++ b/tests/i915/gem_pxp.c
> @@ -757,6 +757,22 @@ static void free_exec_assets(int i915, struct simple_exec_assets *data)
>  	buf_ops_destroy(data->bops);
>  }
>  
> +static bool is_context_valid(int i915, uint32_t ctx)
> +{
> +	struct drm_i915_reset_stats rs;
> +	int ret;
> +
> +	memset(&rs, 0, sizeof(rs));
> +	rs.ctx_id = ctx;
> +	ret = drmIoctl(i915, DRM_IOCTL_I915_GET_RESET_STATS, &rs);
> +	igt_assert(ret == 0);
> +
> +	if (rs.flags & I915_CONTEXT_INVALIDATED)
> +		return false;
> +
> +	return true;
> +}
> +
>  static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_data *pm)
>  {
>  	int ret;
> @@ -788,6 +804,8 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  
>  	trigger_powermgt_suspend_cycle(i915, pm);
>  
> +	igt_assert_f(!is_context_valid(i915, data[0].ctx),
> +				       "RESET_STATS missed INVAL bit on stale pxp context\n");
>  	ret = gem_execbuf_flush_store_dw(i915, data[0].ibb, data[0].ctx, data[0].fencebuf);
>  	igt_assert_f((ret == -EACCES), "Executing stale pxp context didn't fail with -EACCES\n");
>  
> @@ -796,6 +814,8 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  	 * reuse the bo to ensure the kernel is catching the
>  	 * invalidated bo (not context)
>  	 */
> +	igt_assert_f(!is_context_valid(i915, data[1].ctx),
> +				       "RESET_STATS missed INVAL bit on stale pxp context\n");
>  	ret = create_ctx_with_params(i915, true, true, true, false, &ctx2);
>  	igt_assert_eq(ret, 0);
>  	igt_assert_eq(get_ctx_protected_param(i915, ctx2), 1);
> @@ -806,6 +826,8 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
>  	ret = gem_execbuf_flush_store_dw(i915, ibb2, ctx2, data[1].fencebuf);
>  	igt_assert_f((ret == -ENOEXEC), "Executing stale pxp buffer didn't fail with -ENOEXEC\n");
>  
> +	igt_assert_f(is_context_valid(i915, data[2].ctx),
> +				       "RESET_STATS false-hit on opt-out context\n");
>  	ret = gem_execbuf_flush_store_dw(i915, data[2].ibb, data[2].ctx, data[2].fencebuf);
>  	igt_assert_f((ret == 0), "Opt-out-execution with stale pxp buffer didn't succeed\n");
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
