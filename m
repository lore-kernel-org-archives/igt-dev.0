Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D1CCAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 05:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032DF10E041;
	Wed, 17 Sep 2025 05:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxPdT5f5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927CA10E041
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 05:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758086232; x=1789622232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E0SKJFxXTDLNsDPndyji0EHO8DR2WFjjVG1kSeL3oZE=;
 b=YxPdT5f5t8sIM8NAEpSCPjh6bcl53Jpianr9h1O6UqiE+VAy9rW5wIxz
 nPlsp1Lw2KlkjOjDbrv+7CqgYaODsWEuF5fNzcfzLNNFk/0zhtTYVXg0V
 BidwqYwSEoICpKFum0K3iCxZ0WyXZhHiEfK+Hws0Ea8s//ZQK2SYS2Ubp
 x1D08RCRsAbZTPv4RnGwPwoXe3zihDV3SDPC3hDx/K/aURHRikzZ3M4wq
 FMCznAa3Cxp0D4nSTkDBoXQr1DJzi74BIXttCx3vpilhG9xTdWotCcFbM
 TLXsb/Ne+byWBt0x+UB/thdm3fOBm30yM8s4kLR1MvxT/JJFJXNzSE4Qh g==;
X-CSE-ConnectionGUID: g11S2HGrSwOOdwXnCqUj8g==
X-CSE-MsgGUID: 5dR7M7/7T66sFfI8W0qhjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="47957373"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="47957373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 22:17:11 -0700
X-CSE-ConnectionGUID: DfgK5FOpRpWL0/efAj7CGg==
X-CSE-MsgGUID: VHPZpLJCSMah+270ewVLjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="179430972"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.7])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 22:17:08 -0700
Date: Wed, 17 Sep 2025 07:17:06 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v5 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Message-ID: <rfmrr2brjgu4ydmm6viq25kabconqjyxt5u4ogbhif2owzoo4x@pmiv3xlbx5ii>
References: <20250917035639.187462-1-sobin.thomas@intel.com>
 <20250917035639.187462-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917035639.187462-2-sobin.thomas@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Sep 17, 2025 at 03:56:39AM +0000, Sobin Thomas wrote:
