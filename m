Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F30EF9008
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 16:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3A510E18F;
	Wed,  4 Mar 2026 16:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZz0FIqL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A0010E18F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 16:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772643310; x=1804179310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8xDpk49zGMzZkGY2ig4xmoBTYnBPqpvbhrcKIYzUk2U=;
 b=RZz0FIqLQxrM5eZI8e3aeJl8DIfdtfXz2LIANZpOn6VMnGXpyaHohU8g
 r7vVTWBGWhIUX8xSuka7v7l/DIJgmcyWa9VvROz+KZyyV4wck1f5qgH78
 3Jsy231VapbfJT8SKNegbUVsDgzBBxTuG7JfWbQsuaV2VuuGGhRSSQ4h7
 rcRoL7X4iBV/QwHBfLk30FodmN1J3KwnJTJ+qBcuJVOnKsI1d8KKh8Lqr
 xmuw+461gjR4wxLFbp7PA/DlZwj00Zz/l8Z3p/cmca+z46R8L811CmMvx
 9wzshL7ohLBBL2H0j1e8Lx/jEVcPZf1eWpTeVdhUgxRIkn0RsWwPf9KNw g==;
X-CSE-ConnectionGUID: biXyOzIpRlCQBvsFvjA4eQ==
X-CSE-MsgGUID: wFXSMwepSuS0t9cJ9RNWRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84798170"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84798170"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:55:09 -0800
X-CSE-ConnectionGUID: yBJU8sYvTUelLjGyIJPX2w==
X-CSE-MsgGUID: QVxN2tTYT6GgfGl+hfdK8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="217562457"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:55:08 -0800
Date: Wed, 4 Mar 2026 17:55:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com, 
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_exec_system_allocator: Print
 page fault duration in compute
Message-ID: <4zcvcgheilchhipvgtfztuv4ehus5sjkzdfseb3qgcvmtrt5o5@if5jh62p6t3d>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
 <20260128173412.1319610-6-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128173412.1319610-6-francois.dugast@intel.com>
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

On Wed, Jan 28, 2026 at 06:29:10PM +0100, Francois Dugast wrote:
> Extend use of GT stats in the compute test to display the GPU page fault
> handling duration as this is a KPI use for performance optimization.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e45165acd..18ea6e7fe 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2183,6 +2183,10 @@ struct xe_gt_stats_snapshot {
>  	int svm_2M_migrate_count;
>  
>  	int svm_device_copy_kb;
> +
> +	int svm_4K_pagefault_us;
> +	int svm_64K_pagefault_us;
> +	int svm_2M_pagefault_us;
>  };
>  
>  static void read_gt_stats_snapshot(int fd,
> @@ -2205,6 +2209,13 @@ static void read_gt_stats_snapshot(int fd,
>  
>  	snapshot->svm_device_copy_kb =
>  		xe_gt_stats_get_count(fd, eci->gt_id, "svm_device_copy_kb");
> +
> +	snapshot->svm_4K_pagefault_us =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_pagefault_us");
> +	snapshot->svm_64K_pagefault_us =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_pagefault_us");
> +	snapshot->svm_2M_pagefault_us =
> +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_pagefault_us");
>  }
>  
>  /* compute flags */
> @@ -2257,6 +2268,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  	float *compute_input;
>  	struct xe_gt_stats_snapshot stats_before, stats_after;
>  
> +	igt_assert(loops);
> +
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>  	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
>  	sync.addr = to_user_pointer(&bo_sync->sync);
> @@ -2298,6 +2311,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  				      stats_before.svm_64K_migrate_count);
>  			igt_assert_eq(stats_after.svm_2M_migrate_count,
>  				      stats_before.svm_2M_migrate_count);
> +
> +			igt_info("  svm_4K_pagefault_us=%d\n",
> +				 (stats_after.svm_4K_pagefault_us -
> +				  stats_before.svm_4K_pagefault_us) / loops);
>  		} else if (size == SZ_64K) {
>  			igt_assert_eq(stats_after.svm_4K_pagefault_count,
>  				      stats_before.svm_4K_pagefault_count);
> @@ -2312,6 +2329,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  				      stats_before.svm_64K_migrate_count + loops);
>  			igt_assert_eq(stats_after.svm_2M_migrate_count,
>  				      stats_before.svm_2M_migrate_count);
> +
> +			igt_info("  svm_64K_pagefault_us=%d\n",
> +				 (stats_after.svm_64K_pagefault_us -
> +				  stats_before.svm_64K_pagefault_us) / loops);
>  		} else if (size == SZ_2M) {
>  			igt_assert_eq(stats_after.svm_4K_pagefault_count,
>  				      stats_before.svm_4K_pagefault_count);
> @@ -2326,6 +2347,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
>  				      stats_before.svm_64K_migrate_count);
>  			igt_assert_eq(stats_after.svm_2M_migrate_count,
>  				      stats_before.svm_2M_migrate_count + loops);
> +
> +			igt_info("  svm_2M_pagefault_us=%d\n",
> +				 (stats_after.svm_2M_pagefault_us -
> +				  stats_before.svm_2M_pagefault_us) / loops);
>  		}
>  
>  		igt_assert_eq(stats_after.svm_device_copy_kb,
> -- 
> 2.43.0
> 
