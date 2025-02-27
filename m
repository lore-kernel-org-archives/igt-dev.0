Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F958C021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 07:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D236B10EA4E;
	Thu, 27 Feb 2025 07:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVPFp/Bj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B68110EA4E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740641424; x=1772177424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cSWmvttW6r//u436ZWEfTYOdx8yBGlaAvzTv3MMAyKQ=;
 b=cVPFp/BjUSIloxN2v3Yetv5pB+8qvQqK/JRDFepbAvvP7pMPk9UqEQzv
 cwIStwO1qFsQfRWSk6BDbRZuTsIy3A2e5oKzCJSrwNmg+9CiIre66KymC
 /XIKXqjkF+QirVZYqJB1OuqgJIc82esD8WDvaB9HuvF9oCI0PmRTRZO+4
 gkC3ytieofqnBjwkAdBcwb9oZ5zdEABGVCkBSw45TRykiRIE3ghX/lSrB
 eTPiikbMofsp/0rGyYqEghnFX6wxWcE6SDq+VSjXdME5fb+IhIbYCmfG0
 1CRWptGH2tIY9IQ82pBMoTHwfT4A9gob1kvEB1Lsbu/d/G4Fq1aHjuM7V Q==;
X-CSE-ConnectionGUID: Wi30RneIS9C96ICnYgJMyA==
X-CSE-MsgGUID: v90PO7XxTB6QKmfpYyLXNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41219619"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41219619"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 23:30:24 -0800
X-CSE-ConnectionGUID: WI2gQ/xzRqWIEdOUYS6ZXw==
X-CSE-MsgGUID: 03VosMCrQkSgODwV38urNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121877635"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.171])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 23:30:22 -0800
Date: Thu, 27 Feb 2025 08:30:19 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v3 6/6] lib/intel_compute: Allow the user to
 override input and output addresses
Message-ID: <20250227073019.tslf7drsdzer3rux@zkempczy-mobl2>
References: <20250226112532.1332367-1-francois.dugast@intel.com>
 <20250226112532.1332367-7-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226112532.1332367-7-francois.dugast@intel.com>
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

On Wed, Feb 26, 2025 at 12:24:07PM +0100, Francois Dugast wrote:
> The user can specify custom GPU addresses to be used for the input and
> output arrays, otherwise default values will be used. If a compatible
> VM is also provided in user_execenv, the user can even create its own
> arrays and pass their addresses in user_execenv, for example with SVM.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

LGTM but lets wait for CI:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_compute.c | 124 +++++++++++++++++++++++++++++++-------------
>  lib/intel_compute.h |   4 ++
>  2 files changed, 91 insertions(+), 37 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 4818c0ff7..a789755b7 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -708,6 +708,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	};
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	uint16_t devid = intel_get_drm_devid(fd);
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
> @@ -719,16 +721,24 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
> +	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> +	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
>  			     IS_DG1(devid) ? 0x200 : 0x40, SIZE_DATA);
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
>  	if (IS_DG1(devid))
>  		dg1_compute_exec_compute(bo_dict[6].data,
> @@ -995,6 +1005,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	};
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1005,16 +1017,24 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
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
>  	xehp_compute_exec_compute(bo_dict[8].data,
>  				  ADDR_GENERAL_STATE_BASE,
> @@ -1209,6 +1229,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	};
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1218,14 +1240,22 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_bind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
> -	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
> +	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr, SIZE_DATA);
>  
> -	input_data = (float *) bo_dict[2].data;
> -	output_data = (float *) bo_dict[3].data;
> -	srand(time(NULL));
> +	if (user && user->input_addr) {
> +		input_data = (float *) user->input_addr;
> +	} else {
> +		input_data = (float *) bo_dict[2].data;
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
> +		output_data = (float *) bo_dict[3].data;
>  
>  	xehpc_compute_exec_compute(bo_dict[5].data,
>  				   ADDR_GENERAL_STATE_BASE,
> @@ -1572,6 +1602,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1583,16 +1615,24 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	memcpy(bo_dict[0].data, kernel, size);
>  
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
>  	xelpg_compute_exec_compute(bo_dict[8].data,
>  				   ADDR_GENERAL_STATE_BASE,
> @@ -1665,6 +1705,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  
>  	bo_execenv_create(fd, &execenv, eci, user);
>  
> @@ -1675,16 +1717,24 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
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
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index dc0fe2ec2..9abef3084 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -55,6 +55,10 @@ struct user_execenv {
>  	unsigned int kernel_size;
>  	/** @skip_results_check: do not verify correctness of the results if true */
>  	bool skip_results_check;
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
