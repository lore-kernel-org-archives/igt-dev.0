Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490BECA0EF8
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 10:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1A610E8F3;
	Thu, 21 Aug 2025 10:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nnm79luP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7830610E8F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Aug 2025 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755771152; x=1787307152;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sBmcJwPYV8OfIhYQeIplcroh2pwE8BaFQViUzrizOkQ=;
 b=Nnm79luPMYuWXNy4kXslI8N7u7tYwIINBZX3ZG9JxVaR1KibM6LfKRkZ
 koeVO3DH9cQAYiLvv/M/qbRlYstNx5i9zRMjnWeLTTcyghTbjRwxeBFob
 UBJxNPCrW8mAiO6b8PCOlYRRYn0L4AdR4Ppk6egotw+UDBytXgqjTQg+5
 wIwk0jkITX7JT3t6LoI+BzIUq4HQ7LEd60Hmy93+3MCyvrxM1fgSfFuSu
 YrJwtsMZlUlWk7gLKfeR62RbZBz43jaawUyFQOo3qAm6HlnF6QVUqq2ry
 3c3sTBBC7lFiEkp7yy8YsA2ooaB4WHStnLoV5fIep4/D9WBhY+Y1p8Fqz Q==;
X-CSE-ConnectionGUID: ybNDVIvDSLuz42uiIkvYOA==
X-CSE-MsgGUID: eVRUH7MmRn6+vxsHQoPd/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58124226"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58124226"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 03:12:32 -0700
X-CSE-ConnectionGUID: Wj8ZeVZnTVmIczaFNFDuDw==
X-CSE-MsgGUID: t0oUCaopR1GosWZeoKyQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167883449"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 03:12:31 -0700
Date: Thu, 21 Aug 2025 12:12:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] lib/intel_compute: loop_kernel_duration in
 Pipeline
Message-ID: <hp2legfstnvgdz4ok37hzf4ohyir6mpnsvf2uvv6wgnffug5lg@yzu4ys5t7wyx>
References: <20250818075447.15230-1-nishit.sharma@intel.com>
 <20250818075447.15230-2-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818075447.15230-2-nishit.sharma@intel.com>
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

On Mon, Aug 18, 2025 at 07:54:44AM +0000, nishit.sharma@intel.com wrote:
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

Generally patch is fine, but some additional information should
occur in your commit message. Kernel which you support is loop kernel
which comes from opencl/loop.cl file. This information is important
because unblock comes from cpu memory write and likely other shaders
we use in igt won't work like loop kernel.

With this information added to commit message:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/intel_compute.c | 21 ++++++++++++++++++++-
>  lib/intel_compute.h |  2 ++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 147dd2916..125331c53 100644
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
> @@ -1849,7 +1861,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  				    OFFSET_KERNEL, 0, false,
>  				    execenv.array_size);
>  
> -	bo_execenv_exec(&execenv, ADDR_BATCH);
> +	if (user && user->loop_kernel_duration) {
> +		bo_execenv_exec_async(&execenv, ADDR_BATCH);
> +		igt_measured_usleep(user->loop_kernel_duration);
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
> +	uint64_t loop_kernel_duration;
>  };
>  
>  enum execenv_alloc_prefs {
> -- 
> 2.43.0
> 
