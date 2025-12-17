Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C46D64095
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 09:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D870810E037;
	Wed, 17 Dec 2025 09:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhSbX45q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40DC10E037
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 09:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765962535; x=1797498535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QTPusxE5/qLelRcZcSzjhvdXfDM6HlXRZrrWZ/dg/fc=;
 b=EhSbX45q9NJxtJD78c3abesCYsZ/e+LGfjHqcpBrpu0zWiTVq+jpF3ER
 ucPbasKdakPZnAs/AKeaJqhy22eWma1eAHdwtmElCvXBuaZG8Ibi6knCm
 XXMK+RzvWRbzsfO1IOTuuk6eOGqVJuQV80RsSmpdoce/We4v6FyNdNlcI
 TQIBmyWCE+vuSTifsWNczXowPaWSy/KAxgfnxhmpHg75ETSaB9Nje+cO5
 d4N7tGoEwyf6Fi72aWIPKm8x4/r9N/Wr0C20DERJDdj5f/pbl02AuqZJ9
 KVCjHmx49ZEGpaAWgip+koIFa/uf583IMeamxOnM2Ubj1f5BsY7RuwmX2 g==;
X-CSE-ConnectionGUID: oq+YcsUoS1is+yeheyC9vg==
X-CSE-MsgGUID: EnAIn1obQSq1zkMSbk1ymg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85310658"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="85310658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:08:54 -0800
X-CSE-ConnectionGUID: eabY85jeTRGVxxqC+1Qkmw==
X-CSE-MsgGUID: eMCAhHAQRsG4Fz8UBzBeFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="203159546"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.134])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:08:53 -0800
Date: Wed, 17 Dec 2025 10:08:50 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v2 1/3] lib/intel_compute: Differentiate
 array_size and loop_count
Message-ID: <gelf7k7ibthfgzlwe2xkxucxhnlw6obunszawro6tluyc3i57t@m2j2l3gna6da>
References: <20251212115208.179655-1-francois.dugast@intel.com>
 <20251212115208.179655-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251212115208.179655-2-francois.dugast@intel.com>
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

