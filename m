Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F62606A335
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JwZPmCYJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A35510E4E1;
	Wed, 28 Oct 2026 13:10:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFDD10E4E1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793192984; x=1824728984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lMUTdiwzu8/83GhfOHnK/wVvIEwQYNnz7wrce1ibac0=;
 b=JwZPmCYJe0a9YBERlsqg3P4o+FqxEautIEPe2y85FuS+UDUA1SK8RO2C
 mTofAK4LAc2WPIAUvhhOUBm+aJPFvqIcBUoFpP2vKHd9/nPc6sF3ZyeKF
 E7rB2Pqhxo97jb6t70itnVo/0NyYWBfvG26ldpQFAfC9KBYKjTRcnTRAV
 x9ojpfikArNn/nbKNsNsVd1NI1F4SOhUqUeSkTm6RdZXb79jmXUchBcsv
 prs+jpArw98nOD7SZ1aebJOdn6jlJ3wI29ykXvWcbucClx+JFpt0Ozt+p
 R3nNTX46c4RR+bfYBbI/SsUitKAbH49dW1z7LMFBEp5jiliH6E5Mr+STq w==;
X-CSE-ConnectionGUID: SlDeQTF1R+eDdLpxDEF9AA==
X-CSE-MsgGUID: 9BZlLuAGSjmtTp1oy8CNxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1942897"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1942897"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:09:44 -0700
X-CSE-ConnectionGUID: 83RxFxfKSxW/ZhIWFS01Nw==
X-CSE-MsgGUID: IWw4Y2H/QE+r1bC1tjUKKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4776452"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:09:42 -0700
Date: Wed, 28 Oct 2026 14:09:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com
Subject: Re: [PATCH i-g-t 1/2] tests/msm/msm_bo: Reorder info tests and clean
 up
Message-ID: <20261028130939.ahaq2klhkarjcklb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com
References: <20261028102552.3836144-1-jvignan@qti.qualcomm.com>
 <20261028102552.3836144-2-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028102552.3836144-2-jvignan@qti.qualcomm.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jitta,
On 2026-10-28 at 15:55:51 +0530, Jitta Vignan wrote:
> Run the info negative tests after the positive info tests, so the
> basic queries are exercised first.
> 
> Use do_ioctl_err() for the alloc and info negative tests instead of
> open-coding the return value and errno checks, and use a single bit
> outside MSM_BO_FLAGS for the invalid-flags test.
> 
> Keep the deprecated MSM_BO_UNCACHED case in bo-get-flags-cache-modes.
> Kernels that reject it return EINVAL, which is already treated as
> expected; kernels that still accept it may report either UNCACHED or
> WC, so accept both for this case.
> 
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
> ---
>  tests/msm/msm_bo.c | 128 ++++++++++++++++++++++-----------------------
>  1 file changed, 63 insertions(+), 65 deletions(-)
> 
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 8cc2ebf9e..885382825 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -8,11 +8,6 @@
>  #include "igt.h"
>  #include "igt_msm.h"
>  
> -/*
> - * Tests for MSM buffer object allocation and information
> - * Tests DRM_IOCTL_MSM_GEM_NEW and DRM_IOCTL_MSM_GEM_INFO functionality
> - */

Can you add here:

IGT_TEST_DESCRIPTION("your one line test description here");

For example:

IGT_TEST_DESCRIPTION("MSM buffer object allocation and information");

