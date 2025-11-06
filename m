Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECB5CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 14:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2300010E8E9;
	Thu,  6 Nov 2025 14:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWl6LkLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D1B10E8E9
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762438230; x=1793974230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uje8qb7uz7JMJO2gbevSJUkk49a4XKMMbKuIX5DSE8U=;
 b=eWl6LkLjksR+VGDoQJw/VS5pNjBylLqAQQT5LPL/lraiFT4f5rebLJ/P
 B8jnGNVZwVk2hDqvWSTtc4zdRPSodi95pZXMklrC3dqGj7wakRmlWb6UZ
 daGAuMAr/nhUhUTJVsC/sC6k8TNX/O0m6ab9060ikU0JLQCWwx1YoemI7
 el0wlWS1Z2WAAGErttz6k/tqySJS3r+oojiN22Yzxrxyl1hgfqja0Vjcr
 0Sp1JM+LdRhyql0xf7XE8jOwM21Z4HLipXjp17eayv828J1ZJL4kES9BG
 fes1fIE5fRvKzzbEEzPXZTHWS4dm8ZTpUiGUWKEdc20/+K13aOsrUVC1J w==;
X-CSE-ConnectionGUID: fNYDwfucRBC6SIV7L1jfOQ==
X-CSE-MsgGUID: 3sggjtduQ66TUiRB6hRtKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52140775"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="52140775"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:10:30 -0800
X-CSE-ConnectionGUID: PxKRBkmqRjuRckgSKN1Ovw==
X-CSE-MsgGUID: QsucU/MIQHmU5d0uHAcp5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188208898"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 06:10:29 -0800
Date: Thu, 6 Nov 2025 15:10:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH i-g-t v11 2/3] tests/intel/xe_compute: Add
 loop_duration_2s subtest
Message-ID: <20251106141013.teohtf3roxmpu2ui@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nishit.sharma@intel.com, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com
References: <20251105093459.55946-1-nishit.sharma@intel.com>
 <20251105093459.55946-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105093459.55946-3-nishit.sharma@intel.com>
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

Hi nishit.sharma,
On 2025-11-05 at 09:34:58 +0000, nishit.sharma@intel.com wrote:
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
> index 5e9140902..f8059b2d0 100644
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

Second condition after '&&' is useless, either fix it or drop it.

Regards,
Kamil

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
