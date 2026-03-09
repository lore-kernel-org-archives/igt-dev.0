Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A4EEFCD71
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD28F10E4C5;
	Mon,  9 Mar 2026 09:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdWQC4Hm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E085B10E4C5
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773049435; x=1804585435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ygopFrK06BkOuaK07k9zK1Vlz5CYvOrrKIdxBnBOwYM=;
 b=QdWQC4HmStwiWm5sQgKXtwbslbovMxVtHKurwNAbUbspTWDCKtMV/sAI
 cS2hxc/KEOOOZecb7ZfrnxWQc6s09BotUAGfJie8HdaeX+9+YlPBn5Udu
 RKNZ7cYX92ZmciYrKhSlxuWAocX7Rv5tcv8AE31cFks3AdpQFhR8ncelL
 pSArpa4M6QzTPaeUXrkH06AUanKKevrgtemFyVaDP/okA4dnhPIiR3948
 9NVAewMYNVEPgVBxEMcP1F/eD4F1HNeDQsbfucl6KBS+G6saSwUmYcyh5
 FeG5P9quf60jRd4RGtPDXAegXazVGQ0rX71VFcB221BEBLGYnQQeucEp1 A==;
X-CSE-ConnectionGUID: JqeM45lUQsm2154hNnluwA==
X-CSE-MsgGUID: 2kg47rAVQQ2AQhoS29UTMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="76669792"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="76669792"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:43:55 -0700
X-CSE-ConnectionGUID: Bpg90NmMSWKV+miCwtdUfQ==
X-CSE-MsgGUID: 7MmqN/2ZS2aBP2q6UTzBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224632476"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:43:53 -0700
Date: Mon, 9 Mar 2026 10:43:52 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org, francois.dugast@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Enhance SVM
 compute test
Message-ID: <zhg7x7zubhsk6aovkqgdv3teprttndsz76crv252wyn76o65ho@7ov235n6il3v>
References: <20260309043400.2280535-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309043400.2280535-1-nishit.sharma@intel.com>
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

On Mon, Mar 09, 2026 at 04:34:00AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
> 
> Updated test to validate output values against expected results after
> workload execution. These enhancements improve test coverage, reliability,
> and debugging for SVM compute workloads. Updated test to validate output
> values against expected results after kernel execution.
> 
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 14f5e358f..e670ee007 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2257,7 +2257,7 @@ test_compute(int fd, size_t size, unsigned int flags)
>  		 */
>  		.array_size = size / sizeof(float),
>  	};
> -	float *compute_input;
> +	float *compute_input, *compute_output;
>  	int i;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> @@ -2267,19 +2267,31 @@ test_compute(int fd, size_t size, unsigned int flags)
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
>  	compute_input = aligned_alloc(SZ_2M, size);
> -	igt_assert(compute_input);
> +	compute_output = aligned_alloc(SZ_2M, size);
> +	igt_assert(compute_input && compute_output);
>  
> -	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> +	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size / 2;
>  	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
>  	env.input_addr = to_user_pointer(compute_input);
> +	env.output_addr = to_user_pointer(compute_output);
>  	env.vm = vm;
>  
>  	for (i = 0; i < env.loop_count; i++)
> -		compute_input[i] = rand() / (float)RAND_MAX;
> +		compute_input[i] = (float)i + 2.0f;
>  
>  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>  
> +	for (i = 0; i < env.loop_count; i++) {
> +		float expected_output = compute_input[i] * compute_input[i];
> +
> +		if (compute_output[i] != expected_output || compute_output[i] == 0.0f)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, compute_input[i], compute_output[i], expected_output);
> +		igt_assert_eq_double(compute_output[i], expected_output);

I think we may be more strict and add assert if there's 0.0f in the output.

--
Zbigniew

> +	}
> +
>  	free(compute_input);
> +	free(compute_output);
>  	unbind_system_allocator();
>  	xe_vm_destroy(fd, vm);
>  }
> -- 
> 2.43.0
> 
