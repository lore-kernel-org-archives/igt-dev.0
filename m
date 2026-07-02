Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE211C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 11:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8423C10F2EF;
	Thu,  2 Jul 2026 11:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbYcPwQd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7281D10E4AB
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782990902; x=1814526902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pg6jZR+7onoCFiIP/uTZn0RC4N/6iW4xEMVUSqOPMQo=;
 b=IbYcPwQd/73iUs8lyJ970ewlUGmyZSxu/doeGBDA1rLvYGzUGMAeXsu7
 JXdFtJ8fIEVoUjfVvNd/1AqUq3w9zM6VutiQeV55iNAOBKmhBmLgjjVGc
 NiVXi+LcVT332kn/6Q/62psR/LBhfK9i5QzSkGmaiz55DGaYzknlBgRJD
 kY/PzrRZ5Sofjtz79Zi/D1jvCrKrW34DL+QasaNZMpx/kFB7nmB6fnO4U
 GqVhC5X+Zp8T1lJJK/fILyeMcZIJMXUK097OJXYl2hqzATpWa5/M+vZOA
 K/wb7NrcFHpm2YqUTgpmUp5pyCRyfouMrL7QgIJTqynu1g9QlaKrvTNLr A==;
X-CSE-ConnectionGUID: Ye+qpoIMQWydR6hG3R/83w==
X-CSE-MsgGUID: RNZnaa9xSrmkymXzmorcfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82854059"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82854059"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:15:01 -0700
X-CSE-ConnectionGUID: TuVX95QhR9KNa9FRaM2NXA==
X-CSE-MsgGUID: u9hEOOg2QHyz4A6tzDOd0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256742226"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:15:00 -0700
Date: Thu, 2 Jul 2026 13:14:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/msm: fix BO allocation tests to use
 explicit cache flags
Message-ID: <20260702111439.mn5cluajgfzcinmi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org
References: <20260702091351.96324-1-jvignan@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702091351.96324-1-jvignan@qti.qualcomm.com>
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

Hi Jitta,
On 2026-07-02 at 14:43:50 +0530, Jitta Vignan wrote:
> Use explicit cache mode flags (MSM_BO_WC) instead of flags=0 in BO
> allocation tests to match current kernel requirements.
> 
> Also update bo-alloc-uncached to use a raw GEM_NEW ioctl so the
> deprecated MSM_BO_UNCACHED flag can be handled gracefully without
> triggering helper assertions. The test now accepts either successful
> allocation or EINVAL on kernels where the flag is no longer supported.
> 
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> ---
>  tests/msm/msm_bo.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 131b43bfa..f296ad9ae 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -9,8 +9,8 @@
>  #include "igt_msm.h"
>  
>  /*
> - * Tests for MSM buffer object allocation
> - * Tests DRM_IOCTL_MSM_GEM_NEW functionality
> + * Tests for MSM buffer object allocation and information
> + * Tests DRM_IOCTL_MSM_GEM_NEW and DRM_IOCTL_MSM_GEM_INFO functionality
>   */
>  
>  #define DEFAULT_BUFFER_SIZE 4096
> @@ -28,7 +28,7 @@ int igt_main()
>  	igt_subtest("bo-alloc-basic") {
>  		struct msm_bo *bo;
>  
> -		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, 0);
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
>  		igt_assert_f(bo, "Failed to allocate buffer object\n");
>  		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
>  		igt_assert_f(bo->size == DEFAULT_BUFFER_SIZE,
> @@ -49,15 +49,22 @@ int igt_main()
>  		igt_msm_bo_free(bo);
>  	}
>  
> -	igt_describe("Test uncached buffer object allocation");
> +	igt_describe("Test uncached buffer object allocation (deprecated flag)");
>  	igt_subtest("bo-alloc-uncached") {
> -		struct msm_bo *bo;
> -
> -		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_UNCACHED);
> -		igt_assert_f(bo, "Failed to allocate uncached buffer object\n");
> -		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
> +		struct drm_msm_gem_new req = { 0 };
> +		int ret;
>  
> -		igt_msm_bo_free(bo);
> +		req.size = DEFAULT_BUFFER_SIZE;
> +		req.flags = MSM_BO_UNCACHED;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req);
> +		if (ret == 0) {
> +			igt_info("MSM_BO_UNCACHED supported on this kernel\n");
> +			gem_close(dev->fd, req.handle);
> +		} else {
> +			igt_assert_eq(errno, EINVAL);
> +			igt_info("MSM_BO_UNCACHED not supported (deprecated)\n");
> +		}
>  	}
>  
>  	igt_describe("Test allocation with zero size (should fail)");
> @@ -86,7 +93,7 @@ int igt_main()
>  		struct msm_bo *bo;
>  		size_t size = DEFAULT_BUFFER_SIZE - 3; /* Unaligned size */
>  
> -		bo = igt_msm_bo_new(dev, size, 0);
> +		bo = igt_msm_bo_new(dev, size, MSM_BO_WC);
>  		igt_assert_f(bo, "Failed to allocate buffer with unaligned size\n");
>  		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
>  
> -- 
> 2.34.1
> 
