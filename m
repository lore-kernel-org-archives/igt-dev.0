Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD0C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 08:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E3310E1F6;
	Fri, 18 Apr 2025 08:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ay2SU2XC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A77710E1F6
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 08:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744966617; x=1776502617;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5G75QHUBqAIsgctBeqK58k3+yAAmmgpiKxrfmBFuIgI=;
 b=ay2SU2XCkZRS1jsB0ZNxax7NUzFop1Gc7pNzsyro1WJcg9KpjxGG2Tux
 YT5XIpnC9QK4q22VZ6wvKJfuk1VoT77iiaXaVSbucyQFDBqCGSMICxh9x
 ACtQrPxLWA1Xybpofi0SywZD2TPGwVP89hGW7qDbzNufaCp/3wT5LUB0O
 aBJnTYx6INvNZ2BJM3hMvclHRKiG3VeY1I8/fw4HSQt1t82TjMwppJflb
 YOaGCKwvs/YggyRgD2aqVHt4zOmUQ/u5wyL5QKXI8qi1sqQ0L/ZXPc1LO
 p1li4UjGkVOGF2KPpzUt9Rsw6XDfAGqkmdcHYp+UZP1Tg91DASDsjNUzh g==;
X-CSE-ConnectionGUID: hdjryOGWR7q28lUso1gkIw==
X-CSE-MsgGUID: pqCG6W69SCi6vIqZBPf+Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46596881"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="46596881"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 01:56:51 -0700
X-CSE-ConnectionGUID: vU3SK6FMTqmIK/aY6fTdLg==
X-CSE-MsgGUID: YFP37404RsmeasD1vuH+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="136236390"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.208])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 01:56:50 -0700
Date: Fri, 18 Apr 2025 10:56:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/1] lib/intel_compute: Allow the user to override
 input and output addresses
Message-ID: <20250418085647.epajd426uzkvaz5j@zkempczy-mobl2>
References: <20250417154049.634497-1-francois.dugast@intel.com>
 <20250417154049.634497-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417154049.634497-2-francois.dugast@intel.com>
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

On Thu, Apr 17, 2025 at 05:40:23PM +0200, Francois Dugast wrote:
> The user can specify custom GPU addresses to be used for the input and
> output arrays, otherwise default values will be used. If a compatible
> VM is also provided in user_execenv, the user can even create its own
> arrays and pass their addresses in user_execenv, for example with SVM.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

LGTM. I wondered how custom input/output data are not asserting but
I've recall that you've introduced skip_results_check in user_execenv.

Let's wait for CI.

