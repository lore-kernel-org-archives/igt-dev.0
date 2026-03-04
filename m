Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3CCEF9008
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 16:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B88810EA79;
	Wed,  4 Mar 2026 16:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltF5LpIf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F36F10EA6F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 16:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772643242; x=1804179242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p2vMuC7Eyx5uKmqjn7JcOnj6QtcwZp99T1iIUypa8Hs=;
 b=ltF5LpIfi6gJ9geXcmoCgvmmCCF3SPzVrsbJM714ihC/S4Gd4rPMbgQ1
 PCHAipbp1RHEuSAhPtCCaCd7m3JyyAGmi8jDBmQJ2hw9wH9eupLH/jz2s
 NINyZkZ9ccizqRVPPZQWstwbAOwulIJ07zlT5aD47HFY9lkzTulHh45zL
 2fi8LXNIF75E5gCbgo2k948f6fSHmojBcV7mrI0PyyMJyu7Yff6Y080xY
 fB20aWOT9t1XAFqKdYMLhHp0a/20gzgqb1WkWaLdeKvo29H2wUWDujMRf
 f3/1iO3zFjdeRyKIRDye4jm+6Gnl4pp7sZh0y7DgffTSKYxsaWgBbVYhO A==;
X-CSE-ConnectionGUID: Q+iSgLL6TEu/XMbupk+rRQ==
X-CSE-MsgGUID: oBxvh62YRQCMx4GhuynLCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84420325"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84420325"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:54:02 -0800
X-CSE-ConnectionGUID: 17COQBWvRpyBH5jTweWALQ==
X-CSE-MsgGUID: sBRPQ+hOQDih0LWIlGakIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215316539"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:54:01 -0800
Date: Wed, 4 Mar 2026 17:53:58 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Assert
 page fault count in compute
Message-ID: <o3rixwmrgla5elbfjxbzgvm6aapb25ywmzr6syzd3am2pzmvx4@xgkk5cqwv75b>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
 <20260128173412.1319610-5-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128173412.1319610-5-francois.dugast@intel.com>
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

