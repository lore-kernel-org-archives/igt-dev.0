Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFC710E8EE
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 10:41:46 +0000 (UTC)
Date: Wed, 22 Mar 2023 11:41:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230322104142.cl3s4lbrmgf3v7zf@kamilkon-desk1>
References: <20230321144614.1676419-1-mauro.chehab@linux.intel.com>
 <20230321144614.1676419-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230321144614.1676419-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kmod: add support for Xe
 driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-03-21 at 15:46:13 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Change the kmod logic to also work with the Xe driver.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/igt_kmod.c | 34 +++++++++++++++++-----------------
>  lib/igt_kmod.h | 31 ++++++++++++++++++++++++++++---
>  2 files changed, 45 insertions(+), 20 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 6d6ecf0187ed..ccf0063ca1b1 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -404,23 +404,23 @@ static void *strdup_realloc(char *origptr, const char *strdata)
>  }
>  
>  /**
> - * igt_i915_driver_load:
> - * @opts: options to pass to i915 driver
> + * igt_intel_driver_load:
> + * @opts: options to pass to Intel driver
>   *
> - * Loads the i915 driver and its dependencies.
> + * Loads an Intel driver and its dependencies.
>   *
>   */
>  int
> -igt_i915_driver_load(const char *opts)
> +igt_intel_driver_load(const char *opts, const char *driver)
>  {
>  	int ret;
>  
>  	if (opts)
> -		igt_info("Reloading i915 with %s\n\n", opts);
> +		igt_info("Reloading %s with %s\n\n", driver, opts);
>  
> -	ret = igt_kmod_load("i915", opts);
> +	ret = igt_kmod_load(driver, opts);
>  	if (ret) {
> -		igt_debug("Could not load i915\n");
> +		igt_debug("Could not load %s\n", driver);
>  		return ret;
>  	}
>  
> @@ -496,7 +496,7 @@ int igt_audio_driver_unload(char **who)
>  	return igt_always_unload_audio_driver(who);
>  }
>  
> -int __igt_i915_driver_unload(char **who)
> +int __igt_intel_driver_unload(char **who, const char *driver)
>  {
>  	int ret;
>  
> @@ -530,11 +530,11 @@ int __igt_i915_driver_unload(char **who)
>  		}
>  	}
>  
> -	if (igt_kmod_is_loaded("i915")) {
> -		ret = igt_kmod_unload("i915", 0);
> +	if (igt_kmod_is_loaded(driver)) {
> +		ret = igt_kmod_unload(driver, 0);
>  		if (ret) {
>  			if (who)
> -				*who = strdup_realloc(*who, "i915");
> +				*who = strdup_realloc(*who, driver);
>  
>  			return ret;
>  		}
> @@ -544,18 +544,18 @@ int __igt_i915_driver_unload(char **who)
>  }
>  
>  /**
> - * igt_i915_driver_unload:
> + * igt_intel_driver_unload:
>   *
> - * Unloads the i915 driver and its dependencies.
> + * Unloads an Intel driver and its dependencies.
>   *
>   */
>  int
> -igt_i915_driver_unload(void)
> +igt_intel_driver_unload(const char *driver)
>  {
>  	char *who = NULL;
>  	int ret;
>  
> -	ret = __igt_i915_driver_unload(&who);
> +	ret = __igt_intel_driver_unload(&who, driver);
>  	if (ret) {
>  		igt_warn("Could not unload %s\n", who);
>  		igt_kmod_list_loaded();
> @@ -572,8 +572,8 @@ igt_i915_driver_unload(void)
>  	igt_kmod_unload("drm_kms_helper", 0);
>  	igt_kmod_unload("drm", 0);
>  
> -	if (igt_kmod_is_loaded("i915")) {
> -		igt_warn("i915.ko still loaded!\n");
> +	if (igt_kmod_is_loaded("driver")) {
> +		igt_warn("%s.ko still loaded!\n", driver);
>  		return -EBUSY;
>  	}
>  
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index f98dd29fb175..a6b422abf328 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -38,9 +38,34 @@ int igt_kmod_unload(const char *mod_name, unsigned int flags);
>  
>  int igt_audio_driver_unload(char **whom);
>  
> -int igt_i915_driver_load(const char *opts);
> -int igt_i915_driver_unload(void);
> -int __igt_i915_driver_unload(char **whom);
> +int igt_intel_driver_load(const char *opts, const char *driver);
> +int igt_intel_driver_unload(const char *driver);
> +int __igt_intel_driver_unload(char **who, const char *driver);
> +
> +static inline int igt_i915_driver_load(const char *opts)
> +{
> +	return igt_intel_driver_load(opts, "i915");
> +}
> +
> +static inline int igt_i915_driver_unload(void)
> +{
> +	return igt_intel_driver_unload("i915");
> +}
> +
> +static inline int __igt_i915_driver_unload(char **whom) {
---------------------------------------------------------- ^
This should be in new line.

With that fixed

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> +	return __igt_intel_driver_unload(whom, "i915");
> +};
> +
> +static inline int igt_xe_driver_load(const char *opts)
> +{
> +	return igt_intel_driver_load(opts, "xe");
> +}
> +
> +
> +static inline int igt_xe_driver_unload(void)
> +{
> +	return igt_intel_driver_unload("xe");
> +}
>  
>  int igt_amdgpu_driver_load(const char *opts);
>  int igt_amdgpu_driver_unload(void);
> -- 
> 2.39.2
> 

