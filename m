Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FDDC021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 09:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A936610E5DD;
	Tue, 25 Feb 2025 09:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8IhJ5du";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE75910E5DD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740475430; x=1772011430;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lVnjFC825fIN8v8Ap4fZmJiJOpsiVnygzUnVeEAxTno=;
 b=H8IhJ5duUbI+t/YZdkbg9meuMJTDA2nz0keoJwUZdQMN2sQzUiQZ8Yf2
 NS5IX1snbcldC9Ry/oWOoS1L9UWgdSKUGBvXFJ0n3NXTpnJygdiLmRKgU
 MVhfBwbUPNpepWhmetZ99Rt4eiAFkG2R9LVVnWpUywYOCHwyLYvn5eVEw
 M9TJupzidxfyFskA3vaKsT5PSLm1jD8lIVs/hGHq/OBvDYgpQNxiBGAGT
 HhPcZMnRImf2I9RlCzFmS8reNAbgEh27+GnT9n5zxEKsU9zkHk83B8hCF
 KL/YvTSbQJkn6rRaNupYCwPrxKrT6DLw6KZZ+zK5IYLqFBG/V6VfaYj1X A==;
X-CSE-ConnectionGUID: 7P542eCZS6OQKKqlOSo8tA==
X-CSE-MsgGUID: DYnnEPapSeapEtzWQVg4ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40508153"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40508153"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:23:50 -0800
X-CSE-ConnectionGUID: 0P5vbNxES0GsxFkuk977SQ==
X-CSE-MsgGUID: aQZC4G+rTe6jWpmNczFmCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117262422"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.229])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:23:48 -0800
Date: Tue, 25 Feb 2025 10:23:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t,v2 2/6] lib/intel_compute: Rename variables for
 input and output data
Message-ID: <20250225092345.dln6ifvdgk5k3jic@zkempczy-mobl2>
References: <20250224144705.1019940-1-francois.dugast@intel.com>
 <20250224144705.1019940-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224144705.1019940-3-francois.dugast@intel.com>
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

