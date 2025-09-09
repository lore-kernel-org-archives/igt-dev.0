Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00917CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 07:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94D310E163;
	Tue,  9 Sep 2025 07:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8j8osZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0879A10E163
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757403620; x=1788939620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nEg77qr4U3wjqdifH05R77bbMtfR7lpuTE5ItTRfwwM=;
 b=X8j8osZURauabAXIzSADwe/6qlt7LkxFrMEzcDpwoarzTGxNICtrAecJ
 B/pTX9EkqW7kv0KDCPO+fAWV0wOGq3NeQUJ3d/VG3k0C873rPKmVJ67hL
 8ggIR27BhvfTyQgmdqfRY/FUTGf7yDGjG3kwO8ckyAupX3+9Ne6gEKfwO
 0StRTDnZHQzbMFx5WKKTcU9eA+jLs/uBJkzV8YchW73c6osGOPD3eX+FZ
 n9cvTLGkl4MGmYNP6pbwhpsalJa7DPhXMNdAylb06HPMUKQOl5uqVFLzE
 SFmhXQaD1uA8hqsbomxJ7wojlTvSRYBDUyFixV1amKAY4S3jVnX+twMX9 A==;
X-CSE-ConnectionGUID: N0ycgMHBSxqGqxFVR7rrjg==
X-CSE-MsgGUID: Plq94NyxSdqT01o+tpN34A==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59823950"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="59823950"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 00:40:19 -0700
X-CSE-ConnectionGUID: OMy8iKloTh6JiLSOB6Uo+g==
X-CSE-MsgGUID: c9b4g/HYQia/5u691+jEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="173809209"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 00:40:18 -0700
Date: Tue, 9 Sep 2025 09:40:15 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Sobin Thomas <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: Re: [PATCH v2 i-g-t 1/1] tests/intel/xe_compute_preempt: GPU
 Compatibility check
Message-ID: <yyl5mgwoj5rqmturynlub5w3riu4bngqpmvjagdy7oeb6paqpz@kxibybz2mhq6>
References: <20250908171421.1787165-1-sobin.thomas@intel.com>
 <20250908171421.1787165-2-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908171421.1787165-2-sobin.thomas@intel.com>
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

On Mon, Sep 08, 2025 at 05:14:21PM +0000, Sobin Thomas wrote:
> On platforms that do not support walker mid-thread preemption, running
> tests in forked threads can lead to inconsistent states due to
> igt_skip being called mid-execution. This patch introduces a GPU
> compatibility check at the beginning of the xe_compute_preempt test.
> If the GPU version does not support the required features, the
> entire test is skipped gracefully, ensuring consistent behavior across
> platforms.
> 
> v2: Fixed review comments to move the compatibility check
>     into the igt_fixture.
> 
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  lib/intel_compute.c              | 45 +++++++++++++++++++-------------
>  lib/intel_compute.h              |  2 ++
>  tests/intel/xe_compute_preempt.c |  1 +
>  3 files changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..2bb70824e 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2219,24 +2219,6 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	unsigned int batch;
>  	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> -	enum intel_driver driver = get_intel_driver(fd);
> -
> -	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
> -		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
> -			break;
> -
> -
> -	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
> -		igt_debug("GPU version 0x%x not supported\n", ip_ver);
> -		return false;
> -	}
> -
> -	if (!(COMPAT_DRIVER_FLAG(driver) & intel_compute_preempt_batches[batch].compat)) {
> -		igt_debug("Driver is not supported: flags %x & %x\n",
> -			  COMPAT_DRIVER_FLAG(driver),
> -			  intel_compute_preempt_batches[batch].compat);
> -		return false;
> -	}
>  
>  	while (kernels->kernel) {
>  		if (ip_ver == kernels->ip_ver)
> @@ -2260,6 +2242,31 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>  
>  	return true;
>  }
> +
> +bool check_gpu_compatibility_kernel_preempt(int fd)
> +{
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	unsigned int batch;
> +	enum intel_driver driver = get_intel_driver(fd);
> +
> +	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
> +		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
> +			break;
> +
> +	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
> +		igt_debug("GPU version 0x%x not supported\n", ip_ver);
> +		return false;
> +	}
> +
> +	if (!(COMPAT_DRIVER_FLAG(driver) & intel_compute_preempt_batches[batch].compat)) {
> +		igt_debug("Driver is not supported: flags %x & %x\n",
> +			COMPAT_DRIVER_FLAG(driver),
> +			intel_compute_preempt_batches[batch].compat);
> +		return false;
> +	}
> +	return true;
> +}
> +
>  /**
>   * run_intel_compute_kernel_preempt - runs compute kernels to
>   * exercise preemption scenario.
> @@ -2275,6 +2282,8 @@ bool run_intel_compute_kernel_preempt(int fd,
>  		bool threadgroup_preemption,
>  		enum execenv_alloc_prefs alloc_prefs)
>  {
> +	if (!check_gpu_compatibility_kernel_preempt(fd))
> +		return false;

This check doesn't diverge between WMTP and TG preemption.
On PVC we're technically able to run TG preemption tests
(but noone did it before).

>  	return __run_intel_compute_kernel_preempt(fd, eci, threadgroup_preemption,
>  						  alloc_prefs);
>  }
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index 412791d07..0998fd661 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -73,6 +73,8 @@ enum execenv_alloc_prefs {
>  
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
>  
> +bool check_gpu_compatibility_kernel_preempt(int fd);
> +
>  bool run_intel_compute_kernel(int fd, struct user_execenv *user,
>  			      enum execenv_alloc_prefs alloc_prefs);
>  bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci,
> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> index c9b194869..5722ef3d4 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -73,6 +73,7 @@ igt_main
>  		ram_mb = igt_get_avail_ram_mb();
>  		swap_mb = igt_get_total_swap_mb();
>  		vram_mb = xe_visible_vram_size(xe, 0) >> 20;
> +		igt_require_f(check_gpu_compatibility_kernel_preempt(xe), "GPU not supported\n");

And here we eliminate both preemptions in the same time
even if platform may support TG preemption. I would use
this require in each test separately - extend array
struct intel_compute_preempt_batches to include preempt_type
similar to compat and use in the test individually.
This would allow us to use this code in the future if
from some reason platform will have only one of supported
preemptions.

--
Zbigniew



>  	}
>  
>  	igt_subtest_with_dynamic("compute-preempt") {
> -- 
> 2.34.1
> 
