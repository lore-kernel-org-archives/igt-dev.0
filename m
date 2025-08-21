Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBCFCA0EEB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 10:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767E710E91F;
	Thu, 21 Aug 2025 10:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqjWe/ol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBED10E91F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755772259; x=1787308259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zRln53bxIkC0nGpj/PYQXzHJv/3vFQ0zmeJXHnAanI0=;
 b=HqjWe/olPhVfiRBJWkwBCuN6WPREcsKLjcMST8/l9Mj0Q2uXbq6Cs/J1
 NDdp6/Lixi5zpNNfpYFRF2wD4LBQSaQEL7gd9EO+sg42xjHCoX7IDy6T7
 O4P4n/bsZEdrCKcRHb+ReJIDRN5CU+1OE4qdqR1WEPJ/WX9Ja6NRpTlOI
 ZDvcXu0Ek+FKw8omSiL1Iml+y0Xjjz9VL9FZyhIKHdOKnjF9mWO6NPivE
 h/2hAaQDp5cCVWPm4sYFtvT/TLAOiRdXmkoYbMTV+Ua+gZSV2Nab4Qm6G
 z83m3maPP6J5YfmzOHaHMixZGiMJ5p4ZZzw6gZ79oNT5Lhf9K5fOhnsdG Q==;
X-CSE-ConnectionGUID: UcnWrVmZRlu97txvJj1FWQ==
X-CSE-MsgGUID: ytC/VjSWQDWyVA1N7x2vmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61869466"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="61869466"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 03:30:59 -0700
X-CSE-ConnectionGUID: vmYdhKKXT/GcDb2o7u/bVw==
X-CSE-MsgGUID: XGW/OPMcSiOI/xqtoE2f1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167994118"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.184])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 03:30:57 -0700
Date: Thu, 21 Aug 2025 12:30:54 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/3] tests/intel/xe_compute: Added loop_duration_2s subtest
Message-ID: <64xhywvhaqreh5tkoznxayszgwzhxjx4jj5q5fiuya2nyekhhb@u232sezg36ae>
References: <20250819074338.238525-1-nishit.sharma@intel.com>
 <20250819074338.238525-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819074338.238525-3-nishit.sharma@intel.com>
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

On Tue, Aug 19, 2025 at 07:43:37AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Added loop_duration_2s subtest which fills kernel and loop_kernel_duration
> members of structure user_execenv and passed as member in
> xe_run_intel_compute_kernel_on_engine() to schedule Job on CCS engine.
> This also verifies GPU is executing loop_kernel shader when sleep for
> loop_kernel_duration is called. loop_kernel shader is available on
> xe2lpg and xe3lpg pipeline. Verified GPU is working during sleep using
> gputop. Test will skip for xehpc, xehp, xelpg pipeline as they don't have
> loop_kernel shader. This checks whether the test executed successfully
> in elapsed_duration  >= loop_kernel_duration + 0.2 seconds or failed in
> duration - 0.2 < elapsed_duration. elapsed_duration is time taken on
> scheduling and execution of workload in single iteration on single
> single instance of CCS.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_compute.c | 59 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 5e9140902..998a58cf4 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -19,6 +19,8 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#define LOOP_DURATION_2s	(1000000ull *2)
> +
>  static int gt_sysfs_open(int gt)
>  {
>  	int fd, gt_fd;
> @@ -186,6 +188,59 @@ test_compute_kernel_with_ccs_mode(void)
>  	igt_require(num_gt_with_ccs_mode > 0);
>  }
>  
> +static double elapsed(const struct timeval *start,
> +		      const struct timeval *end)
> +{
> +	return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start->tv_usec);
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

This should come from the fixture and test should be in part
before drm_close_driver();

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
> +		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, &execenv, EXECENV_PREF_SYSTEM),
> +				"Unable to run compute kernel successfully\n");
> +		gettimeofday(&end, NULL);
> +		igt_assert((double)(loop_duration/LOOP_DURATION_2s - 0.2) < elapsed(&start, &end) &&
> +				    (double)(loop_duration/LOOP_DURATION_2s + 0.2));

It would be good to define DURATION_MARGIN == 0.2 and use here.

> +	}
> +	drm_close_driver(fd);

This obviously can be removed when you use fd from opening fixture.

With these nits addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +}
> +
>  /**
>   * SUBTEST: compute-square
>   * Mega feature: WMTP
> @@ -223,4 +278,8 @@ igt_main
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