On Mon, Feb 24, 2025 at 03:46:10PM +0100, Francois Dugast wrote:
> Use more explicit names to make development and debugging easier.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/intel_compute.c | 143 ++++++++++++++++++++++++--------------------
>  1 file changed, 77 insertions(+), 66 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index b698bf77d..9cca4a629 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -695,7 +695,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  		  .name = "batch" },
>  	};
>  	struct bo_execenv execenv;
> -	float *dinput;
> +	float *input_data, *output_data;
>  	uint16_t devid = intel_get_drm_devid(fd);
>  
>  	bo_execenv_create(fd, &execenv, eci);
> @@ -711,10 +711,12 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT,
>  			     IS_DG1(devid) ? 0x200 : 0x40, SIZE_DATA);
>  
> -	dinput = (float *)bo_dict[4].data;
> +	input_data = (float *) bo_dict[4].data;
> +	output_data = (float *) bo_dict[5].data;
>  	srand(time(NULL));
> +
>  	for (int i = 0; i < SIZE_DATA; i++)
> -		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +		input_data[i] = rand() / (float)RAND_MAX;
>  
>  	if (IS_DG1(devid))
>  		dg1_compute_exec_compute(bo_dict[6].data,
> @@ -732,13 +734,14 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	for (int i = 0; i < SIZE_DATA; i++) {
> -		float f1, f2;
> -
> -		f1 = ((float *) bo_dict[5].data)[i];
> -		f2 = ((float *) bo_dict[4].data)[i];
> -		if (f1 != f2 * f2)
> -			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
> -		igt_assert(f1 == f2 * f2);
> +		float input = input_data[i];
> +		float output = output_data[i];
> +		float expected_output = input * input;
> +
> +		if (output != expected_output)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, input, output, expected_output);
> +		igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, BO_DICT_ENTRIES);
> @@ -976,7 +979,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  		  .name = "batch" },
>  	};
>  	struct bo_execenv execenv;
> -	float *dinput;
> +	float *input_data, *output_data;
>  
>  	bo_execenv_create(fd, &execenv, eci);
>  
> @@ -991,10 +994,12 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
> -	dinput = (float *)bo_dict[4].data;
> +	input_data = (float *) bo_dict[4].data;
> +	output_data = (float *) bo_dict[5].data;
>  	srand(time(NULL));
> +
>  	for (int i = 0; i < SIZE_DATA; i++)
> -		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +		input_data[i] = rand() / (float)RAND_MAX;
>  
>  	xehp_compute_exec_compute(bo_dict[8].data,
>  				  ADDR_GENERAL_STATE_BASE,
> @@ -1007,13 +1012,14 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	for (int i = 0; i < SIZE_DATA; i++) {
> -		float f1, f2;
> -
> -		f1 = ((float *) bo_dict[5].data)[i];
> -		f2 = ((float *) bo_dict[4].data)[i];
> -		if (f1 != f2 * f2)
> -			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
> -		igt_assert(f1 == f2 * f2);
> +		float input = input_data[i];
> +		float output = output_data[i];
> +		float expected_output = input * input;
> +
> +		if (output != expected_output)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, input, output, expected_output);
> +		igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
> @@ -1184,7 +1190,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  		  .name = "batch" },
>  	};
>  	struct bo_execenv execenv;
> -	float *dinput;
> +	float *input_data, *output_data;
>  
>  	bo_execenv_create(fd, &execenv, eci);
>  
> @@ -1196,10 +1202,12 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	memcpy(bo_dict[0].data, kernel, size);
>  	xehpc_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  
> -	dinput = (float *)bo_dict[2].data;
> +	input_data = (float *) bo_dict[2].data;
> +	output_data = (float *) bo_dict[3].data;
>  	srand(time(NULL));
> +
>  	for (int i = 0; i < SIZE_DATA; i++)
> -		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +		input_data[i] = rand() / (float)RAND_MAX;
>  
>  	xehpc_compute_exec_compute(bo_dict[5].data,
>  				   ADDR_GENERAL_STATE_BASE,
> @@ -1212,13 +1220,14 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	for (int i = 0; i < SIZE_DATA; i++) {
> -		float f1, f2;
> -
> -		f1 = ((float *) bo_dict[3].data)[i];
> -		f2 = ((float *) bo_dict[2].data)[i];
> -		if (f1 != f2 * f2)
> -			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
> -		igt_assert(f1 == f2 * f2);
> +		float input = input_data[i];
> +		float output = output_data[i];
> +		float expected_output = input * input;
> +
> +		if (output != expected_output)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, input, output, expected_output);
> +		igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XEHPC_BO_DICT_ENTRIES);
> @@ -1541,7 +1550,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	};
>  
>  	struct bo_execenv execenv;
> -	float *dinput;
> +	float *input_data, *output_data;
>  
>  	bo_execenv_create(fd, &execenv, eci);
>  
> @@ -1557,11 +1566,12 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
> -	dinput = (float *)bo_dict[4].data;
> +	input_data = (float *) bo_dict[4].data;
> +	output_data = (float *) bo_dict[5].data;
>  	srand(time(NULL));
>  
>  	for (int i = 0; i < SIZE_DATA; i++)
> -		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +		input_data[i] = rand() / (float)RAND_MAX;
>  
>  	xelpg_compute_exec_compute(bo_dict[8].data,
>  				   ADDR_GENERAL_STATE_BASE,
> @@ -1574,15 +1584,14 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	for (int i = 0; i < SIZE_DATA; i++) {
> -		float f1, f2;
> -
> -		f1 = ((float *) bo_dict[5].data)[i];
> -		f2 = ((float *) bo_dict[4].data)[i];
> -
> -		if (f1 != f2 * f2)
> -			igt_debug("[%4d] f1: %f != %f %f\n", i, f1, f2 * f2, f2);
> -
> -		igt_assert(f1 == f2 * f2);
> +		float input = input_data[i];
> +		float output = output_data[i];
> +		float expected_output = input * input;
> +
> +		if (output != expected_output)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, input, output, expected_output);
> +		igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
> @@ -1631,7 +1640,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	};
>  
>  	struct bo_execenv execenv;
> -	float *dinput;
> +	float *input_data, *output_data;
>  
>  	bo_execenv_create(fd, &execenv, eci);
>  
> @@ -1646,11 +1655,12 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
> -	dinput = (float *)bo_dict[4].data;
> +	input_data = (float *) bo_dict[4].data;
> +	output_data = (float *) bo_dict[5].data;
>  	srand(time(NULL));
>  
>  	for (int i = 0; i < SIZE_DATA; i++)
> -		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +		input_data[i] = rand() / (float)RAND_MAX;
>  
>  	xe2lpg_compute_exec_compute(bo_dict[8].data,
>  				  ADDR_GENERAL_STATE_BASE,
> @@ -1664,14 +1674,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	for (int i = 0; i < SIZE_DATA; i++) {
> -		float f1, f2;
> -
> -		f1 = ((float *) bo_dict[5].data)[i];
> -		f2 = ((float *) bo_dict[4].data)[i];
> -
> -		if (f1 != f2 * f2)
> -			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
> -		igt_assert(f1 == f2 * f2);
> +		float input = input_data[i];
> +		float output = output_data[i];
> +		float expected_output = input * input;
> +
> +		if (output != expected_output)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, input, output, expected_output);
> +		igt_assert_eq(output, expected_output);
>  	}
>  
>  	bo_execenv_unbind(&execenv, bo_dict, XE2_BO_DICT_ENTRIES);
> @@ -1869,7 +1879,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  
>  	struct bo_dict_entry bo_dict_short[XE2_BO_PREEMPT_DICT_ENTRIES];
>  	struct bo_execenv execenv_short, execenv_long;
> -	float *dinput;
> +	float *input_data, *output_data;
>  	unsigned int long_kernel_loop_count;
>  	struct drm_xe_sync sync_long = {
>  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -1952,16 +1962,17 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	xehp_create_indirect_data(bo_dict_short[3].data, ADDR_INPUT, ADDR_OUTPUT, SIZE_DATA);
>  	xehp_create_surface_state(bo_dict_short[7].data, ADDR_INPUT, ADDR_OUTPUT);
>  
> -	dinput = (float *)bo_dict_long[4].data;
> +	input_data = (float *) bo_dict_long[4].data;
> +	output_data = (float *) bo_dict_short[5].data;
>  	srand(time(NULL));
>  
>  	for (int i = 0; i < SIZE_DATA; i++)
> -		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +		input_data[i] = rand() / (float)RAND_MAX;
>  
> -	dinput = (float *)bo_dict_short[4].data;
> +	input_data = (float *) bo_dict_short[4].data;
>  
>  	for (int i = 0; i < SIZE_DATA; i++)
> -		((float *)dinput)[i] = rand() / (float)RAND_MAX;
> +		input_data[i] = rand() / (float)RAND_MAX;
>  
>  	xe2lpg_compute_exec_compute(bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
> @@ -1991,14 +2002,14 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	gem_close(fd, bo_short);
>  
>  	for (int i = 0; i < SIZE_DATA; i++) {
> -		float f1, f2;
> -
> -		f1 = ((float *) bo_dict_short[5].data)[i];
> -		f2 = ((float *) bo_dict_short[4].data)[i];
> -
> -		if (f1 != f2 * f2)
> -			igt_debug("[%4d] f1: %f != %f\n", i, f1, f2 * f2);
> -		igt_assert(f1 == f2 * f2);
> +		float input = input_data[i];
> +		float output = output_data[i];
> +		float expected_output = input * input;
> +
> +		if (output != expected_output)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, input, output, expected_output);
> +		igt_assert_eq(output, expected_output);
>  	}
>  
>  	for (int i = 0; i < SIZE_DATA; i++) {
> -- 
> 2.43.0
> 
