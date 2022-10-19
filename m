Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9375910F23A
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 13:17:43 +0000 (UTC)
Date: Wed, 19 Oct 2022 15:17:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0/48XWtQrAtoEfa@kamilkon-desk1>
References: <20221019102325.2886794-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221019102325.2886794-1-vikas.srivastava@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_module_load : Use
 GEM_BUSY instead of SET_CACHE for sanity check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris P Wilson <chris.p.wilson@intel.com>, Fei Yang <fei.yang@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vikas,

few more nits, see below.

On 2022-10-19 at 15:53:25 +0530, Vikas Srivastava wrote:
>     Use GEM_BUSY ioctl for sanity check as SET_CACHING ioctl
>     is not supported on latest platforms like MTL.
>     
>     References: VLK-36552
----------------- ^
Remove this line, general rule is do not use VLK references
or any other ones which are not public. If you really think it
can help, put them after line  with only three "---" and before
"diff --git" so that will be removed after "git am" command and
will not land in git history.

>     
>     Signed-off-by: vikas srivastava <vikas.srivastava@intel.com>

If you did not change anything in patch, do not add your s-o-b and
add line "From: original author <author@address>" at begin of
commit message, see for example:

https://patchwork.freedesktop.org/series/108022/

This one was resended:
https://patchwork.freedesktop.org/patch/500903/?series=108022&rev=3

This was resended and changed (so it has two s-o-b):
https://patchwork.freedesktop.org/patch/500905/?series=108022&rev=3

Regards,
Kamil

>     Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>     Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>     Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
>     Cc: Fei Yang <fei.yang@intel.com>
>     Cc: Stuart Summers <stuart.summers@intel.com>
>     Cc: Chris Wilson <chris.p.wilson@intel.com>
>     
> ---
>  tests/i915/i915_module_load.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index 1009a22b..eebb3167 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -226,13 +226,13 @@ inject_fault(const char *module_name, const char *opt, int fault)
>  
>  static void gem_sanitycheck(void)
>  {
> -	struct drm_i915_gem_caching args = {};
> +	struct drm_i915_gem_busy args = {};
>  	int i915 = __drm_open_driver(DRIVER_INTEL);
>  	int expected = gem_has_lmem(i915) ? -ENODEV : -ENOENT;
>  	int err;
>  
>  	err = 0;
> -	if (ioctl(i915, DRM_IOCTL_I915_GEM_SET_CACHING, &args))
> +	if (ioctl(i915,DRM_IOCTL_I915_GEM_BUSY, &args))
>  		err = -errno;
>  	if (err == expected)
>  		store_all(i915);
> -- 
> 2.25.1
> 
