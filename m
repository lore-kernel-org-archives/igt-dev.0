Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B37CAC581
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 10:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168A110E1FC;
	Mon,  8 Sep 2025 10:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n19m5lUz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DC010E1FC
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757328762; x=1788864762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aIfspRpDUOwO9cXbbvYUbWAYf3xcK9XdE+ueDpHNTq0=;
 b=n19m5lUzn+LnRM9b57ed7+h/gEXZoRXhvcgu/o282REgznqC6c9rE98j
 7kEn+1Nkne4L0jVQCL1q/DPNaCLMh4Cx+tOMcMba9QXntgXMND7y1XHDx
 uZbpoor5e1WuCNfMxMHnkzkSCuQ4E29xXV622W3WTbaoIglXxE/U7sUrx
 09mOUMzE/eIIvm7drKlCd89hmOFUXa4ACMhv9qbRVpBg3DudvUWT/HdPv
 H47sdZRQHkZpyNGaTUALTcuXURvhPs7Sgr3xtUdmXqgP3kQu/mZORCW+u
 b4c2vtv6+cvBYpjc5VMM9AE4Nzu++KwiIyKsFqx5MZqSbixzmKp5JotJB Q==;
X-CSE-ConnectionGUID: zE+8X+xtTAqx0UJAhnIbjw==
X-CSE-MsgGUID: 3O7UUOZ8Q567WqG02AfWpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59651461"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59651461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:52:42 -0700
X-CSE-ConnectionGUID: kSJumOYwQimqZOKgbtlwUg==
X-CSE-MsgGUID: SMSkk+iyS+OH04SySvOnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172634253"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.188])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:52:39 -0700
Date: Mon, 8 Sep 2025 12:52:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/3] tests/intel/xe_compute: Added loop_duration_2s subtest
Message-ID: <czyzmr3pwg56gdo4cdhrhylw5baf5hdd7vgzlzkh5cmvm3w7fp@i7svxhsfbt5d>
References: <20250825115538.321253-1-nishit.sharma@intel.com>
 <20250825115538.321253-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825115538.321253-3-nishit.sharma@intel.com>
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

On Mon, Aug 25, 2025 at 11:55:37AM +0000, nishit.sharma@intel.com wrote:
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

You should rather write sth like:

Verify introduced loop_kernel_duration parameter in user_execenv
is honored when executing a loop kernel. Execution should keep
in 0.2s margin of the requested duration.

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

s/*2/* 2/

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

Fix indent.

> +		gettimeofday(&end, NULL);
> +		igt_assert((double)(loop_duration/LOOP_DURATION_2s - 0.2) < elapsed(&start, &end) &&
> +				    (double)(loop_duration/LOOP_DURATION_2s + 0.2));

And here.

I would also introduce DURATION_MARGIN 0.2 along with LOOP_DURATION_2s
definition.

With these nits fixed:

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
