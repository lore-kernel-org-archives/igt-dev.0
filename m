Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83A510E2F2
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 12:43:53 +0000 (UTC)
Date: Wed, 19 Oct 2022 14:43:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0/xBFcOXIE2/8PO@kamilkon-desk1>
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

put version number in subject, it should be like vN where
N=number. You can omit it when you send version 1, bute then
any new should be numbered. Remove space after i915_module_load
and ':'. In summary this should be:

[PATCH i-g-t v4] tests/i915/i915_module_load: Use GEM_BUSY instead of SET_CACHE for sanity check
------------ ^ ---------------------------- ^

On 2022-10-19 at 15:53:25 +0530, Vikas Srivastava wrote:
>     Use GEM_BUSY ioctl for sanity check as SET_CACHING ioctl
 ^^^^^
>     is not supported on latest platforms like MTL.
 ^^^^^
Remove white spaces at begin of line.

>     
>     References: VLK-36552
>     
>     Signed-off-by: vikas srivastava <vikas.srivastava@intel.com>
>     Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>     Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>     Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
>     Cc: Fei Yang <fei.yang@intel.com>
>     Cc: Stuart Summers <stuart.summers@intel.com>
>     Cc: Chris Wilson <chris.p.wilson@intel.com>
 ^^^^^
Last place where spaces should be removed.

Please use checkpatch script from Linux kernel for checking
and correcting your patches before sendig them.

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
---------------------- ^
Put space after "," (this one spotted by checkpatch).

Regards,
Kamil

>  		err = -errno;
>  	if (err == expected)
>  		store_all(i915);
> -- 
> 2.25.1
> 