With this LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> -
>  #define DEFAULT_BUFFER_SIZE 4096
>  
>  int igt_main()
> @@ -73,8 +68,7 @@ int igt_main()
>  
>  		req.size = 0;
>  
> -		igt_assert_eq(igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req), -1);
> -		igt_assert_eq(errno, EINVAL);
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req, EINVAL);
>  	}
>  
>  	igt_describe("Test allocation with invalid flags (should fail)");
> @@ -82,10 +76,9 @@ int igt_main()
>  		struct drm_msm_gem_new req = { 0 };
>  
>  		req.size = DEFAULT_BUFFER_SIZE;
> -		req.flags = ~0; /* Invalid flags */
> +		req.flags = (1 << 25); /* Invalid flag bit outside MSM_BO_FLAGS */
>  
> -		igt_assert_eq(igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req), -1);
> -		igt_assert_eq(errno, EINVAL);
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req, EINVAL);
>  	}
>  
>  	igt_describe("Test allocation with unaligned size");
> @@ -99,7 +92,9 @@ int igt_main()
>  
>  		igt_msm_bo_free(bo);
>  	}
> -		igt_describe("Get offset for valid BO");
> +
> +	/* Buffer Information Tests - Positive Cases */
> +	igt_describe("Get offset for valid BO");
>  	igt_subtest("bo-get-offset-valid") {
>  		struct msm_bo *bo;
>  		struct drm_msm_gem_info req = { 0 };
> @@ -171,59 +166,6 @@ int igt_main()
>  		igt_msm_bo_free(bo);
>  	}
>  
> -	/* Buffer Information Tests - Negative Cases */
> -	igt_describe("Get offset for invalid handle (expects ENOENT)");
> -	igt_subtest("bo-get-offset-invalid") {
> -		struct drm_msm_gem_info req = { 0 };
> -		int ret;
> -
> -		req.handle = 0xDEADBEEF; /* Invalid handle */
> -		req.info = MSM_INFO_GET_OFFSET;
> -
> -		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> -		igt_assert_eq(ret, -1);
> -		igt_assert_eq(errno, ENOENT);
> -
> -		igt_info("Correctly rejected invalid handle with ENOENT\n");
> -	}
> -
> -	igt_describe("Get IOVA for invalid handle (expects ENOENT)");
> -	igt_subtest("bo-get-iova-invalid") {
> -		struct drm_msm_gem_info req = { 0 };
> -		int ret;
> -
> -		req.handle = 0xDEADBEEF; /* Invalid handle */
> -		req.info = MSM_INFO_GET_IOVA;
> -
> -		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> -		igt_assert_eq(ret, -1);
> -		igt_assert_eq(errno, ENOENT);
> -
> -		igt_info("Correctly rejected invalid handle with ENOENT\n");
> -	}
> -
> -	igt_describe("Use invalid info type (expects EINVAL)");
> -	igt_subtest("bo-invalid-info-type") {
> -		struct msm_bo *bo;
> -		struct drm_msm_gem_info req = { 0 };
> -		int ret;
> -
> -		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> -		igt_assert_f(bo, "Failed to allocate buffer object\n");
> -
> -		req.handle = bo->handle;
> -		req.info = 0xFFFFFFFF; /* Invalid info type */
> -
> -		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> -		igt_assert_eq(ret, -1);
> -		igt_assert_eq(errno, EINVAL);
> -
> -		igt_info("Correctly rejected invalid info type with EINVAL\n");
> -
> -		igt_msm_bo_free(bo);
> -	}
> -
> -	/* Additional Buffer Information Tests */
>  	igt_describe("Verify offset consistency across multiple queries");
>  	igt_subtest("bo-get-offset-consistency") {
>  		struct msm_bo *bo;
> @@ -337,7 +279,7 @@ int igt_main()
>  			{ MSM_BO_CACHED_COHERENT, "CACHED_COHERENT", true }, /* May not be supported */
>  		};
>  
> -		for (int i = 0; i < ARRAY_SIZE(test_cases); i++) {
> +		for (unsigned int i = 0; i < ARRAY_SIZE(test_cases); i++) {
>  			struct drm_msm_gem_new alloc_req = { 0 };
>  			struct drm_msm_gem_info info_req = { 0 };
>  			int ret;
> @@ -367,6 +309,19 @@ int igt_main()
>  				 (unsigned long long)info_req.value,
>  				 test_cases[i].flags);
>  
> +			/*
> +			 * MSM_BO_UNCACHED is deprecated in favour of MSM_BO_WC, so a
> +			 * kernel that still accepts it may report either cache mode.
> +			 */
> +			if (test_cases[i].flags == MSM_BO_UNCACHED) {
> +				uint64_t mode = info_req.value & MSM_BO_CACHE_MASK;
> +
> +				igt_assert_f(mode == MSM_BO_UNCACHED || mode == MSM_BO_WC,
> +					     "Cache mode mismatch for %s\n", test_cases[i].name);
> +				gem_close(dev->fd, alloc_req.handle);
> +				continue;
> +			}
> +
>  			/* Verify the cache mode flag is set */
>  			igt_assert_f((info_req.value & MSM_BO_CACHE_MASK) == test_cases[i].flags,
>  				     "Cache mode mismatch for %s\n", test_cases[i].name);
> @@ -375,6 +330,49 @@ int igt_main()
>  		}
>  	}
>  
> +	/* Buffer Information Tests - Negative Cases */
> +	igt_describe("Get offset for invalid handle (expects ENOENT)");
> +	igt_subtest("bo-get-offset-invalid") {
> +		struct drm_msm_gem_info req = { 0 };
> +
> +		req.handle = 0xDEADBEEF; /* Invalid handle */
> +		req.info = MSM_INFO_GET_OFFSET;
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
> +
> +		igt_info("Correctly rejected invalid handle with ENOENT\n");
> +	}
> +
> +	igt_describe("Get IOVA for invalid handle (expects ENOENT)");
> +	igt_subtest("bo-get-iova-invalid") {
> +		struct drm_msm_gem_info req = { 0 };
> +
> +		req.handle = 0xDEADBEEF; /* Invalid handle */
> +		req.info = MSM_INFO_GET_IOVA;
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
> +
> +		igt_info("Correctly rejected invalid handle with ENOENT\n");
> +	}
> +
> +	igt_describe("Use invalid info type (expects EINVAL)");
> +	igt_subtest("bo-invalid-info-type") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req = { 0 };
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.info = 0xFFFFFFFF; /* Invalid info type */
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, EINVAL);
> +
> +		igt_info("Correctly rejected invalid info type with EINVAL\n");
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
>  	igt_fixture() {
>  		igt_msm_dev_close(dev);
>  	}
> -- 
> 2.34.1
> 
