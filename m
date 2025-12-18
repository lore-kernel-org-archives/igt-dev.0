Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D1CD6E2D8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 18:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875B610E9F4;
	Thu, 18 Dec 2025 18:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/Hl9Wnt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C14B10E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 18:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766083442; x=1797619442;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9ohsPlLyV3D8K6deIdVgIsjvBaTXoZN75IHLm7iQC7w=;
 b=T/Hl9WntZvrtze8NpjzjQCKFMSEDQHaQdOAWPBwRh+ZZoNdbCkwcOgiF
 qTfIB0P65AeBnzKCnUbQaVYih7Ez2/JG2xziNm++vMUJTy1ipDOQBWi7y
 QqwOv2t/5qCFqKoHEgrinedCIv+K0bE9odcNfGispWEveuX3Gtg7Vd94g
 g+us1Rt/SDa/RVmieXJgDBmv8i7j9GJw96KCV0Cp6YDIIfyQkRjsFcA8t
 h0mQ9kRoRR17ozWxI6AWJtP/cQNgbuxHtqoa+KBrEu6SbDlJvyxYXYZ17
 0n5PviaBjEIgwhnf9c0x37oWiHvinNt9Vl/saobQGGTCHanUj6NBbFe5p A==;
X-CSE-ConnectionGUID: WzJiL+ulS/6qsjzvKqzZfg==
X-CSE-MsgGUID: nmHs564JRESMoH91FczzHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85631841"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="85631841"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:44:01 -0800
X-CSE-ConnectionGUID: IMnVzKUxQhqDLBW/lOBAHQ==
X-CSE-MsgGUID: o2DvSrZyRSWqNeYsgWkTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203561666"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:44:00 -0800
Date: Thu, 18 Dec 2025 19:43:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t, v4 3/3] tests/intel/xe_exec_system_allocator: Add
 new SVM compute tests
Message-ID: <garzty6xbbx7z5datytfvqnhh6iycy7ccy56qa6xbsocgmlhxz@rgvz7lhuvytw>
References: <20251218125906.124925-1-francois.dugast@intel.com>
 <20251218125906.124925-4-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218125906.124925-4-francois.dugast@intel.com>
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

On Thu, Dec 18, 2025 at 01:56:07PM +0100, Francois Dugast wrote:
> These new tests allow triggering GPU page faults from the context of
> execution units. They can be used to create single page faults or page
> fault floods, of various sizes. This is helpful for debugging and for
> performance profiling.

On the beginning I thought this code should be benchmark because from
functional point of view doesn't matter number of pagefaults (aggregated
or flood). But there's one strong argument we can accept it as a test
- if pagefault aggregation won't work properly we likely would see
invalid data in output buffer and the test with ACCESS_DEVICE_HOST will fail.
So from me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew

> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Acked-by: Nishit Sharma <nishit.sharma@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 52 +++++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index b1555afbe..66d68f054 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2172,13 +2172,36 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
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
> -test_compute(int fd, size_t size)
> +test_compute(int fd, size_t size, unsigned int flags)
>  {
>  	struct drm_xe_sync sync = {
>  		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -2207,11 +2230,14 @@ test_compute(int fd, size_t size)
>  	compute_input = aligned_alloc(SZ_2M, size);
>  	igt_assert(compute_input);
>  
> -	for (i = 0; i < env.array_size; i++)
> -		compute_input[i] = rand() / (float)RAND_MAX;
> -
> +	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> +	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
>  	env.input_addr = to_user_pointer(compute_input);
>  	env.vm = vm;
> +
> +	for (i = 0; i < env.loop_count; i++)
> +		compute_input[i] = rand() / (float)RAND_MAX;
> +
>  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>  
>  	free(compute_input);
> @@ -2363,6 +2389,13 @@ int igt_main()
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
> @@ -2605,7 +2638,16 @@ int igt_main()
>  	}
>  
>  	igt_subtest("compute")
> -		test_compute(fd, SZ_2M);
> +		test_compute(fd, SZ_2M, 0);
> +
> +	for (const struct section *s = csections; s->name; s++) {
> +		igt_subtest_f("eu-fault-4k-%s", s->name)
> +			test_compute(fd, SZ_4K, s->flags);
> +		igt_subtest_f("eu-fault-64k-%s", s->name)
> +			test_compute(fd, SZ_64K, s->flags);
> +		igt_subtest_f("eu-fault-2m-%s", s->name)
> +			test_compute(fd, SZ_2M, s->flags);
> +	}
>  
>  	igt_fixture() {
>  		xe_device_put(fd);
> -- 
> 2.43.0
> 
