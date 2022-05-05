Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335F110F351
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 17:58:07 +0000 (UTC)
Date: Thu, 5 May 2022 19:57:48 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <YnQQHG91EMbmhxWq@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504095904.2145592-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/6] lib/igt_kmod: make it less
 pedantic with audio driver removal
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

> Current Linux Kernel don't report if the audio driver binds
> into the DRM driver. As this is CPU specific, allow audio
> driver unload fail without skipping the IGT tests on legacy
> Kernels, as this may not be mandatory.
> 
> On new kernels where lsmod will properly display de dependency

/de/the/

> between the audio and DRM drivers, skip the core hotunplug
> test if it fails to unload the audio driver, as this is is

/is//

[...]

>  int igt_audio_driver_unload(const char **who)
>  {
> +	const char *drm_driver = "i915";
>  	unsigned int num_mod, i, j;
>  	struct module_ref *mod;
>  	int pos = -1;
> @@ -572,7 +588,7 @@ int igt_audio_driver_unload(const char **who)
>  	mod = read_module_dependencies(&num_mod);
>  
>  	for (i = 0; i < num_mod; i++) {
> -		if (!strcmp(mod[i].name, "i915")) {
> +		if (!strcmp(mod[i].name, drm_driver)) {
>  			break;
>  		}
>  	}
> @@ -580,14 +596,15 @@ int igt_audio_driver_unload(const char **who)
>  	if (i == num_mod)
>  		return 0;
>  
> -	/* Recursively remove all drivers that depend on i915 */
> +	/* Recursively remove all drivers that depend on the drm driver */
>  	for (j = 0; j < mod[i].num_required; j++) {
>  		pos = mod[i].required_by[j];
>  		if (who)
>  			*who = strdup(mod[pos].name);
>  		/*
> -		 * If a sound driver depends on i915, kill audio processes
> -		 * first, in order to make it possible to unload the driver
> +		 * If a sound driver depends on the drm driver, kill audio
> +		 * processes first, in order to make it possible to unload
> +		 * the driver.

Why isn't i915 --> drm_driver done in patch 3?

[...]

Looks good, though,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
