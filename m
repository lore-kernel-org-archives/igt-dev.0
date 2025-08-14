Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA71CA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 17:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17D510E8C8;
	Thu, 14 Aug 2025 17:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1AD8rUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA1E10E8C8
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 17:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755191433; x=1786727433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qFhDb7Sm4PrmEOw4KLPYqJcxyE/8suyCvnSohjQPPAY=;
 b=N1AD8rUV9LhTcxtkMWn3b8+BRTh9cijGO/VZnVIh4XQ1RRzNuWNtmD6b
 OTxzP4bwU0pRdsvRWd84ixrB3ilnxtT5xZLe/UrYyGZQxXGaWOARozojz
 zx0qYjiWy0syNtD9jto3P2c04gvRCJhUqvQXtGRerFUoHt3gr+HoKdnPv
 /7wKmyUf27Xu3wY/MO7yfiJ5Y8799JytzbIG8wVHXgDv1sua4BLFehLKW
 EcJ6334lOAEr/hJQCmE18YDo0F3sqQJ6sMczcmxQbhDDM9XS9kbZAuzUC
 EqRV9PXsuFlNUdMvCH9qNRzl8FiUfxlXOAsKUIWiLUdqU0W1uvz4wdWVf Q==;
X-CSE-ConnectionGUID: 9jiFWAHrS8y1J64dRfjXPA==
X-CSE-MsgGUID: GrVnYGWsQweeJgHMd3VADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68892497"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68892497"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:10:33 -0700
X-CSE-ConnectionGUID: Aw1+/9mDSSGf7Zp2pfRrzA==
X-CSE-MsgGUID: IB7ofQ1PR0SZHOlsFjC3jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="197805521"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:10:32 -0700
Date: Thu, 14 Aug 2025 19:10:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 2/3] tests/intel/xe_compute: Added loop_duration_2s subtest
Message-ID: <4bsni7x5lfc65rawxyams5ben6hjtrkvkhghugd22tm3vgnk3m@ttbkj6zgeqaj>
References: <20250814155814.130545-1-nishit.sharma@intel.com>
 <20250814155814.130545-3-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814155814.130545-3-nishit.sharma@intel.com>
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

On Thu, Aug 14, 2025 at 03:58:13PM +0000, nishit.sharma@intel.com wrote:
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
> in >= sleep duration set.

Last sentence is not true, you're not verifying that the loop duration.

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/intel_compute.c      |  6 ++++-
>  tests/intel/xe_compute.c | 58 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 125331c53..51caacfa6 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1830,6 +1830,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	int entries = ARRAY_SIZE(bo_dict);
> +	int64_t timeout_one_ns = 1;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1861,11 +1862,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  				    OFFSET_KERNEL, 0, false,
>  				    execenv.array_size);
>  
> +	/* To make GPU run Kernel for specific duration, loo_kernel_duration added */
>  	if (user && user->loop_kernel_duration) {
>  		bo_execenv_exec_async(&execenv, ADDR_BATCH);
>  		igt_measured_usleep(user->loop_kernel_duration);
> +		/* Check that the loop kernel has not completed yet */
> +		igt_assert_neq(0, __xe_wait_ufence(fd, &execenv.bo_sync->sync, USER_FENCE_VALUE,
> +					execenv.exec_queue, &timeout_one_ns));
>  		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
> -		bo_execenv_sync(&execenv);

Why this sync is gone from here? Btw above changes should be part of
first commit, not 2s subtest.

Anyway code looks much better than last time and you're close to
get my acceptance.

>  		user->skip_results_check = 1;
>  	} else
>  		bo_execenv_exec(&execenv, ADDR_BATCH);
> diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
> index 5e9140902..9a417de15 100644
> --- a/tests/intel/xe_compute.c
> +++ b/tests/intel/xe_compute.c
> @@ -19,6 +19,8 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
> +#define LOOP_DURATION	(1000000ull)

I think this should be LOOP_DURATION_2s (1000000ull * 2) because
loop in the shader won't stop after 1s but is spinning until you'll
stop it by magic write.

> +
>  static int gt_sysfs_open(int gt)
>  {
>  	int fd, gt_fd;
> @@ -186,6 +188,58 @@ test_compute_kernel_with_ccs_mode(void)
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
> +		gettimeofday(&end, NULL);
> +		igt_info("Duration for completing Compute kernel :%.3fs\n", elapsed(&start, &end));

Where's verification it is stopped with > 1.5s and < 2.5s?

> +	}
> +	drm_close_driver(fd);
> +}
> +
>  /**
>   * SUBTEST: compute-square
>   * Mega feature: WMTP
> @@ -223,4 +277,8 @@ igt_main
>  
>  	igt_subtest("ccs-mode-compute-kernel")
>  		test_compute_kernel_with_ccs_mode();
> +
> +	/* To test compute function stops after loop_kernel_duration */
> +	igt_subtest("loop-duration-2s")
> +		test_compute_kernel_loop(2 * LOOP_DURATION);

Use LOOP_DURATION_2s.

--
Zbigniew


>  }
> -- 
> 2.43.0
> 
