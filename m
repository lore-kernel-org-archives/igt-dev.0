Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7862FCCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 09:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2313510EB71;
	Fri, 10 Oct 2025 09:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoRqtYDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC6310EB71
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760087358; x=1791623358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cZAgR+EnHfd93IZmJoJRYYhHvR6FwuaWF5x28ggtRK8=;
 b=BoRqtYDBsT5NvkWGaiiHkJJdnWBrqyOD7F0/f4ntjvL5pJCEeB0HI9+W
 n0USYBeBU1S7IpKVDgi+GrGjBwtCGxNbaDgYiShDJLIuFkHnRc9yeaeqy
 W4wzelmo+1W5yeK1N3hBwe6qoUMe4y1SKb6D23e4boB4DaVbN9r32Cjkl
 /Xu6O+ei97KoO6fynsb408JHBOBo0FTTsD4d339yvIDVEmF4dVjdbw7CO
 8CW3KgfsY0VMoy3auBhk0KkYvqRNXMe2qnp9/C/tadGuwVHKgaDaLO9eL
 hCK4VHmqQ3Uw/qli+Wr/veAh2q5tcqvKi01TwvYB84D+DnQxl+Rj0ay61 A==;
X-CSE-ConnectionGUID: N6k18YdySaWKxrkyV1svoA==
X-CSE-MsgGUID: tgj6UK+IQnG1742V0FyiKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="79948193"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="79948193"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:09:18 -0700
X-CSE-ConnectionGUID: ebncGjhbQ520zcD00RMnlg==
X-CSE-MsgGUID: 7R6Bm4JcSfaoX6UMg9ivdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180619897"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.136])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 02:09:17 -0700
Date: Fri, 10 Oct 2025 11:09:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t v9 1/3] tests/intel/xe_compute_preempt: Compute
 preemption check
Message-ID: <7lzgzvg3ysa6md33tov5ovqf4bqh56amb264jwrtc4x3urjx5b@tpnvvnul2zqc>
References: <20251003052640.56068-1-sobin.thomas@intel.com>
 <20251003052640.56068-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003052640.56068-2-sobin.thomas@intel.com>
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

On Fri, Oct 03, 2025 at 05:26:19AM +0000, Sobin Thomas wrote:
> On platforms (like PVC) that do not support walker mid-thread
> preemption, running tests in forked threads can lead to inconsistent
> states due to igt_skip being called mid-execution. Made changes to
> perform kernel preemption check at the beginning of each subtests.
> If the GPU version does not support the required features, the
> test is skipped gracefully, ensuring consistent behavior across
> different platforms.
> 
> v2: Fixed review comments to move the compatibility check
>     into the igt_fixture. [Priyanka]
> 
> v3: Added check for thread group preemption and WMTP.
>     Added enum flags for preemption type as per review . [Zbigniew]
> 
> v4: Added check for preempt inside __run_intel_compute_kernel_preempt
>     Refactored the code.  [priyanka]
> 
> v5: Refactor for finding the kernel and out of bound check. [Zbigniew]
> 
> v6: Added NULL Check for kernel. [Zbigniew]
> 
> v7: Moved TODO inside the code. [kamil]
>     Modified the check condition for kernel [Priyanka]
> 
> v8: Additional check for the kernel variants
> 
> v9: Refactored in to logically related patches
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  lib/intel_compute.c              | 78 ++++++++++++++++++++++++++++----
>  lib/intel_compute.h              | 11 +++++
>  tests/intel/xe_compute_preempt.c |  6 +++
>  3 files changed, 86 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..ae656a4f6 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: MIT */
>  /*
>   * Copyright © 2023 Intel Corporation
> - *
> + * TODO: Add kernel for PVC for preemption test
>   * Authors:
>   *    Francois Dugast <francois.dugast@intel.com>
>   */
> @@ -2193,40 +2193,72 @@ static const struct {
>  			     bool threadgroup_preemption,
>  			     enum execenv_alloc_prefs alloc_prefs);
>  	uint32_t compat;
> +	enum xe_compute_preempt_type preempt_type;
>  } intel_compute_preempt_batches[] = {
>  	{
>  		.ip_ver = IP_VER(20, 01),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
>  	},
>  	{
>  		.ip_ver = IP_VER(20, 04),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
>  	},
>  	{
>  		.ip_ver = IP_VER(30, 00),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
>  	},
>  };
>  
> +static int find_preempt_batch(unsigned int ip_ver)
> +{
> +	for (int batch_idx = 0; batch_idx < ARRAY_SIZE(intel_compute_preempt_batches); batch_idx++)
> +		if (ip_ver == intel_compute_preempt_batches[batch_idx].ip_ver)
> +			return batch_idx;
> +	return -1;
> +}
> +
> +static bool is_preemptable(int batch, enum xe_compute_preempt_type required_preempt)
> +{
> +	if (required_preempt &&
> +	    !(intel_compute_preempt_batches[batch].preempt_type & required_preempt)) {
> +		igt_info("Preemption not supported\n");

I would also remove this igt_info() here allowing caller to decide how
to inform that this preemption is not supported.

> +		return false;
> +	}
> +	return true;
> +}
> +
> +static const char *xe_preempt_type_to_str(enum xe_compute_preempt_type type)
> +{
> +	switch (type) {
> +	case PREEMPT_TGP:
> +		return "PREEMPT_TGP";
> +	case PREEMPT_WMTP:
> +		return "PREEMPT_WMTP";
> +	default:
> +		return "UNKNOWN_PREEMPT_TYPE";
> +	}
> +}
> +
>  static bool __run_intel_compute_kernel_preempt(int fd,
>  		struct drm_xe_engine_class_instance *eci,
>  		bool threadgroup_preemption,
>  		enum execenv_alloc_prefs alloc_prefs)
>  {
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> -	unsigned int batch;
> -	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> +	int batch;
> +	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
>  	enum intel_driver driver = get_intel_driver(fd);
> +	enum xe_compute_preempt_type required_preempt =
> +		threadgroup_preemption ? PREEMPT_TGP : PREEMPT_WMTP;
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
> @@ -2244,6 +2276,9 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  		kernels++;
>  	}
>  
> +	if (!is_preemptable(batch, required_preempt))

