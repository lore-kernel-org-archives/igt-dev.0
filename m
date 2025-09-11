Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7D2CA1016
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 07:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471EA10E2FF;
	Thu, 11 Sep 2025 07:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knRY1vSj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037D910E2FF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 07:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757574989; x=1789110989;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=etMSfw2lfagmAcZMbii8Bv5rzV6QP7rvzutzNLrSfvc=;
 b=knRY1vSjIehXrYeO0Ztsgnk4rbpONcm+aM+F8wPgKolem3Pj0UMfmB9B
 USxfAZJWuiRjuPxVlFFGVOct0C8ZDrPWpHgICGBgzHt3AkLoAjULqrQOS
 mkbglr3vmOPBsGKXcP0tXQwPnBeZbLaispN/Oewkphuy83/9DNBY4atua
 XSbOFQ/BvTWaxqsi4UO/iaVHfzYneVO4qV0akpJKv2+dyhze2fDNzL+du
 9V0pDgDiAGtmtHChBot2togjVIR1m0/m/ahg0znag1idRCkiS8OvNTd5l
 MndDY/YPKxXDL2+oKImYS4WS9KrNNHjd1IRaG4op0C6LRVHix2xZS/DJ0 A==;
X-CSE-ConnectionGUID: WMPZbRvfRJWBMy4WhRvnGw==
X-CSE-MsgGUID: kCpSPUG2Tim/aEccEivZaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="85342666"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="85342666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:16:28 -0700
X-CSE-ConnectionGUID: L+7dSVERTwCx4/C2XOcuFg==
X-CSE-MsgGUID: F+nxg2VIRZuDbPl6ireWFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="204606423"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:16:27 -0700
Date: Thu, 11 Sep 2025 09:16:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com
Subject: Re: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Message-ID: <z2dy75pz7bcf4k5uiqqo4dz4gzqlwnl54pn7ifbyhxkleookxs@33sg4hlmku7j>
References: <20250910171959.1852534-1-sobin.thomas@intel.com>
 <20250910171959.1852534-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910171959.1852534-2-sobin.thomas@intel.com>
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

On Wed, Sep 10, 2025 at 05:19:59PM +0000, Sobin Thomas wrote:
> On platforms like PVC that lack walker mid-thread preemption, running
> tests in forked threads can cause inconsistent states due to mid-
> execution igt_skip calls. This patch adds a kernel preemption check
> at the start of each subtest to ensure consistent behavior. If the
> GPU lacks required preemption, the test is skipped gracefully.
> 
> v2: Moved compatibility check to igt_fixture per review.
> v3: - Added thread group preemption and WMTP checks;
>     - Introduced enum flags for preemption types. [Zbigniew]
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  lib/intel_compute.c              | 22 ++++++++++++++++++++++
>  lib/intel_compute.h              |  7 +++++++
>  tests/intel/xe_compute_preempt.c |  6 ++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..7538c4b42 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2193,21 +2193,25 @@ static const struct {
>  			     bool threadgroup_preemption,
>  			     enum execenv_alloc_prefs alloc_prefs);
>  	uint32_t compat;
> +	enum xe_compute_preempt_type preempt_type;
>  } intel_compute_preempt_batches[] = {
>  	{
>  		.ip_ver = IP_VER(20, 01),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  	{
>  		.ip_ver = IP_VER(20, 04),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  	{
>  		.ip_ver = IP_VER(30, 00),
>  		.compute_exec = xe2lpg_compute_preempt_exec,
>  		.compat = COMPAT_DRIVER_XE,
> +		.preempt_type = PREEMPT_WMTP | PREEMPT_TGP,
>  	},
>  };
>  
> @@ -2260,6 +2264,24 @@ static bool __run_intel_compute_kernel_preempt(int fd,

Please add here check similar to compat, but for wmtp/tgp call. Just for
making sure if someone wouldn't use check_kernel_preempt().

--
Zbigniew

>  
>  	return true;
>  }
> +
> +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type required_preempt)
> +{
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch;
> +
> +	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
> +		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
> +			break;
> +
> +	if (required_preempt &&
> +	    !(intel_compute_preempt_batches[batch].preempt_type & required_preempt)) {
> +		igt_info("Preemption type not supported %x", required_preempt);
> +		return false;
> +	}
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
