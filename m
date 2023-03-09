Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C6510E17F
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 13:43:02 +0000 (UTC)
Message-ID: <833b1d6a-d931-4e3e-15d5-49cf28a6db07@intel.com>
Date: Thu, 9 Mar 2023 14:43:06 +0100
To: Vikas Srivastava <vikas.srivastava@intel.com>
References: <20230307165324.506526-1-vikas.srivastava@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230307165324.506526-1-vikas.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_render_copy: Skip the
 Y-tile test for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 7.03.2023 17:53, Vikas Srivastava wrote:
> All the tests for y-tile or yf-tile , neither of these tiling formats
> are supported on MTL so skipping these tests.
> 
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> Acked-by: Sinjan Kumar <sinjan.kumar@intel.com>
> ---
>   tests/i915/gem_render_copy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
> index 70b96c8f4..2c150b2b0 100644
> --- a/tests/i915/gem_render_copy.c
> +++ b/tests/i915/gem_render_copy.c
> @@ -852,7 +852,7 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
>   			 force_vebox_dst_copy ? "vebox-" : "",
>   			 dst_mode);
>   		igt_subtest_with_dynamic(name) {
> -			igt_skip_on(IS_DG2(data.devid) &&
> +			igt_skip_on((IS_DG2(data.devid) || IS_METEORLAKE(data.devid)) &&

Ideally, we'd use intel_cmds_info/i915_blt helpers, but we lack 
definitions for render. This patch will do for now I think:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

>   				    ((t->src_tiling == I915_TILING_Y) ||
>   				     (t->src_tiling == I915_TILING_Yf) ||
>   				     (t->dst_tiling == I915_TILING_Y) ||