> On platforms (like PVC) that do not support walker mid-thread
> preemption, running tests in forked threads can lead to inconsistent
> states due to igt_skip being called mid-execution. Made changes to
> perform kernel preemption check at the beginning of each subtests.
> If the GPU version does not support the required features, the
> test is skipped gracefully, ensuring consistent behavior across
> different platforms.
> 
> TODO: Add the kernel for PVC
> 
> v2: Fixed review comments to move the compatibility check
>     into the igt_fixture.
> 
> v3: Added check for thread group preemption and WMTP.
>     Added enum flags for preemption type as per review . [Zbigniew]
> 
> v4: Added check for preempt inside __run_intel_compute_kernel_preempt
>     Refactored the code.  [priyanka]
> 
> v5: Refactor for finding the kernel and out of bound check. [Zbigniew]
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  lib/intel_compute.c              | 95 +++++++++++++++++++++++++-------
>  lib/intel_compute.h              |  7 +++
>  tests/intel/xe_compute_preempt.c |  6 ++
>  3 files changed, 89 insertions(+), 19 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..f698ea17d 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1921,14 +1921,33 @@ static const struct {
>  	},
>  };
>  
> +static const struct intel_compute_kernels
> +		*find_kernel(const struct intel_compute_kernels  *kernels,
> +		unsigned int ip_ver)
> +{
> +	if (!kernels) {
> +		igt_debug("%s: kernel_list is NULL\n", __func__);
> +		return NULL;
> +	}
> +
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			return kernels;
> +		kernels++;
> +	}
> +	igt_info("%s: No Match found for ip_ver=%u\n", __func__, ip_ver);
> +
> +	return NULL;
> +}
> +
>  static bool __run_intel_compute_kernel(int fd,
>  				       struct drm_xe_engine_class_instance *eci,
>  				       struct user_execenv *user,
>  				       enum execenv_alloc_prefs alloc_prefs)
>  {
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> -	unsigned int batch;
> -	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> +	int batch;
> +	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
>  	enum intel_driver driver = get_intel_driver(fd);
>  	const unsigned char *kernel;
>  	unsigned int kernel_size;
> @@ -1954,11 +1973,7 @@ static bool __run_intel_compute_kernel(int fd,
>  		kernel = user->kernel;
>  		kernel_size = user->kernel_size;
>  	} else {
> -		while (kernels->kernel) {
> -			if (ip_ver == kernels->ip_ver)
> -				break;
> -			kernels++;
> -		}
> +		kernels = find_kernel(kernel_entries, ip_ver);
>  		if (!kernels->kernel)

Segv if kernels == NULL.

>  			return false;
>  		kernel = kernels->kernel;
> @@ -2193,24 +2208,47 @@ static const struct {
>  			     bool threadgroup_preemption,
>  			     enum execenv_alloc_prefs alloc_prefs);
>  	uint32_t compat;
> +	enum xe_compute_preempt_type preempt_type;
>  } intel_compute_preempt_batches[] = {
>  	{
>  		.ip_ver = IP_VER(20, 01),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_WMTP,
>  	},
>  	{
>  		.ip_ver = IP_VER(20, 04),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_WMTP,
>  	},
>  	{
>  		.ip_ver = IP_VER(30, 00),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_WMTP,
>  	},
> +	{}
>  };
>  
> +static int find_preempt_batch(unsigned int ip_ver)
> +{
> +	for (int batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
> +		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
> +			return batch;
> +	return -1;
> +}
> +
> +static bool is_preemptable(int batch, enum xe_compute_preempt_type required_preempt)
> +{
> +	if (required_preempt &&
> +	    !(intel_compute_preempt_batches[batch].preempt_type & required_preempt)) {
> +		igt_info("Preemption not supported\n");
> +		return false;
> +	}
> +	return true;
> +}
> +
>  static bool __run_intel_compute_kernel_preempt(int fd,
>  		struct drm_xe_engine_class_instance *eci,
>  		bool threadgroup_preemption,
> @@ -2218,15 +2256,12 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  {
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
> -	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> +	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
>  	enum intel_driver driver = get_intel_driver(fd);
> +	int required_preempt = threadgroup_preemption ? PREEMPT_TGP : PREEMPT_WMTP;
>  
> -	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
> -		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
> -			break;
> -
> -
> -	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
> +	batch = find_preempt_batch(ip_ver);
> +	if (batch < 0) {
>  		igt_debug("GPU version 0x%x not supported\n", ip_ver);
>  		return false;
>  	}
> @@ -2238,12 +2273,10 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  		return false;
>  	}
>  
> -	while (kernels->kernel) {
> -		if (ip_ver == kernels->ip_ver)
> -			break;
> -		kernels++;
> -	}
> +	if (!is_preemptable(batch, required_preempt))
> +		return false;
>  
> +	kernels = find_kernel(kernel_entries, ip_ver);
>  	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)

Same.

--
Zbigniew

>  		return 0;
>  
> @@ -2260,6 +2293,30 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  
>  	return true;
>  }
> +
> +/**
> + * check_kernel_preempt- Checks ip version to confirm if  provided 
> + * preempt type is supported.
> + * @fd: file descriptor of the opened DRM Xe device
> + * @required_preempt: Preemption type ( WMTP/TGP)
> + *
> + * Returns true on success, false otherwise.
> + */
> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type required_preempt)
> +{
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch = find_preempt_batch(ip_ver);
> +
> +	if (batch < 0) {
> +		igt_debug("GPU version 0x%x not supported\n", ip_ver);
> +		return false;
> +	}
> +	if (!is_preemptable(batch, required_preempt))
> +		return false;
> +
> +	return true;
> +}
> +
>  /**
>   * run_intel_compute_kernel_preempt - runs compute kernels to
>   * exercise preemption scenario.
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index 412791d07..b70cd7185 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -71,6 +71,11 @@ enum execenv_alloc_prefs {
>  	EXECENV_PREF_VRAM_IF_POSSIBLE,
>  };
>  
> +enum xe_compute_preempt_type {
> +	PREEMPT_TGP  = 1 << 0,    /* ThreadGroup Preemption */
> +	PREEMPT_WMTP  = 1 << 1,  /* Walker Mid Thread Preemption */
> +};
> +
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
>  
>  bool run_intel_compute_kernel(int fd, struct user_execenv *user,
> @@ -81,4 +86,6 @@ bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_in
>  bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
>  				      bool threadgroup_preemption,
>  				      enum execenv_alloc_prefs alloc_prefs);
> +
> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type required_preempt);
>  #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index c9b194869..a4c0bc59b 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -76,6 +76,7 @@ igt_main
>  	}
>  
>  	igt_subtest_with_dynamic("compute-preempt") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -86,6 +87,7 @@ igt_main
>  	}
>  
>  	igt_subtest_with_dynamic("compute-preempt-many") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -112,6 +114,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
>  		igt_require(swap_mb > CONTEXT_MB * 10);
>  
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -138,6 +141,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram") {
>  		igt_require(xe_has_vram(xe));
>  
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -164,6 +168,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
>  		igt_require(xe_has_vram(xe));
>  
> +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -188,6 +193,7 @@ igt_main
>  	}
>  
>  	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
> +		igt_require(check_kernel_preempt(xe, PREEMPT_TGP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> -- 
> 2.34.1
> 