But from me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_compute.c | 128 +++++++++++++++++++++++++++++++-------------
>  lib/intel_compute.h |   4 ++
>  2 files changed, 95 insertions(+), 37 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 2d21e9799..070bc0d2d 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -743,6 +743,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	};
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	uint16_t devid = intel_get_drm_devid(fd);
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
> @@ -756,16 +758,24 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
> +	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> +	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
>  			     IS_DG1(devid) ? 0x200 : 0x40, execenv.array_size);
>  
> -	input_data = (float *) bo_dict[4].data;
> -	output_data = (float *) bo_dict[5].data;
> -	srand(time(NULL));
> +	if (user && user->input_addr) {
> +		input_data = from_user_pointer(user->input_addr);
> +	} else {
> +		input_data = (float *) bo_dict[4].data;
> +		srand(time(NULL));
>  
> -	for (int i = 0; i < execenv.array_size; i++)
> -		input_data[i] = rand() / (float)RAND_MAX;
> +		for (int i = 0; i < execenv.array_size; i++)
> +			input_data[i] = rand() / (float)RAND_MAX;
> +	}
> +
> +	if (user && user->output_addr)
> +		output_data = from_user_pointer(user->output_addr);
> +	else
> +		output_data = (float *) bo_dict[5].data;
>  
>  	if (IS_DG1(devid))
>  		dg1_compute_exec_compute(bo_dict[6].data,
> @@ -1033,6 +1043,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	};
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1045,16 +1057,25 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
> -	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> +	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> +				  execenv.array_size);
> +	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
> -	input_data = (float *) bo_dict[4].data;
> -	output_data = (float *) bo_dict[5].data;
> -	srand(time(NULL));
> +	if (user && user->input_addr) {
> +		input_data = from_user_pointer(user->input_addr);
> +	} else {
> +		input_data = (float *) bo_dict[4].data;
> +		srand(time(NULL));
>  
> -	for (int i = 0; i < execenv.array_size; i++)
> -		input_data[i] = rand() / (float)RAND_MAX;
> +		for (int i = 0; i < execenv.array_size; i++)
> +			input_data[i] = rand() / (float)RAND_MAX;
> +	}
> +
> +	if (user && user->output_addr)
> +		output_data = from_user_pointer(user->output_addr);
> +	else
> +		output_data = (float *) bo_dict[5].data;
>  
>  	xehp_compute_exec_compute(bo_dict[8].data,
>  				  ADDR_GENERAL_STATE_BASE,
> @@ -1250,6 +1271,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	};
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1261,14 +1284,23 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
> -	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
> +	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
> +				   execenv.array_size);
>  
> -	input_data = (float *) bo_dict[2].data;
> -	output_data = (float *) bo_dict[3].data;
> -	srand(time(NULL));
> +	if (user && user->input_addr) {
> +		input_data = from_user_pointer(user->input_addr);
> +	} else {
> +		input_data = (float *) bo_dict[2].data;
> +		srand(time(NULL));
>  
> -	for (int i = 0; i < execenv.array_size; i++)
> -		input_data[i] = rand() / (float)RAND_MAX;
> +		for (int i = 0; i < execenv.array_size; i++)
> +			input_data[i] = rand() / (float)RAND_MAX;
> +	}
> +
> +	if (user && user->output_addr)
> +		output_data = from_user_pointer(user->output_addr);
> +	else
> +		output_data = (float *) bo_dict[3].data;
>  
>  	xehpc_compute_exec_compute(bo_dict[5].data,
>  				   ADDR_GENERAL_STATE_BASE,
> @@ -1643,6 +1675,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1656,16 +1690,25 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	memcpy(bo_dict[0].data, kernel, size);
>  
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
> -	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> +	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> +				   execenv.array_size);
> +	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
> -	input_data = (float *) bo_dict[4].data;
> -	output_data = (float *) bo_dict[5].data;
> -	srand(time(NULL));
> +	if (user && user->input_addr) {
> +		input_data = from_user_pointer(user->input_addr);
> +	} else {
> +		input_data = (float *) bo_dict[4].data;
> +		srand(time(NULL));
>  
> -	for (int i = 0; i < execenv.array_size; i++)
> -		input_data[i] = rand() / (float)RAND_MAX;
> +		for (int i = 0; i < execenv.array_size; i++)
> +			input_data[i] = rand() / (float)RAND_MAX;
> +	}
> +
> +	if (user && user->output_addr)
> +		output_data = from_user_pointer(user->output_addr);
> +	else
> +		output_data = (float *) bo_dict[5].data;
>  
>  	xelpg_compute_exec_compute(bo_dict[8].data,
>  				   ADDR_GENERAL_STATE_BASE,
> @@ -1740,6 +1783,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1752,16 +1797,25 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	xelpg_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, execenv.array_size);
> -	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> +	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> +				   execenv.array_size);
> +	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
> -	input_data = (float *) bo_dict[4].data;
> -	output_data = (float *) bo_dict[5].data;
> -	srand(time(NULL));
> +	if (user && user->input_addr) {
> +		input_data = from_user_pointer(user->input_addr);
> +	} else {
> +		input_data = (float *) bo_dict[4].data;
> +		srand(time(NULL));
>  
> -	for (int i = 0; i < execenv.array_size; i++)
> -		input_data[i] = rand() / (float)RAND_MAX;
> +		for (int i = 0; i < execenv.array_size; i++)
> +			input_data[i] = rand() / (float)RAND_MAX;
> +	}
> +
> +	if (user && user->output_addr)
> +		output_data = from_user_pointer(user->output_addr);
> +	else
> +		output_data = (float *) bo_dict[5].data;
>  
>  	xe2lpg_compute_exec_compute(bo_dict[8].data,
>  				    ADDR_GENERAL_STATE_BASE,
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index a79c3172c..f0d1750cc 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -59,6 +59,10 @@ struct user_execenv {
>  	bool skip_results_check;
>  	/** @array_size: size of input and output arrays */
>  	uint32_t array_size;
> +	/** @input_addr: override default address of the input array if provided */
> +	uint64_t input_addr;
> +	/** @output_addr: override default address of the output array if provided */
> +	uint64_t output_addr;
>  };
>  
>  extern const struct intel_compute_kernels intel_compute_square_kernels[];
> -- 
> 2.43.0
> 
