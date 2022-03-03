Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF1910E2C9
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 16:27:59 +0000 (UTC)
Date: Thu, 3 Mar 2022 17:27:54 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiDsijOKo9O0kvAU@zkempczy-mobl2>
References: <20220302121253.25299-1-zbigniew.kempczynski@intel.com>
 <20220302121253.25299-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302121253.25299-4-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/gem_render_copy: Added skip
 for I915_TILING_Y and I915_TILING_Yf on DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 01:12:53PM +0100, Zbigniew Kempczyński wrote:
> From: Arjun Melkaveri <arjun.melkaveri@intel.com>
> 
> Added skip for I915_TILING_Y and I915_TILING_Yf on DG2, as those tiling
> formats are not supported.

At the moment it is ok, but we need to add ccs support in the future.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Cc: Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_render_copy.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
> index d485e3415a..3da29ec4e3 100644
> --- a/tests/i915/gem_render_copy.c
> +++ b/tests/i915/gem_render_copy.c
> @@ -852,6 +852,12 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
>  			 force_vebox_dst_copy ? "vebox-" : "",
>  			 dst_mode);
>  		igt_subtest_with_dynamic(name) {
> +			igt_skip_on(IS_DG2(data.devid) &&
> +				    ((t->src_tiling == I915_TILING_Y) ||
> +				     (t->src_tiling == I915_TILING_Yf) ||
> +				     (t->dst_tiling == I915_TILING_Y) ||
> +				     (t->dst_tiling == I915_TILING_Yf)));
> +
>  			igt_require_f(data.vebox_copy || !vebox_copy_used,
>  				      "no vebox-copy function\n");
>  			for_each_combination(region_set, 1, set) {
> -- 
> 2.32.0
> 