I mean here, similar to if (batch < 0) conditional.

--
Zbigniew

> +		return false;
> +
>  	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
>  		return 0;
>  
> @@ -2260,6 +2295,31 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  
>  	return true;
>  }
> +
> +/**
> + * xe_kernel_preempt_check - Checks IP version to confirm if provided
> + *			     preempt type is supported.
> + * @fd: file descriptor of the opened DRM Xe device
> + * @required_preempt: Preemption type (WMTP/TGP)
> + *
> + * Returns true on success, false otherwise.
> + */
> +bool xe_kernel_preempt_check(int fd, enum xe_compute_preempt_type required_preempt)
> +{
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	int batch = find_preempt_batch(ip_ver);
> +
> +	if (batch < 0) {
> +		igt_debug("Preemption type %s not supported on GPU version 0x%x\n",
> +			  xe_preempt_type_to_str(required_preempt), ip_ver);
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
> index 412791d07..6e18d93e9 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -71,6 +71,16 @@ enum execenv_alloc_prefs {
>  	EXECENV_PREF_VRAM_IF_POSSIBLE,
>  };
>  
> +/**
> + * enum xe_compute_preempt_type - Types of compute preemption supported.
> + * PREEMPT_TGP: ThreadGroup Preemption
> + * PREEMPT_WMTP: Walker Mid Thread Preemption
> + */
> +enum xe_compute_preempt_type {
> +	PREEMPT_TGP  = 1 << 0,
> +	PREEMPT_WMTP  = 1 << 1,
> +};
> +
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
>  
>  bool run_intel_compute_kernel(int fd, struct user_execenv *user,
> @@ -81,4 +91,5 @@ bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_in
>  bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
>  				      bool threadgroup_preemption,
>  				      enum execenv_alloc_prefs alloc_prefs);
> +bool xe_kernel_preempt_check(int fd, enum xe_compute_preempt_type required_preempt);
>  #endif	/* INTEL_COMPUTE_H */
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index c9b194869..076360f1d 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -76,6 +76,7 @@ igt_main
>  	}
>  
>  	igt_subtest_with_dynamic("compute-preempt") {
> +		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -86,6 +87,7 @@ igt_main
>  	}
>  
>  	igt_subtest_with_dynamic("compute-preempt-many") {
> +		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -112,6 +114,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
>  		igt_require(swap_mb > CONTEXT_MB * 10);
>  
> +		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -138,6 +141,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram") {
>  		igt_require(xe_has_vram(xe));
>  
> +		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -164,6 +168,7 @@ igt_main
>  	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
>  		igt_require(xe_has_vram(xe));
>  
> +		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> @@ -188,6 +193,7 @@ igt_main
>  	}
>  
>  	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
> +		igt_require(xe_kernel_preempt_check(xe, PREEMPT_TGP));
>  		xe_for_each_engine(xe, hwe) {
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>  				continue;
> -- 
> 2.51.0
> 
