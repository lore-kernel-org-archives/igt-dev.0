Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14B212B535
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jan 2022 07:03:57 +0000 (UTC)
Date: Tue, 11 Jan 2022 09:02:27 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yd0rgwiDbIXzeF/J@platvala-desk.ger.corp.intel.com>
References: <20220110140105.2844012-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110140105.2844012-1-gwan-gyeong.mun@intel.com>
Subject: Re: [igt-dev] [PATCH v2] tests/i915/gem_userptr_blits: Skip
 sd-probe test for discrete platforms
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

On Mon, Jan 10, 2022 at 04:01:05PM +0200, Gwan-gyeong Mun wrote:
> The DRM_IOCTL_I915_GEM_SET_DOMAIN ioctl does not support for discrete gpu.
> It skips sd-probe test for discrete platforms.
> 
> https://patchwork.freedesktop.org/patch/msgid/20210715101536.2606307-5-matthew.auld@intel.com
> 
> v2: add a newline at the end of the skip string and fix the skip string. (Petri)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

But you might want to do the same grammarly edit to the commit
message.


> ---
>  tests/i915/gem_userptr_blits.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index a4dca4c0..ec3f2755 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -2374,8 +2374,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
>  		igt_subtest("forbidden-operations")
>  			test_forbidden_ops(fd);
>  
> -		igt_subtest("sd-probe")
> +		igt_subtest("sd-probe") {
> +			igt_skip_on_f(gem_has_lmem(fd),
> +				      "GEM_SET_DOMAIN not supported on discrete platforms\n");
>  			test_sd_probe(fd);
> +		}
>  
>  		igt_subtest("set-cache-level")
>  			test_set_caching(fd);
> -- 
> 2.34.1
> 
