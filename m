Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C0FC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 05:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E77B10E002;
	Tue, 15 Apr 2025 05:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPYg92Sc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1825610E002
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744694618; x=1776230618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Sc8BghCEQxS58aGyLdrR03W4+8L5TmRpkIS8dZAfHDg=;
 b=lPYg92ScguAv6C8nAw8E/NzrNi3i75Ki5GT8+nyK13yL2a1qeB179TMB
 p1bQcvx6a5EmPBKXDYYheWarbwzxqb/uraP6FgBWZTWmFRlYYVnH4liEh
 r6IF8wt5XBWqDAI8ge2hVVsyCmJgal0xn3nbC5XrgKQjNq7eaKP9zXJ9+
 Sos7xecn5WmGFldt7SkBo7WqVCHR/PWQlsV3EYvIjj2DM1Oit4bOYgGBZ
 0dyxbGGFDaFnPB8CMYGoBvBJSyHmThReUdTStm/9L21R/r5CNgokuVYj8
 hWqnrBv+RX0gVoi3bPeIJLeoEVRXPb10Z205/BDwzOvyC1+4VbGPFrzU7 g==;
X-CSE-ConnectionGUID: 4S/VVZfaSY+f+uRGiyj4cA==
X-CSE-MsgGUID: 3pntVrKFTeaU4iiythFHWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63726390"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="63726390"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:23:36 -0700
X-CSE-ConnectionGUID: BfHBgLjDQD6hOD+m9PI46Q==
X-CSE-MsgGUID: XGpLJQ73RQCXxIEuUbXEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135090288"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:23:35 -0700
Date: Tue, 15 Apr 2025 07:23:32 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v2 09/11] lib/intel_compute: Fix enqueued local
 size starting with xelpg
Message-ID: <20250415052332.2asrtjxy7mmtzwva@zkempczy-mobl2>
References: <20250402152256.173562-1-francois.dugast@intel.com>
 <20250402152256.173562-10-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402152256.173562-10-francois.dugast@intel.com>
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

On Wed, Apr 02, 2025 at 05:20:07PM +0200, Francois Dugast wrote:
> The metadata of the compute kernel used for xelpg shows the arguments
> positions has changed. The enqueued_local_size comes at offset 52, right
> after the value of the "count" argument. Create a new create_indirect_data
> function matching this.
> 
> Relevant part of the kernel metadata:
> 
>       - arg_type:        arg_bypointer
>         offset:          32
>         size:            8
>         arg_index:       0
>         addrmode:        stateless
>         addrspace:       global
>         access_type:     readwrite
>       - arg_type:        arg_bypointer
>         offset:          40
>         size:            8
>         arg_index:       1
>         addrmode:        stateless
>         addrspace:       global
>         access_type:     readwrite
>       - arg_type:        arg_byvalue
>         offset:          48
>         size:            4
>         arg_index:       2
>       - arg_type:        enqueued_local_size
>         offset:          52
>         size:            12
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Are you using some compilation flags for ocloc? For MTL I've
different metadata layout.

--
Zbigniew

> ---
>  lib/intel_compute.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index d723ecd0c..9be3b0490 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -1263,6 +1263,31 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_destroy(&execenv);
>  }
>  
> +static void xelpg_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				      uint64_t addr_input,
> +				      uint64_t addr_output,
> +				      unsigned int loop_count)
> +{
> +	int b = 0;
> +
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = loop_count;
> +	addr_bo_buffer_batch[b++] = 0x00000400; // Enqueued local size X
> +	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Y
> +	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Z
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +}
> +
>  static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  					uint64_t addr_general_state_base,
>  					uint64_t addr_surface_state_base,
> @@ -1595,7 +1620,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
> +	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	input_data = (float *) bo_dict[4].data;
> @@ -1688,7 +1713,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
> +	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	input_data = (float *) bo_dict[4].data;
> @@ -2011,7 +2036,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  
>  	create_dynamic_state(bo_dict_short[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict_short[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
> +	xelpg_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
>  	input_data = (float *) bo_dict_long[4].data;
> -- 
> 2.43.0
> 
