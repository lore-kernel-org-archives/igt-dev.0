Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4DCC43602
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 11:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6D310F2E0;
	Thu,  2 Jul 2026 11:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ly2ujxOb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D538E10F2E0
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782991073; x=1814527073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OPpHW9JhKeWO4lP40fZs6EcZ17vuC+Qrj+ueWUwadDs=;
 b=ly2ujxObMu+vCt+b9c5QmV9Beuz77LhHu8ruZxH7R6EMuCukmTBwCDL+
 eSMOPkGKhG58eGgTySeptcLPU5xAAux68lcR7ShmS1aZr7GF8WksFJvgy
 FrFEMXqXqrKJeVk0DvZUXtDb3FvEf+jMuY64cFkmoF6nEu4W7injE2WXe
 Lh0HiUsTvV1CVsaomRoXbCRLmFwLUNTO6XUjJv4biUuWUc9zyeZWGjFMv
 QQDbgo6Blxkn4AuaQ1bYULFS+fYCy6Yk6aaSPi05nQaui63pVX6yejVR6
 oUJVjvNaVszhoYulUXWfo3IYLpA9DUgVL/ipJjNtl7dKlUIiI5YS+HPbr A==;
X-CSE-ConnectionGUID: dHEHx8NiRvWjj4Xg9ytRqg==
X-CSE-MsgGUID: oYxdvRnFSQOyYA+hKGDWoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82732665"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82732665"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:17:53 -0700
X-CSE-ConnectionGUID: 6s7MQgUqRAiuUs77pbmGlQ==
X-CSE-MsgGUID: 8QSbcpWGRES50sdVa1qhcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="250179042"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:17:52 -0700
Date: Thu, 2 Jul 2026 13:17:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jitta Vignan <jvignan@qti.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/msm: extend BO tests to cover GEM_INFO
 and cache flags
Message-ID: <20260702111749.36gymrgtukbcuxvd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jitta Vignan <jvignan@qti.qualcomm.com>,
 igt-dev@lists.freedesktop.org
