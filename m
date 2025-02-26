Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E9C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 08:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1410E10E878;
	Wed, 26 Feb 2025 08:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLMa5Oro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AAE10E878
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 08:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740557444; x=1772093444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PfndyA8QC/s1w0erOFBhopovAntkvToDrQFUy4FQklg=;
 b=dLMa5OroP3HUeIA1bKaZmnlj+CY4sGv6MdISZ8hjiJFAxr4hFhDvHriv
 hxs/5kYeoJ+498knT9SVRYi9EAzIpcVrUpJQro088CiBJG7WB+/tAoy5A
 5kfk+7dIAQntgZOOjH/UHhmKq6gSYWsFr87BmycI1xSqNil0lUbvYDhWm
 7ycQGYx7h0Rv8A4EOUZdGrQcePDO6+SQeRE4U9HB0UOrrpFtgKs6Q+aSo
 jWFzOjzh16LKKZje9eiqXfouIH/fkf+GLOF3ibIBvzV83hj5O3MxXulLE
 35qnFx/8+mVQfwMexVLxcLXNT+ekLHBRd1uUDyJgDi72hQeMrNMr+euJp A==;
X-CSE-ConnectionGUID: az/OVRB2Rd2mNfQ0RvC15g==
X-CSE-MsgGUID: ZRoQe9SiSf2yOGeNZWP//w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="40571359"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="40571359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 00:10:43 -0800
X-CSE-ConnectionGUID: 1TzKCq0nTPqW48y+BZ2MWg==
X-CSE-MsgGUID: fJrAEy3dRSiymnYpXNq7Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117252358"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 00:10:42 -0800
Date: Wed, 26 Feb 2025 09:10:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v2 6/6] lib/intel_compute: Allow the user to
 provide input and output buffers
Message-ID: <20250226081039.2f76oh2kv4552d2d@zkempczy-mobl2>
References: <20250224144705.1019940-1-francois.dugast@intel.com>
 <20250224144705.1019940-7-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224144705.1019940-7-francois.dugast@intel.com>
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

On Mon, Feb 24, 2025 at 03:46:14PM +0100, Francois Dugast wrote:
> Allow the user to create and provide the buffers to be used as input
> and as output of the compute kernel. This allows special handling as
> well as read/write from outside the compute library. Support is
> limited to xe2lpg.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 32 ++++++++++++++++++++++++--------
>  lib/intel_compute.h |  2 ++
>  2 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 4818c0ff7..cb9561946 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1665,6 +1665,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1675,16 +1677,24 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
> -	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> +	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr, SIZE_DATA);
> +	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
> -	input_data = (float *) bo_dict[4].data;
> -	output_data = (float *) bo_dict[5].data;
> -	srand(time(NULL));
> +	if (user && user->input_addr) {
> +		input_data = (float *) user->input_addr;
> +	} else {
> +		input_data = (float *) bo_dict[4].data;
> +		srand(time(NULL));
>  
> -	for (int i = 0; i < SIZE_DATA; i++)
> -		input_data[i] = rand() / (float)RAND_MAX;
> +		for (int i = 0; i < SIZE_DATA; i++)
> +			input_data[i] = rand() / (float)RAND_MAX;
> +	}
> +
> +	if (user && user->output_addr)
> +		output_data = (float *) user->output_addr;
> +	else
> +		output_data = (float *) bo_dict[5].data;
>  
>  	xe2lpg_compute_exec_compute(bo_dict[8].data,
>  				  ADDR_GENERAL_STATE_BASE,
> @@ -1802,6 +1812,12 @@ static bool __run_intel_compute_kernel(int fd,
>  		return false;
>  	}
>  
> +	if (user && (user->input_addr || user->output_addr) &&
> +	    intel_compute_batches[batch].compute_exec != xe2lpg_compute_exec) {
> +		igt_debug("GPU version 0x%x does not support user input/output buffers\n", ip_ver);
> +		return false;
> +	}
> +
>  	/* If the user provides a kernel, use it */
>  	if (user && user->kernel) {
>  		kernel = user->kernel;
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index dc0fe2ec2..edc17b894 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -55,6 +55,8 @@ struct user_execenv {
>  	unsigned int kernel_size;
>  	/** @skip_results_check: do not verify correctness of the results if true */
>  	bool skip_results_check;
> +	uint64_t input_addr;
> +	uint64_t output_addr;

I like this change, but you should introduce this in all pipelines,
otherwise user passing different address won't see any effect.

--
Zbigniew

>  };
>  
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
> -- 
> 2.43.0
> 
