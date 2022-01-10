Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D012113688
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jan 2022 04:30:04 +0000 (UTC)
Date: Mon, 10 Jan 2022 06:28:32 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Ydu18BnxLa/lpx00@platvala-desk.ger.corp.intel.com>
References: <20220107171035.2555834-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107171035.2555834-1-gwan-gyeong.mun@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/i915/gem_userptr_blits: Skip sd-probe
 test for discrete platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 07, 2022 at 07:10:35PM +0200, Gwan-gyeong Mun wrote:
> The DRM_IOCTL_I915_GEM_SET_DOMAIN ioctl does not support for discrete gpu.
> It skips sd-probe test for discrete platforms.
> 
> https://patchwork.freedesktop.org/patch/msgid/20210715101536.2606307-5-matthew.auld@intel.com
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  tests/i915/gem_userptr_blits.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index a4dca4c0..c1c3bf87 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -2374,8 +2374,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
>  		igt_subtest("forbidden-operations")
>  			test_forbidden_ops(fd);
>  
> -		igt_subtest("sd-probe")
> +		igt_subtest("sd-probe") {
> +			igt_skip_on_f(gem_has_lmem(fd),
> +				      "GEM_SET_DOMAIN does not support for discrete platform");

You need a newline at the end of this string.

And a grammar correction,

"GEM_SET_DOMAIN not supported on discrete platforms\n"


-- 
Petri Latvala



>  			test_sd_probe(fd);
> +		}
>  
>  		igt_subtest("set-cache-level")
>  			test_set_caching(fd);
> -- 
> 2.34.1
> 
