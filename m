Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03221113116
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 10:24:14 +0000 (UTC)
Date: Tue, 17 May 2022 12:24:08 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YoN3yImlikekSbzh@intel.intel>
References: <20220517072803.186989-1-mauro.chehab@linux.intel.com>
 <20220517072803.186989-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517072803.186989-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 4/9] lib/igt_kmod: don't leak who
 from module unload routines
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

On Tue, May 17, 2022 at 09:27:58AM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Add code to free allocated strings at the module unload routines
> from igt_kmod.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/igt_kmod.c        | 36 +++++++++++++++++++++++++-----------
>  lib/igt_kmod.h        |  4 ++--
>  tests/i915/perf_pmu.c |  4 +++-
>  3 files changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index ca74c602ce66..3e9302686844 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -390,7 +390,7 @@ igt_i915_driver_load(const char *opts)
>  	return 0;
>  }
>  
> -static int igt_always_unload_audio_driver(const char **who)
> +static int igt_always_unload_audio_driver(char **who)
>  {
>  	int ret;
>  	const char *sound[] = {
> @@ -401,8 +401,11 @@ static int igt_always_unload_audio_driver(const char **who)
>  
>  	for (const char **m = sound; *m; m++) {
>  		if (igt_kmod_is_loaded(*m)) {
> -			if (who)
> -				*who = *m;
> +			if (who) {
> +				if (*who)
> +					free(*who);

I think free() is NULL safe. At least that's what the
documentation says(*).

We could eventually make an igt_strdup_after_free(ptr) function
similar to this:

  char *igt_strdup_after_free(char **ptr, char *m)
  {
  	free(*ptr); /* don't know if it's required a double ** */
  	return strdup(m);
  }

and place it before patch 3. Then we just replace
/strdup/igt_strdup_after_free/ .

This way we also have a correct bisectability.

What do you think? You can choose a better name, I'm not good at
naming functions.

Andi

(*) If ptr is NULL, no operation is performed.

> +				*who = strdup(*m);
> +			}
>  			if (igt_lsof_kill_audio_processes())
>  				return EACCES;
>  
> @@ -544,7 +547,7 @@ static int linux_kernel_version(void)
>  	return LINUX_VERSION(ver[0], ver[1], ver[2]);
>  }
>  
> -int igt_audio_driver_unload(const char **who)
> +int igt_audio_driver_unload(char **who)
>  {
>  	const char *drm_driver = "i915";
>  	unsigned int num_mod, i, j;
> @@ -583,8 +586,11 @@ int igt_audio_driver_unload(const char **who)
>  	/* Recursively remove all drivers that depend on drm_driver */
>  	for (j = 0; j < mod[i].num_required; j++) {
>  		pos = mod[i].required_by[j];
> -		if (who)
> +		if (who) {
> +			if (*who)
> +				free(who);
>  			*who = strdup(mod[pos].name);
> +		}
>  		/*
>  		 * If a sound driver depends on drm_driver, kill audio processes
>  		 * first, in order to make it possible to unload the driver
> @@ -604,7 +610,7 @@ ret:
>  	return ret;
>  }
>  
> -int __igt_i915_driver_unload(const char **who)
> +int __igt_i915_driver_unload(char **who)
>  {
>  	int ret;
>  
> @@ -631,8 +637,12 @@ int __igt_i915_driver_unload(const char **who)
>  
>  		ret = igt_kmod_unload(*m, 0);
>  		if (ret) {
> -			if (who)
> -				*who = *m;
> +			if (who) {
> +				if (*who)
> +					free(*who);
> +
> +				*who = strdup(*m);
> +			}
>  			return ret;
>  		}
>  	}
> @@ -640,8 +650,11 @@ int __igt_i915_driver_unload(const char **who)
>  	if (igt_kmod_is_loaded("i915")) {
>  		ret = igt_kmod_unload("i915", 0);
>  		if (ret) {
> -			if (who)
> -				*who = "i915";
> +			if (who) {
> +				if (*who)
> +					free(*who);
> +				*who = strdup("i915");
> +			}
>  			return ret;
>  		}
>  	}
> @@ -658,7 +671,7 @@ int __igt_i915_driver_unload(const char **who)
>  int
>  igt_i915_driver_unload(void)
>  {
> -	const char *who;
> +	char *who = NULL;
>  	int ret;
>  
>  	ret = __igt_i915_driver_unload(&who);
> @@ -667,6 +680,7 @@ igt_i915_driver_unload(void)
>  		igt_kmod_list_loaded();
>  		igt_lsof("/dev/dri");
>  		igt_lsof("/dev/snd");
> +		free(who);
>  		return ret;
>  	}
>  
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index 15f0be31e8e4..f98dd29fb175 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -36,11 +36,11 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
>  int igt_kmod_load(const char *mod_name, const char *opts);
>  int igt_kmod_unload(const char *mod_name, unsigned int flags);
>  
> -int igt_audio_driver_unload(const char **whom);
> +int igt_audio_driver_unload(char **whom);
>  
>  int igt_i915_driver_load(const char *opts);
>  int igt_i915_driver_unload(void);
> -int __igt_i915_driver_unload(const char **whom);
> +int __igt_i915_driver_unload(char **whom);
>  
>  int igt_amdgpu_driver_load(const char *opts);
>  int igt_amdgpu_driver_unload(void);
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index c48cc07df0d2..ce047eab8296 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -2047,7 +2047,7 @@ static void test_unload(unsigned int num_engines)
>  		int fd[4 + num_engines * 3], i;
>  		uint64_t *buf;
>  		int count = 0, ret;
> -		const char *who;
> +		char *who = NULL;
>  		int i915;
>  
>  		i915 = __drm_open_driver(DRIVER_INTEL);
> @@ -2104,6 +2104,8 @@ static void test_unload(unsigned int num_engines)
>  		pmu_read_multi(fd[0], count, buf);
>  		ret = __igt_i915_driver_unload(&who);
>  		igt_assert(ret != 0 && !strcmp(who, "i915"));
> +		if (who)
> +			free(who);
>  		pmu_read_multi(fd[0], count, buf);
>  
>  		igt_debug("Close perf\n");
> -- 
> 2.36.1
