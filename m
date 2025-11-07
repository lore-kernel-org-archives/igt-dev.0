Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418DDCCF9E3
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 08:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F009A10EA40;
	Fri,  7 Nov 2025 08:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBZ40eMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847CB10EA40
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762505739; x=1794041739;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bdAYbo+UudSVu/xtLIZbnNe6aBxVib9dcRaiKqGEcbg=;
 b=UBZ40eMcwFcIzTJXo3PhDAe9hYICspDXc+/pvhJhG78kWDc4xS3qKwsj
 n3kEvQtov5cx7Xrsl+CKw8t2sj6LrntsrTdnhvXYc/Ag2lfAnSuA05JzP
 xRBkOa721xBaELHruYhDfcK7u7/CzJAETW5tuzzQgMr0e+WLWIc5JJlvg
 KG+9sDj4Mdvot3aRVxYkN8EXvN0ArWNGwel3n3yyS3vtM4uq06SLcEixC
 rX4g5K4qr6Ohol7bnbRA1HJ0/WLQiGqiwiBU93iBsHwe1oo8y8QV9ORJg
 uLdQEzDjkDDRSBYBsr6MKNaZv54K+mjhVrbhLd5On9ojv7BEJmXJposob A==;
X-CSE-ConnectionGUID: oUaKeiVsQNms2gyswQbqsw==
X-CSE-MsgGUID: gSUg3crIQsaYvVXeWBfEeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="67265583"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="67265583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 00:55:39 -0800
X-CSE-ConnectionGUID: kN2bwAIbTSKyFG7Gbf7hIQ==
X-CSE-MsgGUID: 4lanmm0hRa64zhBq1VlSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187830911"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.20])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 00:55:38 -0800
Date: Fri, 7 Nov 2025 09:55:35 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v13 2/3] tests/intel/xe_compute: Add
 loop_duration_2s subtest
Message-ID: <gr3dzv2ch5igtww66cch7le7e4laymf6cqfkq4fbtqmza6v3z5@ysnxfho7txbo>
References: <20251107083210.65425-1-nishit.sharma@intel.com>
 <20251107083210.65425-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251107083210.65425-3-nishit.sharma@intel.com>
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

On Fri, Nov 07, 2025 at 08:32:09AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Verify introduced loop_kernel_duration parameter in user_execenv
> which makes GPU busy for specified duration. Execution should remain
> within a 0.2 second margin of the requested duration. loop_kernel shader
> is not supported in xehpc, xehp, xelpg pipelines so test will skip.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

I don't know why you're keeping my rb here when you're touching the code.
Above should gone when you're resending this altered patch.

> ---
>  tests/intel/xe_compute.c | 65 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 5e9140902..192cbf492 100644
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
> @@ -186,6 +189,64 @@ test_compute_kernel_with_ccs_mode(void)
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
> +	double elapse_time, lower_bound, upper_bound;
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
> +		elapse_time = (double)elapsed(&start, &end);

You don't need to cast here, elapsed already returns double.

> +		lower_bound = (double)(loop_duration / 1e6 - DURATION_MARGIN);

Using 1e6 will cause other variables will be casted to double, so
writing:

lower_bound = loop_duration / 1e6 - DURATION_MARGIN;

is enough, no need to cast the whole expression.

> +		upper_bound = (double)(loop_duration / 1e6 + DURATION_MARGIN);

Ditto.

> +
> +		igt_assert((lower_bound < elapse_time) && (elapse_time < upper_bound));

Logical and (&&) has lower prio than < and >, so brackets are not
necessary.

With above nits fixed

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +	}
> +	drm_close_driver(fd);
> +}
> +
>  /**
>   * SUBTEST: compute-square
>   * Mega feature: WMTP
> @@ -223,4 +284,8 @@ igt_main
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