References: <20260702091351.96324-1-jvignan@qti.qualcomm.com>
 <20260702091351.96324-2-jvignan@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702091351.96324-2-jvignan@qti.qualcomm.com>
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
On 2026-07-02 at 14:43:51 +0530, Jitta Vignan wrote:
> Add DRM_IOCTL_MSM_GEM_INFO test coverage for:
> 
> - GET_OFFSET on valid BOs
> - GET_IOVA on valid BOs
> - GET_FLAGS on valid BOs
> - Invalid handle handling (ENOENT)
> - Invalid info type handling (EINVAL)
> - Offset consistency across repeated queries
> - IOVA consistency across repeated queries
> - Information queries for multiple BOs
> - Unique IOVA validation across multiple BOs
> - Cache mode flag verification across supported BO types
> 
> Also update the file header comment to reflect the expanded
> DRM_IOCTL_MSM_GEM_INFO coverage.
> 
> Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/msm/msm_bo.c | 275 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 275 insertions(+)
> 
> diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
> index f296ad9ae..8cc2ebf9e 100644
> --- a/tests/msm/msm_bo.c
> +++ b/tests/msm/msm_bo.c
> @@ -99,6 +99,281 @@ int igt_main()
>  
>  		igt_msm_bo_free(bo);
>  	}
> +		igt_describe("Get offset for valid BO");
> +	igt_subtest("bo-get-offset-valid") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req = { 0 };
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.info = MSM_INFO_GET_OFFSET;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_assert_f(req.value != 0, "Got zero offset for valid BO\n");
> +
> +		igt_info("BO handle %u: offset = 0x%llx\n", bo->handle,
> +			 (unsigned long long)req.value);
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Get IOVA for valid BO");
> +	igt_subtest("bo-get-iova-valid") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req = { 0 };
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.info = MSM_INFO_GET_IOVA;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_assert_f(req.value != 0, "Got zero IOVA for valid BO\n");
> +
> +		igt_info("BO handle %u: IOVA = 0x%llx\n", bo->handle,
> +			 (unsigned long long)req.value);
> +
> +		/* Verify IOVA matches what's stored in bo structure */
> +		igt_assert_eq_u64(req.value, bo->iova);
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Get flags for valid BO");
> +	igt_subtest("bo-get-flags") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req = { 0 };
> +		int ret;
> +		uint32_t test_flags = MSM_BO_WC | MSM_BO_GPU_READONLY;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, test_flags);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.info = MSM_INFO_GET_FLAGS;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, 0);
> +
> +		igt_info("BO handle %u: flags = 0x%llx (expected 0x%x)\n",
> +			 bo->handle, (unsigned long long)req.value, test_flags);
> +
> +		/* Verify flags match what we requested */
> +		igt_assert_eq_u64(req.value & test_flags, test_flags);
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	/* Buffer Information Tests - Negative Cases */
> +	igt_describe("Get offset for invalid handle (expects ENOENT)");
> +	igt_subtest("bo-get-offset-invalid") {
> +		struct drm_msm_gem_info req = { 0 };
> +		int ret;
> +
> +		req.handle = 0xDEADBEEF; /* Invalid handle */
> +		req.info = MSM_INFO_GET_OFFSET;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, -1);
> +		igt_assert_eq(errno, ENOENT);
> +
> +		igt_info("Correctly rejected invalid handle with ENOENT\n");
> +	}
> +
> +	igt_describe("Get IOVA for invalid handle (expects ENOENT)");
> +	igt_subtest("bo-get-iova-invalid") {
> +		struct drm_msm_gem_info req = { 0 };
> +		int ret;
> +
> +		req.handle = 0xDEADBEEF; /* Invalid handle */
> +		req.info = MSM_INFO_GET_IOVA;
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, -1);
> +		igt_assert_eq(errno, ENOENT);
> +
> +		igt_info("Correctly rejected invalid handle with ENOENT\n");
> +	}
> +
> +	igt_describe("Use invalid info type (expects EINVAL)");
> +	igt_subtest("bo-invalid-info-type") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req = { 0 };
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		req.handle = bo->handle;
> +		req.info = 0xFFFFFFFF; /* Invalid info type */
> +
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, -1);
> +		igt_assert_eq(errno, EINVAL);
> +
> +		igt_info("Correctly rejected invalid info type with EINVAL\n");
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	/* Additional Buffer Information Tests */
> +	igt_describe("Verify offset consistency across multiple queries");
> +	igt_subtest("bo-get-offset-consistency") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req1 = { 0 }, req2 = { 0 };
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		/* First query */
> +		req1.handle = bo->handle;
> +		req1.info = MSM_INFO_GET_OFFSET;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req1);
> +		igt_assert_eq(ret, 0);
> +
> +		/* Second query */
> +		req2.handle = bo->handle;
> +		req2.info = MSM_INFO_GET_OFFSET;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req2);
> +		igt_assert_eq(ret, 0);
> +
> +		/* Verify consistency */
> +		igt_assert_eq_u64(req1.value, req2.value);
> +		igt_info("Offset consistent across queries: 0x%llx\n",
> +			 (unsigned long long)req1.value);
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Verify IOVA consistency across multiple queries");
> +	igt_subtest("bo-get-iova-consistency") {
> +		struct msm_bo *bo;
> +		struct drm_msm_gem_info req1 = { 0 }, req2 = { 0 };
> +		int ret;
> +
> +		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		igt_assert_f(bo, "Failed to allocate buffer object\n");
> +
> +		/* First query */
> +		req1.handle = bo->handle;
> +		req1.info = MSM_INFO_GET_IOVA;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req1);
> +		igt_assert_eq(ret, 0);
> +
> +		/* Second query */
> +		req2.handle = bo->handle;
> +		req2.info = MSM_INFO_GET_IOVA;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req2);
> +		igt_assert_eq(ret, 0);
> +
> +		/* Verify consistency */
> +		igt_assert_eq_u64(req1.value, req2.value);
> +		igt_info("IOVA consistent across queries: 0x%llx\n",
> +			 (unsigned long long)req1.value);
> +
> +		igt_msm_bo_free(bo);
> +	}
> +
> +	igt_describe("Test getting info for multiple BOs");
> +	igt_subtest("bo-get-info-multiple") {
> +		struct msm_bo *bo1, *bo2, *bo3;
> +		struct drm_msm_gem_info req = { 0 };
> +		int ret;
> +
> +		/* Allocate multiple BOs */
> +		bo1 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
> +		bo2 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO_WC);
> +		bo3 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 4, MSM_BO_CACHED);
> +
> +		igt_assert_f(bo1 && bo2 && bo3, "Failed to allocate BOs\n");
> +
> +		/* Get info for each BO */
> +		req.handle = bo1->handle;
> +		req.info = MSM_INFO_GET_IOVA;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_info("BO1 IOVA: 0x%llx\n", (unsigned long long)req.value);
> +
> +		req.handle = bo2->handle;
> +		req.info = MSM_INFO_GET_IOVA;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_info("BO2 IOVA: 0x%llx\n", (unsigned long long)req.value);
> +
> +		req.handle = bo3->handle;
> +		req.info = MSM_INFO_GET_IOVA;
> +		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
> +		igt_assert_eq(ret, 0);
> +		igt_info("BO3 IOVA: 0x%llx\n", (unsigned long long)req.value);
> +
> +		/* Verify IOVAs are different */
> +		igt_assert_neq_u64(bo1->iova, bo2->iova);
> +		igt_assert_neq_u64(bo2->iova, bo3->iova);
> +		igt_assert_neq_u64(bo1->iova, bo3->iova);
> +
> +		igt_msm_bo_free(bo1);
> +		igt_msm_bo_free(bo2);
> +		igt_msm_bo_free(bo3);
> +	}
> +
> +	igt_describe("Test getting flags for BOs with different cache modes");
> +	igt_subtest("bo-get-flags-cache-modes") {
> +		struct {
> +			uint32_t flags;
> +			const char *name;
> +			bool may_fail; /* Some flags may not be supported */
> +		} test_cases[] = {
> +			{ MSM_BO_CACHED, "CACHED", false },
> +			{ MSM_BO_WC, "WC", false },
> +			{ MSM_BO_UNCACHED, "UNCACHED", true }, /* Deprecated */
> +			{ MSM_BO_CACHED_COHERENT, "CACHED_COHERENT", true }, /* May not be supported */
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(test_cases); i++) {
> +			struct drm_msm_gem_new alloc_req = { 0 };
> +			struct drm_msm_gem_info info_req = { 0 };
> +			int ret;
> +
> +			alloc_req.size = DEFAULT_BUFFER_SIZE;
> +			alloc_req.flags = test_cases[i].flags;
> +
> +			ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &alloc_req);
> +
> +			if (ret != 0) {
> +				if (test_cases[i].may_fail && errno == EINVAL) {
> +					igt_info("%s BO not supported (EINVAL)\n", test_cases[i].name);
> +					continue;
> +				}
> +				igt_assert_f(false, "Failed to allocate %s BO: %s\n",
> +					     test_cases[i].name, strerror(errno));
> +			}
> +
> +			info_req.handle = alloc_req.handle;
> +			info_req.info = MSM_INFO_GET_FLAGS;
> +
> +			ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &info_req);
> +			igt_assert_eq(ret, 0);
> +
> +			igt_info("%s BO flags: 0x%llx (expected 0x%x)\n",
> +				 test_cases[i].name,
> +				 (unsigned long long)info_req.value,
> +				 test_cases[i].flags);
> +
> +			/* Verify the cache mode flag is set */
> +			igt_assert_f((info_req.value & MSM_BO_CACHE_MASK) == test_cases[i].flags,
> +				     "Cache mode mismatch for %s\n", test_cases[i].name);
> +
> +			gem_close(dev->fd, alloc_req.handle);
> +		}
> +	}
>  
>  	igt_fixture() {
>  		igt_msm_dev_close(dev);
> -- 
> 2.34.1
> 
