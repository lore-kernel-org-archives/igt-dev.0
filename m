Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC76CD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870F010E49A;
	Thu, 21 May 2026 11:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjefS2cT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEE310E49A
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779364394; x=1810900394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hLqJ1O7+DsaOWxlWTTqiRj2IIVGFWhqiay8s14ReYy4=;
 b=WjefS2cT+dRKp+369ucQpAhLalfgrPmfubiuL2rl0CxvXGXynirytvSW
 z/QHiNW6ibEa01lwMEBUJc9B4zVrBxu8ut1I9wt9sgmzIBLlw/jKp31FO
 1wikqwnNX0niyo5TOon1Q35o/hXHzjdN42K/fQz9Ruwv71rPhcVX44g3s
 9SE48F1sktpHWrn8QPdi2AGZ2ZLi9mCYoOJiwiLneV5/tDZhOmITZu6Hi
 R1QNkRX51U57W082MNX+y9oMVhyOXef+zDREhMDD0BHMtE6fDeAYwSbJ9
 g0aJ/acvGmQTp+YVt89V5Mt50tNkBmry3Yt3o+WUFdJBd/GbWguqDncVY Q==;
X-CSE-ConnectionGUID: xCd8C/7ZT9aX8tZcUkqAAw==
X-CSE-MsgGUID: c/Bfia5OQGOIN3dL8lPRBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91386108"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="91386108"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:53:13 -0700
X-CSE-ConnectionGUID: sj3Em0grQu2EY+/ErsAvqw==
X-CSE-MsgGUID: FsmUQaDlSmSyFpHHzS0MBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="240374824"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:53:12 -0700
Date: Thu, 21 May 2026 13:53:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t, v2] tests/intel/xe_exec_system_allocator: Test
 madvise(MADV_DONTNEED)
Message-ID: <20260521115309.wtp7odyzcruvet6s@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260521101938.139350-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521101938.139350-1-francois.dugast@intel.com>
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

Hi Francois,
On 2026-05-21 at 12:18:39 +0200, Francois Dugast wrote:
> Extend the compute test to make use of madvise(MADV_DONTNEED) on the
> input array before reading from it on host, after running the compute
> kernel. The GT stats are used to verify that no page migration happened
> from device to host.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
> v2: Only skip results check when not needed (Zbigniew)
> ---
>  tests/intel/xe_exec_system_allocator.c | 53 +++++++++++++++++++++++++-
>  1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 0f1d6ee9c..21973e95d 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2250,6 +2250,9 @@ struct xe_gt_stats_snapshot {
>  	int svm_4K_pagefault_us;
>  	int svm_64K_pagefault_us;
>  	int svm_2M_pagefault_us;
> +	int svm_4K_cpu_copy_kb;
> +	int svm_64K_cpu_copy_kb;
> +	int svm_2M_cpu_copy_kb;
>  };
>  
>  static void read_gt_stats_snapshot(int fd,
> @@ -2262,11 +2265,18 @@ static void read_gt_stats_snapshot(int fd,
>  		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_pagefault_us");
>  	snapshot->svm_2M_pagefault_us =
>  		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_pagefault_us");
> +	snapshot->svm_4K_cpu_copy_kb =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_cpu_copy_kb");
> +	snapshot->svm_64K_cpu_copy_kb =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_cpu_copy_kb");
> +	snapshot->svm_2M_cpu_copy_kb =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_cpu_copy_kb");
>  }
>  
>  /* compute flags */
>  #define TOUCH_ONCE		(0x1 << 0)
>  #define ACCESS_DEVICE_HOST	(0x1 << 1)
> +#define USE_MADV_DONTNEED	(0x1 << 2)
>  
>  /**
>   * SUBTEST: compute
> @@ -2285,6 +2295,18 @@ static void read_gt_stats_snapshot(int fd,
>   * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
>   * Test category: performance test
>   *
> + * SUBTEST: eu-fault-4k-range-device-host-madvise-dontneed
> + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> + * Test category: performance test
> + *
> + * SUBTEST: eu-fault-64k-range-device-host-madvise-dontneed
> + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> + * Test category: performance test
> + *
> + * SUBTEST: eu-fault-2m-range-device-host-madvise-dontneed
> + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> + * Test category: performance test
> + *

Could you avoid copy-paste and use parameter for 4KB, 64KB and 2MB?

Regards,
Kamil

>   * arg[1]:
>   *
>   * @once-device:				touch the buffer only once, from the device
> @@ -2321,7 +2343,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>  
>  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> -	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> +	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & MADV_DONTNEED);
>  	env.vm = vm;
>  
>  	read_gt_stats_snapshot(fd, eci, &stats_before);
> @@ -2344,6 +2366,22 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  
>  		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
>  
> +		if (flags & ACCESS_DEVICE_HOST) {
> +			float total = 0;
> +
> +			if (flags & USE_MADV_DONTNEED)
> +				igt_assert_eq(madvise(compute_input, size, MADV_DONTNEED), 0);
> +
> +			/*
> +			 * No functional purpose, just force a read on host
> +			 */
> +			for (int j = 0; j < env.array_size; j++)
> +				total += compute_input[j];
> +
> +			if (!total)
> +				igt_debug("compute_input is zeros\n");
> +		}
> +
>  		free(compute_input);
>  	}
>  
> @@ -2365,6 +2403,18 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  		}
>  	}
>  
> +	if ((flags & ACCESS_DEVICE_HOST) && (flags & USE_MADV_DONTNEED)) {
> +		if (size == SZ_4K)
> +			igt_assert_eq(stats_before.svm_4K_cpu_copy_kb,
> +				      stats_after.svm_4K_cpu_copy_kb);
> +		else if (size == SZ_64K)
> +			igt_assert_eq(stats_before.svm_64K_cpu_copy_kb,
> +				      stats_after.svm_64K_cpu_copy_kb);
> +		else if (size == SZ_2M)
> +			igt_assert_eq(stats_before.svm_2M_cpu_copy_kb,
> +				      stats_after.svm_2M_cpu_copy_kb);
> +	}
> +
>  	unbind_system_allocator();
>  	xe_vm_destroy(fd, vm);
>  }
> @@ -2525,6 +2575,7 @@ int igt_main()
>  		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
>  		{ "range-device", 0 },
>  		{ "range-device-host", ACCESS_DEVICE_HOST },
> +		{ "range-device-host-madvise-dontneed", ACCESS_DEVICE_HOST | USE_MADV_DONTNEED },
>  		{ NULL },
>  	};
>  
> -- 
> 2.43.0
> 