On Fri, Dec 12, 2025 at 12:51:09PM +0100, Francois Dugast wrote:
> Use of execenv.array_size was ambiguous. Split into separate variables
> to make it clear and to prepare to let user control those variables
> independently when executing compute kernels.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c                    | 26 ++++++++++++++++----------
>  lib/intel_compute.h                    |  2 ++
>  tests/intel/xe_exec_system_allocator.c | 11 ++++++-----
>  3 files changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index e112e57b5..154318bb5 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -94,6 +94,7 @@ struct bo_execenv {
>  	uint32_t vm;
>  	uint32_t exec_queue;
>  	uint32_t array_size;
> +	unsigned int loop_count;
>  
>  	/* Xe user-fence */
>  	uint32_t bo;
> @@ -181,6 +182,11 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
>  		else
>  			execenv->array_size = SIZE_DATA;
>  
> +		if (user && user->loop_count)
> +			execenv->loop_count = user->loop_count;
> +		else
> +			execenv->loop_count = execenv->array_size / sizeof(float);

Hmm, shouldn't be:

	execenv->loop_count = execenv->array_size;

?

When user == NULL, we have execenv->array_size = SIZE_DATA;

Input/output is then:
	{ .addr = ADDR_INPUT, .size = MAX(sizeof(float) * SIZE_DATA, 0x10000),

so additional division by sizeof(float) seems wrong.

--
Zbigniew

> +
>  		if (eci) {
>  			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
>  								   eci, 0);
> @@ -864,7 +870,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
>  	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> -			     IS_DG1(devid) ? 0x200 : 0x40, execenv.array_size);
> +			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
>  
>  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
>  	output_data = get_output_data(&execenv, user, bo_dict[5].data);
> @@ -885,7 +891,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	if (!user || (user && !user->skip_results_check))
> -		bo_check_square(input_data, output_data, execenv.array_size);
> +		bo_check_square(input_data, output_data, execenv.loop_count);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> @@ -1152,7 +1158,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
>  	xehp_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> -				  execenv.array_size);
> +				  execenv.loop_count);
>  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
>  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> @@ -1170,7 +1176,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	if (!user || (user && !user->skip_results_check))
> -		bo_check_square(input_data, output_data, execenv.array_size);
> +		bo_check_square(input_data, output_data, execenv.loop_count);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> @@ -1365,7 +1371,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	xehpc_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
> -				   execenv.array_size);
> +				   execenv.loop_count);
>  
>  	input_data = get_input_data(&execenv, user, bo_dict[2].data);
>  	output_data = get_output_data(&execenv, user, bo_dict[3].data);
> @@ -1382,7 +1388,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	if (!user || (user && !user->skip_results_check))
> -		bo_check_square(input_data, output_data, execenv.array_size);
> +		bo_check_square(input_data, output_data, execenv.loop_count);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> @@ -1762,7 +1768,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
>  	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> -				   execenv.array_size);
> +				   execenv.loop_count);
>  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
>  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> @@ -1780,7 +1786,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
>  	if (!user || (user && !user->skip_results_check))
> -		bo_check_square(input_data, output_data, execenv.array_size);
> +		bo_check_square(input_data, output_data, execenv.loop_count);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> @@ -1850,7 +1856,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
>  	xelpg_create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> -				   execenv.array_size);
> +				   execenv.loop_count);
>  	xehp_create_surface_state(bo_dict[7].data, bind_input_addr, bind_output_addr);
>  
>  	input_data = get_input_data(&execenv, user, bo_dict[4].data);
> @@ -1881,7 +1887,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	}
>  
>  	if (!user || (user && !user->skip_results_check))
> -		bo_check_square(input_data, output_data, execenv.array_size);
> +		bo_check_square(input_data, output_data, execenv.loop_count);
>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> index 8a3d7b450..28c1efd55 100644
> --- a/lib/intel_compute.h
> +++ b/lib/intel_compute.h
> @@ -63,6 +63,8 @@ struct user_execenv {
>  	uint64_t input_addr;
>  	/** @output_addr: override default address of the output array if provided */
>  	uint64_t output_addr;
> +	/** @loop_count: override default loop count if provided */
> +	unsigned int loop_count;
>  	/** @loop_kernel_duration: duration till kernel should execute in gpu **/
>  	uint64_t loop_kernel_duration;
>  };
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index ffa4ec3f5..07ac6b66c 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2190,9 +2190,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>  	} *bo_sync;
>  	uint32_t vm;
>  	struct user_execenv env = {
> -		.array_size = size / sizeof(float),
> +		.array_size = size,
>  	};
>  	float *compute_input, *compute_output;
> +	unsigned int loop_count = env.array_size / sizeof(float);
>  	int i;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> @@ -2201,12 +2202,12 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>  	bind_system_allocator(&sync, 1);
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
> -	compute_input = aligned_alloc(SZ_2M, size);
> +	compute_input = aligned_alloc(SZ_2M, env.array_size);
>  	igt_assert(compute_input);
> -	compute_output = aligned_alloc(SZ_2M, size);
> +	compute_output = aligned_alloc(SZ_2M, env.array_size);
>  	igt_assert(compute_output);
>  
> -	for (i = 0; i < env.array_size; i++)
> +	for (i = 0; i < loop_count; i++)
>  		compute_input[i] = rand() / (float)RAND_MAX;
>  
>  	env.input_addr = to_user_pointer(compute_input);
> @@ -2214,7 +2215,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>  	env.vm = vm;
>  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>  
> -	for (i = 0; i < env.array_size; i++)
> +	for (i = 0; i < loop_count; i++)
>  		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
>  
>  	free(compute_output);
> -- 
> 2.43.0
> 
