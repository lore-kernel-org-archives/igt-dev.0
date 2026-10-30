Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED2606A325
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hBURpYBy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33072112771;
	Fri, 30 Oct 2026 11:56:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD713112771
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793361311; x=1824897311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X2gTPBoFkc7+VYi7Vc+YlXGtd9oU6ATOACV+8o03Jj0=;
 b=hBURpYByyzk4p3AMZyJoECN1R5STx6BsFc/7Qp8edtEXAOw2iUEn+IiT
 U7foCLNSc6w6i4u+FBYqwsGLT6N1E3zt8qHLEFN6LxKFrsXrORx6zHqtU
 m6HemLBHYtkv6zZvndkyZ6iCwifUphFY9RNdqTx5vBeQug3sFAwOGtzbG
 7dvxt5ajmo9HcFf0H7YHRFeJnfYGY5zHCo/EkVy48GgSqphCPVxQJBMIK
 L8s6mhCqqSpQvRvuPXMvi5YKPjV8qpNVMRmAHDc2dTezJLggcnmjH/iSk
 lj2fdfMtzJ5U/T3xcBYPh90atORZDAatmxJKS+lynPePq5cYm+OTtm+YS g==;
X-CSE-ConnectionGUID: lM2QWtioTw+ist4ZCyyuOw==
X-CSE-MsgGUID: 85Bvj92rRnW6QWI0L/gnqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2149042"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2149042"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:55:10 -0700
X-CSE-ConnectionGUID: LXBFqkOZREGqMBcSd7cwfw==
X-CSE-MsgGUID: xgd55xEoS7Kb1nIEUk1MJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5787011"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 04:55:08 -0700
Date: Fri, 30 Oct 2026 12:55:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com
Subject: Re: [PATCH i-g-t 2/2] tests/msm/msm_bo: Add buffer free tests
Message-ID: <20261030115506.2x4pq5t7v63li4xp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com
References: <20261029165553.1108121-1-jvignan@qti.qualcomm.com>
 <20261029165553.1108121-3-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029165553.1108121-3-jvignan@qti.qualcomm.com>
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
On 2026-10-29 at 22:25:53 +0530, Jitta Vignan wrote:
> Add positive and negative coverage for freeing MSM buffer objects.
> 
> Exercise single and multiple buffer cleanup, large buffer cleanup,
> repeated allocation and free operations, invalid and zero handles,
> double-free attempts, and queries made after a buffer has been freed.
> 
> Verify that released buffer handles can no longer be queried through
> the MSM GEM info interface.
> 
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. could someone from Cc provide tested-by or r-b? Thanks!

