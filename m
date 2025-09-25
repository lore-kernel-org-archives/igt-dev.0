Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC6CAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 09:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8E410E2B0;
	Thu, 25 Sep 2025 09:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dgq68NaV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCC510E2B0
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758792950; x=1790328950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QcZ/eq4paqVvAhQowrmf5T52v71e4uGwSwvbhU2OuLE=;
 b=Dgq68NaVZ15Nid0/YRYI1pZpkUqVDjuMypj597N5dQPVxHVi/482vpJr
 T8OGJiCxst44DhtlKvXEdhYGBa8EpdSUgyLENTIp+7MRkGdpOIzTLNNex
 arfG2LlzNZFQN+l2o4Abqsa4W+ln7yfzbXviF6NbP3pLvLT0wC+sTTFm4
 rPCRroFoDTenPPCbyTCFIB07Bv62a1zZYvO4Vn1D9X4p/PK5bh3qybczH
 MOB1FXDFTExhdiYN6VPq/TkBv604S0PfNFWjg/cpLXbeBfoVZjEjsGjUp
 ngpuQMNyoIdcrLVCDhrGDPBw3vsKpaF4C96uvUgv9pi0bSITKhS+tRmOH g==;
X-CSE-ConnectionGUID: j8AxBR8YR/yqLZswQkBkEQ==
X-CSE-MsgGUID: l4cRuKrTQt6dDm7exO3GjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="83713775"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="83713775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 02:35:49 -0700
X-CSE-ConnectionGUID: PoBnOb2kTAGxMW0Xw4SAzA==
X-CSE-MsgGUID: gMXMOK4HS6uqluaiDktm8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176887704"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.41])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 02:35:48 -0700
Date: Thu, 25 Sep 2025 11:35:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v5 2/3] tests/intel/xe_compute: Add
 loop_duration_2s subtest
Message-ID: <cn3vwq5us2ga5a5lsahj3j6f22jguu55mxp24abui3hqqag537@5g6ndlkeemu2>
References: <20250925044333.176939-1-nishit.sharma@intel.com>
 <20250925044333.176939-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925044333.176939-3-nishit.sharma@intel.com>
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

On Thu, Sep 25, 2025 at 04:43:32AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Verify introduced loop_kernel_duration parameter in user_execenv
> which makes GPU busy for specified duration. Execution should remain
> within a 0.2 second margin of the requested duration. loop_kernel shader
> is not supported in xehpc, xehp, xelpg pipelines so test will skip.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_compute.c | 61 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 5e9140902..ab1677950 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -19,6 +19,9 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#define LOOP_DURATION_2s	(1000000ull * 2)
> +#define DURATION_MARGIN		0.2
> +
>  static int gt_sysfs_open(int gt)
>  {
>  	int fd, gt_fd;
> @@ -186,6 +189,60 @@ test_compute_kernel_with_ccs_mode(void)
>  	igt_require(num_gt_with_ccs_mode > 0);
>  }
>  
> +static double elapsed(const struct timeval *start,
> +		      const struct timeval *end)
> +{
> +	return (end->tv_sec - start->tv_sec) + 1e - 6 * (end->tv_usec - start->tv_usec);

Are you testing my observation skills? Lucklily for me compiler
did this work for me. Why do you touch already reviewed patches?

--
Zbigniew

> +}
> +
> +/**
> + * SUBTEST: loop-duration-2s
> + * Functionality: OpenCL kernel
> + * Description:
> + *	Run an openCL loop Kernel that for duration,
> + *	set in loop_kernel_duration ..
> + */
> +static void
> +test_compute_kernel_loop(uint64_t loop_duration)
> +{
> +	int fd;
> +	unsigned int ip_ver;
> +	const struct intel_compute_kernels *kernels;
> +	struct user_execenv execenv = { 0 };
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct timeval start, end;
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> +	kernels = intel_compute_square_kernels;
> +
> +	while (kernels->kernel) {
> +		if (ip_ver == kernels->ip_ver)
> +			break;
> +		kernels++;
> +	}
> +
> +	/* loop_kernel_duration used as sleep to make EU busy for loop_duration */
> +	execenv.loop_kernel_duration = loop_duration;
> +	execenv.kernel = kernels->loop_kernel;
> +	execenv.kernel_size = kernels->loop_kernel_size;
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		igt_info("Running loop_kernel on ccs engine %d\n", hwe->engine_instance);
> +		gettimeofday(&start, NULL);
> +		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, &execenv,
> +								   EXECENV_PREF_SYSTEM),
> +			     "Unable to run compute kernel successfully\n");
> +		gettimeofday(&end, NULL);
> +		igt_assert((double)(loop_duration / LOOP_DURATION_2s - DURATION_MARGIN) < elapsed(&start, &end) &&
> +			   (double)(loop_duration / LOOP_DURATION_2s + DURATION_MARGIN));
> +	}
> +	drm_close_driver(fd);
> +}
> +
>  /**
>   * SUBTEST: compute-square
>   * Mega feature: WMTP
> @@ -223,4 +280,8 @@ igt_main
>  
>  	igt_subtest("ccs-mode-compute-kernel")
>  		test_compute_kernel_with_ccs_mode();
> +
> +	/* To test compute function stops after loop_kernel_duration */
> +	igt_subtest("loop-duration-2s")
> +		test_compute_kernel_loop(LOOP_DURATION_2s);
>  }
> -- 
> 2.43.0
> 
