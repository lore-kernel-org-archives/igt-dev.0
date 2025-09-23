Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52243CAC5A7
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 05:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D174910E563;
	Tue, 23 Sep 2025 05:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGNSE8MV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6D810E563
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 05:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758605950; x=1790141950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s8X46eBz2mRSG//wWoI/muz9gNnlCDvg5jg09AkxK+o=;
 b=XGNSE8MVOpQTu0ehSsbSp9PiZJesNECgqud3UnUvQQYjGzJ4CR0mF9d7
 TCEcZtT4Tjxz4hp19eKFDr8ld1xOET60LHA63+fylrBWlVBkPJNlfL+K3
 bqKzcD1WFNCI6GQLHJtId9mok/ddGxbFPDyK8ltWgtjyRISKXbSUJTddw
 fXPW9wb0boCHfh9q8gZy5iYN9hAGhidKLvq9HybnD4xIC7Lxp0HfoMH+T
 8duuRRAP7mRwXqUkLgZtz+hXEJJf4fbOfM1ZzhEjiRzQn5C/OVzSZP+ae
 KyiDew9xbtY9bCu+WLgSzagqkBc5tUmK2/hMTRD1xJF07PimpE1ID2E9a Q==;
X-CSE-ConnectionGUID: nstMfTIJRtmsuE48EWdT0g==
X-CSE-MsgGUID: 66NKOcaXSJ2TcZBNC6eiuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="59918173"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="59918173"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 22:39:09 -0700
X-CSE-ConnectionGUID: Sjn56kS2RHWOPRaS12s/5Q==
X-CSE-MsgGUID: /97i/kxGRrSKB4B6XpTPDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="181837264"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.223])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 22:39:07 -0700
Date: Tue, 23 Sep 2025 07:39:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Cc: "Thomas, Sobin" <sobin.thomas@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH v6 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Message-ID: <txjlguliuh32jfkz3hnrlj2p3yrlfxzkjt4bsdxykwks2hsae7@cggu63ammrwx>
References: <20250917101105.236457-1-sobin.thomas@intel.com>
 <20250917101105.236457-2-sobin.thomas@intel.com>
 <CH3PR11MB84340AE3825F7ABDF2E7555C8D11A@CH3PR11MB8434.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB84340AE3825F7ABDF2E7555C8D11A@CH3PR11MB8434.namprd11.prod.outlook.com>
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

