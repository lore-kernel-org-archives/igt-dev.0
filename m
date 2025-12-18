Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C7CD6ACF0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 11:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EB210E2D5;
	Thu, 18 Dec 2025 11:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koeLeMBs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE9410E2D5
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 11:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766058452; x=1797594452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2YaCMPqHpURRLbkG18WsDNOauEkWhs7SdDWrdcDM4DE=;
 b=koeLeMBs3pTZ7qtpmUvptGhg4SJsUsULN0BAYAkDrKRh3YAgFHkiUETV
 Oxmc/q7nhtnbwTem79+sD3IvK+oCXaZYVBHcFYiuHwgW5dcOt9ZrcnJjg
 79ttcWtQ5qrwanKcRf9oES5JPL8WG+vGtfVsUwL6o2UBBDH93UxMIoyEI
 0DgXc0+Q5nmyN4h5lmd1pYdBe28ciZ+Iw2IP6BGXMuaklsY+ZwbJbnBmq
 uoc97MPYZLL6YYAD56Wgk6ICTs3d1zit/4CihJMRIV+iGTaWaROWTa9kY
 pSvt75uIghxEaswYYrOXmb9zJoNVvbplYJ/ySTQzOvHc90MIxB2Rx7/0a Q==;
X-CSE-ConnectionGUID: Xn1BLHfaSKuZQqLrV9Qb7w==
X-CSE-MsgGUID: X53icpJYRumL6AAV7GgFmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67205389"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67205389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:47:31 -0800
X-CSE-ConnectionGUID: Dlxb6iXdRjKyZ1T1D105xA==
X-CSE-MsgGUID: 6jqc4M8ASn2ddaDkpA7Yog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198330688"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:47:29 -0800
Date: Thu, 18 Dec 2025 12:47:26 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nishit Sharma <nishit.sharma@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t, v3 1/3] tests/intel/xe_exec_system_allocator:
 Cleanup compute test
Message-ID: <6zfsr53t7tdswkekraxyaavmeslvz66rrb32awmdyz5nl57hzc@ukimvf2ez67a>
References: <20251218104907.117812-1-francois.dugast@intel.com>
 <20251218104907.117812-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218104907.117812-2-francois.dugast@intel.com>
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

On Thu, Dec 18, 2025 at 11:47:20AM +0100, Francois Dugast wrote:
> Cleanup the test that uses lib/intel_compute and SVM to execute a compute
> kernel on arrays allocated on host, in preparation to add more tests.
> Remove the result check as this is already done in lib/intel_compute.
> Remove output to simplify the test as it did not add value.
> Remove the drm_xe_engine_class_instance argument as it was unused.

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index ffa4ec3f5..2ca85c95c 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2178,7 +2178,7 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>   * Test category: functionality test
>   */
>  static void
> -test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> +test_compute(int fd, size_t size)
>  {
>  	struct drm_xe_sync sync = {
>  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -2192,7 +2192,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>  	struct user_execenv env = {
>  		.array_size = size / sizeof(float),
>  	};
> -	float *compute_input, *compute_output;
> +	float *compute_input;
>  	int i;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> @@ -2203,21 +2203,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>  
>  	compute_input = aligned_alloc(SZ_2M, size);
>  	igt_assert(compute_input);
> -	compute_output = aligned_alloc(SZ_2M, size);
> -	igt_assert(compute_output);
>  
>  	for (i = 0; i < env.array_size; i++)
>  		compute_input[i] = rand() / (float)RAND_MAX;
>  
>  	env.input_addr = to_user_pointer(compute_input);
> -	env.output_addr = to_user_pointer(compute_output);
>  	env.vm = vm;
>  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>  
> -	for (i = 0; i < env.array_size; i++)
> -		igt_assert_eq_double(compute_input[i] * compute_input[i], compute_output[i]);
> -
> -	free(compute_output);
>  	free(compute_input);
>  	unbind_system_allocator();
>  	xe_vm_destroy(fd, vm);
> @@ -2609,8 +2602,7 @@ int igt_main()
>  	}
>  
>  	igt_subtest("compute")
> -		xe_for_each_engine(fd, hwe)
> -			test_compute(fd, hwe, SZ_2M);
> +		test_compute(fd, SZ_2M);
>  
>  	igt_fixture() {
>  		xe_device_put(fd);
> -- 
> 2.43.0
> 
