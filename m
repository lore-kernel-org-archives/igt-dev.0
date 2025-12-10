Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BFBD3C928
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 16:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E1310E785;
	Wed, 10 Dec 2025 16:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0ZQ6UEw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE59D10E77B
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765384870; x=1796920870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LdSQuJm7D4lS4DjBoPCioD3JIEG1aVTtns5j5UFZcoU=;
 b=g0ZQ6UEw1Q5fDbKT10fnR7PMIVhub94SZlt1IYdnmlrwsXySACu0/AwK
 A1xsdh54MUfueKCVc+YTNCK3KiZhWSz2iDUzHqfL+IZXwB7LsaGPhdmbx
 YXjapRlxU8j2is/4tjkNgZhgeq+tCb4Frw0CZr5TQUYCni3GQLKVAItaJ
 huECMbXjODwO28Nns6O6wuN4YURzExeirljDtGyJzoyOcMVXMBAQuuGLi
 AOaV1vj1h8ZgghzgJUTvSEfm95AMcYculhQCF3aHEubna0DTAfRQARmKv
 zByLXtTeUfOTcB7dsn/PtGvlTir541SfAqdrE/skj99R++jpuXMSc6HKB A==;
X-CSE-ConnectionGUID: O19Gi2dyT16wqfyTxV6/Og==
X-CSE-MsgGUID: 6Il5VdFIQUiyOm4my9Golw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="77976909"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="77976909"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 08:41:10 -0800
X-CSE-ConnectionGUID: i7XwkWArTMGYi6PrTiVmlg==
X-CSE-MsgGUID: OtGT2XutR+SctSYrFkgAXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="197351883"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 08:41:09 -0800
Date: Wed, 10 Dec 2025 17:41:07 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_system_allocator: Add new
 SVM compute tests
Message-ID: <mey3oehlsrzsteourc4m2uk7g7rynk64glwngl623xgd33v6ga@gdhmyrplssu4>
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

How this corresponds to establishing input/output size in the pipeline
creation? I see there's:

	bo_dict[4].size = size_input(execenv.array_size);

where execenv.array_size even if assigned and is equal to 1:

	if (user && user->array_size)
		execenv->array_size = user->array_size;

is altered by size_input() -> return MAX(sizeof(float) * work_size, 0x10000);

--
Zbigniew

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