> ---
>  tests/msm/msm_bo.c | 150 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index 295c7b0d3..f76e78e73 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -834,6 +834,156 @@ int igt_main()
>  		igt_msm_bo_free(bo);
>  	}
>  
> +	/* Buffer Free Tests - Positive Cases */
> +	igt_describe("Free single buffer object");
> +	igt_subtest("bo-free-single") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req = { 0 };
> +		uint32_t handle;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +		handle = bo->handle;
> +
> +		igt_msm_bo_free(bo);
> +
> +		/* Verify the handle is actually gone */
> +		req.handle = handle;
> +		req.info = MSM_INFO_GET_IOVA;
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
> +
> +		igt_info("Successfully freed single buffer object (handle %u)\n", handle);
> +	}
> +
> +	igt_describe("Free multiple buffer objects");
> +	igt_subtest("bo-free-multiple") {
> +		struct msm_bo *bo1, *bo2, *bo3;
> +		uint32_t handle1, handle2, handle3;
> +
> +		/* Allocate multiple buffers */
> +		bo1 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		bo2 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO_CACHED);
> +		bo3 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 4, MSM_BO_WC);
> +
> +		igt_assert_f(bo1 && bo2 && bo3, "Failed to allocate buffer objects\n");
> +
> +		handle1 = bo1->handle;
> +		handle2 = bo2->handle;
> +		handle3 = bo3->handle;
> +
> +		/* Free all buffers */
> +		igt_msm_bo_free(bo1);
> +		igt_msm_bo_free(bo2);
> +		igt_msm_bo_free(bo3);
> +
> +		igt_info("Successfully freed multiple buffer objects (handles %u, %u, %u)\n",
> +			 handle1, handle2, handle3);
> +	}
> +
> +	igt_describe("Free large buffer object");
> +	igt_subtest("bo-free-large") {
> +		struct msm_bo *bo;
> +		size_t large_size = 64 * 1024 * 1024; /* 64MB */
> +		uint32_t handle;
> +
> +		bo = igt_msm_bo_new(dev, large_size, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate large buffer (64MB)\n");
> +		handle = bo->handle;
> +
> +		igt_msm_bo_free(bo);
> +
> +		igt_info("Successfully freed large buffer (64MB, handle %u)\n", handle);
> +	}
> +
> +	igt_describe("Allocate and free buffers in sequence");
> +	igt_subtest("bo-free-sequence") {
> +		const int num_iterations = 10;
> +
> +		for (int i = 0; i < num_iterations; i++) {
> +			struct msm_bo *bo;
> +			uint32_t handle;
> +
> +			bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +			igt_assert_f(bo, "Failed to allocate buffer in iteration %d\n", i);
> +			handle = bo->handle;
> +
> +			igt_msm_bo_free(bo);
> +
> +			igt_debug("Iteration %d: allocated and freed handle %u\n", i, handle);
> +		}
> +
> +		igt_info("Successfully completed %d allocate/free cycles\n", num_iterations);
> +	}
> +
> +	/* Buffer Free Tests - Negative Cases */
> +	igt_describe("Free invalid handle (expects EINVAL)");
> +	igt_subtest("bo-free-invalid") {
> +		struct drm_gem_close close_req = { 0 };
> +
> +		close_req.handle = 0xDEADBEEF;
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINVAL);
> +
> +		igt_info("Correctly rejected freeing invalid handle with EINVAL\n");
> +	}
> +
> +	igt_describe("Free same handle twice (expects EINVAL)");
> +	igt_subtest("bo-double-free") {
> +		struct msm_bo *bo;
> +		struct drm_gem_close close_req = { 0 };
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		close_req.handle = bo->handle;
> +
> +		/*
> +		 * Free it once using gem_close and free bo struct manually
> +		 * (bypassing igt_msm_bo_free to test double-free behavior)
> +		 */
> +		gem_close(dev->fd, bo->handle);
> +		free(bo);
> +
> +		/* Try to free it again - should fail */
> +		do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINVAL);
> +
> +		igt_info("Correctly rejected double-free with EINVAL\n");
> +	}
> +
> +	igt_describe("Free handle zero (expects EINVAL)");
> +	igt_subtest("bo-free-zero-handle") {
> +		struct drm_gem_close close_req = { 0 };
> +
> +		close_req.handle = 0;
> +
> +		do_ioctl_err(dev->fd, DRM_IOCTL_GEM_CLOSE, &close_req, EINVAL);
> +
> +		igt_info("Correctly rejected freeing handle 0 with EINVAL\n");
> +	}
> +
> +	igt_describe("Query offset and IOVA of a freed buffer (expects ENOENT)");
> +	igt_subtest("bo-use-after-free") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req = { 0 };
> +		uint32_t handle;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +		handle = bo->handle;
> +
> +		igt_msm_bo_free(bo);
> +
> +		/* Both info queries on the freed handle must fail */
> +		req.handle = handle;
> +		req.info = MSM_INFO_GET_IOVA;
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
> +
> +		req.info = MSM_INFO_GET_OFFSET;
> +		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req, ENOENT);
> +
> +		igt_info("Correctly rejected use-after-free with ENOENT\n");
> +	}
> +
>  	igt_fixture() {
>  		igt_msm_dev_close(dev);
>  	}
> -- 
> 2.34.1
> 
