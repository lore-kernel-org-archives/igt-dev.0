Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55250D3C92C
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 16:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68CF10E276;
	Wed, 10 Dec 2025 16:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQR3r279";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA72810E785
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765384333; x=1796920333;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xW4RD9hNngP1mVfpQyXP4Akdr2GLQJK0+jHsCDF3ZkQ=;
 b=mQR3r279g2aonwAuOSdziJ93rFbJDxckODhoX0S3UpkxngGIMNVeWtej
 DsTlqqB7k2oZ7jPHtIM7gBqXCj/eiJoeT3XsdsCkKYpwo3rPjSMnooGkw
 Q98VKOGBn5IVQO3Rm9aW5e8wRIRev/T5FgH8C1X180cHxq0pSrLSPYpTI
 ZEpEqFzJtQnZTRXurNT//jrUQQ3W2DP+RjrHR66Fn3kC4TZkI8/882iBd
 vt6pJa960pDOUIRb69rkWhwoy95I+MTnknn/RSs4FBSExuzVhjGWab+It
 KibIsz0+BrgSNdcQD4snRUkPlEwT8oG/X5k5mykG2XtydSiVYlrRs7orN A==;
X-CSE-ConnectionGUID: nU7fYScbTVmCozEm3O+0OQ==
X-CSE-MsgGUID: nnVUlSkqSRqQ6HG2J2Rf9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67316768"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67316768"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 08:32:12 -0800
X-CSE-ConnectionGUID: ZkQSpMH2Ru+r7OY1zVrlWw==
X-CSE-MsgGUID: 3cdmtAILSsaURK/dQTkLgw==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 08:32:10 -0800
Date: Wed, 10 Dec 2025 17:32:08 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_system_allocator: Add new
 SVM compute tests
Message-ID: <olcukudmlfseou22tbkp5bpgjbnj2lrowf4t2rxnwm5o2rktl6@67ib5cr4habv>
References: <20251204113726.567142-1-francois.dugast@intel.com>
 <20251204113726.567142-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204113726.567142-3-francois.dugast@intel.com>
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

On Thu, Dec 04, 2025 at 12:35:59PM +0100, Francois Dugast wrote:
> These new tests allow triggering GPU page faults from the context of
> execution units. They can be used to create single page faults or page
> fault floods, of various sizes. This is helpful for debugging and for
> performance profiling.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 60 ++++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 43be307fb..95146a5f3 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2172,13 +2172,37 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	munmap(pdata, sizeof(*pdata));
>  }
>  
> +/* compute flags */
> +#define TOUCH_ONCE		(0x1 << 0)
> +#define ACCESS_DEVICE_HOST	(0x1 << 1)
> +
>  /**
>   * SUBTEST: compute
>   * Description: Run a simple compute kernel with the system allocator
>   * Test category: functionality test
> + *
> + * SUBTEST: eu-fault-4k-%s
> + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer
> + * Test category: performance test
> + *
> + * SUBTEST: eu-fault-64k-%s
> + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer
> + * Test category: performance test
> + *
> + * SUBTEST: eu-fault-2m-%s
> + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
> + * Test category: performance test
> + *
> + * arg[1]:
> + *
> + * @once-device:				touch the buffer only once, from the device
> + * @once-device-host:				touch the buffer only once, from the device then from the host
> + * @range-device:				touch the whole buffer, from the device
> + * @range-device-host:				touch the whole buffer, from the device then from the host
>   */
>  static void
> -test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> +test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> +	     unsigned int flags)
>  {
>  	struct drm_xe_sync sync = {
>  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -2205,11 +2229,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>  	compute_input = aligned_alloc(aligned_size, size);
>  	igt_assert(compute_input);
>  
> +	env.array_size = (flags & TOUCH_ONCE) ? 1 : aligned_size / sizeof(float);
> +	env.skip_results_check = (flags & ACCESS_DEVICE_HOST) ? false : true;
> +	env.input_addr = to_user_pointer(compute_input);
> +	env.vm = vm;
> +
>  	for (i = 0; i < env.array_size; i++)
>  		compute_input[i] = rand() / (float)RAND_MAX;
>  
> -	env.input_addr = to_user_pointer(compute_input);
> -	env.vm = vm;
>  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>  
>  	free(compute_input);
> @@ -2361,6 +2388,13 @@ igt_main
>  		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
>  		{ NULL },
>  	};
> +	const struct section csections[] = {
> +		{ "once-device", TOUCH_ONCE },
> +		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
> +		{ "range-device", 0 },
> +		{ "range-device-host", ACCESS_DEVICE_HOST },
> +		{ NULL },
> +	};
>  
>  	const struct section intel_get_pat_idx_functions[] = {
>  		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> @@ -2604,7 +2638,25 @@ igt_main
>  
>  	igt_subtest("compute")
>  		xe_for_each_engine(fd, hwe)
> -			test_compute(fd, hwe, SZ_2M);
> +			test_compute(fd, hwe, SZ_2M, 0);

Iteration over each engine here doesn't makes sense, eci is not used
in the test_compute function (it calls run_intel_compute_kernel()
which in turn passes NULL). If you want to execute on more than
single ccs you should pick eci which matches COMPUTE class and
call __run_intel_compute_kernel() directly.

--
Zbigniew

> +
> +	for (const struct section *s = csections; s->name; s++) {
> +		igt_subtest_f("eu-fault-4k-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				test_compute(fd, hwe, SZ_4K, s->flags);
> +				break;
> +			}
> +		igt_subtest_f("eu-fault-64k-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				test_compute(fd, hwe, SZ_64K, s->flags);
> +				break;
> +			}
> +		igt_subtest_f("eu-fault-2m-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				test_compute(fd, hwe, SZ_2M, s->flags);
> +				break;
> +			}
> +	}
>  
>  	igt_fixture {
>  		xe_device_put(fd);
> -- 
> 2.43.0
> 
