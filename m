Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E185DD6ACF1
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 11:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795EC10E094;
	Thu, 18 Dec 2025 11:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0jhHMUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C8B10E094
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766059018; x=1797595018;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rP1N/HIWqiZfXLTDbV1IkBNNL/PJeF0I4UEzW1MqWfI=;
 b=M0jhHMUoAKfY6ywcwStfoR5hMnzH8lTl2QaD9uauBY2tjAoJIvgYa0Ep
 6SxZ5FLa9VS+SKY7OBqAfle+/q++hmeKKhXxV8vFzKusk/e1TLC4+KLvp
 MImY5hHaiECmQVVkjHWpgupQfpVk+7Ar9Di7aRJc0Ce0bJtRM0GpcYuzA
 bYdqpZN0wWMMEQaABWOOYY6QeYRJecbhMi39O0DWiZZKCWmIxx9IjI6o9
 0AO+5wXO8IXbuCaGZG9Wn011MmWGjQoEbStFxD89go3C6oCfF50dkoIH6
 8Kt52XFMIHY7Th9kSCD7IorX3ToOKbbpX7OjM8CmwWAT2szEILYqitFmb g==;
X-CSE-ConnectionGUID: DynXFFlLTqiPMS1uJoJKOg==
X-CSE-MsgGUID: F/bXV0PNQg2vbrY8q4IxAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67760559"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67760559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:56:58 -0800
X-CSE-ConnectionGUID: b78YR3RlRTeu+3jl0kSlGg==
X-CSE-MsgGUID: 1ytUkUKFR4ChtErWvr752Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="202743702"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:56:57 -0800
Date: Thu, 18 Dec 2025 12:56:54 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t, v3 2/3] lib/intel_compute: Allow user to override
 compute kernel loop_count
Message-ID: <oemy6gamvuc2amxgle5k73kfajr3en6bg5p5myhg55hurjrtdz@7gp2hex4ikw7>
References: <20251218104907.117812-1-francois.dugast@intel.com>
 <20251218104907.117812-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218104907.117812-3-francois.dugast@intel.com>
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

On Thu, Dec 18, 2025 at 11:47:21AM +0100, Francois Dugast wrote:
> array_size and loop_count continue to have the same value by default but
> by differentiating those two variables, the user has more control over
> the execution of the compute kernel: the loop count can now be different
> from the array size.
> 
> Also, align use of env.array_size in xe_exec_system_allocator with the
> semantics used in lib/intel_compute.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c                    | 36 +++++++++++++++-----------
>  lib/intel_compute.h                    |  2 ++
>  tests/intel/xe_exec_system_allocator.c |  4 +--
>  3 files changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index e112e57b5..20ee44521 100644
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
> @@ -137,7 +138,7 @@ static float *get_input_data(const struct bo_execenv *execenv,
>  		input_data = from_user_pointer(user->input_addr);
>  	} else {
>  		input_data = (float *) data;
> -		bo_randomize(input_data, execenv->array_size);
> +		bo_randomize(input_data, execenv->loop_count);
>  	}
>  
>  	return input_data;
> @@ -181,6 +182,11 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
>  		else
>  			execenv->array_size = SIZE_DATA;
>  
> +		if (user && user->loop_count)
> +			execenv->loop_count = user->loop_count;
> +		else
> +			execenv->loop_count = execenv->array_size;
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
> @@ -2205,21 +2211,21 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	output_short = (float *) bo_dict_short[5].data;
>  	post_data = (uint64_t *) bo_dict_long[8].data;
>  
> -	bo_randomize(input_short, SIZE_DATA);
> +	bo_randomize(input_short, execenv_short.loop_count);
>  
>  	xe2lpg_compute_exec_compute(fd,
>  				    bo_dict_long[8].data, ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>  				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
> -				    threadgroup_preemption, SIZE_DATA);
> +				    threadgroup_preemption, execenv_long.array_size);
>  
>  	xe2lpg_compute_exec_compute(fd,
>  				    bo_dict_short[8].data, ADDR_GENERAL_STATE_BASE,
>  				    ADDR_SURFACE_STATE_BASE, ADDR_DYNAMIC_STATE_BASE,
>  				    ADDR_INSTRUCTION_STATE_BASE, XE2_ADDR_STATE_CONTEXT_DATA_BASE,
>  				    OFFSET_INDIRECT_DATA_START, OFFSET_KERNEL, OFFSET_STATE_SIP,
> -				    false, SIZE_DATA);
> +				    false, execenv_short.array_size);
>  
>  	bo_execenv_exec_async(&execenv_long, ADDR_BATCH);
>  
> @@ -2232,7 +2238,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
>  	 * square) must complete first and long job must be still active.
>  	 */
>  	bo_execenv_exec(&execenv_short, ADDR_BATCH);
> -	bo_check_square(input_short, output_short, SIZE_DATA);
> +	bo_check_square(input_short, output_short, execenv_short.loop_count);
>  
>  	/*
>  	 * Catch command level preemption instead TG preemption. For TG and WMTP
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
> index 2ca85c95c..e66fa4203 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2190,7 +2190,7 @@ test_compute(int fd, size_t size)
>  	} *bo_sync;
>  	uint32_t vm;
>  	struct user_execenv env = {
> -		.array_size = size / sizeof(float),
> +		.array_size = size,

Assuming array_size is number of elements, above change is
incorrect imo.

--
Zbigniew


>  	};
>  	float *compute_input;
>  	int i;
> @@ -2201,7 +2201,7 @@ test_compute(int fd, size_t size)
>  	bind_system_allocator(&sync, 1);
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
> -	compute_input = aligned_alloc(SZ_2M, size);
> +	compute_input = aligned_alloc(SZ_2M, env.array_size * sizeof(float));
>  	igt_assert(compute_input);
>  
>  	for (i = 0; i < env.array_size; i++)
> -- 
> 2.43.0
> 
