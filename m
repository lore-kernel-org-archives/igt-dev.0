Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA98CAC581
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 10:42:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD610E205;
	Mon,  8 Sep 2025 10:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Af92JLnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272B310E205
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757328161; x=1788864161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jBnqMKsbLn/bVfXrfRxSoQT8HuPuoPdTklmqTn/rvKE=;
 b=Af92JLnpdbvMNIbq8umYjzxMY/YRPj1MWLDC+FbvU8kzvM+XyY0vxbuJ
 V3YLXRghrVsgywxU99qQvplf7YUGTxczn4FulP01qaQkl9WwvQ7OdCV2j
 WcvgbewQjVEuuIuhOuYoU9gQIbBOqUwsCICx/7FTSME0fYqJgkf0+9NsR
 zzxKR10+u7gL1no2ZR41Pm0hTObgmtZp/WrD0FqZH0UuGWrNxF70XBmkK
 ZHrA+TUvCKGgFYebHH3HAYygURWMIXFP8lrlzZJCkxsoOBzk6tlQFNKKS
 yXUot+xV2yPiJA2uQ0uM2yBAfVbl/qo5jiG2GoVcXAkhIP+/1L0wpK1Cs g==;
X-CSE-ConnectionGUID: hVJyJ+tFSK6jzq7SQ0Xbpg==
X-CSE-MsgGUID: X0jSjZKWQHibpx97WIlDcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="71002849"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="71002849"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:42:41 -0700
X-CSE-ConnectionGUID: aNAjbZaTTJSJWKbmbI5m5g==
X-CSE-MsgGUID: xJl3N5w8SCyhM/u6gc1AEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173223725"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.188])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:42:39 -0700
Date: Mon, 8 Sep 2025 12:42:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/3] lib/intel_compute: loop_kernel_duration in Pipeline
Message-ID: <car6eqjg3lintzrt6xlq7yra5pbkmvfgirbyxivgnsqbhamwpn@hhtc7tdrsser>
References: <20250825115538.321253-1-nishit.sharma@intel.com>
 <20250825115538.321253-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825115538.321253-2-nishit.sharma@intel.com>
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

Hi. Subject is not presented here, but you should send patches with
i-g-t prefix inside.

See - https://intel-gfx-ci.01.org/

On Mon, Aug 25, 2025 at 11:55:36AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> To execute KERNEL in GPU for specific duration a brief sleep is
> required. New variable loop_kernel_duration is introduced in
> struct user_execenv which holds duration for sleep and during this
> duration the GPU will be running kernel. xe_run_intel_compute_xxx()
> calls are synchronous hence to execute workload on GPU for sometime
> sleep has been called. loop_kernel_duration acts as sleep duration.
> loop_kernel_duration is checked for all pipelines. Currently xe2lpg and
> xe3lpg pipeline support loop_kernel shader hence loop_kernel_duration
> works in these pipelines only.

You've explaind what code does, but you also should explain what
will be its use.

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/intel_compute.c | 25 ++++++++++++++++++++++++-
>  lib/intel_compute.h |  2 ++
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..5a919deb8 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -849,6 +849,9 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	uint16_t devid = intel_get_drm_devid(fd);
>  	int entries = ARRAY_SIZE(bo_dict);
>  
> +	if (user && (user->kernel || user->loop_kernel_duration))
> +		igt_skip("Pipeline doesn't support loop_kernel\n");
> +
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Set dynamic sizes */
> @@ -1131,6 +1134,9 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	int entries = ARRAY_SIZE(bo_dict);
>  
> +	if (user && (user->kernel || user->loop_kernel_duration))
> +		igt_skip("Pipeline doesn't support loop_kernel\n");
> +
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Set dynamic sizes */
> @@ -1343,6 +1349,9 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	int entries = ARRAY_SIZE(bo_dict);
>  
> +	if (user && (user->kernel || user->loop_kernel_duration))
> +		igt_skip("Pipeline doesn't support loop_kernel\n");
> +
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Set dynamic sizes */
> @@ -1731,6 +1740,9 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	int entries = ARRAY_SIZE(bo_dict);
>  
> +	if (user && (user->kernel || user->loop_kernel_duration))
> +		igt_skip("Pipeline doesn't support loop_kernel\n");
> +
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
>  	/* Set dynamic sizes */
> @@ -1818,6 +1830,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
>  	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	int entries = ARRAY_SIZE(bo_dict);
> +	int64_t timeout_one_ns = 1;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1849,7 +1862,17 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  				    OFFSET_KERNEL, 0, false,
>  				    execenv.array_size);
>  
> -	bo_execenv_exec(&execenv, ADDR_BATCH);
> +	if (user && user->loop_kernel_duration) {
> +		bo_execenv_exec_async(&execenv, ADDR_BATCH);
> +		igt_measured_usleep(user->loop_kernel_duration);
> +		/* Check that the loop kernel has not completed yet */
> +		igt_assert_neq(0, __xe_wait_ufence(fd, &execenv.bo_sync->sync, USER_FENCE_VALUE,
> +					execenv.exec_queue, &timeout_one_ns));

Fix indent.

> +		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
> +		bo_execenv_sync(&execenv);
> +		user->skip_results_check = 1;
> +	} else
> +		bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	if (!user || (user && !user->skip_results_check))
>  		bo_check_square(input_data, output_data, execenv.array_size);
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index 412791d07..54a1c7f82 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -63,6 +63,8 @@ struct user_execenv {
>  	uint64_t input_addr;
>  	/** @output_addr: override default address of the output array if provided */
>  	uint64_t output_addr;
> +	/** @loop_kernel_duration: duration till kernel should execute in gpu **/

**/ -> */

With this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> +	uint64_t loop_kernel_duration;
>  };
>  
>  enum execenv_alloc_prefs {
> -- 
> 2.43.0
> 