On Fri, Sep 19, 2025 at 10:19:37AM +0200, Dandamudi, Priyanka wrote:
> 
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sobin
> > Thomas
> > Sent: 17 September 2025 03:41 PM
> > To: igt-dev@lists.freedesktop.org; Konieczny, Kamil
> > <kamil.konieczny@intel.com>
> > Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Thomas,
> > Sobin <sobin.thomas@intel.com>
> > Subject: [PATCH v6 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
> > preemption check
> > 
> > On platforms (like PVC) that do not support walker mid-thread preemption,
> > running tests in forked threads can lead to inconsistent states due to igt_skip
> > being called mid-execution. Made changes to perform kernel preemption
> > check at the beginning of each subtests.
> > If the GPU version does not support the required features, the test is skipped
> > gracefully, ensuring consistent behavior across different platforms.
> > 
> > TODO: Add the kernel for PVC
> > 
> > v2: Fixed review comments to move the compatibility check
> >     into the igt_fixture. [Priyanka]
> > 
> > v3: Added check for thread group preemption and WMTP.
> >     Added enum flags for preemption type as per review . [Zbigniew]
> > 
> > v4: Added check for preempt inside __run_intel_compute_kernel_preempt
> >     Refactored the code.  [priyanka]
> > 
> > v5: Refactor for finding the kernel and out of bound check. [Zbigniew]
> > 
> > v6: Added NULL Check for kernel. [Zbigniew]
> > 
> > Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> > ---
> >  lib/intel_compute.c              | 104 ++++++++++++++++++++++++-------
> >  lib/intel_compute.h              |   7 +++
> >  tests/intel/xe_compute_preempt.c |   6 ++
> >  3 files changed, 95 insertions(+), 22 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c index
> > 147dd2916..93f56b1b0 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -1921,14 +1921,33 @@ static const struct {
> >  	},
> >  };
> > 
> > +static const struct intel_compute_kernels
> > +		*intel_compute_find_kernel(const struct
> > intel_compute_kernels  *kernels,
> > +		unsigned int ip_ver)
> > +{
> > +	if (!kernels) {
> > +		igt_debug("%s: kernel_list is NULL\n", __func__);
> > +		return NULL;
> > +	}
> > +
> > +	while (kernels->kernel) {
> > +		if (ip_ver == kernels->ip_ver)
> > +			return kernels;
> > +		kernels++;
> > +	}
> > +	igt_info("%s: No Match found for ip_ver=%u\n", __func__, ip_ver);
> Here instead of info just debug can be added.

I think better would be to drop this line here and decide in the caller
what to do in case of getting NULL (likely to use igt_warn()).

--
Zbigniew

> > +
> > +	return NULL;
> > +}
> > +
> >  static bool __run_intel_compute_kernel(int fd,
> >  				       struct drm_xe_engine_class_instance
> > *eci,
> >  				       struct user_execenv *user,
> >  				       enum execenv_alloc_prefs alloc_prefs)  {
> >  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> > -	unsigned int batch;
> > -	const struct intel_compute_kernels *kernels =
> > intel_compute_square_kernels;
> > +	int batch;
> > +	const struct intel_compute_kernels *kernel_entries =
> > +intel_compute_square_kernels, *kernels;
> >  	enum intel_driver driver = get_intel_driver(fd);
> >  	const unsigned char *kernel;
> >  	unsigned int kernel_size;
> > @@ -1954,12 +1973,8 @@ static bool __run_intel_compute_kernel(int fd,
> >  		kernel = user->kernel;
> >  		kernel_size = user->kernel_size;
> >  	} else {
> > -		while (kernels->kernel) {
> > -			if (ip_ver == kernels->ip_ver)
> > -				break;
> > -			kernels++;
> > -		}
> > -		if (!kernels->kernel)
> > +		kernels = intel_compute_find_kernel(kernel_entries, ip_ver);
> > +		if (!kernel || !kernels->kernel)
> >  			return false;
> >  		kernel = kernels->kernel;
> >  		kernel_size = kernels->size;
> > @@ -2193,24 +2208,46 @@ static const struct {
> >  			     bool threadgroup_preemption,
> >  			     enum execenv_alloc_prefs alloc_prefs);
> >  	uint32_t compat;
> > +	enum xe_compute_preempt_type preempt_type;
> >  } intel_compute_preempt_batches[] = {
> >  	{
> >  		.ip_ver = IP_VER(20, 01),
> >  		.compute_exec = xe2lpg_compute_preempt_exec,
> >  		.compat = COMPAT_DRIVER_XE,
> > +		.preempt_type = PREEMPT_WMTP,
> >  	},
> >  	{
> >  		.ip_ver = IP_VER(20, 04),
> >  		.compute_exec = xe2lpg_compute_preempt_exec,
> >  		.compat = COMPAT_DRIVER_XE,
> > +		.preempt_type = PREEMPT_WMTP,
> >  	},
> >  	{
> >  		.ip_ver = IP_VER(30, 00),
> >  		.compute_exec = xe2lpg_compute_preempt_exec,
> >  		.compat = COMPAT_DRIVER_XE,
> > -	},
> > +		.preempt_type = PREEMPT_WMTP,
> > +	}
> >  };
> > 
> > +static int find_preempt_batch(unsigned int ip_ver) {
> > +	for (int batch = 0; batch <
> > ARRAY_SIZE(intel_compute_preempt_batches); batch++)
> > +		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
> > +			return batch;
> > +	return -1;
> > +}
> > +
> > +static bool is_preemptable(int batch, enum xe_compute_preempt_type
> > +required_preempt) {
> > +	if (required_preempt &&
> > +	    !(intel_compute_preempt_batches[batch].preempt_type &
> > required_preempt)) {
> > +		igt_info("Preemption not supported\n");
> > +		return false;
> > +	}
> > +	return true;
> > +}
> > +
> >  static bool __run_intel_compute_kernel_preempt(int fd,
> >  		struct drm_xe_engine_class_instance *eci,
> >  		bool threadgroup_preemption,
> > @@ -2218,15 +2255,12 @@ static bool
> > __run_intel_compute_kernel_preempt(int fd,  {
> >  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> >  	unsigned int batch;
> > -	const struct intel_compute_kernels *kernels =
> > intel_compute_square_kernels;
> > +	const struct intel_compute_kernels *kernel_entries =
> > +intel_compute_square_kernels, *kernels;
> >  	enum intel_driver driver = get_intel_driver(fd);
> > +	int required_preempt = threadgroup_preemption ? PREEMPT_TGP :
> > +PREEMPT_WMTP;
> > 
> > -	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches);
> > batch++)
> > -		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
> > -			break;
> > -
> > -
> > -	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
> > +	batch = find_preempt_batch(ip_ver);
> > +	if (batch < 0) {
> >  		igt_debug("GPU version 0x%x not supported\n", ip_ver);
> >  		return false;
> >  	}
> > @@ -2238,14 +2272,16 @@ static bool
> > __run_intel_compute_kernel_preempt(int fd,
> >  		return false;
> >  	}
> > 
> > -	while (kernels->kernel) {
> > -		if (ip_ver == kernels->ip_ver)
> > -			break;
> > -		kernels++;
> > -	}
> > +	if (!is_preemptable(batch, required_preempt))
> > +		return false;
> > 
> > +	kernels = intel_compute_find_kernel(kernel_entries, ip_ver);
> > +	if (!kernels) {
> > +		igt_debug("No Matching kernel found for ip_ver=%u",
> > ip_ver);
> This debug info whether null or not matching is already present in the compute find kernel method, again no need to use this print. This entire if condition can be removed and add it in the below if condition like added  in __run_intel_compute_kernel if (!kernel || !kernels->kernel)
> > +		return false;
> > +	}
> >  	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
> > -		return 0;
> > +		return false;
> > 
> >  	intel_compute_preempt_batches[batch].compute_exec(fd, kernels-
> > >long_kernel,
> >  							  kernels-
> > >long_kernel_size,
> > @@ -2260,6 +2296,30 @@ static bool
> > __run_intel_compute_kernel_preempt(int fd,
> > 
> >  	return true;
> >  }
> > +
> > +/**
> > + * check_kernel_preempt- Checks ip version to confirm if  provided
> > + * preempt type is supported.
> > + * @fd: file descriptor of the opened DRM Xe device
> > + * @required_preempt: Preemption type ( WMTP/TGP)
> > + *
> > + * Returns true on success, false otherwise.
> > + */
> > +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type
> > +required_preempt) {
> > +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> > +	unsigned int batch = find_preempt_batch(ip_ver);
> > +
> > +	if (batch < 0) {
> > +		igt_debug("GPU version 0x%x not supported\n", ip_ver);
> > +		return false;
> > +	}
> > +	if (!is_preemptable(batch, required_preempt))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> >  /**
> >   * run_intel_compute_kernel_preempt - runs compute kernels to
> >   * exercise preemption scenario.
> > diff --git a/lib/intel_compute.h b/lib/intel_compute.h index
> > 412791d07..b70cd7185 100644
> > --- a/lib/intel_compute.h
> > +++ b/lib/intel_compute.h
> > @@ -71,6 +71,11 @@ enum execenv_alloc_prefs {
> >  	EXECENV_PREF_VRAM_IF_POSSIBLE,
> >  };
> > 
> > +enum xe_compute_preempt_type {
> > +	PREEMPT_TGP  = 1 << 0,    /* ThreadGroup Preemption */
> > +	PREEMPT_WMTP  = 1 << 1,  /* Walker Mid Thread Preemption */ };
> > +
> >  extern const struct intel_compute_kernels intel_compute_square_kernels[];
> > 
> >  bool run_intel_compute_kernel(int fd, struct user_execenv *user, @@ -81,4
> > +86,6 @@ bool xe_run_intel_compute_kernel_on_engine(int fd, struct
> > drm_xe_engine_class_in  bool run_intel_compute_kernel_preempt(int fd,
> > struct drm_xe_engine_class_instance *eci,
> >  				      bool threadgroup_preemption,
> >  				      enum execenv_alloc_prefs alloc_prefs);
> > +
> > +bool check_kernel_preempt(int fd, enum xe_compute_preempt_type
> > +required_preempt);
> >  #endif	/* INTEL_COMPUTE_H */
> > diff --git a/tests/intel/xe_compute_preempt.c
> > b/tests/intel/xe_compute_preempt.c
> > index c9b194869..a4c0bc59b 100644
> > --- a/tests/intel/xe_compute_preempt.c
> > +++ b/tests/intel/xe_compute_preempt.c
> > @@ -76,6 +76,7 @@ igt_main
> >  	}
> > 
> >  	igt_subtest_with_dynamic("compute-preempt") {
> > +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
> >  		xe_for_each_engine(xe, hwe) {
> >  			if (hwe->engine_class !=
> > DRM_XE_ENGINE_CLASS_COMPUTE)
> >  				continue;
> > @@ -86,6 +87,7 @@ igt_main
> >  	}
> > 
> >  	igt_subtest_with_dynamic("compute-preempt-many") {
> > +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
> >  		xe_for_each_engine(xe, hwe) {
> >  			if (hwe->engine_class !=
> > DRM_XE_ENGINE_CLASS_COMPUTE)
> >  				continue;
> > @@ -112,6 +114,7 @@ igt_main
> >  	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
> >  		igt_require(swap_mb > CONTEXT_MB * 10);
> > 
> > +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
> >  		xe_for_each_engine(xe, hwe) {
> >  			if (hwe->engine_class !=
> > DRM_XE_ENGINE_CLASS_COMPUTE)
> >  				continue;
> > @@ -138,6 +141,7 @@ igt_main
> >  	igt_subtest_with_dynamic("compute-preempt-many-vram") {
> >  		igt_require(xe_has_vram(xe));
> > 
> > +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
> >  		xe_for_each_engine(xe, hwe) {
> >  			if (hwe->engine_class !=
> > DRM_XE_ENGINE_CLASS_COMPUTE)
> >  				continue;
> > @@ -164,6 +168,7 @@ igt_main
> >  	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
> >  		igt_require(xe_has_vram(xe));
> > 
> > +		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
> >  		xe_for_each_engine(xe, hwe) {
> >  			if (hwe->engine_class !=
> > DRM_XE_ENGINE_CLASS_COMPUTE)
> >  				continue;
> > @@ -188,6 +193,7 @@ igt_main
> >  	}
> > 
> >  	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
> > +		igt_require(check_kernel_preempt(xe, PREEMPT_TGP));
> >  		xe_for_each_engine(xe, hwe) {
> >  			if (hwe->engine_class !=
> > DRM_XE_ENGINE_CLASS_COMPUTE)
> >  				continue;
> > --
> > 2.34.1
> 