On Wed, Jan 28, 2026 at 06:29:09PM +0100, Francois Dugast wrote:
> With TOUCH_ONCE the page fault count should be deterministic so make use
> of existing GT stats to assert that the memory was indeed touched by the
> GPU and consequently triggered a page fault with migration of the correct
> size.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 88 ++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index d577eb4f3..e45165acd 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2173,6 +2173,40 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>  	munmap(pdata, sizeof(*pdata));
>  }
>  
> +struct xe_gt_stats_snapshot {
> +	int svm_4K_pagefault_count;
> +	int svm_64K_pagefault_count;
> +	int svm_2M_pagefault_count;
> +
> +	int svm_4K_migrate_count;
> +	int svm_64K_migrate_count;
> +	int svm_2M_migrate_count;
> +
> +	int svm_device_copy_kb;
> +};
> +
> +static void read_gt_stats_snapshot(int fd,
> +				   struct drm_xe_engine_class_instance *eci,
> +				   struct xe_gt_stats_snapshot *snapshot)
> +{
> +	snapshot->svm_4K_pagefault_count =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_pagefault_count");
> +	snapshot->svm_64K_pagefault_count =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_pagefault_count");
> +	snapshot->svm_2M_pagefault_count =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_pagefault_count");
> +
> +	snapshot->svm_4K_migrate_count =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_migrate_count");
> +	snapshot->svm_64K_migrate_count =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_migrate_count");
> +	snapshot->svm_2M_migrate_count =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_migrate_count");
> +
> +	snapshot->svm_device_copy_kb =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_device_copy_kb");
> +}
> +
>  /* compute flags */
>  #define TOUCH_ONCE		(0x1 << 0)
>  #define ACCESS_DEVICE_HOST	(0x1 << 1)
> @@ -2221,6 +2255,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  		.array_size = size / sizeof(float),
>  	};
>  	float *compute_input;
> +	struct xe_gt_stats_snapshot stats_before, stats_after;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>  	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
> @@ -2232,6 +2267,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
>  	env.vm = vm;
>  
> +	read_gt_stats_snapshot(fd, eci, &stats_before);
> +
>  	for (int i = 0; i < loops; i++) {
>  		compute_input = aligned_alloc(size, size);
>  		igt_assert(compute_input);
> @@ -2244,6 +2281,57 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  		free(compute_input);
>  	}
>  
> +	read_gt_stats_snapshot(fd, eci, &stats_after);
> +
> +	if (flags & TOUCH_ONCE) {
> +		if (size == SZ_4K) {
> +			igt_assert_eq(stats_after.svm_4K_pagefault_count,
> +				      stats_before.svm_4K_pagefault_count + loops);
> +			igt_assert_eq(stats_after.svm_64K_pagefault_count,
> +				      stats_before.svm_64K_pagefault_count);
> +			igt_assert_eq(stats_after.svm_2M_pagefault_count,
> +				      stats_before.svm_2M_pagefault_count);

It might be simplified with:

#define STATS(tp, l1, l2, l3) \
	igt_assert_eq(stats_after.svm_4K_##tp##_count, \
	stats_before.svm_4K_##tp##_count + l1); \
	igt_assert_eq(stats_after.svm_64K_##tp##_count, \
	stats_before.svm_64K_##tp##_count + l2); \
	igt_assert_eq(stats_after.svm_2M_##tp##_count, \
	stats_before.svm_2M_##tp##_count + l3)

and use:

	STATS(pagefault, loops, 0, 0);
	STATS(migrate, loops, 0, 0);

and so on, but that's a suggestion. Regardless nit addressed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
> +			igt_assert_eq(stats_after.svm_4K_migrate_count,
> +				      stats_before.svm_4K_migrate_count + loops);
> +			igt_assert_eq(stats_after.svm_64K_migrate_count,
> +				      stats_before.svm_64K_migrate_count);
> +			igt_assert_eq(stats_after.svm_2M_migrate_count,
> +				      stats_before.svm_2M_migrate_count);
> +		} else if (size == SZ_64K) {
> +			igt_assert_eq(stats_after.svm_4K_pagefault_count,
> +				      stats_before.svm_4K_pagefault_count);
> +			igt_assert_eq(stats_after.svm_64K_pagefault_count,
> +				      stats_before.svm_64K_pagefault_count + loops);
> +			igt_assert_eq(stats_after.svm_2M_pagefault_count,
> +				      stats_before.svm_2M_pagefault_count);
> +
> +			igt_assert_eq(stats_after.svm_4K_migrate_count,
> +				      stats_before.svm_4K_migrate_count);
> +			igt_assert_eq(stats_after.svm_64K_migrate_count,
> +				      stats_before.svm_64K_migrate_count + loops);
> +			igt_assert_eq(stats_after.svm_2M_migrate_count,
> +				      stats_before.svm_2M_migrate_count);
> +		} else if (size == SZ_2M) {
> +			igt_assert_eq(stats_after.svm_4K_pagefault_count,
> +				      stats_before.svm_4K_pagefault_count);
> +			igt_assert_eq(stats_after.svm_64K_pagefault_count,
> +				      stats_before.svm_64K_pagefault_count);
> +			igt_assert_eq(stats_after.svm_2M_pagefault_count,
> +				      stats_before.svm_2M_pagefault_count + loops);
> +
> +			igt_assert_eq(stats_after.svm_4K_migrate_count,
> +				      stats_before.svm_4K_migrate_count);
> +			igt_assert_eq(stats_after.svm_64K_migrate_count,
> +				      stats_before.svm_64K_migrate_count);
> +			igt_assert_eq(stats_after.svm_2M_migrate_count,
> +				      stats_before.svm_2M_migrate_count + loops);
> +		}
> +
> +		igt_assert_eq(stats_after.svm_device_copy_kb,
> +			      stats_before.svm_device_copy_kb + (loops * size / 1024));
> +	}
> +
>  	unbind_system_allocator();
>  	xe_vm_destroy(fd, vm);
>  }
> -- 
> 2.43.0
> 
